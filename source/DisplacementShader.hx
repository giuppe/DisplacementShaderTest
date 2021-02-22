import flixel.graphics.tile.FlxGraphicsShader;
import flixel.graphics.tile.FlxGraphicsShader;

class DisplacementShader extends FlxGraphicsShader
{
	@:glFragmentSource('
        #pragma header

        uniform float doDisplace;
        uniform float whereDisplace;

        void main()
        {
            
            vec2 pixsize = 1.0 / openfl_TextureSize;
			
            vec2 pixpos = openfl_TextureCoordv;
            
            if(doDisplace == 1.0){
                if(whereDisplace+float(10*pixsize) > pixpos.y){
                    if(whereDisplace -float(10*pixsize)<pixpos.y){
                        pixpos.x -= 100*pixsize;
                    }
                }
            }
            
            vec4 source = flixel_texture2D(bitmap, pixpos);
            gl_FragColor = source;

        }')
	public function new()
	{
		super();
	}
}
