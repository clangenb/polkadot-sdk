# Polkadot-SDK Open Issues Overview

**Date:** 2026-03-19
**Total open items (issues + PRs):** ~2,208
**Issues surveyed:** ~250 (pages 1-10 + label-filtered queries + PR cross-references)

## Table of Contents

1. [Executive Summary](#executive-summary)
2. [Likely Obsolete Issues](#1-likely-obsolete-issues)
3. [Actively Being Worked On](#2-actively-being-worked-on)
4. [Assigned But Stale](#3-assigned-but-stale)
5. [Free to Work On](#4-free-to-work-on)
6. [Production-Impacting Issues](#production-impacting-issues)
7. [Suggestions for Improving This Report](#suggestions)

---

## Executive Summary

The polkadot-sdk issue tracker has significant accumulated debt. ~20 issues date back to 2019-2023 with no meaningful activity and should be triaged for closure. At least 3 issues have merged PRs and should simply be closed. Active work clusters around **statement-store** (~14 issues), **low-latency parachains** (~15 issues), **smart contracts/Revive** (~12 issues), **collator protocol revamp** (~5 issues), and **DAP** (3 new issues). There are 16 mentored/good-first-issues but many already have open PRs despite appearing "unassigned". After PR cross-referencing, the truly free actionable issues are fewer than the label suggests. The highest-priority free issues are correctness bugs in core pallets and DX improvements.

---

## 1. Likely Obsolete Issues

Issues with no meaningful updates for 12+ months, superseded by newer work, too vague to be actionable, or already fixed by merged PRs.

### Should be closed (merged PRs already fix them)

| # | Title | Evidence |
|---|-------|---------|
| 4334 | Add Statement Distribution V2/V3 Metrics | PR #4554 merged Jul 2024 |
| 4073 | XCM NonFungible adapter inconsistencies (vulnerability) | PRs #1242, #4300, #5620 all merged |
| 3683 | FRAME Executive invariant fuzzer | PR #3774 merged Jul 2024 (assignee gitofdeepanshu) |

### Should be triaged for closure (stale/superseded)

| # | Title | Created | Last Updated | Why Obsolete |
|---|-------|---------|-------------|--------------|
| 369 | "And gate" for EnsureOrigin | 2019-07 | 2025-08 | 7 years old, D0-easy but never done — likely no longer needed |
| 989 | Parachains low-level networking meta-issue | 2020-07 | 2024-10 | 6y old meta, networking entirely rearchitected |
| 327 | Tokens Horizon | 2021-03 | 2025-07 | 5y old vision doc (gavofyork), `fungible` traits largely landed |
| 925 | XCM Horizon | 2021-10 | 2025-04 | 4.5y meta, XCM is now at v5 — horizon has shifted |
| 278 | Vision: Redesign Event system | 2022-04 | 2025-03 | 4y vision, no concrete plan materialized |
| 288 | Vision: Improve DX with better Config Traits | 2022-01 | 2025-11 | 4y vision, `derive_impl` largely addresses this |
| 226 | FRAME: Move pallets to `fungible` traits | 2023-01 | 2026-01 | 3y meta-tracking, most pallets migrated; remainder is tail work |
| 239 | Tracking: `try_state` hook for all pallets | 2022-12 | 2025-06 | 3y meta-tracking, most critical pallets done |
| 742 | Time Disputes | 2023-01 | 2024-12 | Meta-issue, no activity in 15 months |
| 616 | Collator Protocol Revamp Draft | 2023-06 | 2025-01 | Superseded by active revamp work (#11023, #10932, etc.) |
| 60 | Light sync state needs a proper format | 2022-04 | 2026-02 | 4y old, 25 comments, never converged |
| 1930 | Warp sync doesn't work if target block is genesis | 2023-10 | 2025-10 | Edge case, 2.5y, unlikely to matter in practice |
| 2081 | Unify imports at the top of a file | 2023-10 | 2025-11 | Style nit, never enforced, not actionable at scale |
| 590 | Improve file structure | 2023-08 | 2025-07 | Too broad, 20 comments but no convergence |
| 10035 | cmd bot failed to add label | 2025-10 | 2025-10 | Trivial CI tooling, 0 comments, likely OBE |
| 10009 | Increase ALITH's initial balance in revive-dev-node | 2025-10 | 2025-10 | Trivial config, 0 comments, 5 months stale |
| 7701 | Metadata hash verification for contracts | 2025-02 | 2025-03 | Meta, 19 comments, no updates in 12 months |

**Recommendation:** Batch-close the first group immediately. For the second group, close with "stale / superseded" label, or convert #226 and #239 to checklists tracking remaining work.

---

## 2. Actively Being Worked On

Grouped by initiative. Issues with recent commits, assignees, or active discussion (updated in last ~6 weeks).

### Statement Store (14 issues)
| # | Title | Assignee | Updated |
|---|-------|----------|---------|
| 11411 | Race between is_major_sync and receiving statements | — | 2026-03-19 |
| 11396 | HostAPI integration guide | AndreiEres | 2026-03-17 |
| 11331 | Add new expected Load Model to e2e load testing | — | 2026-03-10 |
| 11287 | Implement Bloom Filters for light nodes | AndreiEres | 2026-03-10 |
| 11286 | Implement light node | AndreiEres | 2026-03-05 |
| 11285 | Working prototype of light node | AndreiEres | 2026-03-05 |
| 11269 | Release new Substrate primitives for individuality | s0me0ne-unkn0wn | 2026-03-04 |
| 11265 | Make it more configurable from CLI | s0me0ne-unkn0wn | 2026-03-09 |
| 10997 | Potential RPC improvements | — | 2026-02-05 |
| 10926 | Set allowances by sending transaction | alexggh | 2026-02-05 |
| 10910 | Refactor index locking | s0me0ne-unkn0wn | 2026-03-09 |
| 10892 | Process messages from peers in parallel | DenzelPenzel | 2026-02-13 |
| 10820 | Make broadcasting multithreaded | DenzelPenzel | 2026-02-13 |
| 10783 | Integration tests | DenzelPenzel | 2026-02-16 |

### Low-Latency Parachains (15 issues)
| # | Title | Assignee | Updated |
|---|-------|----------|---------|
| 11350 | Skip fewer relay parents at session boundary | iulianbarbu | 2026-03-12 |
| 11266 | Relax UMP signal check for speculative messaging | — | 2026-03-04 |
| 11257 | Fix para runtime upgrade confidence issues | — | 2026-03-04 |
| 11256 | Use correct host configuration in candidate validation | — | 2026-03-04 |
| 11208 | Make older relay parents work on node side | alindima | 2026-03-12 |
| 11171 | Use last finished slot scheduling parent | iulianbarbu | 2026-03-04 |
| 11170 | Low-latency cumulus changes | — | 2026-03-04 |
| 11084 | Port collator protocol to new experimental protocol | AlexandruCihodaru | 2026-03-04 |
| 10883 | Low-latency relay chain (tracking) | — | 2026-03-12 |
| 10836 | Design/architect Collator Resubmissions | iulianbarbu | 2026-03-04 |
| 10501 | block-builder: Improve robustness on runtime API errors | — | 2026-03-04 |
| 10500 | peerset: Backoff too restrictive for notification protocol | — | 2026-03-04 |
| 10499 | Collation not advertised to now-NotAuthority peer | — | 2026-03-04 |
| 10465 | Improve debugability of PeerConnected events | — | 2026-03-04 |
| 10341 | collator/elastic scaling: Advertising to peer timed out | — | 2026-03-04 |

### DAP / DAP Satellites (3 issues, all new)
| # | Title | Assignee | Updated |
|---|-------|----------|---------|
| 11409 | Redirect XCM execution fees to DAP | sigurpol | 2026-03-18 |
| 11410 | Split XCM delivery fees to DAP via HandleFee wrapper | sigurpol | 2026-03-18 |
| 11408 | Redirect user-initiated burns to DAP | sigurpol | 2026-03-18 |

### Collator Protocol Revamp (4 issues)
| # | Title | Assignee | Updated |
|---|-------|----------|---------|
| 11023 | Implement parallel fetching | mchristou | 2026-02-24 |
| 10932 | Picking advertisement doesn't consider lookahead | tdimitrov | 2026-01-31 |
| 10887 | Late advertisement avoids reputation decrease | — | 2026-01-25 |
| 7753 | Testing tools | tdimitrov | 2025-10-08 |

### Smart Contracts / Revive (~10 issues)
| # | Title | Assignee | Updated |
|---|-------|----------|---------|
| 11279 | Fix ERC-20 approve semantics in precompile | — | 2026-03-19 |
| 11383 | revive-rpc: Does not support "earliest" tag | marian-radu | 2026-03-17 |
| 9569 | EVM backend: Account Abstraction | pgherveou | 2026-03-17 |
| 8597 | Audit pallet_revive | patriciobcs | 2026-03-17 |
| 8365 | Add ERC20 pre-compile | pgherveou | 2026-01-30 |
| 6775 | Full XCM support in Polkadot Hub Contracts | franciscoaguirre | 2026-03-17 |
| 9578 | EVM backend: Ethereum state tests | — | 2026-03-17 |
| 9574 | Disambiguate warm/cold storage | — | 2026-03-17 |
| 9573 | Support CALLCODE | — | 2026-03-17 |
| 9533 | Check if contract code is already on chain | — | 2026-03-17 |

### Polkadot Node / Validation (5 issues)
| # | Title | Assignee | Updated |
|---|-------|----------|---------|
| 11431 | Before activation: Run disabling test | — | 2026-03-19 |
| 11423 | Fix collation generation relay parent usage | — | 2026-03-18 |
| 11412 | Simplify upgrade/extension of validation protocols | — | 2026-03-18 |
| 11373 | Remove v1 CandidateDescriptor support | sandreim | 2026-03-13 |
| 11272 | Fix node feature detection | eskimor | 2026-03-13 |

### XCM (4 issues)
| # | Title | Assignee | Updated |
|---|-------|----------|---------|
| 9054 | DOT transfers using pallet-xcm after AHM | — | 2026-03-18 |
| 9431 | Tracking: XCM documentation | franciscoaguirre | 2026-02-03 |
| 7965 | Review Outcome::Error usage in XCM Executor | franciscoaguirre | 2026-03-06 |
| 3861 | Allow one chain to be account provider for another | — | 2026-03-16 |

### Staking (3 issues)
| # | Title | Assignee | Updated |
|---|-------|----------|---------|
| 10993 | NominationPools points/balance discrepancy | Ank4n | 2026-03-10 |
| 10813 | staking-async: Refactor benchmarking | — | 2026-03-18 |
| 8807 | Use active era not current era for bonding | Ank4n | 2025-11-26 |

---

## 3. Assigned But Stale

Issues with an assignee but no issue updates for 2+ months. PR cross-references reveal which are actually progressing silently.

### Stale issue, but has active open PR (work in progress)

| # | Title | Assignee | Last Issue Update | Open PR |
|---|-------|----------|-------------------|---------|
| 5881 | Remove tracing-gum | AlexandruCihodaru | 2025-07-28 | PR #5965 (draft) |
| 8869 | Improve parachains_paras_inherent benchmarks | EleisonC | 2025-09-08 | PR #11080 |
| 7564 | Balance Transfer proxy limit/threshold | Nathy-bajo | 2025-11-20 | PR #7938 |
| 8475 | Agile Coretime: auto renew when PotentialRenewal exists | Stephenlawrence00 | 2026-01-21 | PR #10896 |
| 7807 | Deprecate XCMv3 | programskillforverification | 2026-02-21 | PR #11098 + PR #8209 (draft) |
| 7635 | Feature: Freeze a parachain | MrishoLukamba | 2026-02-19 | PR #11106 (Nathy-bajo took over) |

### Truly stale (no PR activity either)

| # | Title | Assignee | Last Updated | Months Stale |
|---|-------|----------|-------------|-------------|
| 10439 | Remove delegation migration checks from pool | andreitrand | 2025-11-28 | 4 |
| 4230 | Polkadot Doppelganger test | pepoviola | 2025-10-10 | 5 |
| 3210 | ranked-collective voting below minimum rank | abdbee | 2026-01-20 | 2 |
| 10364 | go-libp2p/litep2p interop challenges | dmitry-markin, lexnv | 2025-11-21 | 4 |

### Should be closed (already fixed)

| # | Title | Assignee | Evidence |
|---|-------|----------|---------|
| 3683 | FRAME Executive invariant fuzzer | gitofdeepanshu | PR #3774 merged Jul 2024 |

**Recommendation:** First group is fine — just the issue tracker not reflecting PR activity. Ping the truly stale group for status. Close #3683.

---

## 4. Free to Work On

Issues with **no assignee AND no open PR** referencing them. Verified by checking issue timelines for cross-referenced PRs.

### Small Effort (days)

| Priority | # | Title | Labels | Why Prioritize |
|----------|---|-------|--------|---------------|
| 1 | 10412 | `pallet-assets`: `do_refund` destroys balance without decrementing supply | — | Correctness bug in core pallet |
| 2 | 10181 | `pallet-tx-pause` docs say it can pause pallets but it can't | I2-bug | Misleading docs, quick fix, no PR exists |
| 3 | 10943 | check-publish-compile: simulate release for single prdoc | — | CI/DX improvement (one prior PR merged but issue still open) |
| 4 | 8313 | Add boilerplate for staking-async guide book | T11-documentation | Docs scaffolding |
| 5 | 10251 | More events for paras pallet | — | Observability improvement |
| 6 | 10996 | Bounties: manual cleanup call for old bounty accounts | — | Small pallet enhancement |

**Removed from previous version** (have open PRs despite no assignee):
- ~~#4334~~ — PR #4554 merged
- ~~#8736~~ — PR #11143 open
- ~~#3783~~ — PR #11063 open

### Medium Effort (1-2 weeks)

| Priority | # | Title | Labels | Why Prioritize |
|----------|---|-------|--------|---------------|
| 1 | 10438 | Make pallet-scheduler user friendly | — | DX improvement, no PR exists |
| 2 | 3847 | pallet-xcm `transfer_assets`: take fees separately | C1-mentor, T6-XCM | Better API, mentored, only closed PRs |
| 3 | 11032 | Reduce Active Validator Count Based on Core Needs | — | Resource optimization |
| 4 | 10473 | try_state check for pallet atomic swap | — | Test coverage gap |
| 5 | 9026 | RFC 150: Allow Voting While Delegating | — | Governance improvement |
| 6 | 10622 | Fix session: proper weight accounting for rotation | — | Weight correctness (has own PR, check status) |

**Removed from previous version** (have open PRs despite no assignee):
- ~~#9548~~ — PRs #10176, #10178 open
- ~~#7095~~ — PR #7123 (draft) open
- ~~#6929~~ — PRs #7045, #7293, #7304 open
- ~~#1138~~ — PR #10931 open
- ~~#10825~~ — has active PR
- ~~#4073~~ — multiple PRs already merged
- ~~#8796~~ — PR #11212 open
- ~~#10900~~ — PR #10916 open

### Large Effort (weeks to months)

| Priority | # | Title | Labels | Why Prioritize |
|----------|---|-------|--------|---------------|
| 1 | 9607 | sync: Add backpressure to import queue | D3-involved | Stability, prevents OOM, no PR |
| 2 | 10563 | Speculative Availability | — | Performance, 7 comments, no PR |
| 3 | 5298 | pallet-assets sufficient assets ED benefits | T2-pallets | Economic design, only closed draft PR |
| 4 | 9966 | Permissionless scheduling with scheduler pre-compile | I5-enhancement | Smart contracts enabler |
| 5 | 11199 | RFC: Deferred Dispatch for pallet-whitelist | — | Governance mechanism |
| 6 | 11100 | RFC: Ordered Spend Payouts | — | Treasury improvement |
| 7 | 11099 | RFC: Convert Entity/Pallet Origin to Signed Origin | — | Architecture |
| 8 | 4715 | RFC: Treasury API for Cross-Chain Transfers | — | Cross-chain treasury |
| 9 | 7961 | Improve Treasury payout of stables | I5-enhancement | Treasury UX |
| 10 | 11337 | Create ModuleInvalidity (descriptive invalidities) | — | Error handling |

---

## Production-Impacting Issues (Triage Urgently)

Reported bugs affecting live networks — should be prioritized regardless of category.

| # | Title | Updated | Comments | Network |
|---|-------|---------|----------|---------|
| 11034 | Stuck transactions on Paseo Asset Hub | 2026-03-17 | 55 | Paseo |
| 10719 | RPC randomly stops providing chain_getBlockHash | 2026-02-01 | 33 | Polkadot AH |
| 10751 | Revive not working with 1:1 decimals | 2026-02-09 | 30 | Polkadot |
| 11391 | Trie cache write lock timeout | 2026-03-17 | 1 | Unknown |
| 10765 | Kusama OOM for rpc & boot node | 2026-01-20 | 3 | Kusama |
| 10392 | Validator OOM during slow sync (rocksdb) | 2026-01-20 | 25 | Polkadot |
| 10821 | AssetHub archive node flooded with logs | 2026-01-20 | 6 | Polkadot AH |
| 11338 | Validator missing votes when becoming active | 2026-03-17 | 15 | Polkadot |
| 10921 | Validators missing votes since Elastic Scaling | 2026-02-23 | 5 | Polkadot AH |
| 10940 | Transaction Drops on Asset Hub | 2026-03-16 | 4 | Asset Hub |

---

## Suggestions for Improving This Report

1. **Automate with GitHub Actions.** A weekly scheduled workflow could query the API, classify issues by staleness/activity, and post a summary to a tracking issue or Slack. The heuristics (stale = no update in 60 days with assignee, obsolete = no update in 12 months) are simple to codify.

2. **Cross-reference PRs automatically.** This report manually checked ~30 issues for linked PRs. A script using the timeline API on all open issues would catch "effectively closed" issues and "unassigned but claimed" issues at scale.

3. **Add a "confirmed" triage step.** 50%+ of bugs carry `I10-unconfirmed`. A triage rotation that confirms or closes unconfirmed bugs within 2 weeks would dramatically reduce noise.

4. **Enforce assignee hygiene.** Several issues have assignees from months ago with no activity. A bot that pings after 30 days of inactivity and unassigns after 45 days would keep the "assigned" signal meaningful.

5. **Split meta-issues into checklists.** Issues like #226, #239, #327 are tracking issues with dozens of sub-tasks mixed into comments. Converting them to GitHub Projects or checklist issues with checkboxes would make progress visible.

6. **Label effort estimates.** Only ~10% of issues have `D0-easy`/`D1-medium`/`D3-involved` labels. Expanding this to all issues would let contributors self-select by capacity.

7. **Separate "RFC/discussion" from "actionable work".** Issues like #11099, #11100, #11199 are RFCs that need design consensus before implementation. A dedicated label (e.g., `RFC` or `needs-design`) would prevent them from cluttering the actionable backlog.

8. **Track issue velocity.** This report is a snapshot. Tracking opened-vs-closed per week by category would reveal whether specific areas are accumulating debt.
