class CreateStudents < ActiveRecord::Migration[7.2]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :surname
      t.references :class
      t.references :school

      t.timestamps
    end
  end
end
