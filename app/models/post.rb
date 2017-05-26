class Post < ApplicationRecord
    mount_uploaders :images, ImagesUploader
    belongs_to :user
end
