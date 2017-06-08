Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dIs3K-00038z-V2
	for mharc-qemu-trivial@gnu.org; Thu, 08 Jun 2017 03:40:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37851)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dIs3H-00036t-BM
	for qemu-trivial@nongnu.org; Thu, 08 Jun 2017 03:40:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dIs3G-0003Xx-6z
	for qemu-trivial@nongnu.org; Thu, 08 Jun 2017 03:40:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47694)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1dIs3A-0003Vt-GQ; Thu, 08 Jun 2017 03:40:12 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4414F80C18;
	Thu,  8 Jun 2017 07:40:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 4414F80C18
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=thuth@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 4414F80C18
Received: from thh440s.redhat.com (ovpn-116-59.ams2.redhat.com [10.36.116.59])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 952AD8948B;
	Thu,  8 Jun 2017 07:40:05 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Fam Zheng <famz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Eric Blake <eblake@redhat.com>
Date: Thu,  8 Jun 2017 09:40:04 +0200
Message-Id: <1496907604-2393-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 08 Jun 2017 07:40:11 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH v2] Makefile: Do not generate files if
 "configure" has not been run yet
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
X-List-Received-Date: Thu, 08 Jun 2017 07:40:20 -0000

When doing a "make -j10" in the vanilla QEMU source tree (without
running "configure first), the Makefile currently generates two
files already, qemu-version.h and qemu-options.def. This should not
happen, so let's make these targets depend on config-host.mak.
Also the targets that use python  can not be executed without the
$(PYTHON) from config-host.mak, so these should depend on the config-
host.mak file, too (these targets generate some ugly error messages
otherwise during "make -j10").

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 v2:
 - Add the dependency to the targets that use $(PYTHON) instead of
   adding it to $(qapi-py)

 Makefile | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/Makefile b/Makefile
index c830d7a..b5e0731 100644
--- a/Makefile
+++ b/Makefile
@@ -286,7 +286,7 @@ endif
 
 all: $(DOCS) $(TOOLS) $(HELPERS-y) recurse-all modules
 
-qemu-version.h: FORCE
+qemu-version.h: config-host.mak FORCE
 	$(call quiet-command, \
 		(cd $(SRC_PATH); \
 		printf '#define QEMU_PKGVERSION '; \
@@ -312,6 +312,7 @@ qemu-version.h: FORCE
 
 config-host.h: config-host.h-timestamp
 config-host.h-timestamp: config-host.mak
+qemu-options.def: config-host.mak
 qemu-options.def: $(SRC_PATH)/qemu-options.hx $(SRC_PATH)/scripts/hxtool
 	$(call quiet-command,sh $(SRC_PATH)/scripts/hxtool -h < $< > $@,"GEN","$@")
 
@@ -394,17 +395,17 @@ gen-out-type = $(subst .,-,$(suffix $@))
 qapi-py = $(SRC_PATH)/scripts/qapi.py $(SRC_PATH)/scripts/ordereddict.py
 
 qga/qapi-generated/qga-qapi-types.c qga/qapi-generated/qga-qapi-types.h :\
-$(SRC_PATH)/qga/qapi-schema.json $(SRC_PATH)/scripts/qapi-types.py $(qapi-py)
+$(SRC_PATH)/qga/qapi-schema.json $(SRC_PATH)/scripts/qapi-types.py $(qapi-py) config-host.mak
 	$(call quiet-command,$(PYTHON) $(SRC_PATH)/scripts/qapi-types.py \
 		$(gen-out-type) -o qga/qapi-generated -p "qga-" $<, \
 		"GEN","$@")
 qga/qapi-generated/qga-qapi-visit.c qga/qapi-generated/qga-qapi-visit.h :\
-$(SRC_PATH)/qga/qapi-schema.json $(SRC_PATH)/scripts/qapi-visit.py $(qapi-py)
+$(SRC_PATH)/qga/qapi-schema.json $(SRC_PATH)/scripts/qapi-visit.py $(qapi-py) config-host.mak
 	$(call quiet-command,$(PYTHON) $(SRC_PATH)/scripts/qapi-visit.py \
 		$(gen-out-type) -o qga/qapi-generated -p "qga-" $<, \
 		"GEN","$@")
 qga/qapi-generated/qga-qmp-commands.h qga/qapi-generated/qga-qmp-marshal.c :\
-$(SRC_PATH)/qga/qapi-schema.json $(SRC_PATH)/scripts/qapi-commands.py $(qapi-py)
+$(SRC_PATH)/qga/qapi-schema.json $(SRC_PATH)/scripts/qapi-commands.py $(qapi-py) config-host.mak
 	$(call quiet-command,$(PYTHON) $(SRC_PATH)/scripts/qapi-commands.py \
 		$(gen-out-type) -o qga/qapi-generated -p "qga-" $<, \
 		"GEN","$@")
@@ -416,27 +417,27 @@ qapi-modules = $(SRC_PATH)/qapi-schema.json $(SRC_PATH)/qapi/common.json \
                $(SRC_PATH)/qapi/trace.json
 
 qapi-types.c qapi-types.h :\
-$(qapi-modules) $(SRC_PATH)/scripts/qapi-types.py $(qapi-py)
+$(qapi-modules) $(SRC_PATH)/scripts/qapi-types.py $(qapi-py) config-host.mak
 	$(call quiet-command,$(PYTHON) $(SRC_PATH)/scripts/qapi-types.py \
 		$(gen-out-type) -o "." -b $<, \
 		"GEN","$@")
 qapi-visit.c qapi-visit.h :\
-$(qapi-modules) $(SRC_PATH)/scripts/qapi-visit.py $(qapi-py)
+$(qapi-modules) $(SRC_PATH)/scripts/qapi-visit.py $(qapi-py) config-host.mak
 	$(call quiet-command,$(PYTHON) $(SRC_PATH)/scripts/qapi-visit.py \
 		$(gen-out-type) -o "." -b $<, \
 		"GEN","$@")
 qapi-event.c qapi-event.h :\
-$(qapi-modules) $(SRC_PATH)/scripts/qapi-event.py $(qapi-py)
+$(qapi-modules) $(SRC_PATH)/scripts/qapi-event.py $(qapi-py) config-host.mak
 	$(call quiet-command,$(PYTHON) $(SRC_PATH)/scripts/qapi-event.py \
 		$(gen-out-type) -o "." $<, \
 		"GEN","$@")
 qmp-commands.h qmp-marshal.c :\
-$(qapi-modules) $(SRC_PATH)/scripts/qapi-commands.py $(qapi-py)
+$(qapi-modules) $(SRC_PATH)/scripts/qapi-commands.py $(qapi-py) config-host.mak
 	$(call quiet-command,$(PYTHON) $(SRC_PATH)/scripts/qapi-commands.py \
 		$(gen-out-type) -o "." $<, \
 		"GEN","$@")
 qmp-introspect.h qmp-introspect.c :\
-$(qapi-modules) $(SRC_PATH)/scripts/qapi-introspect.py $(qapi-py)
+$(qapi-modules) $(SRC_PATH)/scripts/qapi-introspect.py $(qapi-py) config-host.mak
 	$(call quiet-command,$(PYTHON) $(SRC_PATH)/scripts/qapi-introspect.py \
 		$(gen-out-type) -o "." $<, \
 		"GEN","$@")
@@ -703,10 +704,10 @@ qemu-img-cmds.texi: $(SRC_PATH)/qemu-img-cmds.hx $(SRC_PATH)/scripts/hxtool
 
 docs/qemu-qmp-qapi.texi docs/qemu-ga-qapi.texi: $(SRC_PATH)/scripts/qapi2texi.py $(qapi-py)
 
-docs/qemu-qmp-qapi.texi: $(qapi-modules)
+docs/qemu-qmp-qapi.texi: $(qapi-modules) config-host.mak
 	$(call quiet-command,$(PYTHON) $(SRC_PATH)/scripts/qapi2texi.py $< > $@,"GEN","$@")
 
-docs/qemu-ga-qapi.texi: $(SRC_PATH)/qga/qapi-schema.json
+docs/qemu-ga-qapi.texi: $(SRC_PATH)/qga/qapi-schema.json config-host.mak
 	$(call quiet-command,$(PYTHON) $(SRC_PATH)/scripts/qapi2texi.py $< > $@,"GEN","$@")
 
 qemu.1: qemu-doc.texi qemu-options.texi qemu-monitor.texi qemu-monitor-info.texi
-- 
1.8.3.1


