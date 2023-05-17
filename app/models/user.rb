class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attr_accessor :avatar

  before_save :upload_avatar

  private

  def upload_avatar
    return unless avatar

    cloudinary_response = Cloudinary::Uploader.upload(avatar.tempfile.path)
    self.avatar_public_id = cloudinary_response['public_id']
  end
end
