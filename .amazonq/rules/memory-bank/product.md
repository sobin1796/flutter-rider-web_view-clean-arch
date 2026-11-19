# Tukaatu - Product Overview

## Project Purpose
Tukaatu is a Flutter-based mobile e-commerce and social commerce platform. It combines product marketplace functionality with social media-style content (short-form videos/reels, films) enabling users to discover, buy, sell, and bid on products while engaging with video content.

## Key Features & Capabilities

### Commerce
- Product browsing via a social-style home feed
- Shopping cart and checkout flow
- Buy now functionality
- Bidding system (place bids, view bid lists, manage bid requests)
- Order management and order details
- Address management for delivery

### Payments
- HamroPay payment gateway integration
- Cart-based and direct purchase flows

### Social / Content
- Short-form video reels feed
- Films creation and upload (video editor with pro_video_editor / pro_image_editor)
- User and store profiles
- Follow stores/users
- Content scoring system
- Share products and films

### Discovery
- Home feed with paginated product/content cards
- Search with voice search (speech_to_text)
- Search engine screen with filters
- Category browsing

### User Account
- Phone-based sign up / login with OTP verification
- Profile editing
- Password change / reset
- Notification settings
- Saved/marked items (bookmarks)
- Chat / messaging

### Maps & Location
- Geolocator integration
- Flutter Map widget for location display
- Save and manage delivery addresses

## Target Users
- Buyers looking for products via a social-commerce feed
- Sellers / store owners listing products and engaging with buyers
- Content creators uploading short films/reels tied to products

## App Variants / Environments
- Development, Staging, Production — controlled via `AppConfiguration` and entry point classes
- `main.dart` defaults to `StagingEntryPoint`
