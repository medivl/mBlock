package cc.makeblock.mbot.uiwidgets.lightSetter
{
	import flash.display.Graphics;
	import flash.display.Sprite;
	
	internal class LightPoint extends Sprite
	{
		static public const SIZE:int = 30;
		
		static public const COLOR_ON:int = 0x00ABFD;
		static public const COLOR_OFF:int = 0x666666;
		
		private var _isOn:Boolean;
		public var px:int;
		public var py:int;
		
		public function LightPoint()
		{
			mouseChildren = false;
			setOff();
		}
		
		private function draw(color:uint):void
		{
			var g:Graphics = graphics;
			
			g.clear();
			
			g.beginFill(color);
			g.drawRect(0, 0, SIZE, SIZE);
			g.endFill();
		}
		
		public function get isOn():Boolean
		{
			return _isOn;
		}
		
		public function set isOn(value:Boolean):void
		{
			if(_isOn != value){
				toggle();
			}
		}
		
		public function setOn():void
		{
			_isOn = true;
			draw(COLOR_ON);
		}
		
		public function setOff():void
		{
			_isOn = false;
			draw(COLOR_OFF);
		}
		
		public function toggle():void
		{
			if(_isOn){
				setOff();
			}else{
				setOn();
			}
		}
	}
}