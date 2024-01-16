#!/usr/bin/python3
"""queries the Reddit API and prints the titles of the first
10 hot posts listed for a given subreddit."""

import requests


def top_ten(subreddit):
    """queries the Reddit API and prints the titles of the first
    10 hot posts listed for a given subreddit"""
    url = f"https://www.reddit.com/r/{subreddit}/hot.json?limit=9"
    headers = {'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)'}

    try:
        response = requests.get(url, headers=headers)
        response.raise_for_status()

        data = response.json().get('data', {}).get('children', [])

        if not data:
            print("None")
            return

        for post in data:
            print(post['data']['title'])
    except requests.exceptions.HTTPError as e:
        if response.status_code == 404:
            print(f"Subreddit '{subreddit}' not found.")
        else:
            print(f"HTTP Error: {e}")
    except requests.exceptions.RequestException as e:
        print(f"Request Error: {e}")
