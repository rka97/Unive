class AddStudentRefToUsers < ActiveRecord::Migration[5.1]
  def change
    change_table :users do |t|
      t.references :profile_owner, polymorphic: true, index: true, optional: false
    end
  end
end
