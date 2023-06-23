class Article < ApplicationRecord
  paginates_per 10
  validates :title, presence: true, length: { minimum: 5 }
  has_many :comments, dependent: :destroy

  def self.ransackable_attributes(auth_object = nil)
    %w(title text)
  end
end
