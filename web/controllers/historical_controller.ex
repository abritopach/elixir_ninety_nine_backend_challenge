defmodule ElixirNinetyNineBackendChallenge.HistoricalController do
    use ElixirNinetyNineBackendChallenge.Web, :controller

    def index(conn, _params) do
      json conn, []
    end

    def hourly(conn, %{"ric" => ric}) do
      IO.puts("Hourly time series")
      IO.puts(ric)
      json conn, []
    end

    def daily(conn, %{"ric" => ric}) do
      IO.puts("Daily time series")
      IO.puts(ric)
      json conn, []
    end

    def weekly(conn, %{"ric" => ric}) do
      IO.puts("Weekly time series")
      IO.puts(ric)
      json conn, []
    end

  end
