class AddColumnsToEstablishments < ActiveRecord::Migration[6.0]
  def change
    add_column :establishments, :ratingValue, :string
    add_column :establishments, :ratingDate, :string
    add_column :establishments, :longitude, :string
    add_column :establishments, :latitude, :string
    add_column :establishments, :localAuth, :string
    add_column :establishments, :postcode, :string
  end
end
