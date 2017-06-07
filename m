Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dIgMZ-0001wt-Fc
	for mharc-qemu-trivial@gnu.org; Wed, 07 Jun 2017 15:11:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45951)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dIgMX-0001vC-0Q
	for qemu-trivial@nongnu.org; Wed, 07 Jun 2017 15:11:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dIgMW-0004Tp-09
	for qemu-trivial@nongnu.org; Wed, 07 Jun 2017 15:11:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45928)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1dIgMR-0004S5-PF; Wed, 07 Jun 2017 15:11:19 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id ADD731766A9;
	Wed,  7 Jun 2017 19:11:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com ADD731766A9
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=thuth@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com ADD731766A9
Received: from thh440s.redhat.com (ovpn-116-81.ams2.redhat.com [10.36.116.81])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 147085C54F;
	Wed,  7 Jun 2017 19:11:14 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Fam Zheng <famz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Date: Wed,  7 Jun 2017 21:11:14 +0200
Message-Id: <1496862674-23626-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 07 Jun 2017 19:11:18 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] Makefile: Do not generate files if
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
X-List-Received-Date: Wed, 07 Jun 2017 19:11:26 -0000

When doing a "make -j10" in the vanilla QEMU source tree (without
running "configure first), the Makefile currently generates two
files already, qemu-version.h and qemu-options.def. This should not
happen, so let's make these targets depend on config-host.mak.
Also the python files can not be executed without $(PYTHON), so
these scripts should depend on config-host.mak, too.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 Makefile | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index c830d7a..6786dc2 100644
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
 
@@ -393,6 +394,8 @@ gen-out-type = $(subst .,-,$(suffix $@))
 
 qapi-py = $(SRC_PATH)/scripts/qapi.py $(SRC_PATH)/scripts/ordereddict.py
 
+$(qapi-py): config-host.mak
+
 qga/qapi-generated/qga-qapi-types.c qga/qapi-generated/qga-qapi-types.h :\
 $(SRC_PATH)/qga/qapi-schema.json $(SRC_PATH)/scripts/qapi-types.py $(qapi-py)
 	$(call quiet-command,$(PYTHON) $(SRC_PATH)/scripts/qapi-types.py \
-- 
1.8.3.1


