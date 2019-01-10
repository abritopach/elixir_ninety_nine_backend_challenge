defmodule ElixirNinetyNineBackendChallenge.Repo.Migrations.CreateHistorical do
  use Ecto.Migration

  def change do
    create table(:historical) do
      add :name, :string
      add :ric, :string
      add :sharePrice, :float
      timestamps
    end
    create unique_index(:historical, [:id])
  end
end