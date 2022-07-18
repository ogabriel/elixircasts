defmodule Theater.Repo.Migrations.CreateManyToManyMoviesActors do
  use Ecto.Migration

  def change do
    create table(:movies_actors) do
      add :movie_id, references(:movies)
      add :actor_id, references(:actors)
    end

    create index(:movies_actors, [:movie_id])
    create index(:movies_actors, [:actor_id])
  end
end
