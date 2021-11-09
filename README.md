# Friendr iOS interview

## Part one

1) Modal views are mainly used as popups and temporary screens. When their tasks are done they are dismissed to show the main screens where the core and persisting functionality exists. 
   Push is mainly used to represent screens in a form of stack. You use a navigation bar to move forwards and backwards within a navigation.
2) Keychain services should be used to store crucial items like passwords. Apple has its way to encrypt and save these in a secure manner. 
   Use UserDefaults for key value pair data that has to be maintained at all launches of the app. Things like a JWT can come here to authenticate each session. 
   Core Data is to be used for full use of local saving like a list of user's addresses. These things are very large to be kept in UserDefaults..
3) The function below can cause a retain cycle and hence a memory leak. Use weak/ unowned concepts to avoid this.

```swift
func fetchData() {
    service.fetchFromAPI { result in
        self.data = result
    }
}
```

4) In POP, we rely on protocols for functionality. We use and inheirt protocols rahter than full classes which allow us to have more flexibility over functionality. When writing an app this way, your code becomes more modular.  We can use mulitple protocols to virtually do even multiple inheritance. POP also helps to write testable and scalable code.

## Part two

I have implemented the project in Reactive-MVVM. I still think there are improvements like adding UI and Unit tests and loaders/ animations. But I think this will be fine for our initial understandings.   
