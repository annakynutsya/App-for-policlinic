ActiveAdmin.register Doctor do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :first_name, :last_name, :phone, :doctor_category_id, :password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :avatar

  form do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :phone
      f.input :doctor_category_id, as: :select, collection: DoctorCategory.all.map { |c| [c.name, c.id] }
      f.input :password
      f.input :avatar, as: :file
    end
    f.actions
  end
  #
  # or
  #
  # permit_params do
  #   permitted = [:first_name, :last_name, :doctor_category_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
