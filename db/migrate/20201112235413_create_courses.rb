class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :topic
      t.string :location
      t.integer :roomNumber
      t.string :profesorName
      t.string :startDate
      t.string :endDate
      t.string :beginningDate
      t.string :endingDate
      t.string :requirement
      t.references :student, null: false, foreign_key: true

      t.timestamps
    end
  end
end
