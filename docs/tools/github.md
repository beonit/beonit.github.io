---
layout: default
title: Github
parent: Tools
date: 2020-05-06
---

## Github API

Personal Access Token (PAT) : `Settings` - `Developer settings` - `Personal access tokens` 에서 PAT 를 얻을 수 있다.

API listup

```bash
curl -v -H "Authorization: token $GITHUB_TOKEN" https://github.com/api/v3
```

HATEOAS 스러운 응답이 내려온다. 멋지다.

```json
{
  "current_user_url": "https://github.com/api/v3/user",
  "current_user_authorizations_html_url": "https://github.com/settings/connections/applications{/client_id}",
  "authorizations_url": "https://github.com/api/v3/authorizations",
  "code_search_url": "https://github.com/api/v3/search/code?q={query}{&page,per_page,sort,order}",
  "commit_search_url": "https://github.com/api/v3/search/commits?q={query}{&page,per_page,sort,order}",
  "emails_url": "https://github.com/api/v3/user/emails",
  "emojis_url": "https://github.com/api/v3/emojis",
  "events_url": "https://github.com/api/v3/events",
  "feeds_url": "https://github.com/api/v3/feeds",
  "followers_url": "https://github.com/api/v3/user/followers",
  "following_url": "https://github.com/api/v3/user/following{/target}",
  "gists_url": "https://github.com/api/v3/gists{/gist_id}",
  "hub_url": "https://github.com/api/v3/hub",
  "issue_search_url": "https://github.com/api/v3/search/issues?q={query}{&page,per_page,sort,order}",
  "issues_url": "https://github.com/api/v3/issues",
  "keys_url": "https://github.com/api/v3/user/keys",
  "notifications_url": "https://github.com/api/v3/notifications",
  "organization_repositories_url": "https://github.com/api/v3/orgs/{org}/repos{?type,page,per_page,sort}",
  "organization_url": "https://github.com/api/v3/orgs/{org}",
  "public_gists_url": "https://github.com/api/v3/gists/public",
  "rate_limit_url": "https://github.com/api/v3/rate_limit",
  "repository_url": "https://github.com/api/v3/repos/{owner}/{repo}",
  "repository_search_url": "https://github.com/api/v3/search/repositories?q={query}{&page,per_page,sort,order}",
  "current_user_repositories_url": "https://github.com/api/v3/user/repos{?type,page,per_page,sort}",
  "starred_url": "https://github.com/api/v3/user/starred{/owner}{/repo}",
  "starred_gists_url": "https://github.com/api/v3/gists/starred",
  "team_url": "https://github.com/api/v3/teams",
  "user_url": "https://github.com/api/v3/users/{user}",
  "user_organizations_url": "https://github.com/api/v3/user/orgs",
  "user_repositories_url": "https://github.com/api/v3/users/{user}/repos{?type,page,per_page,sort}",
  "user_search_url": "https://github.com/api/v3/search/users?q={query}{&page,per_page,sort,order}"
}
```

repository listup

```bash
curl -v -H "Authorization: token $GITHUB_TOKEN" https://github.com/api/v3/orgs/FinancePlatform/repos?per_page=100
```
