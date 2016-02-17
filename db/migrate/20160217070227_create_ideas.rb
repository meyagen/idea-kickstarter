class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.string   :title
      t.text     :description
      t.string   :author
      t.datetime :created_at
    end
  end
end
