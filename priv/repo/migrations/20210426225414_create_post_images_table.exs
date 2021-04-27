defmodule Arenacross.Repo.Migrations.CreatePostImagesTable do
  use Ecto.Migration

  def change do
    create table(:post_images) do
      add :file, :blob
      add :extension, :string

      timestamps()
    end
  end
end
