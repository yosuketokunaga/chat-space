class Message < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :user
  belongs_to :group

  def to_api_json
    {
      name: user.name,
      created_at: created_at.strftime('%m/%d %p %H:%M'),
      body: body,
      image_url: image.to_s
    }
  end
end
