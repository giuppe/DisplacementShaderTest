package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;

class PlayState extends FlxState
{
	private var displacementShader:DisplacementShader;
	private var doDisplace:Float = 0;
	private var whereDisplace:Float = 0;

	private var flixelSprite:FlxSprite;

	override public function create():Void
	{
		super.create();

		FlxG.camera.antialiasing = true;

		var bg = new FlxSprite();
		bg.loadGraphic("assets/brick-0207.jpg");
		add(bg);

		flixelSprite = new FlxSprite();
		flixelSprite.loadGraphic("assets/haxeflixel.png");
		add(flixelSprite);

		displacementShader = new DisplacementShader();
		flixelSprite.shader = displacementShader;
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);

		doDisplace = Math.random() > 0.1 ? 0.0 : 1.0;
		whereDisplace = Math.random();

		displacementShader.doDisplace.value = [doDisplace];
		displacementShader.whereDisplace.value = [whereDisplace];
	}
}
