-- Meetings, supervision and presentation notes
local ls = require("luasnip")
local s, t, i, c, d, f, sn =
	ls.snippet, ls.text_node, ls.insert_node, ls.choice_node, ls.dynamic_node, ls.function_node, ls.snippet_node
local fmt = require("luasnip.extras.fmt").fmt

local function more_actions()
	return sn(nil, {
		c(1, {
			t(""),
			sn(nil, {
				t({ "", "- [ ] " }),
				i(1, "task"),
				t(" ("),
				i(2, "who"),
				t(", due "),
				i(3, "YYYY-MM-DD"),
				t(")"),
				d(4, more_actions, {}),
			}),
		}),
	})
end

return {
	s(
		{ trig = "meetnotes", dscr = "Meeting notes" },
		fmt(
			[[
# {}

**Date:** {}
**Time:** {}
**Location / link:** {}
**Type:** {}

## Attendees
- {}

## Agenda
- {}

## Discussion
{}

## Decisions
- {}

## Action items
- [ ] {} ({}, due {}){}

## Next meeting
{}

## Notes
{}
]],
			{
				i(1, "Meeting title"),
				f(function()
					return os.date("%Y-%m-%d")
				end),
				i(2, "HH:MM"),
				i(3, "Room / Zoom link"),
				c(4, {
					t("Project meeting"),
					t("Supervision"),
					t("Lab meeting"),
					t("Collaborator call"),
					t("Department"),
					t("Other"),
				}),
				i(5, "Name 1, Name 2"),
				i(6, "Topic"),
				i(7, "Key points discussed"),
				i(8, "What was decided"),
				i(9, "task"),
				i(10, "who"),
				i(11, "YYYY-MM-DD"),
				d(12, more_actions, {}),
				i(13, "Date, or TBD"),
				i(0),
			}
		)
	),

	s(
		{ trig = "presnotes", dscr = "Presentation notes" },
		fmt(
			[[
# {}

**Event:** {}
**Date:** {}
**Time / duration:** {}
**Location / link:** {}
**Audience:** {}
**Format:** {}

## Goal
{}

## Key messages
1. {}

## Outline

| Slide / section | Time | Content |
|---|---|---|
| {} | {} | {} |

## Speaker notes
{}

## Anticipated questions
- **Q:** {}
  **A:** {}

## To prepare
- [ ] {}

## Follow-up
{}

## Notes
{}
]],
			{
				i(1, "Presentation title"),
				i(2, "Conference / seminar / meeting"),
				f(function()
					return os.date("%Y-%m-%d")
				end),
				i(3, "HH:MM, 15 min + 5 min questions"),
				i(4, "Room / Zoom link"),
				i(5, "Who will be listening"),
				c(6, {
					t("Talk"),
					t("Poster"),
					t("Lightning talk"),
					t("Seminar"),
					t("Defence"),
					t("Other"),
				}),
				i(7, "What the audience should take away"),
				i(8, "Main message"),
				i(9, "Intro"),
				i(10, "2 min"),
				i(11, "Motivation and question"),
				i(12, "What to say, transitions, things not to forget"),
				i(13, "Likely question"),
				i(14, "Prepared answer"),
				i(15, "Slides, figures, test the link"),
				i(16, "Contacts, feedback, things to send afterwards"),
				i(0),
			}
		)
	),


	s("supmeeting", {
		t("# Supervision Meeting "),
		f(function()
			return os.date("%Y-%m-%d")
		end, {}),
		t({ "", "" }),
		t({ "## Student", "" }),
		i(1, "StudentName"),
		t({ "", "", "## Thesis status", "- Chapter: " }),
		i(2, ""),
		t({ "", "- Deadline: " }),
		i(3, ""),
		t({ "", "", "## Progress since last meeting", "- " }),
		i(4, ""),
		t({ "", "", "## Discussed", "- " }),
		i(5, ""),
		t({ "", "", "## Decisions made", "- " }),
		i(6, ""),
		t({ "", "", "## Action points", "- [ ] Student: " }),
		i(7, ""),
		t({ "", "- [ ] Cesar: " }),
		i(8, ""),
		t({ "", "", "## Waiting on", "- " }),
		i(9, "None"),
		t({ "", "", "## Next meeting", "" }),
		i(0, "TBC"),
	}),

	s("meeting", {
		t("# Meeting "),
		f(function()
			return os.date("%Y-%m-%d") -- auto-inserts today's date
		end, {}),
		t({ "", "", "## Present", "" }),
		i(1, "Cesar, StudentName"),
		t({ "", "", "## Progress since last meeting", "- " }),
		i(2, ""),
		t({ "", "", "## Discussed", "- " }),
		i(3, ""),
		t({ "", "", "## Decisions made", "- " }),
		i(4, ""),
		t({ "", "", "## Action points", "- [ ] Student: " }),
		i(5, ""),
		t({ "", "- [ ] Cesar: " }),
		i(6, ""),
		t({ "", "", "## Next meeting", "" }),
		i(7, "TBC"),
		i(0, ""),
	}),
}
