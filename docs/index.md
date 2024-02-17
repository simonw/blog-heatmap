# My blog through the years

A heatmap of <https://simonwillison.net/> showing the number of posts published each day over the years.

Build using [Observable Framework](https://observablehq.com/framework/). Code here: <https://github.com/simonw/blog-heatmap>.

The data is built from a query running in [Django SQL Dashboard](https://django-sql-dashboard.datasette.io/).

Hover over a day to see a list of post titles. Click on a day to open up that day on my blog.

Based on the [simplified calendar](https://observablehq.com/@observablehq/plot-simplified-calendar?intent=fork) example.

```js
Plot.plot({
  padding: 0,
  x: {axis: null},
  y: {
    tickFormat: Plot.formatWeekday("en", "narrow"),
    tickSize: 0,
  },
  fy: {tickFormat: ""},
  color: {scheme: "PiYG", domain: [0, 10]},
  marks: [
    Plot.cell(days, {
      x: (d) => d3.utcWeek.count(d3.utcYear(new Date(d.day)), new Date(d.day)),
      y: (d) => new Date(d.day).getUTCDay(),
      fy: (d) => "" + new Date(d.day).getUTCFullYear(),
      fill: (d, i) => d.count,
      title: (d, i) => `${d.count} on ${d.day}\n\n${d.titles.join("\n")}`,
      inset: 0.5,
      tip: true,
      href: (d) => {
        var d = new Date(d.day);
        return `https://simonwillison.net/${d.getFullYear()}/${d.toLocaleString(
          "en-us",
          { month: "short" }
        )}/${d.getDate()}/`;
      },
      target: "_blank",
    })
  ]
})
```
```js
const days = FileAttachment("./data/blog-days.json").json()
```
