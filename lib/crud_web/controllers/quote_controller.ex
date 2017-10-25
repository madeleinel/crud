defmodule CrudWeb.QuoteController do
  use CrudWeb, :controller
  alias Crud.Repo
  alias Crud.Quote

   alias CrudWeb.Router
   import CrudWeb.Router.Helpers

  # plug :action
  # This line causes the server to crash after a while; error message:
  # Endpoint terminated
  # (Plug.Conn.AlreadySentError) the response was already sent



  ##############################################################################
  # Display homepage
  ##############################################################################
  def homepage(conn, _params) do
    render conn, "homepage.html"
  end

  ##############################################################################
  # Displaying quotes
  ##############################################################################
  def index(conn, _params) do
    conn
    |> assign(:quotes, Repo.all(Crud.Quote))
    |> render("index.html")
  end

  # Define action for showing the individual quote pages
  def show(conn, %{"id" => id}) do
    # Convert the ID that's been extracted from the URL parameter to an integer
    {id, _} = Integer.parse(id)
    conn
    |> assign(:quote, Repo.get(Crud.Quote, id))
    |> render("show.html")
  end

  ##############################################################################
  # Adding new quotes
  ##############################################################################
  def new(conn, _params) do
    changeset = Quote.changeset(%Quote{})
    conn
    |> render("new.html", changeset: changeset)
  end

  def create(conn, %{"quote" => quote_params}) do
    changeset = Quote.changeset(%Quote{}, quote_params)
    case Repo.insert(changeset) do
      {:ok, quote} ->
        conn
        |> redirect(to: quote_path(conn, :index))
      {:error, changeset} ->
        conn
        |> render("new.html", changeset: changeset)
      end
  end

  ##############################################################################
  # Editing quotes
  ##############################################################################
  def edit(conn, %{"id" => id}) do
    # Convert the ID that's been extracted from the URL parameter to an integer
    {id, _} = Integer.parse(id)
    changeset = Quote.changeset(%Quote{})
    quote = Repo.get(Crud.Quote, id)
    conn
    #|> assign(:quote, Repo.get(Crud.Quote, id))
    |> render("edit.html", changeset: changeset, quote: quote)
  end

  def update(conn, %{"id" => id, "quote" => params}) do
    # Convert the ID that's been extracted from the URL parameter to an integer
    {id, _} = Integer.parse(id)
    quote = Repo.get(Crud.Quote, id)
    if quote do
      changeset = Crud.Quote.changeset(quote, params)
      case Repo.update(changeset) do
        {:ok, quote} ->
          conn
          |> redirect(to: quote_path(conn, :index))
        {:error, changeset} ->
          conn
          |> render("edit.html", changeset: changeset, quote: quote)
        end
      end
    end

  ##############################################################################
  # Deleting quotes
  ##############################################################################
  def delete(conn, %{"id" => id}) do
    # Convert the ID that's been extracted from the URL parameter to an integer
    {id, _} = Integer.parse(id)
    quote = Repo.get(Crud.Quote, id)
    case Repo.delete quote do
      {:ok, quote} ->
        conn
        |> redirect(to: quote_path(conn, :index))
        |> put_flash(:info, "Quote has been deleted")
      {:error} ->
        conn
        |> redirect(to: quote_path(conn, :index))
        |> put_flash(:info, "Quote could not be deleted")
      end
  end

end
