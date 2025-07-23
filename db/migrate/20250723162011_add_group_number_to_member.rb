class AddGroupNumberToMember < ActiveRecord::Migration[8.0]
  def change
    add_column :members, :group_number, :string
  end
end
