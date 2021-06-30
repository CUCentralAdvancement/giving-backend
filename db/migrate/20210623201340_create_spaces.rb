class CreateSpaces < ActiveRecord::Migration[6.1]
  def change
    create_table :spaces do |t|
      t.string :name
      t.string :description
      t.string :slug

      t.timestamps
    end

    create_join_table :users, :spaces do |t|
      t.index :user_id
      t.index :space_id
    end
  end
end
