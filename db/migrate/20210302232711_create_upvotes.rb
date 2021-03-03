class CreateUpvotes < ActiveRecord::Migration[5.2]
  def change
    create_table :upvotes do |t|
      t.references :chirp, foreign_key: true
      t.string :ip

      t.timestamps
    end
    add_index :upvotes, :ip
  end
end
