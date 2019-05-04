class CreateTaggings < ActiveRecord::Migration[5.2]
  def change
    create_table :taggings do |t|
      t.references :task
      t.references :tag
      t.timestamps
    end
  end
end
