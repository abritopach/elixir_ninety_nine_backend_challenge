defmodule ElixirNinetyNineBackendChallenge.CompanieService do
    @moduledoc """
    Interface to Companies service:
    """
    use HTTPoison.Base

    # Set the endpoint to send requests. There is only one for verifying the site,
    # but this could easily be the base URL to append paths to.
    @endpoint "https://dev.ninetynine.com/"

    def headers do
        %{
            "Content-type" => "application/json",
            "Accept" => " application/json"
        }
    end

    def make_request(:get, url) do
        case get(url, headers()) do
            {:ok, %HTTPoison.Response{status_code: code, body: body}} when (code in 200..299) ->
            cond do
                # %{"data" => data} = body -> data
                true -> body
            end
                {:ok, %HTTPoison.Response{body: body}} ->
                %{"errors" => [%{"detail" => detail, "title" => title}]} = body
                raise "Request returned non-200 response. Error: #{title}: #{detail}"
                {:error, error} ->
                raise "#{error}"
        end
    end

    # Example of a POST
    # def make_request(:post, url, body) do
    #   post!(url, body, headers)
    # end

    # HTTPosion Hooks

    def process_url("/" <> path), do: process_url(path)
    def process_url(path), do: @endpoint <> path

    def process_request_body(body) do
        Poison.encode!(body)
    end

    def process_response_body(body) do
        body
        |> Poison.decode! # Turns JSON into map
    end

end