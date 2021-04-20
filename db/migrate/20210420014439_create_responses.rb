class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.string :email
      t.boolean :resp
      t.integer :number
      t.text :other

      t.timestamps null: false
    end
  end
end
