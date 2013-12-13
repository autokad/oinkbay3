class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :is_spam

      t.timestamps
    end
  end
end
