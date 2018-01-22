class AddActiveToStylesheets < ActiveRecord::Migration[5.0]
  def change
    add_column :stylesheets, :active, :integer
  end
end
