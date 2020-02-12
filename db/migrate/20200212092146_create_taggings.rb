class CreateTaggings < ActiveRecord::Migration[6.0]
  def change
    create_table :taggings do |t|
      t.bigint :post_id
      t.bigint :tag_id

      t.timestamps
    end
  end
end
