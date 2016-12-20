# nibPractice
How do nibs work?
## We just don't know!
Just playing. Well...maybe not. This is a guide for making and using nibs, but it doesn't really cover what they're doing on the backend. Somebody at Apple knows. It's fine.
## Making a custom playing card from a nib
First, we need to create a new file to hold the properties for our nib. It's going to be a subclass of UIView. Select CocoaTouchClass so we can get a little boilerplate in our file the instant we create it.
In many cases, we can create nibs at the same time we create our .Swift files. Views are quirky, so that option is greyed out for us right now. So, after you create the .Swift file, go back and explicitly create a nib file as well.
We now have a nib!
### Changing GUI Settings
We have to change a couple of settings inside the GUI to get this nib really functional.
First, change the size of the nib to freeform. This makes it resizable and so it doesn't blow up huge when you try to run it on your app after carefully placing and sizing a view on your storyboard.
Then, change the status bar to none. This removes the little battery icon up top. It's more of a stylistic thing than anything, but it looks neater.
Now, click on the file's owner thing in the left-hand menu. Set this to the name of the .Swift file you just made. This is really important! If you don't do this and start making connections to stuff in the nib, the connections are going to be screwed.
Next, click on the view thing in the left-hand menu and make sure that stays UIView. Is it UIView? Good. Don't touch it. Leave it alone. 
### Wiring up the nib
Create a bunch of labels and stuff inside the nib. Make sure everything fits inside the nib, especially image views. Having labels or image views hang out outside the nib can make them behave in quirky ways.
Two-up the nib and the .Swift file you created. Control drag the UI stuff from the nib into THIS file, not the view controller!
Double-check that the connections are good by control-clicking on each UI item afterward. Sometimes XCode can get confused and connect them to the wrong spot. Then you'll get a confusing error message about how the key isn't compliant and your app will crash.
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
Go to the main storyboard and select UIView. Drag out a new view, and set its custom class to the name of your .Swift file. You can't see any of the work you've put into your nib yet, but the new view is now going to display whatever is in your nib when you run the app.
Control-drag from the storyboard to the view controller to create an outlet for this new view. 
You probably already know all this, but make sure the view controller is set to initial view controller and that it's the correct controller for the view you're currently working on...
### Populating your labels in the view controller
Depending on the kind of stuff you're displaying inside your custom nib, you may want to populate its labels inside the view controller.
We're doing cards, and we don't want to hardcode them to display any particular thing, so we'll put text inside the labels by calling the custom view's label properties inside viewDidLoad()
This is more or less the same kind of stuff as populating table cells. You set the labels via the label's text property.
### Styling
You can also style the text and other UI items inside the view before they hit viewDidLoad(), of course. For example, you can give the view a border, a background color, or custom fonts.
Be careful about where you're setting these properties, or you might accidently set them on the wrong part of the view.

