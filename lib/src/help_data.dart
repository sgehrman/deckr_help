import 'package:deckr_help/l10n/app_localizations.dart';
import 'package:deckr_help/src/constants.dart';
import 'package:dfc_flutter/dfc_flutter_web_lite.dart';
import 'package:flutter/material.dart';

enum HelpDataId {
  whatIsALicenseKey,
  whatAreActivations,
  whyShareBookmarks,
  refunds,
  coupons,
  extensionAndApp,
  expiredLicense,
  blueIconOnMenuBar,
  whySignIn,
  privacy,
  howToSetBookmark,
  installingDesktopApp,
  installingTheExtension,
  multipleComputers,
  autoLaunchOnStartup,
}

class HelpData {
  const HelpData._({
    required this.title,
    required this.message,
  });

  factory HelpData.withId(BuildContext context, HelpDataId id) {
    ParagrafSpec title;
    ParagrafSpec message;

    final l10n = AppLocalizations.of(context);

    switch (id) {
      case HelpDataId.whatIsALicenseKey:
        title = ParagrafSpec.md(l10n.whatIsALicenseKey);
        message = _HelpParagrafs.withId(id);
        break;
      case HelpDataId.whatAreActivations:
        title = ParagrafSpec.md(l10n.whatAreActivations);
        message = _HelpParagrafs.withId(id);
        break;

      case HelpDataId.whyShareBookmarks:
        title = ParagrafSpec.md(l10n.whyProblemDoesDeckrSolve);
        message = _HelpParagrafs.withId(id);
        break;

      case HelpDataId.howToSetBookmark:
        title = ParagrafSpec.md(l10n.basicUsageHowDoISaveABookmark);
        message = _HelpParagrafs.withId(id);
        break;

      case HelpDataId.privacy:
        title = ParagrafSpec.md(l10n.whatIsYourPrivacyPolicy);
        message = _HelpParagrafs.withId(id);
        break;

      case HelpDataId.refunds:
        title = ParagrafSpec.md(l10n.whatSYourRefundPolicy);
        message = _HelpParagrafs.withId(id);
        break;

      case HelpDataId.coupons:
        title = ParagrafSpec.md(l10n.doYouHaveACoupon);
        message = _HelpParagrafs.withId(id);
        break;

      case HelpDataId.extensionAndApp:
        title = ParagrafSpec.md(
          l10n.whyIsThereAnBrowserExtensionAndADesktopApplication,
        );
        message = _HelpParagrafs.withId(id);
        break;

      case HelpDataId.expiredLicense:
        title = ParagrafSpec.md(l10n.whatHappensWhenMyLicenseExpires);
        message = _HelpParagrafs.withId(id);
        break;

      case HelpDataId.blueIconOnMenuBar:
        title = ParagrafSpec.md(l10n.whatIsThatBlueIconInMyMenubar);
        message = _HelpParagrafs.withId(id);
        break;

      case HelpDataId.whySignIn:
        title = ParagrafSpec.md(
          l10n.whyDoIHaveToSignInToAccessTheDeckStore,
        );
        message = _HelpParagrafs.withId(id);
        break;

      case HelpDataId.installingDesktopApp:
        title = ParagrafSpec.md(l10n.howDoIInstallTheDesktopApp);
        message = _HelpParagrafs.withId(id);
        break;

      case HelpDataId.multipleComputers:
        title = ParagrafSpec.md(
          l10n.howDoIInstallDeckrOnMultipleComputers,
        );
        message = _HelpParagrafs.withId(id);
        break;

      case HelpDataId.autoLaunchOnStartup:
        title = ParagrafSpec.md(
          l10n.howDoSetDeckrToAutoLaunchOnStartup,
        );
        message = _HelpParagrafs.withId(id);
        break;

      case HelpDataId.installingTheExtension:
        title = ParagrafSpec.md(l10n.howDoIInstallTheBrowserExtension);
        message = _HelpParagrafs.withId(id);
        break;
    }

    return HelpData._(
      title: title,
      message: message,
    );
  }

  final ParagrafSpec title;
  final ParagrafSpec message;

  static String get mHelpIntro =>
      'We tried to make everything as simple as possible, but If you get confused, don\'t worry. If you need help, reach out to our';

  // ===========================================================

  static List<HelpData> all(BuildContext context) =>
      HelpDataId.values.map((e) => HelpData.withId(context, e)).toList();

  static List<HelpData> aboutDialog(BuildContext context) => [
        HelpData.withId(context, HelpDataId.extensionAndApp),
        HelpData.withId(context, HelpDataId.blueIconOnMenuBar),
        HelpData.withId(context, HelpDataId.whySignIn),
        HelpData.withId(context, HelpDataId.howToSetBookmark),
        HelpData.withId(context, HelpDataId.privacy),
      ];

  static List<HelpData> purchasingDialog(BuildContext context) => [
        HelpData.withId(context, HelpDataId.whatIsALicenseKey),
        HelpData.withId(context, HelpDataId.whatAreActivations),
        HelpData.withId(context, HelpDataId.coupons),
        HelpData.withId(context, HelpDataId.refunds),
        HelpData.withId(context, HelpDataId.expiredLicense),
      ];

  static List<HelpData> installationDialog(BuildContext context) => [
        HelpData.withId(context, HelpDataId.installingDesktopApp),
        HelpData.withId(context, HelpDataId.installingTheExtension),
        HelpData.withId(context, HelpDataId.multipleComputers),
        HelpData.withId(context, HelpDataId.autoLaunchOnStartup),
      ];
}

// ===================================================================

class _HelpParagrafs {
  _HelpParagrafs._();

  static ParagrafSpec withId(HelpDataId id) {
    switch (id) {
      case HelpDataId.whatIsALicenseKey:
        return ParagrafSpec.sml(
          'When you purchase Deckr you are sent a license key. The key is a unique string that represents your purchase.',
          children: [
            ParagrafSpec.sml(
              'When you receive your key, you paste into the purchase dialog in Deckr and activate it.',
              spaces: 2,
            ),
            ParagrafSpec.sml(
              'Activating a license will update a record on our server that indicates this key is installed on your computer.',
              spaces: 2,
            ),
          ],
        );
      case HelpDataId.whatAreActivations:
        return ParagrafSpec.sml(
          'A license key must be activated on your machine to show that you have purchased Deckr.',
          children: [
            ParagrafSpec.sml(
              'By default, you are given 3 activations per purchase. You can activate up to 3 computers. If you stop using one of your computers you can deactivate it.',
              spaces: 2,
            ),
          ],
        );

      case HelpDataId.privacy:
        return ParagrafSpec.sml(
          'We take privacy seriously and we would never do anything to break your trust.',
          children: [
            ParagrafSpec.sml(
              'We created Deckr to be a useful tool that provides value to the customer.',
              spaces: 2,
            ),
            ParagrafSpec.sml(
              'None of your bookmarks or personal information is ever uploaded to our cloud unless you choose to backup your decks.',
              spaces: 2,
            ),
            ParagrafSpec.sml(
              'All of your bookmarks are saved on your computers hard disk, not on our cloud.',
              spaces: 2,
            ),
          ],
        );

      case HelpDataId.whyShareBookmarks:
        return ParagrafSpec.sml(
          'Deckr provides a new way to share and discover great content online.',
          children: [
            ParagrafSpec.sml(
              'You may have noticed that searching with Google or YouTube these days doesn\'t provide great results.',
              spaces: 2,
            ),
            ParagrafSpec.sml(
              'The algoritms are\'t there to help you, they are designed to help their advertisers.',
              spaces: 2,
            ),
            ParagrafSpec.sml(
              'YouTube for example has some great content, but finding it is near impossible. Usually great videos are found by luck. Or sifting though pages of results to find something good.',
              spaces: 2,
            ),
            ParagrafSpec.sml(
              'The problem is discovery. Now days most people stick to Twitter, Facebook, YouTube and rely on Google search to find new sources of information. But this is no longer working',
              spaces: 2,
            ),
            ParagrafSpec.sml(
              'Our goal is to bring back the good ol days of surfing the web.',
              spaces: 2,
            ),
            ParagrafSpec.sml(
              'Discoving great content is up to us. People need to take the initiative and work together to discover great content without relying on "Big Tech".',
              spaces: 2,
            ),
          ],
        );

      case HelpDataId.howToSetBookmark:
        return ParagrafSpec.sml(
          'In the browser you set a bookmark by dragging the address bar into your bookmarks bar.',
          newlines: 2,
          children: [
            ParagrafSpec.sml(
              'That\'s not possible with Deckr, but we have a better way. ',
              newlines: 2,
            ),
            ParagrafSpec.sml(
              'Make a new tab to bring up Deckr and look on the left side for the list of open tabs. Drag the tab to a bookmark deck in the middle column.',
              newlines: 2,
            ),
            ParagrafSpec.sml(
              'You can also type cmd-shift-L to add the current tabs bookmark into the Read Later box on the top right of the Deckr screen.',
              newlines: 2,
            ),
            ParagrafSpec.sml(
              'You also can look in the recents list on the right center and drag bookmark in from there.',
            ),
          ],
        );

      case HelpDataId.refunds:
        return ParagrafSpec.sml(
          'We have a 30 day refund policy. Email the',
          children: [
            const ParagrafSpec.linkSm(
              ' sales team ',
              href: kSalesEmail,
            ),
            ParagrafSpec.sml(
              'to request a refund. Before you request a refund, it would be great to hear why you are unhappy. Maybe we can fix the problem in the next update.',
            ),
          ],
        );

      case HelpDataId.coupons:
        return ParagrafSpec.sml(
          'We\'ll either email people on our mailing list, or announce coupons on our website\'s homepage.',
        );

      case HelpDataId.multipleComputers:
        return ParagrafSpec.sml(
          'Just enter the license key on another computer.  You have 3 activations by default. This will allow you to install on your laptop, desktop and TV.',
        );

      case HelpDataId.extensionAndApp:
        return ParagrafSpec.sml(
          'Deckr has two parts. A browser plugin (chrome or firefox) and a desktop app (mac/win/linux).',
          newlines: 2,
          children: [
            ParagrafSpec.sml(
              'The desktop acts as a local webserver that provides data to the browser plugin. It silently runs in the background. This is done for both speed and privacy. Your data is stored locally, not on the cloud.',
              newlines: 2,
            ),
            ParagrafSpec.sml(
              'The browser extension that replaces the "New Tab" screen in the web browser..',
            ),
          ],
        );

      case HelpDataId.installingDesktopApp:
        return ParagrafSpec.sml(
          'On MacOS, download the dmg using the link on the home page. Open the DMG and drag the Deckr application to the /Applications folder.',
          newlines: 2,
          children: [
            ParagrafSpec.sml(
              'On Windows, download the installer using the link on the home page run the installer, on Linux, head over to the link on Flatpak.org.',
              newlines: 2,
            ),
            ParagrafSpec.sml(
              'On Linux, click the link on the home page to go to the install instructions on Flatpak.org.',
            ),
          ],
        );

      case HelpDataId.installingTheExtension:
        return ParagrafSpec.sml(
          'The extension is listed on the Chrome and Firefox app stores.',
          newlines: 2,
          children: [
            ParagrafSpec.sml(
              'Click the link on the home page and click "install extension". Once installed, run the desktop app and open a browser window, make a new tab and Deckr will show.',
            ),
          ],
        );

      case HelpDataId.expiredLicense:
        return ParagrafSpec.sml(
          'You can still run Deckr, but you\'ll see "nag" messages asking you to purchase.',
        );

      case HelpDataId.blueIconOnMenuBar:
        return ParagrafSpec.sml(
          'When the Deckr desktop app is running, it puts an item in your menubar (task bar on Windows).',
          newlines: 2,
          children: [
            ParagrafSpec.sml(
              'This serves the purpose of letting you know it\'s running and it has a quit menu item so you can quit the desktop app if needed.',
              newlines: 2,
            ),
            ParagrafSpec.sml(
              'If you open the "About Deckr" menu item, you can set the color and size of this icon. And you can set "Launch at Startup" which makes Deckr launch after a restart.',
              newlines: 2,
            ),
            ParagrafSpec.sml(
              'There are a few other menu items for viewing the servers console log.',
            ),
          ],
        );

      case HelpDataId.autoLaunchOnStartup:
        return ParagrafSpec.sml(
          'When the Deckr desktop app is running, it puts an blue icon at the top right of your menubar (task bar on Windows).',
          newlines: 2,
          children: [
            ParagrafSpec.sml(
              'Click on that icon and a menu appears. Choose the "About Deckr" menu item.',
              newlines: 2,
            ),
            ParagrafSpec.sml(
              'In this window find the checkbox labeled "Launch at Startup" and now it will launch after a restart.  This is a convenient feature so Deckr is always running and ready to go.',
            ),
          ],
        );

      case HelpDataId.whySignIn:
        return ParagrafSpec.sml(
          'Signing in is just to protect against trolls and anonymous trouble makers.',
          children: [
            ParagrafSpec.sml(
              'If you post a bookmark deck, we show your avatar and username',
              spaces: 2,
            ),
            ParagrafSpec.sml(
              'You can also backup your bookmarks to the Deckr cloud which requires an account to keep it private',
              spaces: 2,
            ),
          ],
        );
    }
  }
}

 
// ===================================================================

/*
 

include download links and chrome/firefox links on site.


google is useless.
remember the early days of the web? The bloggers, the cool sites, discovering new hidden corners of the internet? Our goal is to bring that back.

Break free from FB/Twitter. Learn to surf again.

 Keeping track of bookmarks has always been painful.

 deckr is a browser extension and app combo designed to make surfing more fun.
The web is huge, filled with amazing content, but finding it is still a problem.

The web is huge, people don't know hwere to go.

 
               'Deckr is a bookmark manager with an integrated trading platform to share your discoveries with the world.',


Activations are a simple way of preventing a license key from being shared online and used by anyone who finds it.
Activations is our solution to software piracy that is simple and easy to use


--- How do activations work?

An activation gives you the ability to run $AppName on one computer.
When you buy $AppName, you are given 3 activations by default.
This allows you to install it on your laptop and desktop (or any two computers you are using)
When you "activate" your computer, that activation is marked as "used" until you deactivate.
If you buy a new computer and don\'t have any free activations, just deactivate your old computer and activate the new one. Or just buy more activations.
  to deativate, just hit the deactivate button

 
copy tutorial help text from app

write up text.

- first step. to make a new bookmark, you don't drag from the address bar, just make a new tab, look for the bookmark in the recents or open tabs list and drag it to a deck in the center scrolling area.

usage is to download a deck from our public listing, check out the links, keep ones you like, delete the set if you're done with it. Don't be afraid to download and delete. that's the whole point.

on cloud or local server.

we don't harvest data or do anything sneaky, we are providing value with a nice app period.

how to reset icon data


feature list:

View page images, source
Image cropper
share and download community sets
free



*/
// sff
