class Article < ApplicationRecord
    has_one :mon_image, as: :imageable
    has_many :comments, dependent: :destroy
    accepts_nested_attributes_for :mon_image, allow_destroy: true # to review after *************

    


    #validates :monimage, presence: true
    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 10 }
    
  end