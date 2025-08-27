//
//#ifndef TNS_IFO 1
//#define TNS_IFO 1
//
//#include "machine_type.h"
//#include "psy_const.h"
//#define MAX_NUM_OF_FILTERSS 2
//#define TNS_MAX_ORDERR 12
//typedef struct {
//	int order;                           /* Filter order */
//	int direction;		       /* Filtering direction */
//	int coefCompress;		       /* Are coeffs compressed? */
//	int length;                          /* Length, in bands */
//	double aCoeffs[TNS_MAX_ORDERR + 1];     /* AR Coefficients */
//	double kCoeffs[TNS_MAX_ORDERR + 1];     /* Reflection Coefficients */
//	int index[TNS_MAX_ORDERR + 1];	       /* Coefficient indices */
//} TNS_FILTER_DATA;
//
//typedef struct {
//	int numFilters;				/* Number of filters */
//	int coefResolution;				/* Coefficient resolution */
//	TNS_FILTER_DATA tnsFilter[3];	                /* TNS filters */
//} TNS_WINDOW_DATA;
//
//typedef struct {
//	INT numOfFilters[TRANS_FAC];
//	INT coefRes[TRANS_FAC];
//	INT length[TRANS_FAC][MAX_NUM_OF_FILTERSS];
//	INT order[TRANS_FAC][MAX_NUM_OF_FILTERSS];
//	INT direction[TRANS_FAC][MAX_NUM_OF_FILTERSS];
//	INT coefCompress[TRANS_FAC][MAX_NUM_OF_FILTERSS];
//	/* for Long: length TNS_MAX_ORDER (12 for LC) is required -> 12 */
//	/* for Short: length TRANS_FAC*TNS_MAX_ORDER (only 5 for short LC) is required
//	 * -> 8*5=40 */
//	 /* Currently TRANS_FAC*TNS_MAX_ORDER = 8*12 = 96 (for LC) is used (per
//	  * channel)! Memory could be saved here! */
//	INT coef[TRANS_FAC][MAX_NUM_OF_FILTERSS][TNS_MAX_ORDERR];
//
//
//	int tnsDataPresent;
//	int tnsMinBandNumberLong;
//	int tnsMinBandNumberShort;
//	int tnsMaxBandsLong;
//	int tnsMaxBandsShort;
//	int tnsMaxOrderLong;
//	int tnsMaxOrderShort;
//	TNS_WINDOW_DATA windowData[8];	/* TNS data per window */
//} TNS_INFO;
//
//#endif
