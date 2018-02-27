require "crypto/bcrypt/password"

class Location < Crecto::Model
  schema "locations" do
    field :id, Int32, primary_key: true
    field :name, String
    field :street_address, String
    field :dine_in, Bool
    field :average_wait, Int32
    field :website, String
    field :brianable, Bool
    field :alexable, Bool
    field :price_level, Int32
    field :group_size, Int32
  end
end
