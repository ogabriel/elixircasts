defmodule Teacher.Email do
  import Bamboo.Email

  def post_removal_email do
    new_email(
      from: "no-reply@elixircasts.io",
      to: "hello@elixircasts.io",
      subject: "Movie removed",
      text_body: "A movie was added.",
      html_body: "A movie was added."
    )
  end
end
