import 'package:deckr_help/src/constants.dart';
import 'package:dfc_flutter/dfc_flutter_web_lite.dart';

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

  factory HelpData.withId(HelpDataId id) {
    ParagrafSpec title;
    ParagrafSpec message;

    switch (id) {
      case HelpDataId.whatIsALicenseKey:
        title = const ParagrafSpec.md('What is a license key?');
        message = _HelpParagrafs.withId(id);
        break;
      case HelpDataId.whatAreActivations:
        title = const ParagrafSpec.md('What are "activations"?');
        message = _HelpParagrafs.withId(id);
        break;

      case HelpDataId.whyShareBookmarks:
        title = const ParagrafSpec.md('Why problem does $kAppName solve?');
        message = _HelpParagrafs.withId(id);
        break;

      case HelpDataId.howToSetBookmark:
        title = const ParagrafSpec.md('Basic usage: how do I save a bookmark?');
        message = _HelpParagrafs.withId(id);
        break;

      case HelpDataId.privacy:
        title = const ParagrafSpec.md('What is your privacy policy?');
        message = _HelpParagrafs.withId(id);
        break;

      case HelpDataId.refunds:
        title = const ParagrafSpec.md('What\'s your refund policy?');
        message = _HelpParagrafs.withId(id);
        break;

      case HelpDataId.coupons:
        title = const ParagrafSpec.md('Do you have a coupon?');
        message = _HelpParagrafs.withId(id);
        break;

      case HelpDataId.extensionAndApp:
        title = const ParagrafSpec.md(
          'Why is there an browser extension and a desktop application?',
        );
        message = _HelpParagrafs.withId(id);
        break;

      case HelpDataId.expiredLicense:
        title = const ParagrafSpec.md('What happens when my license expires?');
        message = _HelpParagrafs.withId(id);
        break;

      case HelpDataId.blueIconOnMenuBar:
        title = const ParagrafSpec.md('What is that blue icon in my menubar?');
        message = _HelpParagrafs.withId(id);
        break;

      case HelpDataId.whySignIn:
        title = const ParagrafSpec.md(
          'Why do I have to sign-in to access the Deck store?',
        );
        message = _HelpParagrafs.withId(id);
        break;

      case HelpDataId.installingDesktopApp:
        title = const ParagrafSpec.md('How do I install the desktop app?');
        message = _HelpParagrafs.withId(id);
        break;

      case HelpDataId.multipleComputers:
        title = const ParagrafSpec.md(
          'How do I install $kAppName on multiple computers?',
        );
        message = _HelpParagrafs.withId(id);
        break;

      case HelpDataId.autoLaunchOnStartup:
        title = const ParagrafSpec.md(
          'How do set $kAppName to auto launch on startup?',
        );
        message = _HelpParagrafs.withId(id);
        break;

      case HelpDataId.installingTheExtension:
        title =
            const ParagrafSpec.md('How do I install the browser extension?');
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

  static List<HelpData> get all =>
      HelpDataId.values.map((e) => HelpData.withId(e)).toList();

  static List<HelpData> get aboutDialog => [
        HelpData.withId(HelpDataId.extensionAndApp),
        HelpData.withId(HelpDataId.blueIconOnMenuBar),
        HelpData.withId(HelpDataId.whySignIn),
        HelpData.withId(HelpDataId.howToSetBookmark),
        HelpData.withId(HelpDataId.privacy),
      ];

  static List<HelpData> get purchasingDialog => [
        HelpData.withId(HelpDataId.whatIsALicenseKey),
        HelpData.withId(HelpDataId.whatAreActivations),
        HelpData.withId(HelpDataId.coupons),
        HelpData.withId(HelpDataId.refunds),
        HelpData.withId(HelpDataId.expiredLicense),
      ];

  static List<HelpData> get installationDialog => [
        HelpData.withId(HelpDataId.installingDesktopApp),
        HelpData.withId(HelpDataId.installingTheExtension),
        HelpData.withId(HelpDataId.multipleComputers),
        HelpData.withId(HelpDataId.autoLaunchOnStartup),
      ];
}

// ===================================================================

class _HelpParagrafs {
  _HelpParagrafs._();

  static ParagrafSpec withId(HelpDataId id) {
    switch (id) {
      case HelpDataId.whatIsALicenseKey:
        return ParagrafSpec.sml(
          'When you purchase $kAppName you are sent a license key. The key is a unique string that represents your purchase.',
          children: [
            ParagrafSpec.sml(
              'When you receive your key, you paste into the purchase dialog in $kAppName and activate it.',
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
          'A license key must be activated on your machine to show that you have purchased $kAppName.',
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
              'We created $kAppName to be a useful tool that provides value to the customer.',
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
          '$kAppName provides a new way to share and discover great content online.',
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
              'That\'s not possible with $kAppName, but we have a better way. ',
              newlines: 2,
            ),
            ParagrafSpec.sml(
              'Make a new tab to bring up $kAppName and look on the left side for the list of open tabs. Drag the tab to a bookmark deck in the middle column.',
              newlines: 2,
            ),
            ParagrafSpec.sml(
              'You can also type cmd-shift-L to add the current tabs bookmark into the Read Later box on the top right of the $kAppName screen.',
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
              'Click the link on the home page and click "install extension". Once installed, run the desktop app and open a browser window, make a new tab and $kAppName will show.',
            ),
          ],
        );

      case HelpDataId.expiredLicense:
        return ParagrafSpec.sml(
          'You can still run $kAppName, but you\'ll see "nag" messages asking you to purchase.',
        );

      case HelpDataId.blueIconOnMenuBar:
        return ParagrafSpec.sml(
          'When the $kAppName desktop app is running, it puts an item in your menubar (task bar on Windows).',
          newlines: 2,
          children: [
            ParagrafSpec.sml(
              'This serves the purpose of letting you know it\'s running and it has a quit menu item so you can quit the desktop app if needed.',
              newlines: 2,
            ),
            ParagrafSpec.sml(
              'If you open the "About $kAppName" menu item, you can set the color and size of this icon. And you can set "Launch at Startup" which makes $kAppName launch after a restart.',
              newlines: 2,
            ),
            ParagrafSpec.sml(
              'There are a few other menu items for viewing the servers console log.',
            ),
          ],
        );

      case HelpDataId.autoLaunchOnStartup:
        return ParagrafSpec.sml(
          'When the $kAppName desktop app is running, it puts an blue icon at the top right of your menubar (task bar on Windows).',
          newlines: 2,
          children: [
            ParagrafSpec.sml(
              'Click on that icon and a menu appears. Choose the "About $kAppName" menu item.',
              newlines: 2,
            ),
            ParagrafSpec.sml(
              'In this window find the checkbox labeled "Launch at Startup" and now it will launch after a restart.  This is a convenient feature so $kAppName is always running and ready to go.',
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
              'You can also backup your bookmarks to the $kAppName cloud which requires an account to keep it private',
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
