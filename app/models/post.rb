class Post < ApplicationRecord
    mount_uploaders :images, ImagesUploader
    belongs_to :user
    has_many :comments

    validates_presence_of :images
end
