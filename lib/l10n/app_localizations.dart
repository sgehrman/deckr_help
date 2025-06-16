import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_cs.dart';
import 'app_localizations_da.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fi.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_sv.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('cs'),
    Locale('da'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fi'),
    Locale('fr'),
    Locale('it'),
    Locale('ja'),
    Locale('nl'),
    Locale('ru'),
    Locale('sv'),
    Locale('zh'),
  ];

  /// No description provided for @activatingALicenseWillUpdateARecord.
  ///
  /// In en, this message translates to:
  /// **'Activating a license will update a record on our server that indicates this key is installed on your computer.'**
  String get activatingALicenseWillUpdateARecord;

  /// No description provided for @aLicenseKeyMustBeActivatedOnYourMachine.
  ///
  /// In en, this message translates to:
  /// **'A license key must be activated on your machine to show that you have purchased Deckr.'**
  String get aLicenseKeyMustBeActivatedOnYourMachine;

  /// No description provided for @allOfYourBookmarksAreSavedOn.
  ///
  /// In en, this message translates to:
  /// **'All of your bookmarks are saved on your computers hard disk, not on our cloud.'**
  String get allOfYourBookmarksAreSavedOn;

  /// No description provided for @basicUsageHowDoISaveABookmark.
  ///
  /// In en, this message translates to:
  /// **'Basic usage: how do I save a bookmark?'**
  String get basicUsageHowDoISaveABookmark;

  /// No description provided for @byDefaultYouAreGiven3Activations.
  ///
  /// In en, this message translates to:
  /// **'By default, you are given 3 activations per purchase. You can activate up to 3 computers. If you stop using one of your computers you can deactivate it.'**
  String get byDefaultYouAreGiven3Activations;

  /// No description provided for @clickOnThatIconAndAMenuAppears.
  ///
  /// In en, this message translates to:
  /// **'Click on that icon and a menu appears. Choose the \"About Deckr\" menu item.'**
  String get clickOnThatIconAndAMenuAppears;

  /// No description provided for @clickTheLinkOnTheHomePageAndClickInstall.
  ///
  /// In en, this message translates to:
  /// **'Click the link on the home page and click \"install extension\". Once installed, run the desktop app and open a browser window, make a new tab and Deckr will show.'**
  String get clickTheLinkOnTheHomePageAndClickInstall;

  /// No description provided for @deckrHasAFewVeryUsefulKeyboardShortcuts.
  ///
  /// In en, this message translates to:
  /// **'Deckr has a few very useful keyboard shortcuts'**
  String get deckrHasAFewVeryUsefulKeyboardShortcuts;

  /// No description provided for @deckrHasTwoPartsABrowserPlugin.
  ///
  /// In en, this message translates to:
  /// **'Deckr has two parts. A browser plugin (Chrome or Firefox) and a desktop app (Mac/Win/Linux).'**
  String get deckrHasTwoPartsABrowserPlugin;

  /// No description provided for @deckrProvidesANewWayToShareAndDiscover.
  ///
  /// In en, this message translates to:
  /// **'Deckr provides a new way to share and discover great content online.'**
  String get deckrProvidesANewWayToShareAndDiscover;

  /// No description provided for @discovingGreatContentIsUpToUsPeople.
  ///
  /// In en, this message translates to:
  /// **'Discoving great content is up to us. People need to take the initiative and work together to discover great content without relying on \"Big Tech\".'**
  String get discovingGreatContentIsUpToUsPeople;

  /// No description provided for @doYouHaveACoupon.
  ///
  /// In en, this message translates to:
  /// **'Do you have a coupon?'**
  String get doYouHaveACoupon;

  /// No description provided for @howDoIInstallDeckrOnMultipleComputers.
  ///
  /// In en, this message translates to:
  /// **'How do I install Deckr on multiple computers?'**
  String get howDoIInstallDeckrOnMultipleComputers;

  /// No description provided for @howDoIInstallTheBrowserExtension.
  ///
  /// In en, this message translates to:
  /// **'How do I install the browser extension?'**
  String get howDoIInstallTheBrowserExtension;

  /// No description provided for @howDoIInstallTheDesktopApp.
  ///
  /// In en, this message translates to:
  /// **'How do I install the desktop app?'**
  String get howDoIInstallTheDesktopApp;

  /// No description provided for @howDoIScaleDeckrSUserInterface.
  ///
  /// In en, this message translates to:
  /// **'How do I scale Deckr\'s user interface?'**
  String get howDoIScaleDeckrSUserInterface;

  /// No description provided for @howDoSetDeckrToAutoLaunchOnStartup.
  ///
  /// In en, this message translates to:
  /// **'How do set Deckr to auto launch on startup?'**
  String get howDoSetDeckrToAutoLaunchOnStartup;

  /// No description provided for @ifTheUserInterfaceIsTooSmallToRead.
  ///
  /// In en, this message translates to:
  /// **'If the user interface is too small to read or too large, you can adjust it using the web browsers built in \"Zoom\" setting.'**
  String get ifTheUserInterfaceIsTooSmallToRead;

  /// No description provided for @ifYouOpenTheAboutDeckrMenuItem.
  ///
  /// In en, this message translates to:
  /// **'If you open the \"About Deckr\" menu item, you can set the color and size of this icon. And you can set \"Launch at Startup\" which makes Deckr launch after a restart.'**
  String get ifYouOpenTheAboutDeckrMenuItem;

  /// No description provided for @ifYouPostABookmarkDeckWeShow.
  ///
  /// In en, this message translates to:
  /// **'If you post a bookmark deck, we show your avatar and username'**
  String get ifYouPostABookmarkDeckWeShow;

  /// No description provided for @inTheBrowserYouSetABookmark.
  ///
  /// In en, this message translates to:
  /// **'In the browser you set a bookmark by dragging the address bar into your bookmarks bar.'**
  String get inTheBrowserYouSetABookmark;

  /// No description provided for @inThisWindowFindTheCheckboxLabeled.
  ///
  /// In en, this message translates to:
  /// **'In this window find the checkbox labeled \"Launch at Startup\" and now it will launch after a restart.  This is a convenient feature so Deckr is always running and ready to go.'**
  String get inThisWindowFindTheCheckboxLabeled;

  /// No description provided for @justEnterTheLicenseKeyOnAnother.
  ///
  /// In en, this message translates to:
  /// **'Just enter the license key on another computer. You have 3 activations by default. This will allow you to install on your laptop, desktop and TV.'**
  String get justEnterTheLicenseKeyOnAnother;

  /// No description provided for @makeANewTabToBringUpDeckrAndLook.
  ///
  /// In en, this message translates to:
  /// **'Make a new tab to bring up Deckr and look on the left side for the list of open tabs. Drag the tab to a bookmark deck in the middle column.'**
  String get makeANewTabToBringUpDeckrAndLook;

  /// No description provided for @manyElementsInTheUserInterfaceHaveContextualMenus.
  ///
  /// In en, this message translates to:
  /// **'Many elements in the user interface have contextual menus'**
  String get manyElementsInTheUserInterfaceHaveContextualMenus;

  /// No description provided for @manyUserfulFeaturesAreAvailableUsingTheseMenus.
  ///
  /// In en, this message translates to:
  /// **'Many userful features are available using these menus'**
  String get manyUserfulFeaturesAreAvailableUsingTheseMenus;

  /// No description provided for @noneOfYourBookmarksOrPersonalInformation.
  ///
  /// In en, this message translates to:
  /// **'None of your bookmarks or personal information is ever uploaded to our cloud unless you choose to backup your decks.'**
  String get noneOfYourBookmarksOrPersonalInformation;

  /// No description provided for @onceYouSetTheZoomLevelItWi.
  ///
  /// In en, this message translates to:
  /// **'Once you set the zoom level it will use that setting for Deckr\'s page only and not affect other pages.'**
  String get onceYouSetTheZoomLevelItWi;

  /// No description provided for @onLinuxClickTheLinkOnTheHomePage.
  ///
  /// In en, this message translates to:
  /// **'On Linux, click the link on the home page to go to the install instructions on Flatpak.org.'**
  String get onLinuxClickTheLinkOnTheHomePage;

  /// No description provided for @onMacosDownloadTheDmgUsing.
  ///
  /// In en, this message translates to:
  /// **'On MacOS, download the dmg using the link on the home page. Open the DMG and drag the Deckr application to the /Applications folder.'**
  String get onMacosDownloadTheDmgUsing;

  /// No description provided for @onWindowsDownloadTheInstallerUsing.
  ///
  /// In en, this message translates to:
  /// **'On Windows, download the installer using the link on the home page run the installer.'**
  String get onWindowsDownloadTheInstallerUsing;

  /// No description provided for @opensTheSearchDialog.
  ///
  /// In en, this message translates to:
  /// **'Opens the Search dialog'**
  String get opensTheSearchDialog;

  /// No description provided for @ourGoalIsToBringBackTheGood.
  ///
  /// In en, this message translates to:
  /// **'Our goal is to bring back the good ol days of surfing the web.'**
  String get ourGoalIsToBringBackTheGood;

  /// No description provided for @rightClickOnItemsToShowTheContextualMenus.
  ///
  /// In en, this message translates to:
  /// **'Right click on items to show the contextual menus'**
  String get rightClickOnItemsToShowTheContextualMenus;

  /// No description provided for @signingInIsJustToProtectAgainst.
  ///
  /// In en, this message translates to:
  /// **'Signing in is just to protect against trolls and anonymous trouble makers.'**
  String get signingInIsJustToProtectAgainst;

  /// No description provided for @thatSNotPossibleWithDeckrBut.
  ///
  /// In en, this message translates to:
  /// **'That\'s not possible with Deckr, but we have a better way.'**
  String get thatSNotPossibleWithDeckrBut;

  /// No description provided for @theAlgoritmsArenTThereToHelpYou.
  ///
  /// In en, this message translates to:
  /// **'The algoritms aren\'t there to help you, they are designed to help their advertisers.'**
  String get theAlgoritmsArenTThereToHelpYou;

  /// No description provided for @theBrowserExtensionThat.
  ///
  /// In en, this message translates to:
  /// **'The browser extension that replaces the \"New Tab\" screen in the web browser.'**
  String get theBrowserExtensionThat;

  /// No description provided for @theDesktopActsAsALocalWebserver.
  ///
  /// In en, this message translates to:
  /// **'The desktop acts as a local webserver that provides data to the browser plugin. It silently runs in the background. This is done for both speed and privacy. Your data is stored locally, not on the cloud.'**
  String get theDesktopActsAsALocalWebserver;

  /// No description provided for @theExtensionIsListedOnTheChrome.
  ///
  /// In en, this message translates to:
  /// **'The extension is listed on the Chrome and Firefox app stores.'**
  String get theExtensionIsListedOnTheChrome;

  /// No description provided for @theProblemIsDiscoveryNowDaysMost.
  ///
  /// In en, this message translates to:
  /// **'The problem is discovery. Now days most people stick to Twitter, Facebook, YouTube and rely on Google search to find new sources of information. But this is no longer working'**
  String get theProblemIsDiscoveryNowDaysMost;

  /// No description provided for @thereAreAFewOtherMenuItemsFor.
  ///
  /// In en, this message translates to:
  /// **'There are a few other menu items for viewing the servers console log.'**
  String get thereAreAFewOtherMenuItemsFor;

  /// No description provided for @thisServesThePurposeOfLettingYouKnowIt.
  ///
  /// In en, this message translates to:
  /// **'This serves the purpose of letting you know it\'s running and it has a quit menu item so you can quit the desktop app if needed.'**
  String get thisServesThePurposeOfLettingYouKnowIt;

  /// No description provided for @thisWillSelectTheDeckrTabOrCreateANewDeckrTab.
  ///
  /// In en, this message translates to:
  /// **'This will select the Deckr tab, or create a new Deckr tab.  Great if you want to get back to Deckr and don\'t want to have to find it in the tab bar.'**
  String get thisWillSelectTheDeckrTabOrCreateANewDeckrTab;

  /// No description provided for @toRequestARefundBeforeYouRequest.
  ///
  /// In en, this message translates to:
  /// **'to request a refund. Before you request a refund, it would be great to hear why you are unhappy. Maybe we can fix the problem in the next update.'**
  String get toRequestARefundBeforeYouRequest;

  /// No description provided for @usefulKeyboardShortcuts.
  ///
  /// In en, this message translates to:
  /// **'Useful keyboard shortcuts'**
  String get usefulKeyboardShortcuts;

  /// No description provided for @weCreatedDeckrToBeAUsefulTool.
  ///
  /// In en, this message translates to:
  /// **'We created Deckr to be a useful tool that provides value to the customer.'**
  String get weCreatedDeckrToBeAUsefulTool;

  /// No description provided for @weHaveA30DayRefundPolicyEmailThe.
  ///
  /// In en, this message translates to:
  /// **'We have a 30 day refund policy. Email the'**
  String get weHaveA30DayRefundPolicyEmailThe;

  /// No description provided for @weLlEitherEmailPeopleOnOur.
  ///
  /// In en, this message translates to:
  /// **'We\'ll either email people on our mailing list, or announce coupons on our website\'s homepage.'**
  String get weLlEitherEmailPeopleOnOur;

  /// No description provided for @weTakePrivacySeriouslyAndWeWouldNeverDoAnything.
  ///
  /// In en, this message translates to:
  /// **'We take privacy seriously and we would never do anything to break your trust.'**
  String get weTakePrivacySeriouslyAndWeWouldNeverDoAnything;

  /// No description provided for @weTriedToMakeEverythingAsSimpleAsPossible.
  ///
  /// In en, this message translates to:
  /// **'We tried to make everything as simple as possible, but If you get confused, don\'t worry. If you need help, reach out to our'**
  String get weTriedToMakeEverythingAsSimpleAsPossible;

  /// No description provided for @whatAreActivations.
  ///
  /// In en, this message translates to:
  /// **'What are \"activations\"?'**
  String get whatAreActivations;

  /// No description provided for @whatHappensWhenMyLicenseExpires.
  ///
  /// In en, this message translates to:
  /// **'What happens when my license expires?'**
  String get whatHappensWhenMyLicenseExpires;

  /// No description provided for @whatIsALicenseKey.
  ///
  /// In en, this message translates to:
  /// **'What is a license key?'**
  String get whatIsALicenseKey;

  /// No description provided for @whatIsThatBlueIconInMyMenubar.
  ///
  /// In en, this message translates to:
  /// **'What is that blue icon in my menubar?'**
  String get whatIsThatBlueIconInMyMenubar;

  /// No description provided for @whatIsYourPrivacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'What is your privacy policy?'**
  String get whatIsYourPrivacyPolicy;

  /// No description provided for @whatSYourRefundPolicy.
  ///
  /// In en, this message translates to:
  /// **'What\'s your refund policy?'**
  String get whatSYourRefundPolicy;

  /// No description provided for @whenTheDeckrDesktopAppIsRun.
  ///
  /// In en, this message translates to:
  /// **'When the Deckr desktop app is running, it puts an blue icon at the top right of your menubar (task bar on Windows).'**
  String get whenTheDeckrDesktopAppIsRun;

  /// No description provided for @whenTheDeckrDesktopAppIsRunning.
  ///
  /// In en, this message translates to:
  /// **'When the Deckr desktop app is running, it puts an item in your menubar (task bar on Windows).'**
  String get whenTheDeckrDesktopAppIsRunning;

  /// No description provided for @whenYouPurchaseDeckrYouAreSentALicenseKey.
  ///
  /// In en, this message translates to:
  /// **'When you purchase Deckr you are sent a license key. The key is a unique string that represents your purchase.'**
  String get whenYouPurchaseDeckrYouAreSentALicenseKey;

  /// No description provided for @whenYouReceiveYourKeyYouPasteIntoThePurchase.
  ///
  /// In en, this message translates to:
  /// **'When you receive your key, you paste into the purchase dialog in Deckr and activate it.'**
  String get whenYouReceiveYourKeyYouPasteIntoThePurchase;

  /// No description provided for @whyDoIHaveToSignInToAccessTheDeckStore.
  ///
  /// In en, this message translates to:
  /// **'Why do I have to sign-in to access the Deck store?'**
  String get whyDoIHaveToSignInToAccessTheDeckStore;

  /// No description provided for @whyIsThereAnBrowserExtensionAndADesktopApplication.
  ///
  /// In en, this message translates to:
  /// **'Why is there an browser extension and a desktop application?'**
  String get whyIsThereAnBrowserExtensionAndADesktopApplication;

  /// No description provided for @whyProblemDoesDeckrSolve.
  ///
  /// In en, this message translates to:
  /// **'Why problem does Deckr solve?'**
  String get whyProblemDoesDeckrSolve;

  /// No description provided for @willAddTheCurrentTabYouAreViewingIntoTheInbox.
  ///
  /// In en, this message translates to:
  /// **'Will add the current tab you are viewing into the Inbox. This is useful if you would like to save this link, but don\'t want to deal with is right now. When you have time, you can drag it from the Inbox into a deck.'**
  String get willAddTheCurrentTabYouAreViewingIntoTheInbox;

  /// No description provided for @youAlsoCanLookInTheRecentsListOn.
  ///
  /// In en, this message translates to:
  /// **'You also can look in the recents list on the right center and drag bookmark in from there.'**
  String get youAlsoCanLookInTheRecentsListOn;

  /// No description provided for @youCanAlsoBackupYourBookmarksTo.
  ///
  /// In en, this message translates to:
  /// **'You can also backup your bookmarks to the Deckr cloud which requires an account to keep it private'**
  String get youCanAlsoBackupYourBookmarksTo;

  /// No description provided for @youCanAlsoTypeCmdShiftKToAddThe.
  ///
  /// In en, this message translates to:
  /// **'You can also type Cmd-Shift-K to add the current tabs bookmark into the Read Later box on the top right of the Deckr screen.'**
  String get youCanAlsoTypeCmdShiftKToAddThe;

  /// No description provided for @youCanStillRunDeckrButYou.
  ///
  /// In en, this message translates to:
  /// **'You can still run Deckr, but you\'ll see \\\"nag\\\" messages asking you to purchase.'**
  String get youCanStillRunDeckrButYou;

  /// No description provided for @youMayHaveNoticedThatSearchingWithGoogleOr.
  ///
  /// In en, this message translates to:
  /// **'You may have noticed that searching with Google or YouTube these days doesn\'t provide great results.'**
  String get youMayHaveNoticedThatSearchingWithGoogleOr;

  /// No description provided for @youtubeForExampleHasSomeGreatContent.
  ///
  /// In en, this message translates to:
  /// **'YouTube for example has some great content, but finding it is near impossible. Usually great videos are found by luck. Or sifting though pages of results to find something good.'**
  String get youtubeForExampleHasSomeGreatContent;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'cs',
    'da',
    'de',
    'en',
    'es',
    'fi',
    'fr',
    'it',
    'ja',
    'nl',
    'ru',
    'sv',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'cs':
      return AppLocalizationsCs();
    case 'da':
      return AppLocalizationsDa();
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fi':
      return AppLocalizationsFi();
    case 'fr':
      return AppLocalizationsFr();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'nl':
      return AppLocalizationsNl();
    case 'ru':
      return AppLocalizationsRu();
    case 'sv':
      return AppLocalizationsSv();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
