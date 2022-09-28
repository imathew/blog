---
title: "A new tiebreaker for footy tipping"
description: "We can rank footy tippers better than by using margin games."
date: "2016-11-21"
categories: 
  - "sport"
  - "technology"
code: true
---

When people used paper to manage their workplace footy tipping competitions they needed a simple method to decide tiebreakers. The closest guess to the margin of the round's blockbuster game was usually the way to sort end-of-week results, and this was sometimes used cumulatively to sort end-of-season results.

Many online competitions follow this tradition and still use the same method to separate contestants on the same number of wins. It's OK, but it could be improved. Now that tipping systems are automated why not rely on the computer to provide a better ranking of participants?

The problem as I see it: Imagine two participants tip eight of nine games correctly. Participant A's incorrect tip was in a game decided by a margin of one point, and Participant B incorrectly tipped a game decided by a margin of 80 points. Both participants were wrong about one game, but Participant B was "more wrong". This, I think, ought to come into play for tiebreakers before worrying about choosing margins of blockbuster games.

## Tip Quality

My suggestion is for a 'tip quality' figure (TQ), based on a similar principle to the AFL ladder's percentage tiebreaker, to be introduced to separate those contestants on the same base score. For each correct tip, the participant's TQ will increase according to a function of that game's margin. For each incorrect tip, the participant's TQ will decrease likewise. The competitor with the higher TQ will win any required tiebreak.

Initially I had imagined a simple calculation - that all margins in games tipped correctly be summed and added to the competitor's TQ, and all margins in games tipped incorrectly be summed and subtracted from their TQ. However, margin alone is inadequate - TQ would need to consider the margin as a percentage of the combined total score of both teams to provide an adequate gauge.

Consider three hypothetical results of AFL matches: 
```
Carlton  110 - 90 Collingwood
Melbourne 60 - 40 St Kilda
Fremantle 30 - 10 Sydney
```

All three games were decided by a margin of twenty points, but while Carlton beat Collingwood by a margin equal to 10% of the total score, Melbourne beat St Kilda by 20% of the total score, and Fremantle beat Sydney by a whopping 50% of the total score. While there are many in-game variables that fans would consider when determining which game was the best match, all that a computer can go on is the raw score, which is appropriate anyway since it is score alone that decides the result. By that metric, Fremantle had the greater win.

## Round 1, 2015

Here is an example from the AFL (Round 1, 2015). Both participants tipped five games correctly, but while Participant A's incorrect tips were in reasonably close games, Participant B tipped a side that was flogged by twelve goals.

![TQ example](/img/tq.png)

The first game was Carlton vs Richmond. Both participants correctly tipped Richmond, who won by a margin of 27 points, or 14.75% of the 183 points scored in the game. For TQ purposes this figure is taken and used as a raw number (not a percentage), so 14.75 is added to their TQ.

The seventh game was Adelaide vs North Melbourne. The Crows won by a margin of 77 points, or 37.93% of the 203 points scored in the match. Participant A picked this correctly and had 39.93 added to their TQ. Participant B picked incorrectly and had 39.93 subtracted from their TQ.

At the end of Round 1, Participant A achieved a TQ of 80.14, which puts them ahead of Participant B's 19.28, and via a TQ tiebreaker gives them the win for the week. For any individual week the score would be reset, but a cumulative value would be calculated over the course of the season to provide an end-of-year TQ value for each tipster, providing a tiebreaker for the final standings.

The TQ is less useful in an individual round than it is over the course of a whole season, since people are more likely to pick the same combination of results in a single week. The "guess the margin" option could still be employed as a further tiebreaker in that scenario, and I think this is a fairer check to apply before resorting to that method.

Over the course of a home-and-away season it is unlikely that two people will have tipped the same combination of teams, so it provides an excellent tiebreaker. In the cutthroat world of footy tipping, with pride and money at stake, a tiebreaker that better reflects the skill (or fortune) of the competitors would be welcome, and a relatively simple task for an online tipping system to provide.