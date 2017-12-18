class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      t.string :name, null: false
      t.string :position, null: false
      t.date :hiring_date, null: false
      t.references :department, foreign_key: true, optional: true, index: true
      t.timestamps
    end
  end
end
