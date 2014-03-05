Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WLJGJ-0000fc-NG
	for mharc-qemu-trivial@gnu.org; Wed, 05 Mar 2014 16:21:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35734)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1WLJGC-0000Ts-G2
	for qemu-trivial@nongnu.org; Wed, 05 Mar 2014 16:21:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1WLJG7-0004Nf-Dv
	for qemu-trivial@nongnu.org; Wed, 05 Mar 2014 16:21:52 -0500
Received: from qemu.weilnetz.de ([37.221.198.45]:43561
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1WLJFw-0004Ln-Vo; Wed, 05 Mar 2014 16:21:37 -0500
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id E163517F99C; Wed,  5 Mar 2014 22:21:33 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>
Date: Wed,  5 Mar 2014 22:21:32 +0100
Message-Id: <1394054492-29004-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] audio: Add 'static' attributes to several
	variables
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
X-List-Received-Date: Wed, 05 Mar 2014 21:21:57 -0000

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 hw/audio/fmopl.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/audio/fmopl.c b/hw/audio/fmopl.c
index f0a0234..f0d6d6f 100644
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


