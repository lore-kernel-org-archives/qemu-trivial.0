Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WIoGY-0006X2-QM
	for mharc-qemu-trivial@gnu.org; Wed, 26 Feb 2014 18:51:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53886)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WIoGV-0006Ss-LO
	for qemu-trivial@nongnu.org; Wed, 26 Feb 2014 18:51:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WIoGU-0006Ce-MY
	for qemu-trivial@nongnu.org; Wed, 26 Feb 2014 18:51:51 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:46291)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WIoGS-0006CO-LC; Wed, 26 Feb 2014 18:51:48 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WIoGQ-0006To-QV; Wed, 26 Feb 2014 23:51:46 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 26 Feb 2014 23:51:46 +0000
Message-Id: <1393458706-24883-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <andreas.faerber@web.de>,
	patches@linaro.org
Subject: [Qemu-trivial] [PATCH] qjson.h: Remove spurious GCC_FMT_ATTR markup
	from qobject_from_json() declaration
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
X-List-Received-Date: Wed, 26 Feb 2014 23:51:52 -0000

The function qobject_from_json() doesn't actually allow its
argument to be a format string -- it passes a NULL va_list*
to qobject_from_jsonv(), and the parser code will then never
actually intepret %-escape sequences (it tests whether the
va_list pointer is NULL and will stop with a parse error).

The spurious attribute markup causes clang warnings in some
of the test cases where we programmatically construct JSON
to feed to qobject_from_json():

 tests/test-qmp-input-visitor.c:76:35: warning: format string is not a
 string literal (potentially insecure) [-Wformat-security]
    data->obj = qobject_from_json(json_string);
                                  ^~~~~~~~~~~

Remove the incorrect attribute.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qapi/qmp/qjson.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/qapi/qmp/qjson.h b/include/qapi/qmp/qjson.h
index 73351ed..ee4d31a 100644
--- a/include/qapi/qmp/qjson.h
+++ b/include/qapi/qmp/qjson.h
@@ -19,7 +19,7 @@
 #include "qapi/qmp/qobject.h"
 #include "qapi/qmp/qstring.h"
 
-QObject *qobject_from_json(const char *string) GCC_FMT_ATTR(1, 0);
+QObject *qobject_from_json(const char *string);
 QObject *qobject_from_jsonf(const char *string, ...) GCC_FMT_ATTR(1, 2);
 QObject *qobject_from_jsonv(const char *string, va_list *ap) GCC_FMT_ATTR(1, 0);
 
-- 
1.8.5.4


