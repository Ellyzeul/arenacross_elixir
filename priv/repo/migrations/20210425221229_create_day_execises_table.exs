defmodule Arenacross.Repo.Migrations.CreateDayExecisesTable do
  use Ecto.Migration

  def change do
    create table(:day_exercises) do
      add :name, :string
      add :repetition, :string

      timestamps()
    end
  end
end
