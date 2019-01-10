# web/models/company.ex
defmodule ElixirNinetyNineBackendChallenge.Company do
    # defstruct [:id, :name, :ric, :sharePrice]

    use ElixirNinetyNineBackendChallenge.Web, :model
    @derive {Poison.Encoder, only: [:name, :ric, :sharePrice, :id]}
    schema "companies" do
      field :name, :string
      field :ric, :string
      field :sharePrice, :float
      timestamps()
    end
end