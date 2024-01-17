#!/usr/bin/python3
"""queries the Reddit API and returns the number of subscribers"""

import requests


def number_of_subscribers(subreddit):
    """queries the Reddit API and returns the number of subscribers"""
    url = f"https://www.reddit.com/r/{subreddit}/about.json"
    headers = {'User-Agent': 'My-Agent'}

    response = requests.get(url, headers=headers, allow_redirects=False)
    if response.status_code >= 300:
        return 0
    data = response.json()
    return data.get('data').get('subscribers')
