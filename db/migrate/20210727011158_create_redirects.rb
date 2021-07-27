class CreateRedirects < ActiveRecord::Migration[6.1]
  def change
    create_table :redirects do |t|
      t.string :source
      t.string :redirect
      t.datetime :expiration
      t.string :status

      t.timestamps
    end
    add_index :redirects, :source, unique: true
  end
end
