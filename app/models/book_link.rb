class BookLink < ActiveRecord::Base
  attr_accessible :book_id, :email
  validates :book_id, :presence => true
  validates :email, :presence => true, :uniqueness => true

end
