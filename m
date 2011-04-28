Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QFT1k-0001OW-MO
	for mharc-qemu-trivial@gnu.org; Thu, 28 Apr 2011 11:21:12 -0400
Received: from eggs.gnu.org ([140.186.70.92]:48543)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1QFT1c-00018q-BD
	for qemu-trivial@nongnu.org; Thu, 28 Apr 2011 11:21:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1QFT1b-0006ke-2A
	for qemu-trivial@nongnu.org; Thu, 28 Apr 2011 11:21:04 -0400
Received: from moutng.kundenserver.de ([212.227.126.186]:63577)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1QFT1T-0006eF-Ay; Thu, 28 Apr 2011 11:20:55 -0400
Received: from flocke.fritz.box (p5086FD13.dip.t-dialin.net [80.134.253.19])
	by mrelayeu.kundenserver.de (node=mrbap1) with ESMTP (Nemesis)
	id 0MATjG-1Q53yE2rco-00BBV9; Thu, 28 Apr 2011 17:20:48 +0200
Received: from stefan by flocke.fritz.box with local (Exim 4.72)
	(envelope-from <stefan@weilnetz.de>)
	id 1QFT1L-0002Bc-TG; Thu, 28 Apr 2011 17:20:47 +0200
From: Stefan Weil <weil@mail.berlios.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Date: Thu, 28 Apr 2011 17:20:34 +0200
Message-Id: <1304004042-8334-10-git-send-email-weil@mail.berlios.de>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1304004042-8334-1-git-send-email-weil@mail.berlios.de>
References: <1304004042-8334-1-git-send-email-weil@mail.berlios.de>
X-Provags-ID: V02:K0:53hrL161lABz+xRCC7UbBpaCwKYkFkM5g117vYJjyTp
	QoUbBSQnqN1DC8A1cRWJcEFseN7nCQ/sHMyZ8qBIsKmMEMxc5f
	aM9+HQLJPUIVTGUk7ehWISGj8hqX9vCfrKBq9v3wcdaus5U+vm
	4lCr6LYndZV/+b6eZ/NJQT/cdHurWvFh5T4JGpAan1vpfSo1Cd
	u050tfRCoex/JzNZGEqt9qP7H3LidbctWLJx14izC4TQwnXayb jMdjgEY3hG5bJ
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 212.227.126.186
Cc: qemu-trivial@nongnu.org, Stefan Weil <weil@mail.berlios.de>
Subject: [Qemu-trivial] [PATCH 10/18] Fix typos in comments (existance ->
	existence)
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
X-List-Received-Date: Thu, 28 Apr 2011 15:21:05 -0000

Signed-off-by: Stefan Weil <weil@mail.berlios.de>
---
 libcacard/vscard_common.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/libcacard/vscard_common.h b/libcacard/vscard_common.h
index bebd52d..609ae98 100644
--- a/libcacard/vscard_common.h
+++ b/libcacard/vscard_common.h
@@ -153,7 +153,7 @@ typedef struct VSCMsgCardRemove {
 
 /*
  * VSCMsgAPDU               Client <-> Host
- * Main reason of existance. Transfer a single APDU in either direction.
+ * Main reason of existence. Transfer a single APDU in either direction.
  */
 typedef struct VSCMsgAPDU {
     uint8_t    data[0];
-- 
1.7.2.5


