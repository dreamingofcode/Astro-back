class AddRateToZodiacMatches < ActiveRecord::Migration[6.0]
  def change
    add_column :zodiac_matches, :rate, :integer
  end
end
