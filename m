Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QFT1j-0001MP-Qw
	for mharc-qemu-trivial@gnu.org; Thu, 28 Apr 2011 11:21:11 -0400
Received: from eggs.gnu.org ([140.186.70.92]:48305)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1QFT1V-0000xF-8x
	for qemu-trivial@nongnu.org; Thu, 28 Apr 2011 11:21:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1QFT1U-0006gC-7c
	for qemu-trivial@nongnu.org; Thu, 28 Apr 2011 11:20:57 -0400
Received: from moutng.kundenserver.de ([212.227.17.9]:61488)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1QFT1T-0006eE-Fp; Thu, 28 Apr 2011 11:20:55 -0400
Received: from flocke.fritz.box (p5086FD13.dip.t-dialin.net [80.134.253.19])
	by mrelayeu.kundenserver.de (node=mrbap2) with ESMTP (Nemesis)
	id 0Lwnl2-1PiSZk2MmG-016nQH; Thu, 28 Apr 2011 17:20:48 +0200
Received: from stefan by flocke.fritz.box with local (Exim 4.72)
	(envelope-from <stefan@weilnetz.de>)
	id 1QFT1L-0002BT-QE; Thu, 28 Apr 2011 17:20:47 +0200
From: Stefan Weil <weil@mail.berlios.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Date: Thu, 28 Apr 2011 17:20:31 +0200
Message-Id: <1304004042-8334-7-git-send-email-weil@mail.berlios.de>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1304004042-8334-1-git-send-email-weil@mail.berlios.de>
References: <1304004042-8334-1-git-send-email-weil@mail.berlios.de>
X-Provags-ID: V02:K0:r0fCMaasKujNBx8Aeo97MP2M87pqMsgvYYL+hZJ54Of
	rjheKugKytAN20C29cSqtGFieYBXOqdSCBgXC5rHwOvDcfn2Vj
	dKw1mtb1KHRUVUPSCHS7WDer9aNZZKqB/C2SX5Kt1JH+o+z9kP
	fELQL4iUNmXgyPpgIW/uHVUMNf+UUVyAVooHSDHTqI1Mg9UCdO
	3r/zV2Yo0jsud7G9eM15UMP7lZww6zfkNOVd008Td8r0aliK+W tIjElF0BFX2lo
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 212.227.17.9
Cc: qemu-trivial@nongnu.org, Stefan Weil <weil@mail.berlios.de>
Subject: [Qemu-trivial] [PATCH 07/18] Fix typo in comment (consistant ->
	consistent)
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
X-List-Received-Date: Thu, 28 Apr 2011 15:21:04 -0000

Signed-off-by: Stefan Weil <weil@mail.berlios.de>
---
 libcacard/vcard_emul_nss.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/libcacard/vcard_emul_nss.c b/libcacard/vcard_emul_nss.c
index baada52..f3db657 100644
--- a/libcacard/vcard_emul_nss.c
+++ b/libcacard/vcard_emul_nss.c
@@ -971,7 +971,7 @@ find_blank(const char *str)
 
 /*
  *  We really want to use some existing argument parsing library here. That
- *  would give us a consistant look */
+ *  would give us a consistent look */
 static VCardEmulOptions options;
 #define READER_STEP 4
 
-- 
1.7.2.5


