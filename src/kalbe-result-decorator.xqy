xquery version "1.0-ml";

module namespace search-dec = "http://marklogic.com/poc/kalbe";

import module namespace dls = "http://marklogic.com/xdmp/dls"
      at "/MarkLogic/dls.xqy";
import module namespace utilities = "http://marklogic.com/utilities"
      at "/lib/utilities.xqy";

declare function search-dec:decorator($uri as xs:string) as node()*
{
      let $doc := fn:doc($uri)
      return (
        attribute cust_name {
          $doc/CustomerName
        },
        attribute country {
          $doc/Country
        },
        attribute age {
          $doc/Umur
        },
        attribute region {
          $doc/Region
        },
        attribute city {
          $doc/City
        }
        (:,attribute balance {
          search-dec:rupiah($doc/Balance)
        },
        attribute salary_per_month {
			search-dec:rupiah($doc/SalaryPerMonth)
        } :)
      )
};

declare function search-dec:rupiah($rupiah)
{
	fn:string(
		fn:replace(
			fn:normalize-space(
				$rupiah
			), ',', ''
		)
	)
};



