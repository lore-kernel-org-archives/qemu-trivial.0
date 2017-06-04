Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dHXpc-0006yA-OC
	for mharc-qemu-trivial@gnu.org; Sun, 04 Jun 2017 11:52:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60995)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dHXpY-0006s1-3W
	for qemu-trivial@nongnu.org; Sun, 04 Jun 2017 11:52:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dHXpX-0005AL-Dz
	for qemu-trivial@nongnu.org; Sun, 04 Jun 2017 11:52:40 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:34433)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dHXpS-0004zq-Sy; Sun, 04 Jun 2017 11:52:35 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 79593404E6;
	Sun,  4 Jun 2017 18:52:33 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 3176A5EB;
	Sun,  4 Jun 2017 18:45:29 +0300 (MSK)
Received: (nullmailer pid 16399 invoked by uid 1000);
	Sun, 04 Jun 2017 15:45:27 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sun,  4 Jun 2017 18:45:26 +0300
Message-Id: <070ccceda3b23f85d048bbcf3c0040252a9a793a.1496591095.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1496591095.git.mjt@msgid.tls.msk.ru>
References: <cover.1496591095.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1496591095.git.mjt@msgid.tls.msk.ru>
References: <cover.1496591095.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 22/22] hw/core: nmi.c can be compiled as
 common-obj nowadays
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 04 Jun 2017 15:52:41 -0000

From: Thomas Huth <thuth@redhat.com>

The target-specific code in nmi.c has been removed with this commit:

	commit f7e981f29548fe4af7812f5920304fe607e5bf0d
	nmi: remove x86 specific nmi handling

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/core/Makefile.objs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/core/Makefile.objs b/hw/core/Makefile.objs
index 91450b2eab..f8d7a4aaed 100644
--- a/hw/core/Makefile.objs
+++ b/hw/core/Makefile.objs
@@ -5,7 +5,7 @@ common-obj-y += fw-path-provider.o
 # irq.o needed for qdev GPIO handling:
 common-obj-y += irq.o
 common-obj-y += hotplug.o
-obj-y += nmi.o
+common-obj-y += nmi.o
 
 common-obj-$(CONFIG_EMPTY_SLOT) += empty_slot.o
 common-obj-$(CONFIG_XILINX_AXI) += stream.o
-- 
2.11.0


