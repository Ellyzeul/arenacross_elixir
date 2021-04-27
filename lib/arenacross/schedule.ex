defmodule Arenacross.Schedule do
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
    field :checked, :boolean, default: false
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:name, min: 3)
    |> validate_format(:email, ~r/.{1,}@+.{1,}\..{1,}/)
    |> validate_format(:cellphone, ~r/\(([0-9]){2}\)+[ ]+([0-9]){4,5}-+([0-9]){4}/)
    |> validate_naive_datetime(:scheduled_hour)
  end

  defp validate_naive_datetime(changeset, field_name) do
    case DateTime.from_iso8601(Map.get(changeset, field_name)) do
      {:ok, datetime, _utc_offset} -> Map.replace(changeset, field_name, DateTime.to_naive(datetime))
      {:error, _atoms} -> add_error(changeset, field_name, "invalid naive datetime format")
    end
  end
end
