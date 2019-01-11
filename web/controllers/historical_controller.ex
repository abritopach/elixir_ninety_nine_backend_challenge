defmodule ElixirNinetyNineBackendChallenge.HistoricalController do
    use ElixirNinetyNineBackendChallenge.Web, :controller

    def index(conn, _params) do
        historical_all = Repo.all(ElixirNinetyNineBackendChallenge.Historical)
        json conn, historical_all
    end

    def hourly(conn, %{"ric" => ric}) do
      IO.puts("Hourly time series")
      IO.puts(ric)
      json conn, []
    end

    def daily(conn, %{"ric" => ric}) do
      IO.puts("Daily time series")
      IO.puts(ric)
      date = Date.utc_today
      query = from h in ElixirNinetyNineBackendChallenge.Historical, where: h.ric == ^ric and fragment("?::date", h.inserted_at) == ^date
      result = Repo.all(query)
      json conn, result
    end

    def weekly(conn, %{"ric" => ric}) do
      IO.puts("Weekly time series")
      IO.puts(ric)
      startDate = ~D[2019-01-02]
      endDate = ~D[2019-01-03]
      query = from h in ElixirNinetyNineBackendChallenge.Historical, where: h.ric == ^ric and fragment("?::date", h.inserted_at) >= ^startDate and fragment("?::date", h.inserted_at) <= ^endDate
      result = Repo.all(query)
      json conn, result
    end

end
