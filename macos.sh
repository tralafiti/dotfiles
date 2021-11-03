#!/usr/bin/env zsh

############################################################################################
# Set up macOS preferences                                                                 #
#                                                                                          #
# Inspired by: ~/.macos — https://mths.be/macos                                            #
# See also: https://macos-defaults.com/ and                                                #
# https://developer.apple.com/documentation/devicemanagement/profile-specific_payload_keys #
###########################################################################################

# defaults write wrapper function: log out default changes
_defaults_write() {
    local domain key value value_old value_new
    domain="${1}"
    key="${2}"
    value="${@:3}"

    value_old=${$(defaults read ${domain} ${key} 2>/dev/null):-(null)}
    defaults write ${domain} ${key} ${=value}
    value_new=${$(defaults read ${domain} ${key} 2>/dev/null):-(null)}

    echo "  + ${domain} ${key}: ${value_old} -> ${value_new}"
}

# just getting s*** done copy&paste 🙈
_defaults_write_currentHost() {
    local domain key value value_old value_new
    domain="${1}"
    key="${2}"
    value="${@:3}"

    value_old=${$(defaults read ${domain} ${key} 2>/dev/null):-(null)}
    defaults -currentHost write ${domain} ${key} ${=value}
    value_new=${$(defaults read ${domain} ${key} 2>/dev/null):-(null)}

    echo "  + ${domain} ${key}: ${value_old} (currentHost) -> ${value_new}"
}

###############################################################################
# Variables and bootstrap                                                     #
###############################################################################

HOSTNAME="tralaPro"

###

echo "This script will set some basic properties on macOS"
echo ""

echo "* Close any open System Preferences panes, to prevent them from overriding settings we’re about to change"
osascript -e 'tell application "System Preferences" to quit'

echo "* Ask for the administrator password for the duration of this script and keeping it alive till script has finished"
sudo -v
# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


###############################################################################
# General UI/UX                                                               #
###############################################################################
echo ""
echo "* Adjusting general UI/UX settings ..."

# Set computer name (as done via System Preferences → Sharing)
sudo scutil --set ComputerName $HOSTNAME
sudo scutil --set HostName $HOSTNAME
sudo scutil --set LocalHostName $HOSTNAME
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string $HOSTNAME
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server ServerDescription -string $HOSTNAME

# Disable the over-the-top focus ring animation
_defaults_write NSGlobalDomain NSUseAnimatedFocusRing -bool false

# Adjust toolbar title rollover delay
_defaults_write NSGlobalDomain NSToolbarTitleViewRolloverDelay -float 0

# Expand save panel by default
_defaults_write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
_defaults_write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Expand print panel by default
_defaults_write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
_defaults_write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Save to disk (not to iCloud) by default
_defaults_write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Disable automatic termination of inactive apps
#_defaults_write NSGlobalDomain NSDisableAutomaticTermination -bool true

# Disable Helper Menu beeing always-on-top
_defaults_write com.apple.helpviewer DevMode -bool true

# Disable automatic capitalization - I know how to type macOS...
_defaults_write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Disable smart dashes - I still know how to type...
_defaults_write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Disable automatic period substitution ... you guessed it
_defaults_write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# Disable smart quotes - shame on you macOS!
_defaults_write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Disable auto-correct
_defaults_write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false


###############################################################################
# Trackpad, mouse, keyboard, Bluetooth accessories, and input                 #
###############################################################################
echo ""
echo "* Adjusting Trackpad, mouse, keyboard, Bluetooth accessories, and input ..."

# Trackpad: enable tap to click for this user and for the login screen
_defaults_write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
_defaults_write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
_defaults_write_currentHost NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Trackpad: map to-finger-tap to right-click
_defaults_write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 0
_defaults_write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
_defaults_write_currentHost NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 0
_defaults_write_currentHost NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true

# Enable full keyboard access for all controls
# (e.g. enable Tab in modal dialogs)
_defaults_write NSGlobalDomain AppleKeyboardUIMode -int 3

# Disable press-and-hold for keys in favor of key repeat
_defaults_write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Set fastest possible keyboard repeat rate
_defaults_write NSGlobalDomain KeyRepeat -int 1
_defaults_write NSGlobalDomain InitialKeyRepeat -int 10


###############################################################################
# Screen                                                                      #
###############################################################################
echo ""
echo "* Adjusting Screen ..."

# Require password immediately after sleep or screen saver begins
_defaults_write com.apple.screensaver askForPassword -int 1
_defaults_write com.apple.screensaver askForPasswordDelay -int 0

# Enable subpixel font rendering on non-Apple LCDs
# Reference: https://github.com/kevinSuttle/macOS-Defaults/issues/17#issuecomment-266633501
# TODO: wanted / nedded?
_defaults_write NSGlobalDomain AppleFontSmoothing -int 1


###############################################################################
# Finder                                                                      #
###############################################################################
echo ""
echo "* Adjusting Finder ..."

# Finder: show all filename extensions
_defaults_write NSGlobalDomain AppleShowAllExtensions -bool true

# Finder: show path bar
_defaults_write com.apple.finder ShowPathbar -bool true

# When performing a search, search the current folder by default
_defaults_write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Avoid creating .DS_Store files on network or USB volumes
_defaults_write com.apple.desktopservices DSDontWriteNetworkStores -bool true
_defaults_write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `glyv`
_defaults_write com.apple.finder FXPreferredViewStyle -string "clmv"

# Show the ~/Library folder
chflags nohidden ~/Library

# Show icons for hard drives, servers, and removable media on the desktop
_defaults_write com.apple.finder ShowHardDrivesOnDesktop -bool false
_defaults_write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
_defaults_write com.apple.finder ShowRemovableMediaOnDesktop -bool false

# Finder: show hidden files by default
#_defaults_write com.apple.finder AppleShowAllFiles -bool true

# Keep folders on top when sorting by name
#_defaults_write com.apple.finder _FXSortFoldersFirst -bool true

# Disable the warning when changing a file extension
_defaults_write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Enable spring loading (open folder when dragging file over it) for directories
_defaults_write NSGlobalDomain com.apple.springing.enabled -bool true

# Decrease the spring loading delay for directories
_defaults_write NSGlobalDomain com.apple.springing.delay -float 0.2

# Disable the warning before emptying the Trash
#_defaults_write com.apple.finder WarnOnEmptyTrash -bool false

# Enable AirDrop over Ethernet and on unsupported Macs running Lion
#_defaults_write com.apple.NetworkBrowser BrowseAllInterfaces -bool true

# Expand the following File Info panes:
# “General”, “Open with”, and “Sharing & Permissions”
#_defaults_write com.apple.finder FXInfoPanesExpanded -dict \
# 	General -bool true \
# 	OpenWith -bool true \
# 	Privileges -bool true


###############################################################################
# Dock, Dashboard, and hot corners                                            #
###############################################################################
echo ""
echo "* Adjusting Dock, Dashboard, and hot corners ..."

# Disable show recently used apps in a separate section of the Dock
_defaults_write com.apple.dock show-recents -bool false

# Enable spring loading for all Dock items
_defaults_write com.apple.dock enable-spring-load-actions-on-all-items -bool true

# Don’t automatically rearrange Spaces based on most recent use
_defaults_write com.apple.dock mru-spaces -bool false

# Never autohide the Dock
_defaults_write com.apple.dock autohide -bool false

# Don’t show recent applications in Dock
_defaults_write com.apple.dock show-recents -bool false

# Disable App Expose, Launchpad and Desktop gestures
_defaults_write com.apple.dock showAppExposeGestureEnabled -bool false
_defaults_write com.apple.dock showLaunchpadGestureEnabled -bool false
_defaults_write com.apple.dock showDesktopGestureEnabled -bool false

# Hot corners
# Possible values:
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center
# 13: Lock Screen
# Disable all
_defaults_write com.apple.dock wvous-tl-corner -int 0
_defaults_write com.apple.dock wvous-tr-corner -int 0
_defaults_write com.apple.dock wvous-bl-corner -int 0
_defaults_write com.apple.dock wvous-br-corner -int 0


###############################################################################
# Safari & WebKitViews                                                        #
###############################################################################
echo ""
echo "* Adjusting Safari & WebKitViews ..."

# Show the full URL in the address bar (note: this still hides the scheme)
_defaults_write com.apple.Safari ShowFullURLInSmartSearchField -bool true

# Prevent Safari from opening ‘safe’ files automatically after downloading
_defaults_write com.apple.Safari AutoOpenSafeDownloads -bool false

# Make Safari’s search default to Contains instead of Starts With
_defaults_write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

# Enable the Develop menu and the Web Inspector in Safari
_defaults_write com.apple.Safari IncludeDevelopMenu -bool true
_defaults_write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
_defaults_write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

# Add a context menu item for showing the Web Inspector in web views
_defaults_write NSGlobalDomain WebKitDeveloperExtras -bool true


###############################################################################
# Mail                                                                        #
###############################################################################
echo ""
echo "* Adjusting Mail ..."

# Disable send and reply animations in Mail.app
#_defaults_write com.apple.mail DisableReplyAnimations -bool true
#_defaults_write com.apple.mail DisableSendAnimations -bool true

# Disable inline attachments (just show the icons)
_defaults_write com.apple.mail DisableInlineAttachmentViewing -bool true


###############################################################################
# Terminal                                                                    #
###############################################################################
echo ""
echo "* Adjusting Terminal ..."

# Only use UTF-8 in Terminal.app
_defaults_write com.apple.terminal StringEncodings -array 4

# Enable Secure Keyboard Entry in Terminal.app
# See: https://security.stackexchange.com/a/47786/8918
_defaults_write com.apple.terminal SecureKeyboardEntry -bool true

# Disable the annoying line marks
_defaults_write com.apple.Terminal ShowLineMarks -int 0

###############################################################################
# Time Machine                                                                #
###############################################################################
echo ""
echo "* Adjusting Time Machine ..."

# Prevent Time Machine from prompting to use new hard drives as backup volume
_defaults_write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# Disable local Time Machine backups
#hash tmutil &> /dev/null && sudo tmutil disablelocal


###############################################################################
# Activity Monitor                                                            #
###############################################################################
echo ""
echo "* Adjusting Activity Monitor  ..."

# Visualize CPU usage in the Activity Monitor Dock icon
#_defaults_write com.apple.ActivityMonitor IconType -int 5

# Activity Monitor: View -> All Processes, Hierarchically
_defaults_write com.apple.ActivityMonitor ShowCategory -int 101

# Sort Activity Monitor results by CPU usage
_defaults_write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
_defaults_write com.apple.ActivityMonitor SortDirection -int 0


###############################################################################
# TextEdit                                                                    #
###############################################################################
echo ""
echo "* Adjusting TextEdit  ..."

# Use plain text mode for new TextEdit documents
_defaults_write com.apple.TextEdit RichText -int 0

# Open and save files as UTF-8 in TextEdit
_defaults_write com.apple.TextEdit PlainTextEncoding -int 4
_defaults_write com.apple.TextEdit PlainTextEncodingForWrite -int 4


###############################################################################
# App Store                                                                   #
###############################################################################
echo ""
echo "* Adjusting App Store ..."

# Enable the automatic update check
_defaults_write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true

# Check for software updates daily, not just once per week
_defaults_write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# Download newly available updates in background
_defaults_write com.apple.SoftwareUpdate AutomaticDownload -int 1


###############################################################################
# Photos                                                                      #
###############################################################################
echo ""
echo "* Adjusting Photos ..."

# Prevent Photos from opening automatically when devices are plugged in
_defaults_write com.apple.ImageCapture disableHotPlug -bool true


###############################################################################
# Messages                                                                    #
###############################################################################
echo ""
echo "* Adjusting Messages ..."

# Disable automatic emoji substitution (i.e. use plain text smileys)
_defaults_write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticEmojiSubstitutionEnablediMessage" -bool false

# Disable smart quotes as it’s annoying for messages that contain code
_defaults_write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticQuoteSubstitutionEnabled" -bool false


###############################################################################
# Suggest Restart                                                             #
###############################################################################
echo ""
echo "Done. Note that some of these changes require a logout/restart to take effect."