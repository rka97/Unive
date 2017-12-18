class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.integer :section_number, null: false
      t.integer :bench_number, null: false
      t.string :name, null: false
      t.string :gender, null: false
      t.string :degree, null: false
      t.integer :year, null: false
      t.integer :phone_number, null: false
      t.string :address, null: false
      t.date :birth_date, null: false
      t.timestamps
    end
  end
end
