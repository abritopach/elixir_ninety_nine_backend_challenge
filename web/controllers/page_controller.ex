defmodule ElixirNinetyNineBackendChallenge.PageController do
  use ElixirNinetyNineBackendChallenge.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
