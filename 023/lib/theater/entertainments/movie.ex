defmodule Theater.Entertainments.Movie do
  use Ecto.Schema
  import Ecto.Changeset
  alias Theater.People

  schema "movies" do
    field :summary, :string
    field :title, :string
    field :year, :integer

    many_to_many :actors, Theater.People.Actor, join_through: "movies_actors", on_replace: :delete

    timestamps()
  end

  @doc false
  def changeset(movie, attrs) do
    movie
    |> cast(attrs, [:title, :summary, :year])
    |> validate_required([:title, :summary, :year])
    |> put_assoc(:actors, actors_map(attrs["actors"]))
  end

  defp validate_actors(changeset, nil),
    do: add_error(changeset, :actors, "can't be blank")

  defp validate_actors(changeset, _), do: changeset

  defp actors_map(nil), do: []

  defp actors_map(actors) do
    Enum.map(actors, fn id ->
      People.get_actor!(id)
    end)
  end
end
