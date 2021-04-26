defmodule Crossarea.Schedule do
  use Ecto.Schema

  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @required_params [:name, :email, :cellphone, :scheduled_hour]
  @derive {Jason.Encoder, only: @required_params ++ [:id]}

  schema "schedules" do
    field :name, :string
    field :email, :string
    field :cellphone, :string
    field :scheduled_hour, :naive_datetime
    field :add, :boolean, default: false
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:name, min: 3)
    |> validate_format(:email, ~r/.{1,}@+.{1,}\..{1,}/)
    |> validate_format(:cellphone, ~r/\(([0-9]){2}\)+[ ]+([0-9]){4,5}-+([0-9]){4}/)
  end
end
