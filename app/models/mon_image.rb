class MonImage < ApplicationRecord
    has_one_attached :image
    belongs_to :imageable, polymorphic: true
    #validates :image, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg']
    
end