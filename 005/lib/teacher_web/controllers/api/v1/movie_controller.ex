defmodule TeacherWeb.Api.V1.MovieController do
  use TeacherWeb, :controller

  alias Teacher.Movies

  def index(conn, _params) do
    movies = Movies.list_movies()
    render(conn, "index.json", movies: movies)
  end

  def show(conn, %{"id" => id}) do
    movie = Movies.get_movie!(id)
    render(conn, "show.json", movie: movie)
  end
end
