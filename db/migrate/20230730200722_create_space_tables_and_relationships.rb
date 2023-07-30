class CreateSpaceTablesAndRelationships < ActiveRecord::Migration[7.0]
  def change
    create_table :galaxies do |t|
      t.integer :diameter_in_light_years
      t.belongs_to :cluster, index: true
      t.timestamps
    end
    create_table :clusters do |t|
      t.integer :total_galaxies
      t.timestamps
    end
    create_table :stars do |t|
      t.string :name
      t.string :color
      t.text :description
      t.belongs_to :galaxy, index: true
      t.belongs_to :cluster, index: true
      t.timestamps
    end
    create_table :systems do |t|
      t.string :name
      t.belongs_to :star, index: true
      t.timestamps
    end
    create_table :planets do |t|
      t.string :planet_type
      t.integer :population
      t.belongs_to :system, index: true
      t.belongs_to :cluster, index: true
      t.timestamps
    end
  end
end
