Steps taken to resolve the backend challenge

1.  Create a Phoenix project

	Create a base Phoenix project with build tool mix (provides tasks for creating, compiling, testing your application, managing its dependencies,…)

2. Create a static companies API endpoint

	First I created a route for an API endpoint and configure a controller to return fixed companies data. 

	I defined an array of Elixir maps and return that static array to simulate companies info.

	companies = [
      %{
        id: 1,
        name: "Apple Inc.",
        ric: "APPL",
        sharePrice: 223.154
      },
      %{
        id: 2,
        name: "Microsoft Corporation",
        ric: "MSFT",
        sharePrice: 102.574
      },
      %{
        id: 3,
        name: "Alphabet Inc.",
        ric: "GOOG",
        sharePrice: 1126.764
      }
    ]

3.  Create a company Phoenix model

	I’m followed the approach described in Programing Phoenix to build model. Instead of jumping right in and creating an Ecto model that is tied to a database, I’m created first a static model that mirrors the structure of Ecto. This approach helps me in understanding how all of the pieces tie together.

	In this step I have companies data hardcoded in controller.

4.  Added a single company detail endpoint

	I added another endpoint to return a single company.

5. Configured Ecto, created company schema and created database table for companies

	In this step I replaced hardcode model data with real database access.

	I created a schema for our company model in web/models/company.ex.

	schema "companies" do
      field :name, :string
      field :ric, :string
      field :sharePrice, :float
      timestamps()
    end

Then I create a database table for companies. I do this by first creating a database migration.

mix ecto.gen.migration create_company

And I modified migration file in priv/repo/migrations/<timestamp>_create_company.exs and execute mix ecto.migrate

6. Added companies service & test request

	I have created a service to perform the request to the provided endpoint and recover the data from the companies using httpoison (https://github.com/edgurgel/httpoison).

7. Create background jobs

To perfom the task in the background I have decided to use an external library.

I tried rihanna (https://github.com/samphilipd/rihanna) but it didn't allow me to define that a task would be repeated periodically in time.

I finally opted for quantum (https://github.com/quantum-elixir/quantum-core).

To test the library I created a task that printed every 20 seconds a hello world per console.

8. Launch a request and store the information obtained by a task in the background
