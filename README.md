# Skill Levels

![Version](https://img.shields.io/badge/version-1.2.0-blue.svg)
![License](https://img.shields.io/badge/license-MIT-green.svg)
![Languages](https://img.shields.io/badge/languages-11-orange.svg)

A lightweight, dependency-free World of Warcraft addon that tracks your **Professions**, **Secondary Skills**, **Class Skills**, and **Weapon Skills** directly on your HUD with live level-up animations, custom color ranges, progress bars, and flexible multi-column layouts.

---

## Slash Commands

| Command | Description |
| :--- | :--- |
| `/sl` or `/skilllevels` | Open the Options window |
| `/sl reset` or `/skilllevels reset` | Reset all frame positions to the center of the screen |

> **Quick Controls:**
> * **Left-Click** any tracked skill row on your HUD to directly open your Professions or Skills window.
> * **Drag & Drop** any frame to reposition it (when *Lock position* is unchecked).
> * Access the options anytime via **Esc → Options → AddOns → Skill Levels**.

---

## Installation

1. Download the latest release from the [Releases](https://github.com/ZUNII/SkillLevels/releases) page (or clone this repository).
2. Extract the `SkillLevels` folder into your World of Warcraft AddOns directory:
   * **Forever** `_forever_\Interface\AddOns\`
3. Ensure the folder name is exactly `SkillLevels` and contains `SkillLevels.toc` and `SkillLevels.lua`.
4. Restart World of Warcraft or type `/reload` in-game.

---

## Key Features

### Tracked Skills & Smart Filters
* **Professions & Secondary Skills:** Tracks all primary professions alongside **Cooking**, **First Aid**, **Fishing**, **Poisons**, and **Comprehension**.
* **Secondary Display Modes:** Display secondary skills grouped with primary professions, separated into their own block/column, or completely hidden.
* **Class Skills:** Automatically tracks **Lockpicking** (for Rogues, until maximum skill rank is reached).
* **Individual Skill Selection:** Use the **Skill Selection** pop-out window to toggle individual learned professions or secondary skills on and off.
* **Weapon Skill Tracking:**
  * **Only Equipped Weapons:** Dynamically displays your currently equipped main-hand, off-hand, and ranged weapons (including **Unarmed** fallback) without switching mid-combat.
  * **Custom Weapon Selection:** Manually pick specific weapon types (with an *Only learned skills* filter) or show all weapon skills at once.
  * **Slot Toggles:** Independently show or hide Off-Hand and Ranged weapon tracking.

### Flexible Layouts & Ordering
* **Three Layout Modes:**
  * **Combined Frame (Vertical):** Stacks all active sections inside one movable frame with a customizable separator line.
  * **Side-by-Side (Columns Right):** Aligns sections horizontally into columns expanding to the right without overlapping—even during active level-up counters.
  * **Separate Frames (Free Move):** Splits Professions, Secondary Professions, and Weapons into three independently movable frames.
* **Custom Block Order:** Supports all 6 ordering combinations for *Professions*, *Weapons*, and *Secondary* blocks.
* **Frame Locking:** Lock all frames in place to prevent accidental movement.

### Colors, Progress Bars & Visibility
* **Custom Color Ranges:** Configure up to **6 rank intervals** (e.g., `0–150`, `151–225`, `226–299`) with custom RGB colors, separately for Professions and Weapons.
* **Cap & Max Alerts:** Highlight skills when a rank cap is reached (train next rank) and when maximum skill (`300`) is achieved.
* **Rainbow Mode:** Smooth synchronized rainbow color cycling across rows and progress bars.
* **Progress Bars & Typography:** Optional progress bars under each row, `Current/Max` display (e.g., `225/300`), text outline, and adjustable font sizes (`8–32`).
* **Smart Visibility:** Automatically **Hide in combat** and/or **Hide in instances**.

### Level-Up Counter & Custom Animation Editor
* **Level-Up Counter (`+1`):** Displays a green `+1` indicator next to your skill upon leveling up (visible for 10 seconds or permanently for the entire session).
* **7 Built-in Presets:** *Bounce & Glow*, *Float Up*, *Wave & Pulse*, *Sparkle*, *Letter Bounce* (UTF-8 safe across all alphabets and special characters), *Rainbow Flash*, or *Off*.
* **Animation Editor:** Fine-tune arrow bounce height, star glow brightness, double sparkle, counter pulse, letter wave height/speed, and rainbow speed with a live preview.

### Localization & In-Game Guide
* **11 Supported Languages:** Automatic client locale detection or manual override:

| Code | Language | Code | Language |
| :--- | :--- | :--- | :--- |
| `enUS` | English | `ruRU` | Русский |
| `deDE` | Deutsch | `plPL` | Polski |
| `frFR` | Français | `nlNL` | Nederlands |
| `esES` | Español | `svSE` | Svenska |
| `itIT` | Italiano | `csCZ` | Čeština |
| `ptBR` | Português | | |

* **Built-in Help Window:** Click the `?` button in the top-right corner of the options panel for a full localized feature reference.

---

## Contributing & Issues

Found a bug, missing translation, or have a feature suggestion? Feel free to open an [Issue](https://github.com/ZUNII/SkillLevels/issues) or submit a Pull Request.

## License

This project is licensed under the [MIT License](LICENSE).
