#!/usr/bin/python3
"""queries the Reddit API and returns the number of subscribers"""

import requests


def number_of_subscribers(subreddit):
    """
    Returns the number of subscriber a subreddit has

    subreddit: subreddit to scrape for
    """
    body = requests.get(f'https://www.reddit.com/r/{subreddit}/about.json',
                        headers={'User-Agent': 'My-Agent'},
                        allow_redirects=False)
    if body.status_code >= 300:
        return 0
    return body.json().get('data').get('subscribers')
