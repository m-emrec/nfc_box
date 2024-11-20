

# Welcome to NFC Box
Simplify your inventory management with NFC Box! This app allows you to save items onto an NFC tag for easy tracking. For example, you can record the contents of a box onto an NFC tag. Later, to see what’s inside the box, all you need to do is scan the tag – it's that simple!

NFC Box makes organization smarter, faster, and more efficient. Start tagging your items today and never lose track of what's inside!

## 🚀 Features  
- Save item details to an NFC tag.
- Store items in Firebase
- Retrieve and view saved items by simply scanning the tag.  
- Perfect for organizing boxes, inventories, and more.  
- User-friendly interface for seamless NFC interaction.  

## 📸 Screenshots  
<div align="center">
<img src="https://github.com/user-attachments/assets/8a7711c1-962f-4585-9e6e-ad805d2afefa" alt="create item" width="200"/>
<img src="https://github.com/user-attachments/assets/32b9b609-c7a3-4f27-b8e3-b38eea26712e" alt="items" width="200"/>
<img src="https://github.com/user-attachments/assets/5b1021fd-7c10-4686-910b-1982d50b5506" alt="item detail" width="200"/>
 <img src="https://github.com/user-attachments/assets/61e24793-6dc7-44f2-9944-b4b614ba4448" alt="nfc read" width="200"/>
 <img src="https://github.com/user-attachments/assets/74170772-6de1-410a-95a5-46ef0fdc37b6" alt="sign in" width="200"/>
 <img src="https://github.com/user-attachments/assets/8fe6f080-e4d9-4ff0-89f5-f69d43b427bf" alt="sign up" width="200"/>
 <img src="https://github.com/user-attachments/assets/84e7aee1-b4b8-41d1-843e-e29c70ab9b0a" alt="splash" width="200"/>
<img src="https://github.com/user-attachments/assets/6b1cd180-0d5a-4f09-8b76-5ad0c26ec968" alt="terms and conditions" width="200"/>
</div>

## 📹 Product Video
[![Watch the video](https://img.youtube.com/vi/GVdbVGIJ7S8/0.jpg)](https://www.youtube.com/watch?v=GVdbVGIJ7S8)



## 🛠️ Tech Stack  
- **Frontend:** Flutter  
- **State Management:** Riverpod
- **Backend:** Firebase
- **Architecture:** MVVM

## 📦 Packages Used  
Here’s a list of Flutter packages used in this project:  
- **[nfc_manager](https://pub.dev/packages/nfc_manager)**: For reading and writing NFC tags.  
- **[riverpod](https://pub.dev/packages/flutter_riverpod)**: For state management.  
- **[firebase_core](https://pub.dev/packages/firebase_core)**: For Firebase initialization.  
- **[cloud_firestore](https://pub.dev/packages/cloud_firestore)**: For storing item data in Firestore.
- **[firebase_auth](https://pub.dev/packages/firebase_auth)**: For authentication.
- **[firebase_storage](https://pub.dev/packages/firebase_storage)**: For storing image files.
- **[firebase_database](https://pub.dev/packages/firebase_database)**: For storing storing nfc tag details.
- **[go_router](https://pub.dev/packages/go_router)**: For navigation.
- **[lottie](https://pub.dev/packages/lottie)**: For animations.
- **[image_picker](https://pub.dev/packages/image_picker)**: For using device camera.

## 📂 File Structure  
Below is a simplified representation of the project’s file structure:  

```plaintext  
nfc_box/  
│  
lib/
├── config/
│   ├── routes/
│   │   └── auth_checker.dart
│   │   └── router.dart
│   ├── theme/
│       ├── theme_extensions/
│       │   ├── custom_bottom_sheet_theme.dart
│       │   ├── inline_text_button_theme.dart
│       │   ├── item_card_theme.dart
│       ├── app_theme.dart
├── core/
│   ├── assets/
│       ├── animations/
│       ├── icons/
│       ├── images/
│       ├── translations/
│   ├── constants/
│       ├── enums/
│       │   ├── asset_enum.dart
│       │   ├── collection_keys.dart
│       │   ├── color_values.dart
│       │   ├── item_doc_keys.dart
│       │   ├── item_field_names.dart
│       │   ├── app_assets.dart
│       │   ├── app_paddings.dart
│       │   ├── border_radiuses.dart
│       │   ├── colors.dart
│       │   ├── text_styles.dart
│   ├── extensions/
│       └── context_extension.dart
│   ├── resources/
│       ├── data_state.dart
│       ├── error_manager.dart
│       ├── firebase_utils.dart
├── utils/    # utilities used accross the app
│   ├── mixins/
│   ├── models/
│   ├── widgets/
├── features/
│   ├── auth/
│       ├── mixins/
│       ├── model/
│       ├── providers/
│       ├── service/
│       ├── view/
│       ├── view_model/
│   ├── main.dart                # App entry point  
├── pubspec.yaml                 # Project dependencies  
└── README.md                    # Project documentation  
```  
## 📲 Installation  

### Prerequisites  
- Flutter installed ([Install Flutter](https://flutter.dev/docs/get-started/install)).  
- A device with NFC support or an NFC-enabled emulator.  

### Steps  
1. Clone the repository:  
   ```bash  
   git clone https://github.com/m-emrec/nfc_box.git  
   cd nfc_box  
   ```  
2. Install dependencies:  
   ```bash  
   flutter pub get  
   ```  
3. Run the app:  
   ```bash  
   flutter run  
   ```  

## 🎯 Usage  
1. Open the NFC Box app
2. Create your items
3. Read a nfc tag and save item details to an NFC tag  
5. Retrieve details by scanning the tag to see the stored contents.  

## 🤝 Contributing  
Contributions are always welcome!  

1. Fork the repository.  
2. Create a new branch:  
   ```bash  
   git checkout -b feature-name  
   ```  
3. Commit your changes:  
   ```bash  
   git commit -m 'Add your feature description'  
   ```  
4. Push to the branch:  
   ```bash  
   git push origin feature-name  
   ```  
5. Open a pull request.  

