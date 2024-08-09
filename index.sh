#!/bin/bash

# Project indexing
curl --location --request POST 'http://localhost:8087/full-index/projects?baseYear=2024&startMonth=1&endMonth=8'

# Post indexing
curl --location --request POST 'http://localhost:8087/full-index/posts?baseYear=2024&startMonth=1&endMonth=8'

# Comment indexing
curl --location --request POST 'http://localhost:8087/full-index/comments?baseYear=2024&startMonth=1&endMonth=8'

# Reply indexing
curl --location --request POST 'http://localhost:8087/full-index/reply?baseYear=2024&startMonth=1&endMonth=8'

# Chat indexing
curl --location --request POST 'http://localhost:8087/full-index/chats?baseYear=2024&startMonth=1&endMonth=8'
