defmodule Arenacross.PostImage do
  use Ecto.Schema

  import Ecto.Changeset

  alias Arenacross.Post

  @primary_key {:id, :binary_id, autogenerate: true}
  @required_params [:file, :extension]
  @derive {Jason.Encoder, only: @required_params ++ [:id]}

  schema "post_images" do
    field :file, :binary
    field :extension, :string

    belongs_to :post, Post

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
  end
end
