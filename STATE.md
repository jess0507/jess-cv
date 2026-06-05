# Flutter State Management

## 關係圖
```
Flutter SDK
│
├─ Listenable
│   │
│   ├─ ChangeNotifier
│   │
│   └─ ValueNotifier<T>
│
└─ State<T> (StatefulWidget)

Provider 套件
│
├─ Provider
├─ ChangeNotifierProvider
├─ FutureProvider
└─ StreamProvider

Riverpod
│
├─ Provider
├─ StateProvider
├─ NotifierProvider
├─ AsyncNotifierProvider
└─ StreamProvider
```

