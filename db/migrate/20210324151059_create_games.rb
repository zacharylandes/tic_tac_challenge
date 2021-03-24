class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.string :title
      t.string :board, :array => true
      t.string :winner
      t.string :status

      t.timestamps
    end
  end
end
