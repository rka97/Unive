class CreateCourseworks < ActiveRecord::Migration[5.1]
  def change
    create_table :courseworks do |t|
      t.date :date_due, null: false
      t.date :date_assigned, null: false
      t.string :description, null: false
      t.float :weight, null: false
      t.integer :total_mark, null: false
      t.string :title, null: false
      t.belongs_to :course, index: true, optional: false 

      t.timestamps
    end
  end
end
