class CreateStudentResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :student_responses do |t|
      t.string :input
      t.string :from
      t.string :to
      t.string :answer
      t.string :result

      t.timestamps
    end
  end
end
