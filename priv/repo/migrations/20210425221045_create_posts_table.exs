defmodule Crossarena.Repo.Migrations.CreatePostsTable do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string, default: "Untitled"
      add :image, :blob
      add :description, :string

      timestamps()
    end
  end
end
