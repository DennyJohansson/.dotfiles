// docs: https://kasper.github.io/phoenix/
// based on https://github.com/azamuddin/phoenix/blob/master/.phoenix.js 
// Preferences
// debug: ❯ log stream --process Phoenix

Phoenix.set({
  // daemon: true,
  openAtLogin: true,
});

Event.on('willTerminate', () => {
  Storage.remove('lastPositions');
  Storage.remove('maxHeight');
})

const INCREMENT = 0.05;
const CONTROL_SHIFT = ['ctrl', 'shift'];
const MEH = ['ctrl', 'alt', 'shift'];

const LEFT = 'left';
const RIGHT = 'right';
const CENTRE = 'centre';

let appHistoryCursor = 0;
// don't save duplicates, 
// if the app is already in the history, remove it and add it to the front
let appHistory = [];
// TODO: support <leader> + b : go [b]ack to previous app
let initBackApp = null;

Key.on("+", MEH, () => {
  const window = Window.focused();
  if (window) {
    window.resize({ width: INCREMENT });
  }
});

Key.on('-', MEH, () => {
  const window = Window.focused();
  if (window) {
    window.resize({ width: -INCREMENT });
  }
});

Key.on('c', CONTROL_SHIFT, () => {
  const screen = Screen.main().flippedVisibleFrame();
  const window = Window.focused();

  if (window) {
    window.setSize(
      {
        width: screen.width / 1.2,
        height: screen.height,
      }
    );
    window.setTopLeft({
      x: screen.x + (screen.width / 2) - (window.frame().width / 2),
      y: screen.y + (screen.height / 2) - (window.frame().height / 2)
    });
  }
});

Key.on('left', CONTROL_SHIFT, function() {
  const screen = Screen.main().flippedVisibleFrame();
  const window = Window.focused();

  if (window) {
    window.setSize(
      {
        width: screen.width / 2,
        height: screen.height,
      }
    );
    window.setTopLeft({
      x: 0,
      y: 0,
    });
  }

});

Key.on('right', CONTROL_SHIFT, function() {
  const screen = Screen.main().flippedVisibleFrame();
  const window = Window.focused();

  if (window) {
    window.setSize(
      {
        width: screen.width / 2,
        height: screen.height,
      }
    );
    window.setTopLeft({
      x: screen.width / 2,
      y: 0,
    });
  }

})

Key.on('f', CONTROL_SHIFT, () => {
  Window.focused().maximise();
})

const launchApp = (appName) => {
  App.launch(appName).focus();
  const appIndex = appHistory.indexOf(appName);

  if (appIndex > -1) {
    appHistory.splice(appIndex, 1);
  }

  appHistory.unshift(appName);
  appHistoryCursor = 0;
}

const goBackToPreviousApp = () => {
  const currentApp = appHistory[appHistoryCursor];

  if (!initBackApp) {
    // first time pressing the key
    const prevApp = appHistory[appHistoryCursor + 1]

    if (prevApp) {
      appHistoryCursor += 1;
      initBackApp = currentApp;

      App.launch(prevApp).focus();
    }
  } else {
    // second time pressing the key
    App.launch(initBackApp).focus();
    initBackApp = null;
    appHistoryCursor -= 1;
  }
}

Key.on('b', MEH, goBackToPreviousApp);

Key.on('*', MEH, function() {
  launchApp('Kitty');
})

Key.on(']', MEH, function() {
  launchApp('Brave Browser');
})

Key.on('}', MEH, function() {
  launchApp('Slack');
})

Key.on(')', MEH, function() {
  launchApp('Spotify');
})

Key.on('=', MEH, function() {
  launchApp('Microsoft Teams');
})

Key.on('&', MEH, function() {
  launchApp('Microsoft Outlook');
})

Key.on('(', MEH, function() {
  launchApp('Discord');
})

Key.on('{', MEH, function() {
  launchApp('Chromium');
})

Key.on('o', MEH, function() {
  const appName = appHistory[(appHistoryCursor + 1)];

  if (appName) {
    App.launch(appName).focus();
    appHistoryCursor += 1;
  }
});

Key.on('i', MEH, function() {
  const appName = appHistory[(appHistoryCursor - 1)];

  if (appName) {
    App.launch(appName).focus();
    appHistoryCursor -= 1;
  }
});
