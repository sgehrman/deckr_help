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
        message = _HelpParagrafs.withId(context, id);
        break;
      case HelpDataId.whatAreActivations:
        title = ParagrafSpec.md(l10n.whatAreActivations);
        message = _HelpParagrafs.withId(context, id);
        break;

      case HelpDataId.whyShareBookmarks:
        title = ParagrafSpec.md(l10n.whyProblemDoesDeckrSolve);
        message = _HelpParagrafs.withId(context, id);
        break;

      case HelpDataId.howToSetBookmark:
        title = ParagrafSpec.md(l10n.basicUsageHowDoISaveABookmark);
        message = _HelpParagrafs.withId(context, id);
        break;

      case HelpDataId.privacy:
        title = ParagrafSpec.md(l10n.whatIsYourPrivacyPolicy);
        message = _HelpParagrafs.withId(context, id);
        break;

      case HelpDataId.refunds:
        title = ParagrafSpec.md(l10n.whatSYourRefundPolicy);
        message = _HelpParagrafs.withId(context, id);
        break;

      case HelpDataId.coupons:
        title = ParagrafSpec.md(l10n.doYouHaveACoupon);
        message = _HelpParagrafs.withId(context, id);
        break;

      case HelpDataId.extensionAndApp:
        title = ParagrafSpec.md(
          l10n.whyIsThereAnBrowserExtensionAndADesktopApplication,
        );
        message = _HelpParagrafs.withId(context, id);
        break;

      case HelpDataId.expiredLicense:
        title = ParagrafSpec.md(l10n.whatHappensWhenMyLicenseExpires);
        message = _HelpParagrafs.withId(context, id);
        break;

      case HelpDataId.blueIconOnMenuBar:
        title = ParagrafSpec.md(l10n.whatIsThatBlueIconInMyMenubar);
        message = _HelpParagrafs.withId(context, id);
        break;

      case HelpDataId.whySignIn:
        title = ParagrafSpec.md(
          l10n.whyDoIHaveToSignInToAccessTheDeckStore,
        );
        message = _HelpParagrafs.withId(context, id);
        break;

      case HelpDataId.installingDesktopApp:
        title = ParagrafSpec.md(l10n.howDoIInstallTheDesktopApp);
        message = _HelpParagrafs.withId(context, id);
        break;

      case HelpDataId.multipleComputers:
        title = ParagrafSpec.md(
          l10n.howDoIInstallDeckrOnMultipleComputers,
        );
        message = _HelpParagrafs.withId(context, id);
        break;

      case HelpDataId.autoLaunchOnStartup:
        title = ParagrafSpec.md(
          l10n.howDoSetDeckrToAutoLaunchOnStartup,
        );
        message = _HelpParagrafs.withId(context, id);
        break;

      case HelpDataId.installingTheExtension:
        title = ParagrafSpec.md(l10n.howDoIInstallTheBrowserExtension);
        message = _HelpParagrafs.withId(context, id);
        break;
    }

    return HelpData._(
      title: title,
      message: message,
    );
  }

  final ParagrafSpec title;
  final ParagrafSpec message;

  static String mHelpIntro(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return l10n.weTriedToMakeEverythingAsSimpleAsPossible;
  }
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

  static ParagrafSpec withId(BuildContext context, HelpDataId id) {
    final l10n = AppLocalizations.of(context);

    switch (id) {
      case HelpDataId.whatIsALicenseKey:
        return ParagrafSpec.sml(
          l10n.whenYouPurchaseDeckrYouAreSentALicenseKey,
          children: [
            ParagrafSpec.sml(
              l10n.whenYouReceiveYourKeyYouPasteIntoThePurchase,
              spaces: 2,
            ),
            ParagrafSpec.sml(
              l10n.activatingALicenseWillUpdateARecord,
              spaces: 2,
            ),
          ],
        );
      case HelpDataId.whatAreActivations:
        return ParagrafSpec.sml(
          l10n.aLicenseKeyMustBeActivatedOnYourMachine,
          children: [
            ParagrafSpec.sml(
              l10n.byDefaultYouAreGiven3Activations,
              spaces: 2,
            ),
          ],
        );

      case HelpDataId.privacy:
        return ParagrafSpec.sml(
          l10n.weTakePrivacySeriouslyAndWeWouldNeverDoAnything,
          children: [
            ParagrafSpec.sml(
              l10n.weCreatedDeckrToBeAUsefulTool,
              spaces: 2,
            ),
            ParagrafSpec.sml(
              l10n.noneOfYourBookmarksOrPersonalInformation,
              spaces: 2,
            ),
            ParagrafSpec.sml(
              l10n.allOfYourBookmarksAreSavedOn,
              spaces: 2,
            ),
          ],
        );

      case HelpDataId.whyShareBookmarks:
        return ParagrafSpec.sml(
          l10n.deckrProvidesANewWayToShareAndDiscover,
          children: [
            ParagrafSpec.sml(
              l10n.youMayHaveNoticedThatSearchingWithGoogleOr,
              spaces: 2,
            ),
            ParagrafSpec.sml(
              l10n.theAlgoritmsArenTThereToHelpYou,
              spaces: 2,
            ),
            ParagrafSpec.sml(
              l10n.youtubeForExampleHasSomeGreatContent,
              spaces: 2,
            ),
            ParagrafSpec.sml(
              l10n.theProblemIsDiscoveryNowDaysMost,
              spaces: 2,
            ),
            ParagrafSpec.sml(
              l10n.ourGoalIsToBringBackTheGood,
              spaces: 2,
            ),
            ParagrafSpec.sml(
              l10n.discovingGreatContentIsUpToUsPeople,
              spaces: 2,
            ),
          ],
        );

      case HelpDataId.howToSetBookmark:
        return ParagrafSpec.sml(
          l10n.inTheBrowserYouSetABookmark,
          newlines: 2,
          children: [
            ParagrafSpec.sml(
              l10n.thatSNotPossibleWithDeckrBut,
              newlines: 2,
            ),
            ParagrafSpec.sml(
              l10n.makeANewTabToBringUpDeckrAndLook,
              newlines: 2,
            ),
            ParagrafSpec.sml(
              l10n.youCanAlsoTypeCmdShiftLToAddThe,
              newlines: 2,
            ),
            ParagrafSpec.sml(
              l10n.youAlsoCanLookInTheRecentsListOn,
            ),
          ],
        );

      case HelpDataId.refunds:
        return ParagrafSpec.sml(
          l10n.weHaveA30DayRefundPolicyEmailThe,
          children: [
            const ParagrafSpec.linkSm(
              ' sales team ',
              href: kSalesEmail,
            ),
            ParagrafSpec.sml(
              l10n.toRequestARefundBeforeYouRequest,
            ),
          ],
        );

      case HelpDataId.coupons:
        return ParagrafSpec.sml(
          l10n.weLlEitherEmailPeopleOnOur,
        );

      case HelpDataId.multipleComputers:
        return ParagrafSpec.sml(
          l10n.justEnterTheLicenseKeyOnAnother,
        );

      case HelpDataId.extensionAndApp:
        return ParagrafSpec.sml(
          l10n.deckrHasTwoPartsABrowserPlugin,
          newlines: 2,
          children: [
            ParagrafSpec.sml(
              l10n.theDesktopActsAsALocalWebserver,
              newlines: 2,
            ),
            ParagrafSpec.sml(
              l10n.theBrowserExtensionThat,
            ),
          ],
        );

      case HelpDataId.installingDesktopApp:
        return ParagrafSpec.sml(
          l10n.onMacosDownloadTheDmgUsing,
          newlines: 2,
          children: [
            ParagrafSpec.sml(
              l10n.onWindowsDownloadTheInstallerUsing,
              newlines: 2,
            ),
            ParagrafSpec.sml(
              l10n.onLinuxClickTheLinkOnTheHomePage,
            ),
          ],
        );

      case HelpDataId.installingTheExtension:
        return ParagrafSpec.sml(
          l10n.theExtensionIsListedOnTheChrome,
          newlines: 2,
          children: [
            ParagrafSpec.sml(
              l10n.clickTheLinkOnTheHomePageAndClickInstall,
            ),
          ],
        );

      case HelpDataId.expiredLicense:
        return ParagrafSpec.sml(
          l10n.youCanStillRunDeckrButYou,
        );

      case HelpDataId.blueIconOnMenuBar:
        return ParagrafSpec.sml(
          l10n.whenTheDeckrDesktopAppIsRunning,
          newlines: 2,
          children: [
            ParagrafSpec.sml(
              l10n.thisServesThePurposeOfLettingYouKnowIt,
              newlines: 2,
            ),
            ParagrafSpec.sml(
              l10n.ifYouOpenTheAboutDeckrMenuItem,
              newlines: 2,
            ),
            ParagrafSpec.sml(
              l10n.thereAreAFewOtherMenuItemsFor,
            ),
          ],
        );

      case HelpDataId.autoLaunchOnStartup:
        return ParagrafSpec.sml(
          l10n.whenTheDeckrDesktopAppIsRun,
          newlines: 2,
          children: [
            ParagrafSpec.sml(
              l10n.clickOnThatIconAndAMenuAppears,
              newlines: 2,
            ),
            ParagrafSpec.sml(
              l10n.inThisWindowFindTheCheckboxLabeled,
            ),
          ],
        );

      case HelpDataId.whySignIn:
        return ParagrafSpec.sml(
          l10n.signingInIsJustToProtectAgainst,
          children: [
            ParagrafSpec.sml(
              l10n.ifYouPostABookmarkDeckWeShow,
              spaces: 2,
            ),
            ParagrafSpec.sml(
              l10n.youCanAlsoBackupYourBookmarksTo,
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
