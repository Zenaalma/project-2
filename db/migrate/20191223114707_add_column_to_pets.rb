class AddColumnToPets < ActiveRecord::Migration[6.0]
  def change
    add_column :pets , :description, :string
  end
end
