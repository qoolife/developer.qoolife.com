---
title: Qoolife API V1 Pagination
---

# Pagination

Requests that return multiple items will be paginated to 20 items by default. You can specify further pages with the ?page parameter.

<pre class="console">
  curl https://qoolife.com/api/v1/journal_entries?page=2
</pre>

Note that page numbering is 1-based and that ommiting the ?page parameter will return the first page.

## Link Header

The pagination info is included in the Link header. It is important to follow these Link header values instead of constructing your own URLs.

<pre class="console">
	Link: <https://qoolife.com/api/v1/journal_entries?page=3>; rel="next", <https://qoolife.com/api/v1/journal_entries?page=100>; rel="last"
</pre>

The possible *rel* values are:

<dl>
  <dt>
    next
  </dt>
  <dd>
    Shows the URL of the immediate next page of results.
  </dd>
  <dt>
    last
  </dt>
  <dd>
    Shows the URL of the last page of results.
  </dd>
  <dt>
    first
  </dt>
  <dd>
    Shows the URL of the first page of results.
  </dd>
  <dt>
    prev
  </dt>
  <dd>
    Shows the URL of the immediate previous page of results.
  </dd>
</dl>
