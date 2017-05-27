class Post < ApplicationRecord
    mount_uploaders :images, ImagesUploader
    belongs_to :user

    validates_presence_of :images
end
