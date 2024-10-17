# 🍔 FetchRecipes

Simple list → detail application that shows a list of recipes, and information about them.

## ℹ️ Information

- Time spent: **~3 hours**
- Built with: **Xcode 16.0 (16A242d)**
- Minimum deployment target: **iOS 16**
- Architecture: **DI, MVVM, & Services**

## 🔨 Build & Run

1. Open `FetchRecipes.xcodeproj`
2. Wait for package dependencies to resolve & install
3. Build & run 🎉

## 🍎 Q&A

### What specific areas of the project did you prioritize? Why did you choose to focus on these areas?

I pretty much approach all projects the same - setting up a strong architecture that can scale as the project grows.
While it might be overkill for a simple application like this, I wanted to demonstrate how important a strong foundation
is to me.

---

### Did you make any significant trade-offs in your approach?

Not really. As I mentioned above with the architecture, I guess I sacrificed a bit of up-front development time
on the initial foundation (but literally not that much time - this kind of thing is pretty second-nature to me
at this point). The rest of the app is pretty simple, so I decided to showcase my architecture experience.

---

### What do you think is the weakest part of your project?

Like I said, this is a pretty simple app - and with the architecture side in a really solid state... not many points for weakness
(I swear I'm not arrogant 😆). That being said, if I wanted to spend more time on the project, I would probably focus on things
like integration tests for the API calls, moving navigation to a more robust coordinator-like pattern, and adding more code 
documentation (in-case anyone looking at the project needed more clarity).

---

### Did you use any external code, libraries, or dependencies?

Yes! I used a mix of packages that I personally maintain, as well as extremely common community-led ones. The main ones are:

- [Espresso](https://github.com/mitchtreece/espresso) **(maintained by me)** - Helper library that I use in all my projects.
- [Spider](https://github.com/mitchtreece/spider) **(maintained by me)** - Simple networking library without al the bloat of things like `AlamoFire`.
- [Swinject](https://github.com/Swinject/Swinject) - My preferred dependency injection framework, works great for SwiftUI or UIKit.
- [Nuke](https://github.com/kean/Nuke) - Image loading library used for `AsyncImage` caching.

## 🧠 Final Thoughts

I hope you enjoyed looking through the project, and getting to know my coding-style. If you have any questions, need clarity on aspects of the project, or just want to chat - feel free to reach out 😎
