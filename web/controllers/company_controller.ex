defmodule ElixirNinetyNineBackendChallenge.CompanyController do
  use ElixirNinetyNineBackendChallenge.Web, :controller

  def index(conn, _params) do

    #companies = [
    #  %ElixirNinetyNineBackendChallenge.Company{
    #    id: 1,
    #    name: "Apple Inc.",
    #    ric: "APPL",
    #    sharePrice: 223.154
    #  },
    #  %ElixirNinetyNineBackendChallenge.Company{
    #    id: 2,
    #    name: "Microsoft Corporation",
    #    ric: "MSFT",
    #    sharePrice: 102.574
    #  },
    #  %ElixirNinetyNineBackendChallenge.Company{
    #    id: 3,
    #    name: "Alphabet Inc.",
    #    ric: "GOOG",
    #    sharePrice: 1126.764
    #  }
    #]

    # Access fixed company data. We use an Ecto repository to do this (lib/elixir_ninety_nine_backend_challenge/repo.ex)
    companies = Repo.all(ElixirNinetyNineBackendChallenge.Company)
    json conn, companies
  end

  def show(conn, %{"id" => id}) do
    company = Repo.get(ElixirNinetyNineBackendChallenge.Company, String.to_integer(id))
    json conn, company
  end
end
