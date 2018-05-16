class CreateCharacters < ActiveRecord::Migration[5.1]
  def change
    create_table :characters do |t|
      t.integer :external_id
      t.bigint :adn

      t.timestamps
    end
  end
end
