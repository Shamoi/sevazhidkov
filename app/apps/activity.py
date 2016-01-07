import json
import requests

GITHUB_ACTIVITY_URL = 'https://api.github.com/users/sevazhidkov/events'


def get_github_activity(cache):
    response = cache.get('github_activity')
    if not response:
        response = json.loads(requests.get(GITHUB_ACTIVITY_URL).text)
        cache.add('github_activity', response, 3600)
    activity = []
    for event in response:
        if event['type'] == 'PushEvent':
            commits_num = len(event['payload']['commits'])
            if commits_num == 1:
                event_text = "Pushed {} commit to {} repository"
            else:
                event_text = "Pushed {} commits to {} repository"

            repo_href = event['repo']['url']
            repo_href = repo_href.replace('api.', '').replace('repos/', '')
            repo_name = event['repo']['name']
            repo_link = "<a href='{}'>{}</a>".format(repo_href, repo_name)
            activity.append(event_text.format(commits_num, repo_link))
        if event['type'] == 'CreateEvent':
            # If it not repository creation (for example, change of description)
            # just skip event
            if event['payload']['ref'] is not None:
                continue

            event_text = 'Created {} repository'

            repo_href = event['repo']['url']
            repo_href = repo_href.replace('api.', '').replace('repos/', '')
            repo_name = event['repo']['name']
            repo_link = "<a href='{}'>{}</a>".format(repo_href, repo_name)
            activity.append(event_text.format(repo_link))
        if event['type'] == 'IssueCommentEvent':
            event_text = 'Commented issue "{}" in {}'

            issue_href = event['payload']['issue']['url']
            issue_href = issue_href.replace('api.', '').replace('repos/', '')
            issue_name = event['payload']['issue']['title']
            issue_link = "<a href='{}'>{}</a>".format(issue_href, issue_name)

            repo_href = event['repo']['url']
            repo_href = repo_href.replace('api.', '').replace('repos/', '')
            repo_name = event['repo']['name']
            repo_link = "<a href='{}'>{}</a>".format(repo_href, repo_name)

            activity.append(event_text.format(issue_link, repo_link))
        if event['type'] == 'PullRequestEvent':
            event_text = '{} pull request "{}" in {}'

            event_type = event['payload']['action'].capitalize()

            pr_href = event['payload']['pull_request']['issue_url']
            pr_href = pr_href.replace('api.', '').replace('repos/', '')
            pr_name = event['payload']['pull_request']['title']
            pr_link = "<a href='{}'>{}</a>".format(pr_href, pr_name)

            repo_href = event['repo']['url']
            repo_href = repo_href.replace('api.', '').replace('repos/', '')
            repo_name = event['repo']['name']
            repo_link = "<a href='{}'>{}</a>".format(repo_href, repo_name)

            activity.append(event_text.format(event_type, pr_link, repo_link))
        # TODO: IssueCreateEvent
    return activity[:]
