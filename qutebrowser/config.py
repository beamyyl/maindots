config.load_autoconfig(False)
# ===== Tabs =====
config.bind('<Ctrl-t>', 'open -t')           # Opens a new blank tab
config.bind('<Ctrl-w>', 'tab-close')         # This one is correct
config.bind('<Ctrl-Tab>', 'tab-next')        # This one is correct
config.bind('<Ctrl-Shift-Tab>', 'tab-prev')  # This one is correctonfig.bind('<Ctrl-t>', 'tab-new')           # New tab
config.bind('<Ctrl-Shift-Tab>', 'tab-prev')  # Previous tab

# Switch to tabs 1-9 with Alt+number
for i in range(1, 10):
    config.bind(f'<Alt-{i}>', f'tab-focus {i}')

# ===== History & Downloads =====
config.bind('<Ctrl-h>', 'history')  # Open history in new tab
config.bind('<Ctrl-j>', 'open -t about:downloads')             # Open downloads

# ===== Private tabs =====
config.bind('<Ctrl-Shift-p>', 'open -p')        # Open new private tab

# ===== Hint mode scrolling (optional, makes keyboard navigation smoother) =====
config.bind('H', 'scroll left')                 # Scroll left
config.bind('L', 'scroll right')                # Scroll right
config.bind('J', 'scroll down')                 # Scroll down
config.bind('K', 'scroll up')                   # Scroll up
