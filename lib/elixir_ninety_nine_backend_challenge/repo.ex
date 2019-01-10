defmodule ElixirNinetyNineBackendChallenge.Repo do
  # use Ecto.Repo, otp_app: :elixir_ninety_nine_backend_challenge
  def all(ElixirNinetyNineBackendChallenge.Company) do
    [
      %ElixirNinetyNineBackendChallenge.Company{
        id: 1,
        name: "Apple Inc.",
        ric: "APPL",
        sharePrice: 223.154
      },
      %ElixirNinetyNineBackendChallenge.Company{
        id: 2,
        name: "Microsoft Corporation",
        ric: "MSFT",
        sharePrice: 102.574
      },
      %ElixirNinetyNineBackendChallenge.Company{
        id: 3,
        name: "Alphabet Inc.",
        ric: "GOOG",
        sharePrice: 1126.764
      }
    ]
  end

  def get(module, id) do
    Enum.find all(module), fn elem -> elem.id == id end
  end
end
