ActiveAdmin.register User do
  permit_params :name, :first_name, :last_name, :gender, :location, :email, :password

  config.comments = false

  index do
    selectable_column
    id_column
    column :name
    column :first_name
    column :last_name
    column :gender
    column :email
    actions
  end

  filter :name
  filter :first_name
  filter :last_name
  filter :email

  form do |f|
    f.inputs "User Details" do
      f.input :name
      f.input :first_name
      f.input :last_name
      f.input :gender
      f.input :location
      f.input :email
      # f.input :password
      # f.input :password_confirmation
    end
    f.actions
  end

end
