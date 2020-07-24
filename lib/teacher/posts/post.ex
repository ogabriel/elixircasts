defmodule Teacher.Posts.Post do
  use Ecto.Schema
  import Ecto.Changeset

  alias Teacher.Repo

  schema "posts" do
    field :body, :string
    field :title, :string
    field :slug, :string

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    attrs = Map.merge(attrs, slug_map(attrs))

    post
    |> cast(attrs, [:title, :body, :slug])
    |> validate_required([:title, :body])
    |> unique_constraint(:title)
  end

  def slugify_post(post) do
    slug = String.downcase(post.title) |> String.replace(" ", "-")
    post_params = %{"slug" => slug}
    changeset_post = Teacher.Posts.Post.changeset(post, post_params)
    Teacher.Repo.update(changeset_post)
  end

  defp slug_map(%{"title" => title}) do
    slug = String.downcase(title) |> String.replace(" ", "-")
    %{"slug" => slug}
  end

  defp slug_map(%{title: title}) do
    slug = String.downcase(title) |> String.replace(" ", "-")
    %{slug: slug}
  end

  defp slug_map(_params), do: %{}
end

defimpl Phoenix.Param, for: Teacher.Posts.Post do
  def to_param(%{slug: slug}) do
    "#{slug}"
  end
end
