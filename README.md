# TvSimulation

This is a task used in the recruitment process to the company MindNexus GmbH. It has multiple purposes:

- ensure all the candidates are judged fairly by comparing the same task
- provides a solid foundation for the technical interview
- gives me understanding of your code style and quality
- hopefully is "fun" and not very long

## Overview

This is a standard Phoenix project without unnecessary things:

- no ecto repo, i18n, mailer, dashboard
- replaced default `/` page by `TvSimulationWeb.SimulationLive`, which is a view you should edit
- it has `instructor` library https://github.com/thmsmlr/instructor_ex preconfigured to use [GROQ](https://console.groq.com/docs/quickstart). It's free (with some rate-limiting in place), very fast, OpenAI-compatible service giving access to many models.
- You should use `llama3-70b-8192` model.

## Starting

To start your Phoenix server:

- Run `mix setup` to install and setup dependencies
- Export GROQ_API_KEY variable in the shell: `export GROQ_API_KEY=...`
- Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Instructions

You've received the instructions via the email. Please:

- clone this repository
- do all the necessary changes
- push to the PRIVATE github or gitlab repository and give me access. Public repositories won't be accepted!

My username is `Valian` on github and `Skalecki` on gitlab.
