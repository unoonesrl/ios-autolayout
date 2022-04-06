# ios-autolayout

## Scopo

Questa libreria mette a disposizione funzioni utili per semplificare la gestione dell'autolayout via codice nelle applicazioni iOS.

## Utilizzo

Per gestire l'autolayout di una `myView` in modo semplificato, è necessario aggiungerla come subview di una `superView`, altrimenti verrà sollevata un'eccezione al momento dell'attivazione delle constraint:

	superView.addSubview(myView)

### Ancoraggio generico

	let anchors = myView.anchor(
            top: superView.topAnchor,
            bottom: superView.bottomAnchor,
            leading: superView.leadingAnchor,
            trailing: superView.trailingAnchor,
            padding: UIEdgeInsets(top: 1, left: 2, bottom: 3, right: 4),
            size: CGSize(width: 5, height: 6)
        )
        
### Centramento        
   	 let anchors = myView.center(
            centerX: superView.centerXAnchor,
            centerY: superView.centerYAnchor,
            paddingX: 1,
            paddingY: 2
        )
        
### Size    
    
     let anchors = myView.size(
            CGSize(width: 1, height: 2)
        )

## Requisiti

* iOS 10+
* Swift 5.0

## Installazione - Swift Package Manager

	dependencies: [
    	.package(url: "https://github.com/unoonesrl/ios-autolayout.git") 
    ]
