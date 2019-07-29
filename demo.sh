curl 'localhost:9200/get-together/group/_search?pretty' -d '{
    "query":{
        "match":{
            "location_group":"Denver"
        }
    },
    "aggs":{
        "top_tags":{
            "terms":{
                "field":"tags.verbatim"
            }
        }
    }
}'


curl 'localhost:9200/get-together/group/_search?pretty' -d '{
    "query":{
        "match":{
            "location_group":"Denver"
        }
    }
}'

curl 'localhost:9200/get-together/group/_search?pretty' -d '{
    "query":{
        "bool":{
            "filter":{
                "term":{
                    "location_group":"denver"
                }
            }
        }
    }
}'

curl 'localhost:9200/get-together/group/_search?pretty' -d '{
    "post_filter":{
        "term":{
            "location_group":"denver"
        }
    }
}'


curl 'localhost:9200/get-together//_search?pretty' -d '{
    "aggregations":{
        "attendees_stats":{
            "stats":{
                "script":"doc['"'attendees'"'].values.length"
            }
        }
    }
}'

curl 'localhost:9200/get-together//_search?pretty' -d '{
    "aggregations":{
        "attendees_avg":{
            "avg":{
                "script":"doc['"'attendees'"'].values.length"
            }
        }
    }
}'

curl 'localhost:9200/get-together//_search?pretty' -d '{
    "aggregations":{
        "attendees_avg":{
            "extended_stats":{
                "script":"doc['"'attendees'"'].values.length"
            }
        }
    }
}'

curl 'localhost:9200/get-together//_search?pretty' -d '{
    "aggregations":{
        "attendees_percentiles":{
            "percentiles":{
                "script":"doc['"'attendees'"'].values.length",
                "percents":[80, 99]
            }
        }
    }
}'


curl 'localhost:9200/get-together//_search?pretty' -d '{
    "aggregations":{
        "attendees_percentiles":{
            "percentile_ranks":{
                "script":"doc['"'attendees'"'].values.length",
                "values":[4, 5]
            }
        }
    }
}'


URI=localhost:9200/get-together/group/_search
curl "$URI?pretty" -d '
{
    "size":0,
    "aggregations":
    {
        "tags":
        { 
            "terms":
            { 
                "field": "tags.verbatim",
                "order":
                { 
                    "_term":"asc"
                }
            }
        }
    }
}'

curl "$URI?pretty" -d '
{
    "aggregations":
    {
        "tags":
        { 
            "terms":
            { 
                "field": "tags.verbatim"
            }
        }
    }
}'


curl "$URI?pretty" -d '
{
    "aggregations":
    {
        "tags":
        { 
            "terms":
            { 
                "field": "tags.verbatim",
                "include":".*search.*"
            }
        }
    }
}'


curl "$URI?pretty" -d '
{
    "aggregations":
    {
        "attendees_breakdown":
        { 
                "range":
                {
                    "script":"doc['"'attendees'"'].values.length",
                    "ranges":
                    [
                        {"to":4},
                        {"from":4, "to":6},
                        {"from":6}
                    ]
                }
        }
    }
}'