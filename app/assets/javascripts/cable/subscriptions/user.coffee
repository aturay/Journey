App.cable.subscriptions.create { channel: "UserChannel", room: "New User" },
  received: (data) ->
    @appendLine(data)

  appendLine: (data) ->
    html = @createLine(data)
    $("[data-user-room='New User']").append(html)

  createLine: (data) ->
    """
    <article class="user-line">
      <span class="speaker">#{data["sent_by"]}</span>
      <span class="body">#{data["body"]}</span>
    </article>
    """
