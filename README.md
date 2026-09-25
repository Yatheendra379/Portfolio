# Yatheendra Panchumarthi - Portfolio

A responsive Flutter Web portfolio for Yatheendra Panchumarthi, Full Stack Mobile Developer and AI Generalist.

## Live site

- Firebase Hosting: https://yatheendra-portfolio.web.app
- Custom domain: https://yatheendra.com (available after DNS verification completes)

## Run locally

Install Flutter, then run:

```bash
flutter pub get
flutter run -d chrome
```

## Production build

```bash
flutter clean
flutter pub get
flutter build web --release
```

The production files are generated in `build/web`.

## Firebase deployment

### 1. Install and authenticate Firebase CLI

```bash
npm install -g firebase-tools
firebase login
```

Confirm that the intended Google account is active:

```bash
firebase login:list
```

### 2. Select the Firebase project

This repository uses the Firebase project `yatheendra-portfolio`, configured in `.firebaserc`.

```bash
firebase use yatheendra-portfolio
```

### 3. Build and deploy

```bash
flutter build web --release
firebase deploy --only hosting --project yatheendra-portfolio
```

Firebase prints the Hosting URL after a successful deployment.

## Connect `yatheendra.com`

1. Open Firebase Console and select **Yatheendra Portfolio**.
2. Go to **Hosting > Add custom domain**.
3. Enter `yatheendra.com`.
4. Copy the verification and hosting DNS records supplied by Firebase.
5. Add those records in the DNS dashboard of the domain registrar.
6. Remove conflicting `A`, `AAAA`, or `CNAME` records for the same host if Firebase identifies any.
7. Return to Firebase and select **Verify**.

DNS propagation and Firebase SSL certificate provisioning can take several hours. Keep `www.yatheendra.com` as an additional domain if both addresses should work; Firebase can redirect one to the other.

## Repository workflow

```bash
git add .
git commit -m "Describe the portfolio update"
git push origin main
```

Deploy Firebase Hosting after pushing whenever the website content changes.
