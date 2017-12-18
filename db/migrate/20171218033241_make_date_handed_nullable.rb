class MakeDateHandedNullable < ActiveRecord::Migration[5.1]
  def change
    remove_column :student_courseworks, :date_handed
    add_column :student_courseworks, :date_handed, :date
  end
end
