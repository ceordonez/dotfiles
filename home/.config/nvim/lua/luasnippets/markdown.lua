local ls = require("luasnip")
local s, t, i, c, d, f, sn =
	ls.snippet, ls.text_node, ls.insert_node, ls.choice_node, ls.dynamic_node, ls.function_node, ls.snippet_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

-- Status checkbox: toggle between [ ] and [x] with your change-choice key
local function check(pos)
  return c(pos, { t("[ ]"), t("[x]") })
end

local fence = "```"

-- Recursive "add another task" node: cycle the choice to append a new checkbox line
local function more_tasks()
	return sn(nil, {
		c(1, {
			t(""),
			sn(nil, { t({ "", "- [ ] " }), i(1, "task"), d(2, more_tasks, {}) }),
		}),
	})
end
return {
	s(
		{ trig = "nextsteps", dscr = "Next steps for a paper" },
		fmt(
			[[
## Next steps: {}

**Status:** {}
**Updated:** {}

### This week
- [ ] {}{}

### This month
- [ ] {}{}

### Waiting on / blockers
- {}

### Notes
{}
]],
			{
				i(1, "Paper short title"),
				c(2, {
					t("Draft"),
					t("In preparation"),
					t("Submitted"),
					t("Under review"),
					t("Revision"),
					t("Accepted"),
				}),
				f(function()
					return os.date("%Y-%m-%d")
				end),
				i(3, "task"),
				d(4, more_tasks, {}),
				i(5, "task"),
				d(6, more_tasks, {}),
				i(7, "co-author / data / reviewer"),
				i(0),
			}
		)
	),

	s(
		{ trig = "papersum", dscr = "Summary of a paper" },
		fmt(
			[[
# {}

**Authors:** {}
**Year / Journal:** {} / {}
**DOI:** {}
**Cite key:** {}
**Read status:** {}
**Added:** {}

## One-sentence summary
{}

## Research question / gap
{}

## Study system and data
{}

## Methods
{}

## Key results
- {}

## Conclusions
{}

## Strengths and limitations
- **Strengths:** {}
- **Limitations:** {}

## Relevance to my work
{}

## Figures, tables or equations to revisit
- {}

## Follow-up references
- {}

## Tags
{}
{}
]],
			{
				i(1, "Paper title"),
				i(2, "First author et al."),
				i(3, "YYYY"),
				i(4, "Journal"),
				i(5, "10.xxxx/xxxxx"),
				i(6, "authorYYYY"),
				c(7, {
					t("Skimmed"),
					t("Read"),
					t("Read closely"),
					t("To read"),
				}),
				f(function()
					return os.date("%Y-%m-%d")
				end),
				i(8, "What the paper does and finds, in one sentence"),
				i(9, "What problem or gap does it address?"),
				i(10, "Site, system, dataset, time span"),
				i(11, "Approach, models, measurements, analysis"),
				i(12, "Main finding"),
				i(13, "What the authors conclude and how far the evidence supports it"),
				i(14, "..."),
				i(15, "..."),
				i(16, "How it connects to my projects or papers"),
				i(17, "Fig. X: why"),
				i(18, "Reference to chase"),
				i(19, "#topic #method"),
				i(0),
			}
		)
	),

	s(
		{ trig = "papersumq", dscr = "Quick paper summary" },
		fmt(
			[[
# {}

**Authors / Year:** {} / {}
**DOI:** {}
**Cite key:** {}
**Read status:** {}

## Summary
{}

## Key results
- {}

## Relevance to my work
{}

## Tags
{}
{}
]],
			{
				i(1, "Paper title"),
				i(2, "First author et al."),
				i(3, "YYYY"),
				i(4, "10.xxxx/xxxxx"),
				i(5, "authorYYYY"),
				c(6, {
					t("Skimmed"),
					t("To read"),
					t("Read"),
					t("Read closely"),
				}),
				i(7, "What the paper does and finds, in one or two sentences"),
				i(8, "Main finding"),
				i(9, "How it connects to my projects or papers"),
				i(10, "#topic #method"),
				i(0),
			}
		)
	),
	s(
		{ trig = "readmepaper", dscr = "make readme for paper" },
		fmt(
			[[
# {}

## One-line summary
{}

## Status
**Started:** {}
**Submitted:** {}
**Accepted:** {}

## Co-authors
- Lead: {}
- Co-authors: {}
- Corresponding author: {}

## Submission history

| Journal | Submitted | Decision | Round |
|---|---|---|---|
| {} | {} | {} | {} |

## Targeted journal info
- Journal: {}
- Word limit: {}
- Figure limit: {}
- Style guide: {}

## Related project
{}
]],
			{
				i(1, "Paper title"),
				i(2, "One sentence on what the paper does and finds"),
				i(3, "YYYY-MM-DD"),
				i(4, "YYYY-MM-DD"),
				i(5, "YYYY-MM-DD"),
				i(6, "Lead author"),
				i(7, "Co-author 1, Co-author 2"),
				i(8, "Corresponding author"),
				i(9, "Journal"),
				i(10, "YYYY-MM-DD"),
				c(11, {
					t("Pending"),
					t("Rejected"),
					t("Major revision"),
					t("Minor revision"),
					t("Accepted"),
				}),
				i(12, "1"),
				i(13, "Journal name"),
                i(14, "e.g max 5000 words"),
				i(15, "e.g. max 8 figures"),
				i(16, "Link or notes"),
				i(17, "Project name"),
			}
		)
	),

      s(
    { trig = "readme", dscr = "Research project README" },
    fmta(
      [[
# Project: <> — <>

## Overview
<>

## Status
- <> Data collection
- <> Data cleaning
- <> Analysis
- <> Writing

## People
- Lead: <>
- Collaborators: <>
- Students: <>

## Data sources
| Source | Type | Location | Period | Notes |
|---|---|---|---|---|
| <> | <> | <> | <> | <> |

## Known data issues
- <>

## Folder structure
data/raw/        ← original files, never modified
data/clean/      ← output of 01_clean_data.py
data/processed/  ← output of 02_analysis.py
scripts/         ← analysis pipeline
figures/         ← generated figures

## How to reproduce
]] .. fence .. [[bash
# 1. Install dependencies
pip install -e <>

# 2. Clean data
python scripts/01_clean_data.py <>

# 3. Run analysis
python scripts/02_analysis.py <>

# 4. Generate figures
python scripts/03_figures.py <>
]] .. fence .. [[

## Related publications
→ <>

## Funding
<>

## Notes
Any decisions made during analysis worth remembering:
- <>
]],
      {
        i(1, "Project name"),
        i(2, "Site/Period"),
        i(3, "One paragraph: what question are you answering, why it matters, and what makes this dataset/approach unique."),
        check(4), check(5), check(6), check(7),
        i(8, "Cesar Ordoñez"),
        i(9, "Name (Institution)"),
        i(10, "Name (thesis chapter)"),
        i(11, "Source"), i(12, "Type"), i(13, "data/raw/.../"), i(14, "YYYY-YYYY"), i(15, "Notes"),
        i(16, "Issue (date, cause, how handled)"),
        i(17, "../../../05_Tools/lake_plotting"),
        i(18, "2024"),
        rep(18),
        rep(18),
        i(19, "02_Publications/YYYY_Name/"),
        i(20, "Funder grant number — \"Title\""),
        i(21, "Decision and rationale"),
      }
    )
  ),

  -- Extra data source row
  s(
    { trig = "rrow", dscr = "README data source table row" },
    fmta("| <> | <> | <> | <> | <> |", {
      i(1, "Source"), i(2, "Type"), i(3, "data/raw/.../"), i(4, "YYYY-YYYY"), i(5, "Notes"),
    })
  ),
}
