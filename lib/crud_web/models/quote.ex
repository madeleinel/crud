defmodule Crud.Quote do
  use Ecto.Schema
  import Ecto.Changeset

  schema "quotes" do
    field :quote, :string
    field :author, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(quote, params \\ %{}) do
    quote
    |> cast(params, [:quote, :author])
    |> validate_required([:quote, :author])
  end
end
