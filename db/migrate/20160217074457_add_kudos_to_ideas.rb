class AddKudosToIdeas < ActiveRecord::Migration
  def change
    add_column :ideas, :kudos, :integer, default: 0
  end
end
