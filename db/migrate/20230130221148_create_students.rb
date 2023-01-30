class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.boolean :english_learner
      t.integer :grade
      t.string :name
      t.references :school, foreign_key: true
      t.timestamps
    end
  end
end

