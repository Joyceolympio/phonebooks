defmodule PhonebookWeb.PageController do
  use PhonebookWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
