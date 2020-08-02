defmodule Theater.Repo.Migrations.CreateActors do
  use Ecto.Migration

  def change do
    create table(:actors) do
      add :name, :string
      add :likes, :string

      timestamps()
    end

  end
end
