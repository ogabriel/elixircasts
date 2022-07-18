# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Teacher.Repo.insert!(%Teacher.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Teacher.Posts

Posts.delete_all

posts_data = [
  %{
    title: "How to do something 1",
    body: "this is a cool text"
  },
  %{
    title: "How to do something 2",
    body: "this is a cool text"
  },
  %{
    title: "How to do something 3",
    body: "this is a cool text"
  }
]

Enum.each(posts_data, fn(data) ->
  Posts.create_post(data)
end)
