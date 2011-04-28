Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QFT1f-0001FO-Uz
	for mharc-qemu-trivial@gnu.org; Thu, 28 Apr 2011 11:21:08 -0400
Received: from eggs.gnu.org ([140.186.70.92]:48406)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1QFT1Y-00012e-IG
	for qemu-trivial@nongnu.org; Thu, 28 Apr 2011 11:21:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1QFT1U-0006gZ-CH
	for qemu-trivial@nongnu.org; Thu, 28 Apr 2011 11:21:00 -0400
Received: from moutng.kundenserver.de ([212.227.17.10]:56657)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1QFT1T-0006ec-MX; Thu, 28 Apr 2011 11:20:56 -0400
Received: from flocke.fritz.box (p5086FD13.dip.t-dialin.net [80.134.253.19])
	by mrelayeu.kundenserver.de (node=mrbap3) with ESMTP (Nemesis)
	id 0MSrBt-1QPBmn3hmn-00RmIU; Thu, 28 Apr 2011 17:20:49 +0200
Received: from stefan by flocke.fritz.box with local (Exim 4.72)
	(envelope-from <stefan@weilnetz.de>)
	id 1QFT1M-0002Bq-2O; Thu, 28 Apr 2011 17:20:48 +0200
From: Stefan Weil <weil@mail.berlios.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Date: Thu, 28 Apr 2011 17:20:39 +0200
Message-Id: <1304004042-8334-15-git-send-email-weil@mail.berlios.de>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1304004042-8334-1-git-send-email-weil@mail.berlios.de>
References: <1304004042-8334-1-git-send-email-weil@mail.berlios.de>
X-Provags-ID: V02:K0:7dtJEn+pC2cSqvvPVzF7CIhZLmhFPVO/hRkHSA5iOv1
	Tn87+KRwdEVjBnDqs8aM3m9Ybhn6xfmRtxDDJMzU+lpM9UC6OP
	EJelPrMUQIJHbfIYYdHsEpwBDPHK5u/syI8UGhy9x5xLJE9kmO
	o4qbC8Gdo65ww3tH8Je4TUeoLoCE4T7zPwkoM6pWdYU8ClwuqZ
	IDcSUzYw4g9XaSRP3jLBFGr++rJnb9mSuTQfx/1HRW0Mti5Ule 6dClijUAupscS
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 212.227.17.10
Cc: qemu-trivial@nongnu.org, Stefan Weil <weil@mail.berlios.de>
Subject: [Qemu-trivial] [PATCH 15/18] Fix typo in comment (relevent ->
	relevant)
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
X-List-Received-Date: Thu, 28 Apr 2011 15:21:01 -0000

Signed-off-by: Stefan Weil <weil@mail.berlios.de>
---
 hppa-dis.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/hppa-dis.c b/hppa-dis.c
index 49f99c8..a5760a9 100644
--- a/hppa-dis.c
+++ b/hppa-dis.c
@@ -1645,7 +1645,7 @@ static const char *const fp_reg_names[] =
 
 typedef unsigned int CORE_ADDR;
 
-/* Get at various relevent fields of an instruction word.  */
+/* Get at various relevant fields of an instruction word.  */
 
 #define MASK_5  0x1f
 #define MASK_10 0x3ff
-- 
1.7.2.5


