# Godot Action & Adventure RPG Game

### Guide by [Michael Games](https://www.youtube.com/@MichaelGamesOfficial)
### Done by [Me](https://github.com/eapzzz)

---

### Project Guide
Detailed walkthrough and development process can be found here:
**[YouTube Playlist](https://www.youtube.com/playlist?list=PLfcCiyd_V9GH8M9xd_QKlyU8jryGcy3Xa)**

---

### How to start from a specific episode?

If you want to start from a specific point (e.g., you are stuck on E49 and want to use my finished E48), follow these steps:

1. **Find the Episode Hash:**
   * Go to the **Commits** tab in this repository.
   * Find the commit for the episode you want (e.g., `E48: Player Combat`).
   * Copy the **Commit Hash** (the 7-character code like `a1b2c3d`).

2. **Clone and Checkout:**
    Open your terminal in the desired folder and run:
   ```bash
   git clone https://github.com/eapzzz/AARPG.git)
   cd AARPG
   git checkout <PASTE_HASH_HERE>

3. **Open in Godot:**
    Import the ```project.godot``` file into Godot by clicking **Import** in the Project List. You now have exact project state from that episode.

Note: If you want to go back to the latest version, just run git checkout main
