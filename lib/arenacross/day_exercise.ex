defmodule Arenacross.DayExercise do
  use Ecto.Schema

  import Ecto.Changeset

  alias Arenacross.WorkoutDay

  @primary_key {:id, :binary_id, autogenerate: true}
  @required_params [:file, :extension]
  @derive {Jason.Encoder, only: @required_params ++ [:id]}

  schema "day_exercises" do
    field :name, :string
    field :repetition, :string

    belongs_to :days, WorkoutDay

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
  end
end
