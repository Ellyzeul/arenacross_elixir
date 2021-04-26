defmodule Crossarena.Repo.Migrations.CreateSchedulesTable do
  use Ecto.Migration

  def change do
    create table(:schedules) do
      add :name, :string
      add :email, :string
      add :celphone, :string
      add :scheduled_hour, :datetime
      add :checked, :boolean, default: false

      timestamps()
    end
  end
end
