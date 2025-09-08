// docs: https://kasper.github.io/phoenix/
// based on https://github.com/azamuddin/phoenix/blob/master/.phoenix.js
// Preferences
// debug: ❯ log stream --process Phoenix

Phoenix.set({
  // daemon: true,
  openAtLogin: true,
});

Event.on("willTerminate", () => {
  Storage.remove("lastPositions");
  Storage.remove("maxHeight");
});

const MOVE_VALUE = 100;
const CONTROL_SHIFT = ["ctrl", "shift"];
const MEH = ["ctrl", "alt", "shift"];
const LEADER = MEH;

const LEFT = "left";
const RIGHT = "right";
const CENTRE = "centre";

let appHistoryCursor = 0;
let appHistory = [];
let initBackApp = null;

Key.on("=", LEADER, () => {
  const window = Window.focused();
  if (window) {
    window.setSize({ width: window.frame().width + MOVE_VALUE });
  }
});

Key.on("-", LEADER, () => {
  const window = Window.focused();
  if (window) {
    window.setSize({ width: window.frame().width - MOVE_VALUE });
  }
});

Key.on("c", LEADER, () => {
  const screen = Screen.main().flippedVisibleFrame();
  const window = Window.focused();

  if (window) {
    window.setSize({
      width: screen.width / 1.5,
      height: screen.height,
    });
    window.setTopLeft({
      x: screen.x + screen.width / 2 - window.frame().width / 2,
      y: screen.y + screen.height / 2 - window.frame().height / 2,
    });
  }
});

Key.on("left", LEADER, function () {
  const screen = Screen.main().flippedVisibleFrame();
  const window = Window.focused();

  if (window) {
    window.setSize({
      width: screen.width / 2,
      height: screen.height,
    });
    window.setTopLeft({
      x: 0,
      y: 0,
    });
  }
});

Key.on("right", LEADER, function () {
  const screen = Screen.main().flippedVisibleFrame();
  const window = Window.focused();

  if (window) {
    window.setSize({
      width: screen.width / 2,
      height: screen.height,
    });
    window.setTopLeft({
      x: screen.width / 2,
      y: 0,
    });
  }
});

Key.on("f", LEADER, () => {
  Window.focused().maximise();
});

const launchApp = (appName) => {
  App.launch(appName).focus();
};

Key.on("0", LEADER, function () {
  launchApp("Ghostty.app");
});

Key.on("9", LEADER, function () {
  launchApp("Brave Browser");
});

Key.on("8", LEADER, function () {
  launchApp("Slack");
});

Key.on("7", LEADER, function () {
  launchApp("IntelliJ IDEA Ultimate");
});

Key.on("6", LEADER, function () {
  launchApp("Microsoft Teams");
});

Key.on("5", LEADER, function () {
  launchApp("Discord");
});

Key.on("4", LEADER, function () {
  launchApp("Spotify");
});

Key.on("3", LEADER, function () {
  launchApp("Microsoft Outlook");
});

Key.on("2", LEADER, () => {
  // launchApp("Google Chrome");
  launchApp("Chromium");
});

// Key.on("2", LEADER, function () {
//   launchApp("Chromium");
// });

// Key.on("p", LEADER, () => {
//   const lines = App.all()
//     .map((a) => `${a.name()} — ${a.bundleIdentifier()}`)
//     .sort();
//   console.log(lines.join("\n"));
// });
