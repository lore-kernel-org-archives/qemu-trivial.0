Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VhcuA-0007SZ-Ta
	for mharc-qemu-trivial@gnu.org; Sat, 16 Nov 2013 05:15:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33712)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vhcu5-0007IM-Es
	for qemu-trivial@nongnu.org; Sat, 16 Nov 2013 05:15:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vhcu1-0002UC-8e
	for qemu-trivial@nongnu.org; Sat, 16 Nov 2013 05:15:01 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:33563)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Vhctt-0002TJ-22; Sat, 16 Nov 2013 05:14:49 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 4A72E41CD9;
	Sat, 16 Nov 2013 14:14:48 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 35C06211;
	Sat, 16 Nov 2013 14:14:48 +0400 (MSK)
Received: (nullmailer pid 29393 invoked by uid 1000);
	Sat, 16 Nov 2013 10:14:48 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-trivial@nongnu.org
Date: Sat, 16 Nov 2013 14:14:44 +0400
Message-Id: <1384596884-29358-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: Luigi Rizzo <rizzo@iet.unipi.it>, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] hw/i386/Makefile.obj: use $(PYTHON) to run
	.py scripts consistently
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
X-List-Received-Date: Sat, 16 Nov 2013 10:15:05 -0000

$(PYTHON) is a Make variable which is set by configure.
In all other places over the tree, .py files are run from
Makefiles using this variable, except of a single leftover
in hw/i386/Makefile.obj (and a nearby place in there uses
$(PYTHON) correctly).  Fix this leftover too.

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
Cc: Luigi Rizzo <rizzo@iet.unipi.it>
Cc: Stefan Weil <sw@weilnetz.de>

--
mjt: I want to apply this to trivial-patches for-1.7
---
 hw/i386/Makefile.objs |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/Makefile.objs b/hw/i386/Makefile.objs
index 185aacb..09ac433 100644
--- a/hw/i386/Makefile.objs
+++ b/hw/i386/Makefile.objs
@@ -20,7 +20,7 @@ hw/i386/%.hex: $(SRC_PATH)/hw/i386/%.dsl $(SRC_PATH)/scripts/acpi_extract_prepro
 	$(call quiet-command, cpp -P $< -o $*.dsl.i.orig, "  CPP $(TARGET_DIR)$*.dsl.i.orig")
 	$(call quiet-command, $(PYTHON) $(SRC_PATH)/scripts/acpi_extract_preprocess.py $*.dsl.i.orig > $*.dsl.i, "  ACPI_PREPROCESS $(TARGET_DIR)$*.dsl.i")
 	$(call quiet-command, $(IASL) $(call iasl-option,$(IASL),-Pn,) -vs -l -tc -p $* $*.dsl.i $(if $(V), , > /dev/null) 2>&1 ,"  IASL $(TARGET_DIR)$*.dsl.i")
-	$(call quiet-command, $(SRC_PATH)/scripts/acpi_extract.py $*.lst > $*.off, "  ACPI_EXTRACT $(TARGET_DIR)$*.off")
+	$(call quiet-command, $(PYTHON) $(SRC_PATH)/scripts/acpi_extract.py $*.lst > $*.off, "  ACPI_EXTRACT $(TARGET_DIR)$*.off")
 	$(call quiet-command, cat $*.off > $@, "  CAT $(TARGET_DIR)$@")
 else
 #IASL Not present. Restore pre-generated hex files.
-- 
1.7.10.4


