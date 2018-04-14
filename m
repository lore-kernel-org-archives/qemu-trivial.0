Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f7M9n-0004ZT-79
	for mharc-qemu-trivial@gnu.org; Sat, 14 Apr 2018 10:27:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54708)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1f7M9k-0004Xk-DU
	for qemu-trivial@nongnu.org; Sat, 14 Apr 2018 10:27:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1f7M9j-00030e-Kp
	for qemu-trivial@nongnu.org; Sat, 14 Apr 2018 10:27:56 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:33641)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1f7M9e-0002rb-U7; Sat, 14 Apr 2018 10:27:51 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 7E18A4129B;
	Sat, 14 Apr 2018 17:27:40 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 59795F31;
	Sat, 14 Apr 2018 17:27:40 +0300 (MSK)
Received: (nullmailer pid 23424 invoked by uid 1000);
	Sat, 14 Apr 2018 14:27:40 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org
Date: Sat, 14 Apr 2018 17:27:39 +0300
Message-Id: <20180414142739.23375-1-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PATCH trivial for-2.12] Makefile: install gtk
 message catalogs if CONFIG_GTK=y too, not only =m
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
X-List-Received-Date: Sat, 14 Apr 2018 14:27:57 -0000

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 727ef118f3..8644c2e918 100644
--- a/Makefile
+++ b/Makefile
@@ -856,7 +856,7 @@ ifneq ($(BLOBS),)
 		$(INSTALL_DATA) $(SRC_PATH)/pc-bios/$$x "$(DESTDIR)$(qemu_datadir)"; \
 	done
 endif
-ifeq ($(CONFIG_GTK),m)
+ifneq ($(filter $(CONFIG_GTK),y m),)
 	$(MAKE) -C po $@
 endif
 	$(INSTALL_DIR) "$(DESTDIR)$(qemu_datadir)/keymaps"
-- 
2.11.0


