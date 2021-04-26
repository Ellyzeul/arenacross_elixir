defmodule Crossarena.Repo.Migrations.CreateWorkoutDaysTable do
  use Ecto.Migration

  def change do
    create table(:workout_days) do
      add :coach, :string
      add :weekday, :integer

      timestamps()
    end

    create constraint(
      "workout_days",
      :weekday_in_interval_zero_to_six,
      check: "weekday >= 0 and weekday <= 6"
    )
  end
end
