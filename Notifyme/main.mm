#import <CoreFoundation/CoreFoundation.h>
#import <CoreFoundation/CFUserNotification.h>
#include <unistd.h>

void display_usage( char **argv ){
	fprintf(stderr, "Usage: %s [arguments...]\n"
                    "      -t    Titre           - titre de la notification      (optionel)\n"
                    "                              défaut : \"Titre de la notification\"\n"
                    "      -m    Message         - message de la notification    (optionel)\n"
                    "                              défaut : \"Voici le message.\" \n"
                    "      -d:   bouton par défaut\n"
                    "      -a:   bouton alternatif\n"
                    "      -o:   autre buton\n"
                    "      -q:   interval en secondes\n"
                    "      -p:   champ texte\n"
                    "      -v:   message du champ texte\n"
                    "      -h:   affiche l'aide\n"
                    "\n"
                    "  Voici les valeurs de retour en fonction du bouton choisi :\n"
                    "     0 : bouton par défaut\n"
                    "     1 : bouton alternatif\n"
                    "     2 : autre bouton\n"
                    "     3 : interval\n"
                    , argv[0]);
	exit(-1);
}

//Main
int main(int argc, char **argv, char **envp) {
	
	extern char *optarg;
	extern int optind;

	CFTimeInterval timeout = 0;
	
	CFMutableDictionaryRef dict = CFDictionaryCreateMutable(NULL, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);

	if (argc == 1) {
		display_usage(argv);
	}
		
	int ch;
	
	while ((ch = getopt(argc, argv, "ht:m:d:a:o:pv:q:")) != -1){
		switch (ch){
        	case 't':
				CFDictionaryAddValue( dict, kCFUserNotificationAlertHeaderKey, CFStringCreateWithCString(NULL, optarg, kCFStringEncodingUTF8) );
        	break;
        	case 'm':
				CFDictionaryAddValue( dict, kCFUserNotificationAlertMessageKey, CFStringCreateWithCString(NULL, optarg, kCFStringEncodingUTF8) );
        	break;
        	case 'd':
				CFDictionaryAddValue( dict, kCFUserNotificationDefaultButtonTitleKey, CFStringCreateWithCString(NULL, optarg, kCFStringEncodingUTF8) );
        	break;
        	case 'a':
				CFDictionaryAddValue( dict, kCFUserNotificationAlternateButtonTitleKey, CFStringCreateWithCString(NULL, optarg, kCFStringEncodingUTF8) );
        	break;
        	case 'o':
				CFDictionaryAddValue( dict, kCFUserNotificationOtherButtonTitleKey, CFStringCreateWithCString(NULL, optarg, kCFStringEncodingUTF8) );
        	break;
        	case 'p':
				CFDictionaryAddValue( dict, kCFUserNotificationTextFieldTitlesKey, @"title" );
        	break;
        	case 'v':
				CFDictionaryAddValue( dict, kCFUserNotificationTextFieldValuesKey, CFStringCreateWithCString(NULL, optarg, kCFStringEncodingUTF8) );
        	case 'q':
				timeout = atoi(optarg);
        	break;
        	case 'h':
        	default:
				display_usage(argv);
        }
	}
	argc -= optind;
	argv += optind;
	
	SInt32 error;	
	
	CFOptionFlags flags = 0;
	
	flags |= kCFUserNotificationPlainAlertLevel;
	
	CFDictionaryAddValue( dict, kCFUserNotificationAlertTopMostKey, kCFBooleanTrue );
	CFNotificationCenterPostNotificationWithOptions( CFNotificationCenterGetDarwinNotifyCenter(), CFSTR("test"),  NULL, NULL, kCFNotificationDeliverImmediately );
	CFUserNotificationRef notif = CFUserNotificationCreate( NULL, timeout, flags, &error, dict );
	CFOptionFlags options;
	CFUserNotificationReceiveResponse( notif, 0, &options );
	CFDictionaryRef result = CFUserNotificationGetResponseDictionary(notif);
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	NSDictionary * powerDic = (NSDictionary *) result;
	NSString * aValue = [powerDic objectForKey:@"TextFieldValues"];
	if( aValue.length > 0 ){
		printf( "%s\n", [aValue UTF8String] );
	}
	
	[pool drain];
	
	if((int) error == 0){
		exit((int) options);
	}else{
		exit(error);
	}
}

