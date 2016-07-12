class ChangeNametoTitle < ActiveRecord::Migration
  def change
    add_column :blogs, :title, :string
    remove_column :blogs, :name
  end
end
