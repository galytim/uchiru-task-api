class CreateSchoolClasses < ActiveRecord::Migration[7.2]
  def change
    create_table :school_classes do |t|
      t.integer :number
      t.string :letter
      t.references :school
      t.timestamps
    end
  end
end
