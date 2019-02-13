# NGProjectThatRequestsNGResourcePodExample
This iOS app project is an example to demonstrate certain behavior when using CocoaPods with a pod that uses a local podspec for an external library (pod definition using `:podspec`).

To set up, run:
```
bundle install
bundle exec pod install
```

[noahsark769/NGResourcePodExample](https://github.com/noahsark769/NGResourcePodExample) is an example library without a podspec that includes a txt file. It is distributed as a tar (see the podspec's source). This example app pulls in the library and presents the content of the text file in a UILabel.

Commit `442ac1b324335488e72f053a233e407587ed101b` of this example project works correctly with version 1.0.0 of a local podspec (`InternalPodspecs/NGResourcePodExample.podspec`).

If you update the version to 1.1.0 (like in `80b78deb3227549f8f97f46827c2a255d5541be8`), the new version of the library is not pulled in the next time `bundle exec pod install` is run. If you `rm -rf Pods/NGResourcePodExample` and try `bundle exec pod install` again, you get this error:

```
$ bundle exec pod install
Analyzing dependencies
Fetching podspec for `NGResourcePodExample` from `InternalPodspecs/NGResourcePodExample.podspec`
[!] CocoaPods could not find compatible versions for pod "NGResourcePodExample":
  In snapshot (Podfile.lock):
    NGResourcePodExample (from `InternalPodspecs/NGResourcePodExample.podspec`)

  In Podfile:
    NGResourcePodExample (from `InternalPodspecs/NGResourcePodExample.podspec`)

None of your spec sources contain a spec satisfying the dependencies: `NGResourcePodExample (from `InternalPodspecs/NGResourcePodExample.podspec`), NGResourcePodExample (from `InternalPodspecs/NGResourcePodExample.podspec`)`.

You have either:
 * out-of-date source repos which you can update with `pod repo update` or with `pod install --repo-update`.
 * mistyped the name or version.
 * not added the source repo that hosts the Podspec to your Podfile.

Note: as of CocoaPods 1.0, `pod repo update` does not happen on `pod install` by default.
```