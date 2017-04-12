App.cable.subscriptions.create { channel: "UserChannel", room: "New User" },
  received: (data) ->
    @appendLine(data)

  appendLine: (data) ->
    html = @createLine(data)
    # $("[data-user-room='New User']").append(html)
    $("#ws_new_user").append(html)

  createLine: (data) ->
    console.log data
    """
    <tr>
      <td><a href="/users/2">Admin</a></td>
      <td class="item_user_mail">admin@gmail.com</td>
      <td>-</td>
      <td>2</td>
      <td><a target="_blank" href="/files/original/missing.png">/files/original/missing.png</a></td>
      <td class="status">admin</td>
      <td class="blocked_date">-</td>
      <td class="action"><a href="/users/2?status=accept">Принять</a></td>
      <td class="action"><a href="/users/2?status=reject">Отклонить</a></td>
      <td class="action"><a href="/users/2?status=block">Заблакировать</a></td>
      <td><a confirm="Are you sure?" rel="nofollow" data-method="delete" href="/users/2">Удалить</a></td>
    </tr>
    """

