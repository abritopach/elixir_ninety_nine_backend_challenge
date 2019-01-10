# web/models/historical.ex
defmodule ElixirNinetyNineBackendChallenge.Historical do
    use ElixirNinetyNineBackendChallenge.Web, :model
    @derive {Poison.Encoder, only: [:name, :ric, :sharePrice, :id, :inserted_at]}
    schema "historical" do
      field :name, :string
      field :ric, :string
      field :sharePrice, :float
      timestamps()
    end
end