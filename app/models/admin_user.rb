class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable, authentication_keys: [:phone]


        def email_required?
          false
        end

        def email_changed?
          false
        end

        # use this instead of email_changed? for rails >= 5.1
        def will_save_change_to_email?
          false
        end
end
