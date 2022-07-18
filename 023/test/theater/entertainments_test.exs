defmodule Theater.EntertainmentsTest do
  use Theater.DataCase

  alias Theater.Entertainments

  describe "movies" do
    alias Theater.Entertainments.Movie

    @valid_attrs %{summary: "some summary", title: "some title", year: 42}
    @update_attrs %{summary: "some updated summary", title: "some updated title", year: 43}
    @invalid_attrs %{summary: nil, title: nil, year: nil}

    def movie_fixture(attrs \\ %{}) do
      {:ok, movie} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Entertainments.create_movie()

      movie
    end

    test "list_movies/0 returns all movies" do
      movie = movie_fixture()
      assert Entertainments.list_movies() == [movie]
    end

    test "get_movie!/1 returns the movie with given id" do
      movie = movie_fixture()
      assert Entertainments.get_movie!(movie.id) == movie
    end

    test "create_movie/1 with valid data creates a movie" do
      assert {:ok, %Movie{} = movie} = Entertainments.create_movie(@valid_attrs)
      assert movie.summary == "some summary"
      assert movie.title == "some title"
      assert movie.year == 42
    end

    test "create_movie/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Entertainments.create_movie(@invalid_attrs)
    end

    test "update_movie/2 with valid data updates the movie" do
      movie = movie_fixture()
      assert {:ok, %Movie{} = movie} = Entertainments.update_movie(movie, @update_attrs)
      assert movie.summary == "some updated summary"
      assert movie.title == "some updated title"
      assert movie.year == 43
    end

    test "update_movie/2 with invalid data returns error changeset" do
      movie = movie_fixture()
      assert {:error, %Ecto.Changeset{}} = Entertainments.update_movie(movie, @invalid_attrs)
      assert movie == Entertainments.get_movie!(movie.id)
    end

    test "delete_movie/1 deletes the movie" do
      movie = movie_fixture()
      assert {:ok, %Movie{}} = Entertainments.delete_movie(movie)
      assert_raise Ecto.NoResultsError, fn -> Entertainments.get_movie!(movie.id) end
    end

    test "change_movie/1 returns a movie changeset" do
      movie = movie_fixture()
      assert %Ecto.Changeset{} = Entertainments.change_movie(movie)
    end
  end
end
