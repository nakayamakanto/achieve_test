class ChangeNameToTitle < ActiveRecord::Migration
  def change
    add_column :blogs, :title, :string
    remove_column :blogs, :title, :string
  end
end
