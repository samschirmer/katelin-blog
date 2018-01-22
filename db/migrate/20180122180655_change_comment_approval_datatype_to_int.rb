class ChangeCommentApprovalDatatypeToInt < ActiveRecord::Migration[5.0]
  def change
		remove_column :comments, :approval, :string
		add_column :comments, :approval, :integer
  end
end
