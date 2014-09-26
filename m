Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XXXKb-00029F-SP
	for mharc-qemu-trivial@gnu.org; Fri, 26 Sep 2014 11:21:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33934)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1XXXKT-0001uX-Q4
	for qemu-trivial@nongnu.org; Fri, 26 Sep 2014 11:21:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1XXXKN-0007S7-F9
	for qemu-trivial@nongnu.org; Fri, 26 Sep 2014 11:21:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52885)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1XXXKA-0007Nj-3K; Fri, 26 Sep 2014 11:20:46 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s8QFKcds002856
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Fri, 26 Sep 2014 11:20:38 -0400
Received: from red.redhat.com (ovpn-113-28.phx2.redhat.com [10.3.113.28])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s8QFKbGc028824; Fri, 26 Sep 2014 11:20:37 -0400
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 26 Sep 2014 09:20:31 -0600
Message-Id: <1411744833-20699-2-git-send-email-eblake@redhat.com>
In-Reply-To: <1411744833-20699-1-git-send-email-eblake@redhat.com>
References: <1411744833-20699-1-git-send-email-eblake@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Luiz Capitulino <lcapitulino@redhat.com>,
	Fam Zheng <famz@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, wenchaoqemu@gmail.com
Subject: [Qemu-trivial] [PATCH v5 1/3] qapi: Consistent whitespace in
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
X-List-Received-Date: Fri, 26 Sep 2014 15:21:12 -0000

tests/Makefile had a mix of TAB vs. 8-space indentation; given
that it is a Makefile, TAB is more idiomatic even though in these
particular cases the choice of whitespace didn't matter.

Signed-off-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
---
 tests/Makefile | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/tests/Makefile b/tests/Makefile
index f5de29c..3c5bc0f 100644
--- a/tests/Makefile
+++ b/tests/Makefile
@@ -196,23 +196,23 @@ $(foreach target,$(SYSEMU_TARGET_LIST), \
     $(eval check-qtest-$(target)-y += tests/qom-test$(EXESUF)))

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
@@ -224,7 +224,7 @@ test-obj-y = tests/check-qint.o tests/check-qstring.o tests/check-qdict.o \
 	tests/test-opts-visitor.o tests/test-qmp-event.o

 test-qapi-obj-y = tests/test-qapi-visit.o tests/test-qapi-types.o \
-                  tests/test-qapi-event.o
+		  tests/test-qapi-event.o

 $(test-obj-y): QEMU_INCLUDES += -Itests
 QEMU_CFLAGS += -I$(SRC_PATH)/tests
-- 
1.9.3


