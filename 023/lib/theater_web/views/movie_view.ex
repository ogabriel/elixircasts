defmodule TheaterWeb.MovieView do
  use TheaterWeb, :view

  def list_all_actors() do
    Theater.People.list_actors()
    |> Enum.map(& {&1.name, &1.id})
  end
end
