class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :text

      t.timestamps null: false
    end
  end
end
