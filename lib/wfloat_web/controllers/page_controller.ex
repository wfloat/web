defmodule WfloatWeb.PageController do
  use WfloatWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    redirect(conn, to: Routes.live_path(conn, WfloatWeb.CreateTTSLive, %{}))
  end
end
