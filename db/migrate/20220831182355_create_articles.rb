class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      #These were added by the generator because we included them in our
      #generate command (bin/rails generate model Article title:string
      #body:text).
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
