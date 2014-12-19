# class User < ActiveRecord::Base

class User < ActiveRecord::Base
  TEMP_EMAIL_PREFIX = 'temp.email'
  TEMP_EMAIL_REGEX = /\Atemp.email/

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable
  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook, :twitter, :linkedin, :google_oauth2]

  validates_format_of :email, :without => TEMP_EMAIL_REGEX, on: :update

  def self.find_for_oauth(auth, signed_in_resource = nil)

    # Get the identity and user if they exist
    identity = Identity.find_for_oauth(auth)

    # If a signed_in_resource is provided it always overrides the existing user
    # to prevent the identity being locked with accidentally created accounts.
    # Note that this may leave zombie accounts (with no associated identity) which
    # can be cleaned up at a later date.
    user = signed_in_resource ? signed_in_resource : identity.user

    # Create the user if needed
    if user.nil?

      # Get the existing user by email if the provider gives us a verified email.
      # If no verified email was provided we assign a temporary email and ask the
      # user to verify it on the next step via UsersController.finish_signup
      email_is_verified = auth.info.email && (auth.info.verified || auth.info.verified_email)
      email = auth.info.email if email_is_verified
      user = User.where(:email => email).first if email

      # Create the user if it's a new registration
      if user.nil?
        case auth.provider
        when 'facebook'
          name = auth.info.name
          firstname = auth.info.first_name
          last_name = auth.info.last_name
          gender = auth.info.gender if auth.info.gender.present?
          age = auth.info.age_range if auth.info.age_range.present?

        when 'twitter'
          name = auth.info.name
          location = auth.info.location

        when 'google_oauth2'
          name = auth.info.name
          firstname = auth.info.given_name
          last_name = auth.info.family_name
          gender = auth.info.gender

        when 'linkedin'
          name = auth.info.name
          firstname = auth.info.first_name
          last_name = auth.info.last_name
          location = auth.info.location.name
          country = auth.info.location.country.code
        end

        user = User.new(
          # name: auth.extra.raw_info.name,
          name: name,
          email: email.present? ? email : "#{TEMP_EMAIL_PREFIX}-#{auth.uid}-#{auth.provider}@townhallsocial.com",
          gender: gender ? gender : '',
          password: Devise.friendly_token[0,20]
        )

        user.skip_confirmation!
        user.save!
      end
    end

    # Associate the identity with the user if needed
    if identity.user != user
      identity.user = user
      identity.save!
    end

    identity.user

  end

  def email_verified?
    self.email && self.email !~ TEMP_EMAIL_REGEX
  end
end