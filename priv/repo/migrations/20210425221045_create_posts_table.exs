defmodule Arenacross.Repo.Migrations.CreatePostsTable do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string, default: "Untitled"
      add :description, :string

      timestamps()
    end
  end
end
