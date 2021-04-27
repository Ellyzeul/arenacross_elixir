defmodule Arenacross.WorkoutDay do
  use Ecto.Schema

  import Ecto.Changeset

  alias Arenacross.{DayExercise, Post}

  @primary_key {:id, :binary_id, autogenerate: true}
  @required_params [:title, :description]
  @derive {Jason.Encoder, only: @required_params ++ [:id]}

  schema "workout_days" do
    field :coach, :string
    field :weekday, :integer

    belongs_to :post, Post
    has_many :exercises, DayExercise

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_weekday(:weekday)
  end

  defp validate_weekday(changeset, field_name) do
    weekday = Map.get(changeset, field_name)
    if weekday >= 1 and weekday <= 7 do
      changeset
    else
      add_error(changeset, field_name, "weekday out of interval [1, 7]")
    end
  end
end
