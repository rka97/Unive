class AddAbbreviationToDepartments < ActiveRecord::Migration[5.1]
  def change
    add_column :departments, :abbreviation, :string
  end
end
