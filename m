Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S9mnA-0003rA-5u
	for mharc-qemu-trivial@gnu.org; Mon, 19 Mar 2012 20:19:12 -0400
Received: from eggs.gnu.org ([208.118.235.92]:55480)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <flukshun@gmail.com>) id 1S9mmp-0002pJ-LF
	for qemu-trivial@nongnu.org; Mon, 19 Mar 2012 20:19:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <flukshun@gmail.com>) id 1S9mmf-00060D-Ke
	for qemu-trivial@nongnu.org; Mon, 19 Mar 2012 20:18:51 -0400
Received: from mail-gx0-f173.google.com ([209.85.161.173]:50395)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <flukshun@gmail.com>)
	id 1S9mmb-0005yC-5m; Mon, 19 Mar 2012 20:18:37 -0400
Received: by ggnj2 with SMTP id j2so6912243ggn.4
	for <multiple recipients>; Mon, 19 Mar 2012 17:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=zc8ap9nn7qwqS6K1mA3NFdysJAWUSpiBP33Jc4m+06g=;
	b=TVqhJre2JK5wS9gerTdyx4ABc/xPoNURx6rlXQUbi/gzuoMt59FbEH8jJuEFeZurEM
	aqoHa81j5orYPdTDRoPiMi20k4Npp6UUZEjrixFh2bXX2Kszlv88nmP5vf1g5GTzJQRY
	oP2qIOHJRX+X29ETljXH7pXS5OWNvNBoHGjdHw/wytJxgi7NII1xl8KG9xEXEhUepZNi
	lC3q1a8lAV4kE81LiEGH4hS41HNHS7gSqatu7pOPbeTMvAmb8HGILxaH3SXVtlPH4vbv
	sSj6WEq7ymnyqgCu7H0/XHmaqo0fYY8vBWkV/mOG5UUZIvtk3jhE2S2bqstwPS6dqnMa
	Pumg==
Received: by 10.60.1.230 with SMTP id 6mr15820405oep.42.1332202714851;
	Mon, 19 Mar 2012 17:18:34 -0700 (PDT)
Received: from localhost.localdomain ([32.97.110.59])
	by mx.google.com with ESMTPS id g4sm11295540oeg.5.2012.03.19.17.18.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 19 Mar 2012 17:18:34 -0700 (PDT)
Sender: fluxion <flukshun@gmail.com>
From: Michael Roth <mdroth@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Date: Mon, 19 Mar 2012 19:18:24 -0500
Message-Id: <1332202706-25061-1-git-send-email-mdroth@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.4.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.161.173
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com
Subject: [Qemu-trivial] [PATCH 1/3] test: remove qemu-ga reference
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
X-List-Received-Date: Tue, 20 Mar 2012 00:19:11 -0000

This was added by mistake a while back.

Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
---
 tests/Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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


