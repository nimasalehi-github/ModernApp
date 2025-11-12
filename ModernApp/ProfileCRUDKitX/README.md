# ProfileCRUDKitX

A description of this package.
ProfileCRUDKitX/
├─ Package.swift
└─ Sources/
   └─ ProfileCRUDKitX/
      ├─ Model/
      │  └─ ProfileX.swift
      ├─ Service/
      │  └─ ProfileCRUDService.swift
      ├─ ViewModel/
      │  └─ ProfileCRUDViewModel.swift
      └─ Views/
         ├─ ProfileListView.swift
         └─ ProfileEditView.swift
نحوهٔ استفاده و تست در Xcode 14.2

پوشهٔ ProfileCRUDKitX/ را بساز و فایل‌ها را داخل مسیرهای گفته‌شده قرار بده.

در Xcode (پروژهٔ اپ اصلی یا یک پروژه جدید SwiftUI):

File → Add Packages… → Add Local… → انتخاب فولدر ProfileCRUDKitX (مسیری که Package.swift دارد).

در فایل App اصلی (مثلاً ModernAppApp.swift) این‌را بگذار:
import SwiftUI
import ProfileCRUDKitX

@main
struct ModernAppApp: App {
    var body: some Scene {
        WindowGroup {
            ProfileListView() // ویوی اصلی پکیج
        }
    }
}


    Product → Clean Build Folder (⇧⌘K) و سپس ⌘B و اجرا (Simulator یا Preview).

    در Canvas یا Simulator:

        لیست بارگذاری می‌شود،

        دکمه Add صفحهٔ افزودن را باز می‌کند،

        Save در فرم افزودن واقعی پروفایل را اضافه می‌کند،

        لمس هر ردیف صفحه ویرایش را باز می‌کند و Save آن، پروفایل را آپدیت می‌کند،

        Swipe-to-delete پروفایل را حذف می‌کند.

نکات عیب‌یابی (در صورت خطا)

    اگر No such module 'ProfileCRUDKitX' دیدی: پکیج را با File → Add Packages… دوباره بیاور و target پروژه را انتخاب کن.

    اگر Preview ارور داد: Clean Build Folder و باز کردن مجدد canvas معمولاً حل می‌کند.

    اگر تابع Task.sleep پیام deprecated داد، از try? await Task.sleep(nanoseconds: ...) استفاده کن (در فایل‌ها همینکار شده).
