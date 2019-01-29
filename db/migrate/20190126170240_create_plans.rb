class CreatePlans < ActiveRecord::Migration[5.1]
  def change
    create_table :plans do |t|
      t.string :pavadinimas
      t.string :tinklas
      t.integer :zinutes
      t.integer :pokalbiai
      t.integer :internetas
      t.float :kaina
    end
  end
end
