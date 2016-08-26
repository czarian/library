class Rental < ActiveRecord::Base

  enum status: [:inactive, :active]

  belongs_to :user
  belongs_to :book

scope :byBookId, ->(book_id) { where("book_id=#{book_id}", book_id) }
scope :byStatusActive, -> {where("status = 1") }

scope :activeRentedBook, ->(book_id) {byBookId(book_id).byStatusActive}

  #scope :activeRentedBook, ->(book_id) { where(:statuds => :active),book_id}


end
