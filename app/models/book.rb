class Book < ActiveRecord::Base
  validates :title, presence: true
  validates :author, presence: true
  validates :description, presence: true
  validates :publisher, presence: true
  has_many :rentals

  scope :activeById, -> (id){ where(:status => true, :id => id).first }

end
