#!/usr/bin/python3
"""queries the Reddit API and returns a list containing
the titles of all hot articles for a given subreddit."""

import requests


def recurse(subreddit, hot_list=[], i=0):
    """queries the Reddit API and returns a list containing
    the titles of all hot articles for a given subreddit."""

    url = f"https://www.reddit.com/r/{subreddit}/hot.json"
    headers = {'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)'}

    try:
        response = requests.get(url, headers=headers)
        response.raise_for_status()

        data = response.json().get('data', {}).get('children', [])
        if not data:
            return None
        data = data[i]['data']['title']
        i += 1
        hot_list.append(data)
        recurse(subreddit, hot_list, i)
    except IndexError:
        return hot_list
    except requests.exceptions.HTTPError as e:
        print(e)
    except requests.exceptions.RequestException as e:
        print(f"Request Error: {e}")
