class CreateMonImages < ActiveRecord::Migration[7.0]
  def change
    create_table :mon_images do |t|
      t.references :imageable, polymorphic: true
      t.string :titre
      t.timestamps
    end
   # add_reference :mon_images, :image, foreign_key: { to_table: :active_storage_blobs }, index: true
  end
end