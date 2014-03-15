Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WOlSJ-0004Q7-HA
	for mharc-qemu-trivial@gnu.org; Sat, 15 Mar 2014 06:04:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53658)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WOlSC-0004DM-PE
	for qemu-trivial@nongnu.org; Sat, 15 Mar 2014 06:04:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WOlS8-0007CH-B4
	for qemu-trivial@nongnu.org; Sat, 15 Mar 2014 06:04:32 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:35876)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WOlRu-00076J-E9; Sat, 15 Mar 2014 06:04:14 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id E533A41D98;
	Sat, 15 Mar 2014 14:04:12 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 398F766C;
	Sat, 15 Mar 2014 13:57:05 +0400 (MSK)
Received: (nullmailer pid 20027 invoked by uid 1000);
	Sat, 15 Mar 2014 09:57:04 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sat, 15 Mar 2014 13:56:56 +0400
Message-Id: <1394877419-19949-11-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1394877419-19949-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1394877419-19949-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 10/13] audio: Add 'static' attributes to
	several variables
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
X-List-Received-Date: Sat, 15 Mar 2014 10:04:37 -0000

From: Stefan Weil <sw@weilnetz.de>

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/audio/fmopl.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/audio/fmopl.c b/hw/audio/fmopl.c
index f0a0234..290a224 100644
--- a/hw/audio/fmopl.c
+++ b/hw/audio/fmopl.c
@@ -223,13 +223,13 @@ static void *cur_chip = NULL;	/* current chip point */
 /* static OPLSAMPLE  *bufL,*bufR; */
 static OPL_CH *S_CH;
 static OPL_CH *E_CH;
-OPL_SLOT *SLOT7_1,*SLOT7_2,*SLOT8_1,*SLOT8_2;
+static OPL_SLOT *SLOT7_1, *SLOT7_2, *SLOT8_1, *SLOT8_2;
 
 static INT32 outd[1];
 static INT32 ams;
 static INT32 vib;
-INT32  *ams_table;
-INT32  *vib_table;
+static INT32 *ams_table;
+static INT32 *vib_table;
 static INT32 amsIncr;
 static INT32 vibIncr;
 static INT32 feedback2;		/* connect for SLOT 2 */
-- 
1.7.10.4


