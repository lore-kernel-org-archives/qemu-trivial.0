Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QFT1Y-00012D-8B
	for mharc-qemu-trivial@gnu.org; Thu, 28 Apr 2011 11:21:00 -0400
Received: from eggs.gnu.org ([140.186.70.92]:48321)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1QFT1V-0000y5-OK
	for qemu-trivial@nongnu.org; Thu, 28 Apr 2011 11:20:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1QFT1U-0006gH-8A
	for qemu-trivial@nongnu.org; Thu, 28 Apr 2011 11:20:57 -0400
Received: from moutng.kundenserver.de ([212.227.17.8]:56371)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1QFT1T-0006eL-Gr; Thu, 28 Apr 2011 11:20:55 -0400
Received: from flocke.fritz.box (p5086FD13.dip.t-dialin.net [80.134.253.19])
	by mrelayeu.kundenserver.de (node=mrbap2) with ESMTP (Nemesis)
	id 0MKLPq-1QH7BO2Xhe-001Jng; Thu, 28 Apr 2011 17:20:48 +0200
Received: from stefan by flocke.fritz.box with local (Exim 4.72)
	(envelope-from <stefan@weilnetz.de>)
	id 1QFT1L-0002BV-R8; Thu, 28 Apr 2011 17:20:47 +0200
From: Stefan Weil <weil@mail.berlios.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Date: Thu, 28 Apr 2011 17:20:32 +0200
Message-Id: <1304004042-8334-8-git-send-email-weil@mail.berlios.de>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1304004042-8334-1-git-send-email-weil@mail.berlios.de>
References: <1304004042-8334-1-git-send-email-weil@mail.berlios.de>
X-Provags-ID: V02:K0:EFVDQ19mBL2MovEaUrRLKJpp4rCI3qgAgirWjJbJAMK
	EZb4A+G/drPIBegs87ontW6Z82SIB5f0g9Zr+yDXBCjPJbVxCy
	w5fjz8m0Sw/QTQHw3PrPivx4Xs89LHP9XdflPP+MP+mYG2wW6o
	tBOTAplUwslVA4PVZj0TnevWqUw9/1lVSnTlvvqZAyPDwP1sYu
	7M5qjH+NheARXm4KNxfm8YLTSKxUtrRGwRd2ti+eObMPpFK1g8 FUJ90KFhfbmHg
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 212.227.17.8
Cc: qemu-trivial@nongnu.org, Stefan Weil <weil@mail.berlios.de>
Subject: [Qemu-trivial] [PATCH 08/18] Fix typo in comment (dieing -> dying)
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
X-List-Received-Date: Thu, 28 Apr 2011 15:20:58 -0000

Signed-off-by: Stefan Weil <weil@mail.berlios.de>
---
 linux-user/signal.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/linux-user/signal.c b/linux-user/signal.c
index ce033e9..6fe086b 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -391,7 +391,7 @@ static void QEMU_NORETURN force_sig(int target_sig)
             target_sig, strsignal(host_sig), "core dumped" );
     }
 
-    /* The proper exit code for dieing from an uncaught signal is
+    /* The proper exit code for dying from an uncaught signal is
      * -<signal>.  The kernel doesn't allow exit() or _exit() to pass
      * a negative value.  To get the proper exit code we need to
      * actually die from an uncaught signal.  Here the default signal
-- 
1.7.2.5


