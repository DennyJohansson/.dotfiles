// docs: https://kasper.github.io/phoenix/
// based on https://github.com/azamuddin/phoenix/blob/master/.phoenix.js 
// Preferences
Phoenix.set({
  // daemon: true,
  openAtLogin: true,
});

Event.on('willTerminate', () => {
  Storage.remove('lastPositions');
  Storage.remove('maxHeight');
})

function frameRatio(a, b) {
  const widthRatio = b.width / a.width;
  const heightRatio = b.height / a.height;

  return ({ width, height, x, y }) => {
    width = Math.round(width * widthRatio);
    height = Math.round(height * heightRatio);
    x = Math.round(b.x + (x - a.x) * widthRatio);
    y = Math.round(b.y + (y - a.y) * heightRatio);

    return { width, height, x, y };
  };
}

// Globals
const HIDDEN_DOCK_MARGIN = 3;
const INCREMENT = 0.05;
const CONTROL_SHIFT = ['ctrl', 'shift'];
const MEH = ['ctrl', 'alt', 'shift'];

// Relative Directions
const LEFT = 'left';
const RIGHT = 'right';
const CENTRE = 'centre';

// Cardinal Directions
const NW = 'nw';
const NE = 'ne';
const SE = 'se';
const SW = 'sw';
const EAST = 'east';
const WEST = 'west';
const NORTH = 'north';
const SOUTH = 'south';

class ChainWindow {
  constructor(window, margin = 10) {
    this.window = window;
    this.margin = margin;
    this.frame = window.frame();
    this.parent = window.screen().flippedVisibleFrame();
  }

  // Difference frame
  difference() {
    const { parent, frame } = this;
    return {
      x: parent.x - frame.x,
      y: parent.y - frame.y,
      width: parent.width - frame.width,
      height: parent.height - frame.height,
    };
  }

  // Set frame
  set() {
    const { window, frame } = this;
    window.setFrame(frame);
    this.frame = window.frame();
    return this;
  }

  // Move to screen
  screen(screen) {
    this.parent = screen.flippedVisibleFrame();
    return this;
  }

  // Move to cardinal directions NW, NE, SE, SW or relative direction CENTRE
  to(direction) {
    const { parent, margin } = this;
    const difference = this.difference();

    // X-coordinate
    switch (direction) {
      case NW:
      case SW:
        this.frame.x = parent.x + margin;
        break;
      case NE:
      case SE:
        this.frame.x = parent.x + difference.width - margin;
        break;
      case CENTRE:
        this.frame.x = parent.x + (difference.width / 2);
        break;
      default:
    }

    // Y-coordinate
    switch (direction) {
      case NW:
      case NE:
        this.frame.y = parent.y + margin;
        break;
      case SE:
      case SW:
        this.frame.y = parent.y + difference.height - margin;
        break;
      case CENTRE:
        this.frame.y = parent.y + (difference.height / 2);
        break;
      default:
    }

    return this;
  }

  // Resize SE-corner by factor
  resize(factor) {
    const { parent, margin, frame } = this;
    const difference = this.difference();
    let delta;
    if (factor.width) {
      delta = Math.min(parent.width * factor.width, difference.x + difference.width - margin);
      this.frame.width += delta;
    } else if (factor.height) {
      delta = Math.min(
        parent.height * factor.height,
        difference.height - frame.y + margin + HIDDEN_DOCK_MARGIN,
      );
      this.frame.height += delta;
    }
    return this;
  }

  // Maximise to fill whole screen
  maximise() {
  }

  // Halve width
  halve() {
    this.frame.width /= 2;
    return this;
  }

  // Fit to screen
  fit() {
    const difference = this.difference();
    if (difference.width < 0 || difference.height < 0) {
      this.maximise();
    }
    return this;
  }

  // Fill relatively to LEFT or RIGHT-side of screen, or fill whole screen
  fill(direction) {
    this.maximise();
    if (direction === LEFT || direction === RIGHT) {
      this.halve();
    }
    switch (direction) {
      case LEFT:
        this.to(NW);
        break;
      case RIGHT:
        this.to(NE);
        break;
      default:
        this.to(NW);
    }
    return this;
  }
}

// Chain a Window-object
Window.prototype.chain = function() {
  return new ChainWindow(this);
};

// To direction in screen
Window.prototype.to = function(direction, screen) {
  const window = this.chain();
  if (screen) {
    window.screen(screen).fit();
  }
  window.to(direction).set();
};

// Fill in screen
Window.prototype.fill = function(direction, screen) {
  const window = this.chain();
  if (screen) {
    window.screen(screen);
  }
  window.fill(direction).set();
  // Ensure position for windows larger than expected
  if (direction === RIGHT) {
    window.to(NE).set();
  }
};

// Resize by factor
Window.prototype.resize = function(factor) {
  this.chain().resize(factor).set();
};

/* Position Bindings */

Key.on('q', CONTROL_SHIFT, () => {
  const window = Window.focused();
  if (window) {
    window.to(NW);
  }
});

Key.on('w', CONTROL_SHIFT, () => {
  const window = Window.focused();
  if (window) {
    window.to(NE);
  }
});

Key.on('s', CONTROL_SHIFT, () => {
  const window = Window.focused();
  if (window) {
    window.to(SE);
  }
});

Key.on('a', CONTROL_SHIFT, () => {
  const window = Window.focused();
  if (window) {
    window.to(SW);
  }
});

Key.on('z', CONTROL_SHIFT, () => {
  const window = Window.focused();
  if (window) {
    window.to(CENTRE);
  }
});

Key.on('q', MEH, () => {
  const window = Window.focused();
  if (window) {
    window.to(NW, window.screen().next());
  }
});

Key.on('w', MEH, () => {
  const window = Window.focused();
  if (window) {
    window.to(NE, window.screen().next());
  }
});

Key.on('s', MEH, () => {
  const window = Window.focused();
  if (window) {
    window.to(SE, window.screen().next());
  }
});

Key.on('a', MEH, () => {
  const window = Window.focused();
  if (window) {
    window.to(SW, window.screen().next());
  }
});

Key.on('z', MEH, () => {
  const window = Window.focused();
  if (window) {
    window.to(CENTRE, window.screen().next());
  }
});

/* Fill Bindings */

Key.on('o', CONTROL_SHIFT, () => {
  const window = Window.focused();
  if (window) {
    window.fill(LEFT);
  }
});

Key.on('p', CONTROL_SHIFT, () => {
  const window = Window.focused();
  if (window) {
    window.fill(RIGHT);
  }
});

/* Size Bindings */

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

/* Focus Bindings */

// TODO: this one would be nice to have, it's not working though
// Key.on('b', MEH, () => {
//   const last = _.last(Window.recent());
//   if (last) {
//     last.focus();
//   }
// });

// Key.on('.', CONTROL_SHIFT, () => {
//   const window = Window.focused();
//   if (!window) {
//     return
//   }
//
//   const oldScreen = window.screen();
//   const newScreen = oldScreen.next();
//
//   if (oldScreen.isEqual(newScreen)) {
//     return;
//   }
//
//   const ratio = frameRatio(
//     oldScreen.flippedVisibleFrame(),
//     newScreen.flippedVisibleFrame(),
//   )
//
//   window.setFrame(ratio(window.frame()));
//
// })


Key.on('f', CONTROL_SHIFT, () => {
  window.maximise();
})

// Key.on('/', CONTROL_SHIFT, function() {
//
//   const window =
//     Window.focused();
//
//   window.setSize({
//     height: window.size().height / 2,
//     width: window.size().width
//   })
// })

Key.on('*', MEH, function() {
  App.launch('Kitty').focus();
})

Key.on(']', MEH, function() {
  App.launch('Brave Browser').focus();
})

Key.on('}', MEH, function() {
  App.launch('Slack').focus();
})

Key.on(')', MEH, function() {
  App.launch('Spotify').focus();
})

Key.on('=', MEH, function() {
  App.launch('Microsoft Teams').focus();
})

Key.on('&', MEH, function() {
  App.launch('Microsoft Outlook').focus();
})

Key.on('(', MEH, function() {
  App.launch('Discord').focus();
})

/**
 * Move window to space on the right 
 */
Key.on('right', CONTROL_SHIFT, function() {

  const window =
    Window.focused();

  const space =
    Space.active();

  if (!window || !space) return;

  const nextSpace =
    space.next();

  space.removeWindows([window]);
  nextSpace.addWindows([window]);

  window.focus();

});


/**
 * Move window to space on the left 
 */
Key.on('left', CONTROL_SHIFT, function() {

  const window =
    Window.focused();

  const space =
    Space.active();

  if (!window || !space) return;

  const previousSpace =
    space.previous();

  space.removeWindows([window]);
  previousSpace.addWindows([window]);

  window.focus();

})
