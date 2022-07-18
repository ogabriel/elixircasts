# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Theater.Repo.insert!(%Theater.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Theater.Entertainments
alias Theater.People

Entertainments.delete_all_movies()
People.delete_all_actors()

movies_data = [
  %{
    title: "Apocalypto",
    summary: """
    As the Mayan kingdom faces its decline,
    a young man is taken on a perilous journey
    to a world ruled by fear and oppression.
    """,
    year: 2006
  },
  %{
    title: "Black Swan",
    summary: """
    A committed dancer struggles to maintain her
    sanity after winning the lead role in a production
    of Tchaikovsky's "Swan Lake".
    """,
    year: 2010
  },
  %{
    title: "Braveheart",
    summary: """
    When his secret bride is executed for assaulting
    an English soldier who tried to rape her, William
    Wallace begins a revolt against King Edward I of England.
    """,
    year: 1995
  },
  %{
    title: "Drive",
    summary: """
    A mysterious Hollywood stuntman and mechanic moonlights
    as a getaway driver and finds himself in trouble when
    he helps out his neighbor.
    """,
    year: 2011
  }
]

actors_data = [
  %{
    name: "Meryl Streep",
    likes: "to act"
  },
  %{
    name: "Cate Blanchett",
    likes: "to act"
  },
  %{
    name: "Jodie Foster",
    likes: "to act"
  }
]

Enum.each(movies_data, fn(data) ->
  Entertainments.create_movie(data)
end)

Enum.each(actors_data, fn(data) ->
  People.create_actor(data)
end)
