defmodule Teacher.Repo.Migrations.CreateMovies do
  use Ecto.Migration

  def change do
    create table(:movies) do
      add :title, :string
      add :summary, :text
      add :year, :integer

      timestamps()
    end

  end
end
