defmodule ElixirNinetyNineBackendChallenge.BackgroundTask do

    def get_companies() do
      ElixirNinetyNineBackendChallenge.CompanieService.start
      res = ElixirNinetyNineBackendChallenge.CompanieService.make_request(:get, "testapi/1/companies")
      IO.inspect res

      companies = ElixirNinetyNineBackendChallenge.Repo.all(ElixirNinetyNineBackendChallenge.Company)
      IO.puts(length(companies))
      if length(companies) === 0 do
        IO.puts("Empty list")
        # Insert in company table.
        addCompany(res)
      else
        IO.puts("List's not empty")
        # Update share prices of the companies.
        updateCompany(res)
      end

      # Insert in historical table.
      addHistorical(res)
    end

    def addCompany(res) do
        Enum.each res, fn company ->
            IO.inspect company["name"]
            ElixirNinetyNineBackendChallenge.Repo.insert(%ElixirNinetyNineBackendChallenge.Company{
                name: company["name"],
                ric: company["ric"],
                sharePrice: company["sharePrice"]
            })
        end
    end

    def updateCompany(res) do
        Enum.each res, fn company ->
            c = ElixirNinetyNineBackendChallenge.Repo.get!(ElixirNinetyNineBackendChallenge.Company, company["id"])
            c = Ecto.Changeset.change c, sharePrice: company["sharePrice"]
            case ElixirNinetyNineBackendChallenge.Repo.update c do
              {:ok, struct}       -> IO.puts("Updated with success")
              {:error, changeset} -> IO.puts("Something went wrong")
            end
        end
    end

    def addHistorical(res) do
        Enum.each res, fn company ->
            ElixirNinetyNineBackendChallenge.Repo.insert(%ElixirNinetyNineBackendChallenge.Historical{
                name: company["name"],
                ric: company["ric"],
                sharePrice: company["sharePrice"]})
        end
    end

end