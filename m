Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RZ9ki-0004Bg-7B
	for mharc-qemu-trivial@gnu.org; Fri, 09 Dec 2011 18:21:16 -0500
Received: from eggs.gnu.org ([140.186.70.92]:48114)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1RZ9ka-0003kg-IV
	for qemu-trivial@nongnu.org; Fri, 09 Dec 2011 18:21:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1RZ9kZ-0000cy-DS
	for qemu-trivial@nongnu.org; Fri, 09 Dec 2011 18:21:08 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:46615)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1RZ9kV-0000bv-Du; Fri, 09 Dec 2011 18:21:03 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	0149D728188B; Sat, 10 Dec 2011 00:20:53 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id 6nmkaCdwFkze; Sat, 10 Dec 2011 00:20:32 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id DB7CA7281891; Sat, 10 Dec 2011 00:19:58 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Sat, 10 Dec 2011 00:19:42 +0100
Message-Id: <1323472786-26821-3-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1323472786-26821-1-git-send-email-sw@weilnetz.de>
References: <1323472786-26821-1-git-send-email-sw@weilnetz.de>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH 2/6] fmopl: Fix spelling in code and comments
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Dec 2011 23:21:14 -0000

algorythm->algorithm
rythm->rhythm

I did not try to fix the coding standard, so checkpatch.pl
reports lots of violations.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 hw/fmopl.c |   32 ++++++++++++++++----------------
 hw/fmopl.h |    4 ++--
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/hw/fmopl.c b/hw/fmopl.c
index 5ad52ab..431f736 100644
--- a/hw/fmopl.c
+++ b/hw/fmopl.c
@@ -362,8 +362,8 @@ INLINE UINT32 OPL_CALC_SLOT( OPL_SLOT *SLOT )
 	return SLOT->TLL+ENV_CURVE[SLOT->evc>>ENV_BITS]+(SLOT->ams ? ams : 0);
 }
 
-/* set algorythm connection */
-static void set_algorythm( OPL_CH *CH)
+/* set algorithm connection */
+static void set_algorithm( OPL_CH *CH)
 {
 	INT32 *carrier = &outd[0];
 	CH->connect1 = CH->CON ? carrier : &feedback2;
@@ -498,7 +498,7 @@ INLINE void OPL_CALC_CH( OPL_CH *CH )
 	}
 }
 
-/* ---------- calcrate rythm block ---------- */
+/* ---------- calcrate rhythm block ---------- */
 #define WHITE_NOISE_db 6.0
 INLINE void OPL_CALC_RH( OPL_CH *CH )
 {
@@ -895,14 +895,14 @@ static void OPLWriteReg(FM_OPL *OPL, int r, int v)
 		case 0xbd:
 			/* amsep,vibdep,r,bd,sd,tom,tc,hh */
 			{
-			UINT8 rkey = OPL->rythm^v;
+			UINT8 rkey = OPL->rhythm^v;
 			OPL->ams_table = &AMS_TABLE[v&0x80 ? AMS_ENT : 0];
 			OPL->vib_table = &VIB_TABLE[v&0x40 ? VIB_ENT : 0];
-			OPL->rythm  = v&0x3f;
-			if(OPL->rythm&0x20)
+			OPL->rhythm  = v&0x3f;
+			if(OPL->rhythm&0x20)
 			{
 #if 0
-				usrintf_showmessage("OPL Rythm mode select");
+				usrintf_showmessage("OPL Rhythm mode select");
 #endif
 				/* BD key on/off */
 				if(rkey&0x10)
@@ -995,7 +995,7 @@ static void OPLWriteReg(FM_OPL *OPL, int r, int v)
 		int feedback = (v>>1)&7;
 		CH->FB   = feedback ? (8+1) - feedback : 0;
 		CH->CON = v&1;
-		set_algorythm(CH);
+		set_algorithm(CH);
 		}
 		return;
 	case 0xe0: /* wave type */
@@ -1049,7 +1049,7 @@ void YM3812UpdateOne(FM_OPL *OPL, INT16 *buffer, int length)
 	OPLSAMPLE *buf = buffer;
 	UINT32 amsCnt  = OPL->amsCnt;
 	UINT32 vibCnt  = OPL->vibCnt;
-	UINT8 rythm = OPL->rythm&0x20;
+	UINT8 rhythm = OPL->rhythm&0x20;
 	OPL_CH *CH,*R_CH;
 
 	if( (void *)OPL != cur_chip ){
@@ -1057,7 +1057,7 @@ void YM3812UpdateOne(FM_OPL *OPL, INT16 *buffer, int length)
 		/* channel pointers */
 		S_CH = OPL->P_CH;
 		E_CH = &S_CH[9];
-		/* rythm slot */
+		/* rhythm slot */
 		SLOT7_1 = &S_CH[7].SLOT[SLOT1];
 		SLOT7_2 = &S_CH[7].SLOT[SLOT2];
 		SLOT8_1 = &S_CH[8].SLOT[SLOT1];
@@ -1068,7 +1068,7 @@ void YM3812UpdateOne(FM_OPL *OPL, INT16 *buffer, int length)
 		ams_table = OPL->ams_table;
 		vib_table = OPL->vib_table;
 	}
-	R_CH = rythm ? &S_CH[6] : E_CH;
+	R_CH = rhythm ? &S_CH[6] : E_CH;
     for( i=0; i < length ; i++ )
 	{
 		/*            channel A         channel B         channel C      */
@@ -1080,7 +1080,7 @@ void YM3812UpdateOne(FM_OPL *OPL, INT16 *buffer, int length)
 		for(CH=S_CH ; CH < R_CH ; CH++)
 			OPL_CALC_CH(CH);
 		/* Rythn part */
-		if(rythm)
+		if(rhythm)
 			OPL_CALC_RH(S_CH);
 		/* limit check */
 		data = Limit( outd[0] , OPL_MAXOUT, OPL_MINOUT );
@@ -1110,7 +1110,7 @@ void Y8950UpdateOne(FM_OPL *OPL, INT16 *buffer, int length)
 	OPLSAMPLE *buf = buffer;
 	UINT32 amsCnt  = OPL->amsCnt;
 	UINT32 vibCnt  = OPL->vibCnt;
-	UINT8 rythm = OPL->rythm&0x20;
+	UINT8 rhythm = OPL->rhythm&0x20;
 	OPL_CH *CH,*R_CH;
 	YM_DELTAT *DELTAT = OPL->deltat;
 
@@ -1122,7 +1122,7 @@ void Y8950UpdateOne(FM_OPL *OPL, INT16 *buffer, int length)
 		/* channel pointers */
 		S_CH = OPL->P_CH;
 		E_CH = &S_CH[9];
-		/* rythm slot */
+		/* rhythm slot */
 		SLOT7_1 = &S_CH[7].SLOT[SLOT1];
 		SLOT7_2 = &S_CH[7].SLOT[SLOT2];
 		SLOT8_1 = &S_CH[8].SLOT[SLOT1];
@@ -1133,7 +1133,7 @@ void Y8950UpdateOne(FM_OPL *OPL, INT16 *buffer, int length)
 		ams_table = OPL->ams_table;
 		vib_table = OPL->vib_table;
 	}
-	R_CH = rythm ? &S_CH[6] : E_CH;
+	R_CH = rhythm ? &S_CH[6] : E_CH;
     for( i=0; i < length ; i++ )
 	{
 		/*            channel A         channel B         channel C      */
@@ -1148,7 +1148,7 @@ void Y8950UpdateOne(FM_OPL *OPL, INT16 *buffer, int length)
 		for(CH=S_CH ; CH < R_CH ; CH++)
 			OPL_CALC_CH(CH);
 		/* Rythn part */
-		if(rythm)
+		if(rhythm)
 			OPL_CALC_RH(S_CH);
 		/* limit check */
 		data = Limit( outd[0] , OPL_MAXOUT, OPL_MINOUT );
diff --git a/hw/fmopl.h b/hw/fmopl.h
index a01ff90..24ba5f4 100644
--- a/hw/fmopl.h
+++ b/hw/fmopl.h
@@ -110,8 +110,8 @@ typedef struct fm_opl_f {
 	/* FM channel slots */
 	OPL_CH *P_CH;		/* pointer of CH                     */
 	int	max_ch;			/* maximum channel                   */
-	/* Rythm sention */
-	UINT8 rythm;		/* Rythm mode , key flag */
+	/* Rhythm sention */
+	UINT8 rhythm;		/* Rhythm mode , key flag */
 #if BUILD_Y8950
 	/* Delta-T ADPCM unit (Y8950) */
 	YM_DELTAT *deltat;			/* DELTA-T ADPCM       */
-- 
1.7.2.5


