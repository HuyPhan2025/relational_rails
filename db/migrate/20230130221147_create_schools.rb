class CreateSchools < ActiveRecord::Migration[5.2]
  def change
    create_table :schools do |t|
      t.boolean :esl_program
      t.integer :tuition
      t.string :name
      t.timestamps
    end
  end
end
