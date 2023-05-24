# app/admin/admin_user.rb
ActiveAdmin.register AdminUser do
  # ...

  controller do
    def authorize_resource
      authorize!(:manage, resource)
    end

    def current_ability
      @current_ability ||= Ability.new(current_admin_user)
    end
  end
end
