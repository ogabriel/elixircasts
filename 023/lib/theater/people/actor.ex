defmodule Theater.People.Actor do
  use Ecto.Schema
  import Ecto.Changeset

  schema "actors" do
    field :likes, :string
    field :name, :string

    many_to_many :movies, Theater.Entertainments.Movie, join_through: "movies_actors", on_replace: :delete

    timestamps()
  end

  @doc false
  def changeset(actor, attrs) do
    actor
    |> cast(attrs, [:name, :likes])
    |> validate_required([:name])
  end
end
