require "crypto/bcrypt/password"

class Outing < Crecto::Model
  schema "outings" do
    field :id, Int32, primary_key: true
    field :name, String
    field :time, Time

    belongs_to :owner, Account, foreign_key: :owner_id
    belongs_to :location, Location
  end
end
