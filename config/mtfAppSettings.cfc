component displayname="Meet the family App Settings" hint="I look after the application settings" output="false"
{
		public function init(){
			application.appsettings = getSettings();
			return this;
		}


		public any function getSettings() {

			var local['modelPath'] = 'model.services';

			return local;
		}


		public any function onDIComplete() {
			//application.appsettings = getSettings();
			//return application.appsettings;
			return;
		}
		
		
		
		
}