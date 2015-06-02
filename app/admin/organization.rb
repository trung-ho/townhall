ActiveAdmin.register Organization do
  before_filter :only => [:show] do
    @organization = Organization.friendly.find(params[:id])
  end

  permit_params :name, :created_at

  config.comments = false

  index do
    selectable_column
    id_column
    column :name
    actions
  end

  filter :name

  form do |f|
    f.inputs "User Details" do
      f.input :name
    end
    f.actions
  end

end
