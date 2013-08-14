---
title: Qoolife API V1 Pagination
---

# Pagination

Requests that return multiple items will be paginated to 20 items by default. You can specify further pages with the ?page parameter.

    curl https://qoolife.com/api/v1/journal_entries?page=2

Note that page numbering is 1-based and that ommiting the ?page parameter will return the first page.

## Link Header

The pagination info is included in the Link header. It is important to follow these Link header values instead of constructing your own URLs.

    Link: <https://qoolife.com/api/v1/journal_entries?page=3>; rel='next', <https://qoolife.com/api/v1/journal_entries?page=100>; rel='last'

The possible *rel* values are:

<dl>
  <dt>
    <code>
      next
    </code>
  </dt>
  <dd>
    Shows the URL of the immediate next page of results.
  </dd>
  <dt>
    <code>
      last
    </code>
  </dt>
  <dd>
    Shows the URL of the last page of results.
  </dd>
  <dt>
    <code>
      first
    </code>
  </dt>
  <dd>
    Shows the URL of the first page of results.
  </dd>
  <dt>
    <code>
      prev
    </code>
  </dt>
  <dd>
    Shows the URL of the immediate previous page of results.
  </dd>
</dl>
