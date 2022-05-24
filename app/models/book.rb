class Book < ApplicationRecord

  has_one_attached :image
  validates :title, presence: true, length: { minimum: 1}
  validates :body,  presence: true, length: { minimum: 1, maximum: 200}
  belongs_to :user
end

def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
end
