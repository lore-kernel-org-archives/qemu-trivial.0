Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XXZjD-0004Yy-4R
	for mharc-qemu-trivial@gnu.org; Fri, 26 Sep 2014 13:54:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38900)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XXZj7-0004SA-Ev
	for qemu-trivial@nongnu.org; Fri, 26 Sep 2014 13:54:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XXZj2-0000Pe-Hf
	for qemu-trivial@nongnu.org; Fri, 26 Sep 2014 13:54:41 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:46796)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XXZis-0000DZ-3o; Fri, 26 Sep 2014 13:54:26 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id A39ED46F3D;
	Fri, 26 Sep 2014 21:54:19 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 2403A70E;
	Fri, 26 Sep 2014 21:36:19 +0400 (MSK)
Received: (nullmailer pid 29118 invoked by uid 1000);
	Fri, 26 Sep 2014 17:36:18 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri, 26 Sep 2014 21:36:11 +0400
Message-Id: <1411752976-29051-8-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1411752976-29051-1-git-send-email-mjt@tls.msk.ru>
References: <1411752976-29051-1-git-send-email-mjt@tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Eric Blake <eblake@redhat.com>
Subject: [Qemu-trivial] [PULL 07/12] qapi: Consistent whitespace in
	tests/Makefile
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
X-List-Received-Date: Fri, 26 Sep 2014 17:54:46 -0000

From: Eric Blake <eblake@redhat.com>

tests/Makefile had a mix of TAB vs. 8-space indentation; given
that it is a Makefile, TAB is more idiomatic even though in these
particular cases the choice of whitespace didn't matter.

Signed-off-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 tests/Makefile |   32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/tests/Makefile b/tests/Makefile
index e8bdd1a..834279c 100644
--- a/tests/Makefile
+++ b/tests/Makefile
@@ -197,23 +197,23 @@ $(foreach target,$(SYSEMU_TARGET_LIST), \
 		$(eval check-qtest-$(target)-y += tests/qom-test$(EXESUF))))
 
 check-qapi-schema-y := $(addprefix tests/qapi-schema/, \
-        comments.json empty.json funny-char.json indented-expr.json \
-        missing-colon.json missing-comma-list.json \
-        missing-comma-object.json non-objects.json \
-        qapi-schema-test.json quoted-structural-chars.json \
-        trailing-comma-list.json trailing-comma-object.json \
-        unclosed-list.json unclosed-object.json unclosed-string.json \
-        duplicate-key.json union-invalid-base.json flat-union-no-base.json \
-        flat-union-invalid-discriminator.json \
-        flat-union-invalid-branch-key.json flat-union-reverse-define.json \
-        flat-union-string-discriminator.json \
-        include-simple.json include-relpath.json include-format-err.json \
-        include-non-file.json include-no-file.json include-before-err.json \
-        include-nested-err.json include-self-cycle.json include-cycle.json \
-        include-repetition.json event-nest-struct.json)
+	comments.json empty.json funny-char.json indented-expr.json \
+	missing-colon.json missing-comma-list.json \
+	missing-comma-object.json non-objects.json \
+	qapi-schema-test.json quoted-structural-chars.json \
+	trailing-comma-list.json trailing-comma-object.json \
+	unclosed-list.json unclosed-object.json unclosed-string.json \
+	duplicate-key.json union-invalid-base.json flat-union-no-base.json \
+	flat-union-invalid-discriminator.json \
+	flat-union-invalid-branch-key.json flat-union-reverse-define.json \
+	flat-union-string-discriminator.json \
+	include-simple.json include-relpath.json include-format-err.json \
+	include-non-file.json include-no-file.json include-before-err.json \
+	include-nested-err.json include-self-cycle.json include-cycle.json \
+	include-repetition.json event-nest-struct.json)
 
 GENERATED_HEADERS += tests/test-qapi-types.h tests/test-qapi-visit.h \
-                     tests/test-qmp-commands.h tests/test-qapi-event.h
+		     tests/test-qmp-commands.h tests/test-qapi-event.h
 
 test-obj-y = tests/check-qint.o tests/check-qstring.o tests/check-qdict.o \
 	tests/check-qlist.o tests/check-qfloat.o tests/check-qjson.o \
@@ -225,7 +225,7 @@ test-obj-y = tests/check-qint.o tests/check-qstring.o tests/check-qdict.o \
 	tests/test-opts-visitor.o tests/test-qmp-event.o
 
 test-qapi-obj-y = tests/test-qapi-visit.o tests/test-qapi-types.o \
-                  tests/test-qapi-event.o
+		  tests/test-qapi-event.o
 
 $(test-obj-y): QEMU_INCLUDES += -Itests
 QEMU_CFLAGS += -I$(SRC_PATH)/tests
-- 
1.7.10.4


