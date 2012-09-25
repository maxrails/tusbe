class CreateBookLinks < ActiveRecord::Migration
  def change
    create_table :book_links do |t|
      t.string :book_id
      t.string :email
    end
  end
end
