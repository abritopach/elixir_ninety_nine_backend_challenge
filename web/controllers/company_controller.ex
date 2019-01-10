defmodule ElixirNinetyNineBackendChallenge.CompanyController do
  use ElixirNinetyNineBackendChallenge.Web, :controller

  def index(conn, _params) do
    companies = [
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
    json conn, companies
  end
end
