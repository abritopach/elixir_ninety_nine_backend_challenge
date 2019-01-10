defmodule ElixirNinetyNineBackendChallenge.Repo.Migrations.CreateCompany do
  use Ecto.Migration

  def change do
    create table(:companies) do
      add :name, :string
      add :ric, :string
      add :sharePrice, :float
      timestamps
    end
    create unique_index(:companies, [:name])
  end
end
