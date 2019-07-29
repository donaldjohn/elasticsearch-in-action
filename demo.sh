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