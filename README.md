# nibPractice
![](http://digventures.com/wp-content/uploads/2013/03/birds.png)

How do nibs work?
## We just don't know!
Just playing. Well...maybe not. This is a guide for making and using nibs, but it doesn't really cover what they're doing on the backend. Somebody at Apple knows. It's fine.
## Making a custom playing card from a nib
First, we need to create a new file to hold the properties for our nib. It's going to be a subclass of UIView. Select CocoaTouchClass so we can get a little boilerplate in our file the instant we create it.

![](https://cloud.githubusercontent.com/assets/19174201/21356585/325fb2c6-c6a0-11e6-8212-ebfd00eb4fac.png)

In many cases, we can create nibs at the same time we create our .Swift files. Views are quirky, so that option is greyed out for us right now. That's normal.

![](https://cloud.githubusercontent.com/assets/19174201/21356593/3b8b4d4c-c6a0-11e6-8611-6f4f543d4590.png)

So, after you create the .Swift file, go back and explicitly create a nib file as well.

![](https://cloud.githubusercontent.com/assets/19174201/21356601/3fea8254-c6a0-11e6-93e2-c22687d250e7.png)

![](https://cloud.githubusercontent.com/assets/19174201/21356623/538bf48c-c6a0-11e6-8a73-6bef924030b9.png)

We now have a nib!

![](https://cloud.githubusercontent.com/assets/19174201/21356627/583aff0a-c6a0-11e6-8c49-dbd56b71ecc7.png)
### Changing GUI Settings
We have to change a couple of settings inside the GUI to get this nib really functional. Click on View in the left-hand menu and go over to the shield in the right-hand menu. See these? You need to change them.

![](https://cloud.githubusercontent.com/assets/19174201/21356631/5c87a478-c6a0-11e6-8035-6bee3463047f.png)

First, change the size of the nib to freeform. 

![](https://cloud.githubusercontent.com/assets/19174201/21356636/637be2f8-c6a0-11e6-871e-f59caeb2fc39.png)

This makes it resizable and so it doesn't blow up huge when you try to run it on your app after carefully placing and sizing a view on your storyboard.

![](https://cloud.githubusercontent.com/assets/19174201/21356684/8ae33012-c6a0-11e6-9b93-66ba5a790057.png)

Then, change the status bar to none. This removes the little battery icon up top. It's more of a stylistic thing than anything, but it looks neater.

![](https://cloud.githubusercontent.com/assets/19174201/21356638/6871752a-c6a0-11e6-97e3-ca6755c38b5b.png)

Now, click on the file's owner thing in the left-hand menu. 

![](https://cloud.githubusercontent.com/assets/19174201/21356685/8ae77e88-c6a0-11e6-94a8-1e48ced7e88b.png)

See how it says NSObject? 

![](https://cloud.githubusercontent.com/assets/19174201/21356682/8ae23932-c6a0-11e6-9f81-edb1fe64518a.png)

Set this to the name of the .Swift file you just made. This is really important! If you don't do this and start making connections to stuff in the nib, the connections are going to be screwed.

![](https://cloud.githubusercontent.com/assets/19174201/21356683/8ae2b33a-c6a0-11e6-8849-7bb311583826.png)

Next, click on the view thing in the left-hand menu and make sure that stays UIView. 

![](https://cloud.githubusercontent.com/assets/19174201/21356680/8adf4fce-c6a0-11e6-8d5c-1bc2e40220e4.png)

Is it UIView? Good. Don't touch it. Leave it the hell alone.

![](https://cloud.githubusercontent.com/assets/19174201/21356681/8adf439e-c6a0-11e6-8e96-2dcb42572c47.png)

### Wiring up the nib
Create a bunch of labels and stuff inside the nib. Make sure everything fits inside the nib, especially image views. Having labels or image views hang out outside the nib can make them behave in odd ways.

![](https://cloud.githubusercontent.com/assets/19174201/21356691/8bbb2454-c6a0-11e6-8a11-cd30006aac1e.png)

Two-up the nib and the .Swift file you created. 

![](https://cloud.githubusercontent.com/assets/19174201/21356689/8bb84ebe-c6a0-11e6-9ead-dbb6b124d557.png)

Control drag the UI stuff from the nib into THIS file, not the view controller!

![](https://cloud.githubusercontent.com/assets/19174201/21356688/8bb7145e-c6a0-11e6-8ab8-4303a23ca40a.png)

Double-check that the connections are good by control-clicking on each UI item afterward. Sometimes XCode can get confused and connect them to the wrong spot. Then you'll get a confusing error message about how the key isn't compliant and your app will crash.

![](https://cloud.githubusercontent.com/assets/19174201/21356690/8bbac6f8-c6a0-11e6-91e9-a87639f821c9.png)

If the connection says anything other than File's Owner or the name of your .Swift file, remove the connection and attach it again.

### Adding nib boilerplate
Inside the .Swift file, add these two functions:

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        if let view = Bundle.main.loadNibNamed("Card", owner: self, options: nil)?.first as? UIView {
            self.addSubview(view)
            view.frame = self.bounds
            
        }
    }

The first one creates a rectangular box for your nib. The second does some magic that fits your nib inside a view when you mess around on the storyboard.

### Using the custom view on a Storyboard
Go to the main storyboard and select UIView. 

![](https://cloud.githubusercontent.com/assets/19174201/21356738/b022b4e2-c6a0-11e6-8c2d-6cda565e5902.png)

Drag out a new view, and set its custom class to the name of your .Swift file. 

![](https://cloud.githubusercontent.com/assets/19174201/21356737/b01ee740-c6a0-11e6-80e8-1c48085b18da.png)

![](https://cloud.githubusercontent.com/assets/19174201/21356736/b01a7aca-c6a0-11e6-960b-f30ea53f1d2b.png)

![](https://cloud.githubusercontent.com/assets/19174201/21356734/b0178bbc-c6a0-11e6-9942-dd5286f9233c.png)

You can't see any of the work you've put into your nib yet, but the new view is now going to display whatever is in your nib when you run the app. Two-up again.

![](https://cloud.githubusercontent.com/assets/19174201/21356739/b0411af4-c6a0-11e6-85ff-aebe4fe04fa4.png)

Control-drag from the storyboard to the view controller to create an outlet for this new view. 

![](https://cloud.githubusercontent.com/assets/19174201/21356740/b0428984-c6a0-11e6-8d63-ad6153179b26.png)

You probably already know all this, but make sure the view controller is set to initial view controller and that it's the correct controller for the view you're currently working on...

### Running the Project
If you run your project now, you should see an all-white screen with two little A's in the corner. That's because you haven't done any styling yet.

![](https://cloud.githubusercontent.com/assets/19174201/21374546/7d37ff56-c6f5-11e6-900a-b1c4210d5f9c.png)

### Styling in the .Swift file
You can style the text and other UI items inside the .Swift file. For example, you can give the view a border, a background color, or custom fonts.

You can set some properties inside the required init inside your .Swift file. Properties you might want to set there include the width and height of the card, rounded corners, or border color. 

![](https://cloud.githubusercontent.com/assets/19174201/21374612/e90af2e2-c6f5-11e6-8601-4e21ce4c1db5.png)

However, if you try to set the background color here, it will be covered up by the background color specified inside the nib. 

![](https://cloud.githubusercontent.com/assets/19174201/21374549/7d3ef9c8-c6f5-11e6-8a6c-2ea5f4afa853.png)

![](https://cloud.githubusercontent.com/assets/19174201/21375283/68c9a97a-c6fa-11e6-9366-120fbc8d8080.png)

![](https://cloud.githubusercontent.com/assets/19174201/21375285/68cb958c-c6fa-11e6-9c38-eddc6955488e.png)

![](https://cloud.githubusercontent.com/assets/19174201/21375286/68cc004e-c6fa-11e6-96d0-422b4efd3f10.png)

The same deal if you try to set the color for the card in the storyboard -- you won't see the color you set there. Instead, you'll see the color you set in the nib. On the other hand, if you don't explicitly set the width and height for your card, the background will stretch to match the dimensions of whatever is on the storyboard -- but the color still won't match.

![](https://cloud.githubusercontent.com/assets/19174201/21375284/68cb6878-c6fa-11e6-9e3a-eb2677a9dca8.png)

![](https://cloud.githubusercontent.com/assets/19174201/21375328/c788a5e2-c6fa-11e6-97f4-0fb563c178f4.png)


### Filling in your labels & positioning your card in the view controller
Depending on the kind of stuff you're displaying inside your custom nib, you may want to also do some display stuff inside the view controller.

We're making cards, and we don't want to hardcode the labels to display any one thing, so we'll put text inside the labels by calling the custom view's label properties inside viewDidLoad()

This is more or less the same kind of stuff as populating table cells. You set the labels via the label's text property. You can also position the card programatically.

![](https://cloud.githubusercontent.com/assets/19174201/21375005/a36b9a90-c6f8-11e6-80a0-acf71988e101.png)

![](https://cloud.githubusercontent.com/assets/19174201/21375309/8ddd2160-c6fa-11e6-86b1-d4f2ab21e628.png)




