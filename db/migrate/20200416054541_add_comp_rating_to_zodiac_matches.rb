class AddCompRatingToZodiacMatches < ActiveRecord::Migration[6.0]
  def change
    add_column :zodiac_matches, :comp_rating, :string
    add_column :zodiac_matches, :sex_rating, :string
    add_column :zodiac_matches, :communication_rating, :string
  end
end
