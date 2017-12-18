class CreateLectures < ActiveRecord::Migration[5.1]
  def change
    create_table :lectures do |t|
      t.string :place, null: false
      t.datetime :lec_time, null: false
      t.string :note
      t.belongs_to :teacher, index: true, optional: false
      t.belongs_to :course, index: true, optional: false
      t.timestamps
    end
  end
end
