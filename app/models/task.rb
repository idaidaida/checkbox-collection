class Task < ApplicationRecord

    validates :content, presence: true

    has_many :taggings
    has_many :tags, through: :taggings
    accepts_nested_attributes_for :taggings
end
