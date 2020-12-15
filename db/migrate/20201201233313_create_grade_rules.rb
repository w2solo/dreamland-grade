class CreateGradeRules < ActiveRecord::Migration[6.0]
  def change
    create_table :grade_rules do |t|
      t.string :action, uniq: true
      t.string :message
      t.integer :score
      t.integer :change_type

      t.timestamps
    end
  end
end
