Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SANCB-0005hX-BP
	for mharc-qemu-trivial@gnu.org; Wed, 21 Mar 2012 11:11:27 -0400
Received: from eggs.gnu.org ([208.118.235.92]:44139)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <flukshun@gmail.com>) id 1SANC7-0005VH-N1
	for qemu-trivial@nongnu.org; Wed, 21 Mar 2012 11:11:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <flukshun@gmail.com>) id 1SANC1-0002Xq-Em
	for qemu-trivial@nongnu.org; Wed, 21 Mar 2012 11:11:23 -0400
Received: from mail-gx0-f173.google.com ([209.85.161.173]:35507)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <flukshun@gmail.com>)
	id 1SANBj-0002Vq-QH; Wed, 21 Mar 2012 11:10:59 -0400
Received: by ggnj2 with SMTP id j2so1189317ggn.4
	for <multiple recipients>; Wed, 21 Mar 2012 08:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=gYaiM9TOKkpybPNfRsffGFoacSOxD+n6vkDlvQRqxTE=;
	b=CwF6pS4TTyS1MT5tK5FY6eHCQaHb0gMpkouVxkgI2D9I4EFYQQUSjex9pfMJrOMuQ3
	qQOzmpTBTmQUa9ENZxUVK29eEZdkRPrS28hBcrHkIC72sw5C1Gv0/UF7VHr6IsxFzNVn
	xqg9Fscmf98jrI1SKy49jXsfJCr8XV5uYhUHoB6kBULNiWZi4jrp+G8M3Pf6R4R2RTLQ
	/KG+JFOwY9JS6TgmdSuJXBDFcXvswyPr6LkZHSETXEJ+qH89k8YNK2bHzE87RrhJjP0L
	kZMMxIImOwVYgudMYLpKH9M/gPy9uU43XK3Lmn9vGfI/cyGl7hVe1PpmKIF4qHKl/MCg
	gcdg==
Received: by 10.60.4.106 with SMTP id j10mr4927255oej.47.1332342657487;
	Wed, 21 Mar 2012 08:10:57 -0700 (PDT)
Received: from localhost.localdomain ([32.97.110.59])
	by mx.google.com with ESMTPS id b6sm1816441obe.12.2012.03.21.08.10.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Mar 2012 08:10:56 -0700 (PDT)
Sender: fluxion <flukshun@gmail.com>
From: Michael Roth <mdroth@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Date: Wed, 21 Mar 2012 10:10:46 -0500
Message-Id: <1332342646-9250-1-git-send-email-mdroth@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1332202706-25061-1-git-send-email-mdroth@linux.vnet.ibm.com>
References: <1332202706-25061-1-git-send-email-mdroth@linux.vnet.ibm.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.161.173
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH v2] test: remove qemu-ga reference
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
X-List-Received-Date: Wed, 21 Mar 2012 15:11:25 -0000

This was added by mistake a while back.

Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
---
 Makefile       |    1 +
 tests/Makefile |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index 1bc3cb0..cab7c74 100644
--- a/Makefile
+++ b/Makefile
@@ -173,6 +173,7 @@ qemu-img-cmds.h: $(SRC_PATH)/qemu-img-cmds.hx
 $(qapi-obj-y): $(GENERATED_HEADERS)
 qapi-dir := $(BUILD_DIR)/qapi-generated
 qemu-ga$(EXESUF): LIBS = $(LIBS_QGA)
+qemu-ga$(EXESUF): QEMU_CFLAGS += -I $(qapi-dir)
 
 gen-out-type = $(subst .,-,$(suffix $@))
 
diff --git a/tests/Makefile b/tests/Makefile
index c78ade1..354fdbb 100644
--- a/tests/Makefile
+++ b/tests/Makefile
@@ -17,7 +17,7 @@ test-coroutine: test-coroutine.o qemu-timer-common.o async.o $(coroutine-obj-y)
 
 test-qmp-input-visitor.o test-qmp-output-visitor.o \
 test-string-input-visitor.o test-string-output-visitor.o \
-	test-qmp-commands.o qemu-ga$(EXESUF): QEMU_CFLAGS += -I $(qapi-dir)
+	test-qmp-commands.o: QEMU_CFLAGS += -I $(qapi-dir)
 
 $(qapi-dir)/test-qapi-types.c $(qapi-dir)/test-qapi-types.h :\
 $(SRC_PATH)/qapi-schema-test.json $(SRC_PATH)/scripts/qapi-types.py
-- 
1.7.4.1


