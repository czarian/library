class Book < ActiveRecord::Base
  validates :title, presence: true
  validates :author, presence: true
  validates :description, presence: true
  validates :publisher, presence: true
  has_many :rentals

  scope :byId, ->(id) { where("id=#{id}", id) }
  scope :byStatusActive, -> {where(:status => true) }

scope :activeBook, ->(id) {byId(id).byStatusActive.first}

  #scope :activeById, -> (id){ where(:status => true, :id => id).first }

end
