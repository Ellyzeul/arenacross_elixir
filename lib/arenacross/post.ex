defmodule Arenacross.Post do
  use Ecto.Schema

  import Ecto.Changeset

  alias Arenacross.{PostImage, WorkoutDay}

  @primary_key {:id, :binary_id, autogenerate: true}
  @required_params [:title, :description]
  @derive {Jason.Encoder, only: @required_params ++ [:id]}

  schema "posts" do
    field :title, :string, default: "Untitled"
    field :description, :string

    has_one :image, PostImage
    has_many :days, WorkoutDay

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)

  end
end
