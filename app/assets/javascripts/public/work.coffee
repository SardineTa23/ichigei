$ ->
  $("#work_postcode").jpostal({
    postcode : [ "#work_postcode" ],
    address  : {
                  "#work_prefecture_code" : "%3",
                  "#work_city"            : "%4",
                  "#work_street"          : "%5%6%7"
                }
  })