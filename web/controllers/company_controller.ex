defmodule ElixirNinetyNineBackendChallenge.CompanyController do
  use ElixirNinetyNineBackendChallenge.Web, :controller

  def index(conn, _params) do
    # Access data from postgresql database companies table.
    companies = Repo.all(ElixirNinetyNineBackendChallenge.Company)
    json conn, companies
  end

  def show(conn, %{"id" => id}) do
    company = Repo.get(ElixirNinetyNineBackendChallenge.Company, String.to_integer(id))
    json conn, company
  end
end
