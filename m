Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QFT1g-0001Gd-D7
	for mharc-qemu-trivial@gnu.org; Thu, 28 Apr 2011 11:21:08 -0400
Received: from eggs.gnu.org ([140.186.70.92]:48354)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1QFT1W-0000zC-GX
	for qemu-trivial@nongnu.org; Thu, 28 Apr 2011 11:21:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1QFT1U-0006hL-T8
	for qemu-trivial@nongnu.org; Thu, 28 Apr 2011 11:20:58 -0400
Received: from moutng.kundenserver.de ([212.227.126.187]:61666)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1QFT1U-0006ei-7R; Thu, 28 Apr 2011 11:20:56 -0400
Received: from flocke.fritz.box (p5086FD13.dip.t-dialin.net [80.134.253.19])
	by mrelayeu.kundenserver.de (node=mrbap1) with ESMTP (Nemesis)
	id 0M1zHn-1Pvsq33k0h-00tLgJ; Thu, 28 Apr 2011 17:20:49 +0200
Received: from stefan by flocke.fritz.box with local (Exim 4.72)
	(envelope-from <stefan@weilnetz.de>)
	id 1QFT1M-0002Bt-3P; Thu, 28 Apr 2011 17:20:48 +0200
From: Stefan Weil <weil@mail.berlios.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Date: Thu, 28 Apr 2011 17:20:40 +0200
Message-Id: <1304004042-8334-16-git-send-email-weil@mail.berlios.de>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1304004042-8334-1-git-send-email-weil@mail.berlios.de>
References: <1304004042-8334-1-git-send-email-weil@mail.berlios.de>
X-Provags-ID: V02:K0:7LSmQafE7R9dgZJCO7aguhOo5hbhqbflEw5SYb2MVKu
	QjIgklrJVuq9sVlj47XQ1q7T95fFPvpPtV0yGluwdWwz4C1PaC
	RHbHy61GNaJePOc7aA53uVxajfaOC7QkOFIeVTyfjW3TRFCDwg
	rp+YClU8AkVueclSnY23l9eNSIXIXu8HSVihHY7udr65ZhJeLS
	BoLJVaj9aQq0EzPJhfYjJ5AOaDTzqeYvmqjLTxhEfRYvdV0bA8 WUCebhZ6QkN5b
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 212.227.126.187
Cc: qemu-trivial@nongnu.org, Stefan Weil <weil@mail.berlios.de>
Subject: [Qemu-trivial] [PATCH 16/18] Fix typo in comment (responsiblity ->
	responsibility)
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
X-List-Received-Date: Thu, 28 Apr 2011 15:21:02 -0000

Signed-off-by: Stefan Weil <weil@mail.berlios.de>
---
 hw/pcie_aer.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/hw/pcie_aer.c b/hw/pcie_aer.c
index 0c4e8a5..f08d3c7 100644
--- a/hw/pcie_aer.c
+++ b/hw/pcie_aer.c
@@ -612,7 +612,7 @@ static bool pcie_aer_inject_uncor_error(PCIEAERInject *inj, bool is_fatal)
 /*
  * non-Function specific error must be recorded in all functions.
  * It is the responsibility of the caller of this function.
- * It is also caller's responsiblity to determine which function should
+ * It is also caller's responsibility to determine which function should
  * report the rerror.
  *
  * 6.2.4 Error Logging
-- 
1.7.2.5


