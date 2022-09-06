class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :text

      t.timestamps default: -> { 'CURRENT_TIMESTAMP' }
    end
  end
end
