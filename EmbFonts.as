package  {
	import flash.display.MovieClip;
	import flash.text.Font;
	
	
	
	public class EmbFonts extends MovieClip{
         
		[Embed(source="./files/fonts/sansMS.ttf", fontFamily="EmbComicSansMS", 
   						fontStyle="normal", fontWeight="normal", embedAsCFF="false", unicodeRange="U+0020-007E")]
		private var EmbComicSansMS : Class;
		[Embed(source="./files/fonts/sansMSBold.ttf", fontFamily="EmbComicSansMS",
   						fontStyle="normal", fontWeight="bold", embedAsCFF="false", unicodeRange="U+0020-007E")]
		private var EmbComicSansMSBold : Class;
		
		[Embed(source="./files/fonts/vrinda.ttf", fontFamily="EmbVrinda", 
   						fontStyle="normal", fontWeight="normal", embedAsCFF="false", unicodeRange="U+0020-007E")]
		private var EmbVrinda : Class;
		[Embed(source="./files/fonts/vrindab.ttf", fontFamily="EmbVrinda",
   						fontStyle="normal", fontWeight="bold", embedAsCFF="false", unicodeRange="U+0020-007E")]
		private var EmbVrindaBold : Class;
		[Embed(source="./files/fonts/cordiaui.ttf", fontFamily="EmbVrinda", 
   						fontStyle="italic", fontWeight="normal", embedAsCFF="false", unicodeRange="U+0020-007E")]
		private var EmbVrindaItalic : Class;
		[Embed(source="./files/fonts/cordiauz.ttf", fontFamily="EmbVrinda",
   						fontStyle="italic", fontWeight="bold", embedAsCFF="false", unicodeRange="U+0020-007E")]
		private var EmbVrindaItalicBold : Class;
		
		[Embed(source="./files/fonts/verdana.ttf", fontFamily="EmbVerdana", 
   						fontStyle="normal", fontWeight="normal", embedAsCFF="false", unicodeRange="U+0020-007E")]
		private var EmbVerdana : Class;
		[Embed(source="./files/fonts/verdanab.ttf", fontFamily="EmbVerdana",
   						fontStyle="normal", fontWeight="bold", embedAsCFF="false", unicodeRange="U+0020-007E")]
		private var EmbVerdanaBold : Class;
		[Embed(source="./files/fonts/verdanai.ttf", fontFamily="EmbVerdana", 
   						fontStyle="italic", fontWeight="normal", embedAsCFF="false", unicodeRange="U+0020-007E")]
		private var EmbVerdanaItalic : Class;
		[Embed(source="./files/fonts/verdanaz.ttf", fontFamily="EmbVerdana",
   						fontStyle="italic", fontWeight="bold", embedAsCFF="false", unicodeRange="U+0020-007E")]
		private var EmbVerdanaItalicBold : Class;
		
		[Embed(source="./files/fonts/times.ttf", fontFamily="EmbTimesNewRoman", 
   						fontStyle="normal", fontWeight="normal", embedAsCFF="false", unicodeRange="U+0020-007E")]
		private var EmbTimesNewRoman : Class;
		[Embed(source="./files/fonts/timesb.ttf", fontFamily="EmbTimesNewRoman",
   						fontStyle="normal", fontWeight="bold", embedAsCFF="false", unicodeRange="U+0020-007E")]
		private var EmbTimesNewRomanBold : Class;
		[Embed(source="./files/fonts/timesi.ttf", fontFamily="EmbTimesNewRoman", 
   						fontStyle="italic", fontWeight="normal", embedAsCFF="false", unicodeRange="U+0020-007E")]
		private var EmbTimesNewRomanItalic : Class;
		[Embed(source="./files/fonts/timesz.ttf", fontFamily="EmbTimesNewRoman",
   						fontStyle="italic", fontWeight="bold", embedAsCFF="false", unicodeRange="U+0020-007E")]
		private var EmbTimesNewRomanItalicBold : Class;
		
		[Embed(source="./files/fonts/arial.ttf", fontFamily="EmbArial", 
   						fontStyle="normal", fontWeight="normal", embedAsCFF="false", unicodeRange="U+0020-007E")]
		private var EmbArial : Class;
		[Embed(source="./files/fonts/arialb.ttf", fontFamily="EmbArial",
   						fontStyle="normal", fontWeight="bold", embedAsCFF="false", unicodeRange="U+0020-007E")]
		private var EmbArialBold : Class;
		[Embed(source="./files/fonts/ariali.ttf", fontFamily="EmbArial", 
   						fontStyle="italic", fontWeight="normal", embedAsCFF="false", unicodeRange="U+0020-007E")]
		private var EmbArialItalic : Class;
		[Embed(source="./files/fonts/arialz.ttf", fontFamily="EmbArial",
   						fontStyle="italic", fontWeight="bold", embedAsCFF="false", unicodeRange="U+0020-007E")]
		private var EmbArialItalicBold : Class;
		
		[Embed(source="./files/fonts/tahoma.ttf", fontFamily="EmbTahoma", 
   						fontStyle="normal", fontWeight="normal", embedAsCFF="false", unicodeRange="U+0020-007E")]
		private var EmbTahoma : Class;
		[Embed(source="./files/fonts/tahomab.ttf", fontFamily="EmbTahoma",
   						fontStyle="normal", fontWeight="bold", embedAsCFF="false", unicodeRange="U+0020-007E")]
		private var EmbTahomaBold : Class;
		[Embed(source="./files/fonts/cordiaui.ttf", fontFamily="EmbTahoma", 
   						fontStyle="italic", fontWeight="normal", embedAsCFF="false", unicodeRange="U+0020-007E")]
		private var EmbTahomaItalic : Class;
		[Embed(source="./files/fonts/cordiauz.ttf", fontFamily="EmbTahoma",
   						fontStyle="italic", fontWeight="bold", embedAsCFF="false", unicodeRange="U+0020-007E")]
		private var EmbTahomaItalicBold : Class;
		
		[Embed(source="./files/fonts/georgia.ttf", fontFamily="EmbGeorgia", 
   						fontStyle="normal", fontWeight="normal", embedAsCFF="false", unicodeRange="U+0020-007E")]
		private var EmbGeorgia : Class;
		[Embed(source="./files/fonts/georgiab.ttf", fontFamily="EmbGeorgia",
   						fontStyle="normal", fontWeight="bold", embedAsCFF="false", unicodeRange="U+0020-007E")]
		private var EmbGeorgiaBold : Class;
		[Embed(source="./files/fonts/georgiai.ttf", fontFamily="EmbGeorgia", 
   						fontStyle="italic", fontWeight="normal", embedAsCFF="false", unicodeRange="U+0020-007E")]
		private var EmbGeorgiaItalic : Class;
		[Embed(source="./files/fonts/georgiaz.ttf", fontFamily="EmbGeorgia",
   						fontStyle="italic", fontWeight="bold", embedAsCFF="false", unicodeRange="U+0020-007E")]
		private var EmbGeorgiaItalicBold : Class;
				
		[Embed(source="./files/fonts/calibri.ttf", fontFamily="EmbСalibri", 
   						fontStyle="normal", fontWeight="normal", embedAsCFF="false", unicodeRange="U+0020-007E")]
		private var EmbСalibri : Class;
		[Embed(source="./files/fonts/calibrib.ttf", fontFamily="EmbСalibri",
   						fontStyle="normal", fontWeight="bold", embedAsCFF="false", unicodeRange="U+0020-007E")]
		private var EmbСalibriBold : Class;
		[Embed(source="./files/fonts/calibrii.ttf", fontFamily="EmbСalibri", 
   						fontStyle="italic", fontWeight="normal", embedAsCFF="false", unicodeRange="U+0020-007E")]
		private var EmbСalibriItalic : Class;
		[Embed(source="./files/fonts/calibriz.ttf", fontFamily="EmbСalibri",
   						fontStyle="italic", fontWeight="bold", embedAsCFF="false", unicodeRange="U+0020-007E")]
		private var EmbСalibriItalicBold : Class;
		
		[Embed(source="./files/fonts/cour.ttf", fontFamily="EmbCourier", 
   						fontStyle="normal", fontWeight="normal", embedAsCFF="false", unicodeRange="U+0020-007E")]
		private var EmbCourier : Class;
		[Embed(source="./files/fonts/courb.ttf", fontFamily="EmbCourier",
   						fontStyle="normal", fontWeight="bold", embedAsCFF="false", unicodeRange="U+0020-007E")]
		private var EmbCourierBold : Class;
		[Embed(source="./files/fonts/couri.ttf", fontFamily="EmbCourier", 
   						fontStyle="italic", fontWeight="normal", embedAsCFF="false", unicodeRange="U+0020-007E")]
		private var EmbCourierItalic : Class;
		[Embed(source="./files/fonts/courz.ttf", fontFamily="EmbCourier",
   						fontStyle="italic", fontWeight="bold", embedAsCFF="false", unicodeRange="U+0020-007E")]
		private var EmbCourierItalicBold : Class;
		
		
		public function EmbFonts() {
			// constructor code
		}
		
		public function loadFonts() : void
		{
			Font.registerFont(EmbComicSansMS);
			Font.registerFont(EmbVrinda);
			Font.registerFont(EmbVerdana);
			Font.registerFont(EmbTimesNewRoman);
			Font.registerFont(EmbArial);
			Font.registerFont(EmbTahoma);
			Font.registerFont(EmbGeorgia);
			Font.registerFont(EmbСalibri);
			Font.registerFont(EmbCourier);
		}

	}
	
}
