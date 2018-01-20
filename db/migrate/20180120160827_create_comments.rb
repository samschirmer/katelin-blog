class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :author
      t.string :email
      t.text :body
      t.references :post, foreign_key: true
      t.string :approval
      t.integer :deleted

      t.timestamps
    end
  end
end
