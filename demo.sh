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