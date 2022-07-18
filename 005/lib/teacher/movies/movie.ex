defmodule Teacher.Movies.Movie do
  use Ecto.Schema
  import Ecto.Changeset

  schema "movies" do
    field :summary, :string
    field :title, :string
    field :year, :integer

    timestamps()
  end

  @doc false
  def changeset(movie, attrs) do
    movie
    |> cast(attrs, [:title, :summary, :year])
    |> validate_required([:title, :summary, :year])
  end
end
