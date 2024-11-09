// 06xx
user_pref("browser.send_pings", false);

// 07xx
user_pref("network.proxy.allow_bypass", false);
user_pref("network.trr.mode", 3);

// 08xx
user_pref("browser.urlbar.clipboard.featureGate", false);
// user_pref("browser.urlbar.recentsearches.featureGate", false);
user_pref("browser.urlbar.suggest.engines", false);
user_pref("layout.css.visited_links_enabled", false);

// 09xx
user_pref("network.http.windows-sso.enabled", false);

// 12xx
// user_pref("security.mixed_content.block_display_content", true);
// user_pref("dom.security.https_only_mode_pbm", true);
// user_pref("dom.security.https_only_mode.upgrade_local", true);

// 17xx
user_pref("privacy.userContext.enabled", false);
user_pref("privacy.userContext.ui.enabled", false);
user_pref("privacy.userContext.newTabContainerOnLeftClick.enabled", false);

// 20xx
// user_pref("media.gmp-provider.enabled", false);
// user_pref("media.peerconnection.ice.no_host", true);

// 26xx
// user_pref("browser.download.alwaysOpenPanel", true);
user_pref("permissions.default.shortcuts", 1);
user_pref("extensions.postDownloadThirdPartyPrompt", true);

// 27xx
user_pref("privacy.antitracking.enableWebcompat", false);

// 28xx
user_pref("privacy.clearOnShutdown.cookies", false); // Cookies
user_pref("privacy.clearOnShutdown.offlineApps", false); // Site Data
user_pref("privacy.clearOnShutdown.sessions", false;  // Active Logins [DEFAULT: true]
user_pref("privacy.clearOnShutdown_v2.cookiesAndStorage", false); // Cookies, Site Data, Active Logins [FF128+]
// should not need to change 283x and 284x settings after this

// 40xx
user_pref("privacy.fingerprintingProtection.pbmode", true)
user_pref("privacy.fingerprintingProtection.remoteOverrides.enabled", false);

// 45xx
user_pref("privacy.resistFingerprinting", true);
user_pref("privacy.resistFingerprinting.pbmode", true);
user_pref("privacy.resistFingerprinting.letterboxing", false); // this is actually too much
user_pref("browser.display.use_system_colors", true);

// 50xx
user_pref("browser.cache.memory.enable", false);
user_pref("browser.cache.memory.capacity", 0);
user_pref("signon.rememberSignons", false);
user_pref("browser.chrome.site_icons", false);
// user_pref("browser.sessionstore.max_tabs_undo", 0);
user_pref("browser.sessionstore.resume_from_crash", false);
user_pref("browser.download.forbid_open_with", true);
user_pref("browser.urlbar.suggest.history", false);
user_pref("browser.urlbar.suggest.bookmark", false);
user_pref("browser.urlbar.suggest.openpage", false);
user_pref("browser.urlbar.suggest.topsites", false); // [FF78+]
user_pref("browser.urlbar.maxRichResults", 0);
user_pref("browser.urlbar.autoFill", false);
user_pref("places.history.enabled", false);
user_pref("extensions.formautofill.addresses.enabled", false);
user_pref("extensions.formautofill.creditCards.enabled", false);
user_pref("dom.popup_allowed_events", "click dblclick mousedown pointerdown");
user_pref("browser.pagethumbnails.capturing_disabled", true);
user_pref("alerts.useSystemBackend.windows.notificationserver.enabled", false);
user_pref("keyword.enabled", true);
user_pref("browser.taskbar.lists.enabled", false);
user_pref("browser.taskbar.lists.frequent.enabled", false);
user_pref("browser.taskbar.lists.recent.enabled", false);
user_pref("browser.taskbar.lists.tasks.enabled", false);

// 55xx
// user_pref("javascript.options.wasm", false);
user_pref("media.eme.enabled", false);
user_pref("browser.eme.ui.enabled", false);
