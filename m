Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SdFn2-0005i0-SQ
	for mharc-qemu-trivial@gnu.org; Sat, 09 Jun 2012 03:08:52 -0400
Received: from eggs.gnu.org ([208.118.235.92]:35654)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1SdFmy-0005V1-FW
	for qemu-trivial@nongnu.org; Sat, 09 Jun 2012 03:08:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1SdFmw-0005xP-Fh
	for qemu-trivial@nongnu.org; Sat, 09 Jun 2012 03:08:48 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:46176)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1SdFms-0005wF-QE; Sat, 09 Jun 2012 03:08:43 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	85C567280026; Sat,  9 Jun 2012 09:08:41 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id cZJreLx726CL; Sat,  9 Jun 2012 09:08:40 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id E5B9B7280027; Sat,  9 Jun 2012 09:08:40 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial <qemu-trivial@nongnu.org>
Date: Sat,  9 Jun 2012 09:08:39 +0200
Message-Id: <1339225719-5434-2-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1339225719-5434-1-git-send-email-sw@weilnetz.de>
References: <1339225719-5434-1-git-send-email-sw@weilnetz.de>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.47.199.172
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH 2/2] Makefile: Remove macro qapi-dir
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
X-List-Received-Date: Sat, 09 Jun 2012 07:08:50 -0000

As qapi-dir was now a constant, it can be replaced by its value.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 Makefile |   21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/Makefile b/Makefile
index 8880a3e..10874b8 100644
--- a/Makefile
+++ b/Makefile
@@ -171,9 +171,8 @@ fsdev/virtfs-proxy-helper$(EXESUF): LIBS += -lcap
 qemu-img-cmds.h: $(SRC_PATH)/qemu-img-cmds.hx
 	$(call quiet-command,sh $(SRC_PATH)/scripts/hxtool -h < $< > $@,"  GEN   $@")
 
-qapi-dir := qapi-generated
 qemu-ga$(EXESUF): LIBS = $(LIBS_QGA)
-qemu-ga$(EXESUF): QEMU_CFLAGS += -I $(qapi-dir)
+qemu-ga$(EXESUF): QEMU_CFLAGS += -I qapi-generated
 
 gen-out-type = $(subst .,-,$(suffix $@))
 
@@ -181,15 +180,15 @@ ifneq ($(wildcard config-host.mak),)
 include $(SRC_PATH)/tests/Makefile
 endif
 
-$(qapi-dir)/qga-qapi-types.c $(qapi-dir)/qga-qapi-types.h :\
+qapi-generated/qga-qapi-types.c qapi-generated/qga-qapi-types.h :\
 $(SRC_PATH)/qapi-schema-guest.json $(SRC_PATH)/scripts/qapi-types.py
-	$(call quiet-command,$(PYTHON) $(SRC_PATH)/scripts/qapi-types.py $(gen-out-type) -o "$(qapi-dir)" -p "qga-" < $<, "  GEN   $@")
-$(qapi-dir)/qga-qapi-visit.c $(qapi-dir)/qga-qapi-visit.h :\
+	$(call quiet-command,$(PYTHON) $(SRC_PATH)/scripts/qapi-types.py $(gen-out-type) -o qapi-generated -p "qga-" < $<, "  GEN   $@")
+qapi-generated/qga-qapi-visit.c qapi-generated/qga-qapi-visit.h :\
 $(SRC_PATH)/qapi-schema-guest.json $(SRC_PATH)/scripts/qapi-visit.py
-	$(call quiet-command,$(PYTHON) $(SRC_PATH)/scripts/qapi-visit.py $(gen-out-type) -o "$(qapi-dir)" -p "qga-" < $<, "  GEN   $@")
-$(qapi-dir)/qga-qmp-commands.h $(qapi-dir)/qga-qmp-marshal.c :\
+	$(call quiet-command,$(PYTHON) $(SRC_PATH)/scripts/qapi-visit.py $(gen-out-type) -o qapi-generated -p "qga-" < $<, "  GEN   $@")
+qapi-generated/qga-qmp-commands.h qapi-generated/qga-qmp-marshal.c :\
 $(SRC_PATH)/qapi-schema-guest.json $(SRC_PATH)/scripts/qapi-commands.py
-	$(call quiet-command,$(PYTHON) $(SRC_PATH)/scripts/qapi-commands.py $(gen-out-type) -o "$(qapi-dir)" -p "qga-" < $<, "  GEN   $@")
+	$(call quiet-command,$(PYTHON) $(SRC_PATH)/scripts/qapi-commands.py $(gen-out-type) -o qapi-generated -p "qga-" < $<, "  GEN   $@")
 
 qapi-types.c qapi-types.h :\
 $(SRC_PATH)/qapi-schema.json $(SRC_PATH)/scripts/qapi-types.py
@@ -201,8 +200,8 @@ qmp-commands.h qmp-marshal.c :\
 $(SRC_PATH)/qapi-schema.json $(SRC_PATH)/scripts/qapi-commands.py
 	$(call quiet-command,$(PYTHON) $(SRC_PATH)/scripts/qapi-commands.py $(gen-out-type) -m -o "." < $<, "  GEN   $@")
 
-QGALIB_OBJ=$(addprefix $(qapi-dir)/, qga-qapi-types.o qga-qapi-visit.o qga-qmp-marshal.o)
-QGALIB_GEN=$(addprefix $(qapi-dir)/, qga-qapi-types.h qga-qapi-visit.h qga-qmp-commands.h)
+QGALIB_OBJ=$(addprefix qapi-generated/, qga-qapi-types.o qga-qapi-visit.o qga-qmp-marshal.o)
+QGALIB_GEN=$(addprefix qapi-generated/, qga-qapi-types.h qga-qapi-visit.h qga-qmp-commands.h)
 $(QGALIB_OBJ): $(QGALIB_GEN)
 $(qga-obj-y) qemu-ga.o: $(QGALIB_GEN)
 
@@ -226,7 +225,7 @@ clean:
 	rm -f trace-dtrace.h trace-dtrace.h-timestamp
 	rm -f $(foreach f,$(GENERATED_HEADERS),$(f) $(f)-timestamp)
 	rm -f $(foreach f,$(GENERATED_SOURCES),$(f) $(f)-timestamp)
-	rm -rf $(qapi-dir)
+	rm -rf qapi-generated
 	$(MAKE) -C tests/tcg clean
 	for d in $(ALL_SUBDIRS) $(QEMULIBS) libcacard; do \
 	if test -d $$d; then $(MAKE) -C $$d $@ || exit 1; fi; \
-- 
1.7.10


