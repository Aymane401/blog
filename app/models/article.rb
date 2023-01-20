class Article < ApplicationRecord
    has_many :mon_images, as: :imageable
    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 10 }
    accepts_nested_attributes_for :mon_images, allow_destroy: true, reject_if: :all_blank, update_only: true


    
  end