module.exports = (robot) ->
  robot.on "github-repo-event", (res) ->
    Payload = res.payload
    channel = "#seteam"
    switch(res.eventType)
      when "commit_comment"
        comment = Payload.comment
        repo = Payload.repository
        robot.messageRoom channel, "#{repo.name}: Comment to commit #{comment.commit_id}: #{comment.body}"
      when "fork"
        fork = Payload.forkee
        repo = Payload.repository
        robot.messageRoom channel, "New fork! #{repo.name} was forked by #{fork.owner.login}."
      when "issue_comment"
        action = Payload.action
        issue = Payload.issue
        comment = Payload.comment
        repo = Payload.repository
        robot.messageRoom channel, "#{repo.name}: New comment to issue #{issue.title}; #{comment.body}"
      when "issues"
        action = Payload.action
        issue = Payload.issue
        repo = Payload.repository
        robot.messageRoom channel, "#{repo.name}: Issue #{issue.title} was #{action}."
