Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WKiwH-0004QS-8q
	for mharc-qemu-trivial@gnu.org; Tue, 04 Mar 2014 01:34:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35117)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WKiwA-0004GO-3d
	for qemu-trivial@nongnu.org; Tue, 04 Mar 2014 01:34:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WKiw5-0007hX-Ug
	for qemu-trivial@nongnu.org; Tue, 04 Mar 2014 01:34:46 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:43579)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WKivv-0007dT-Qp; Tue, 04 Mar 2014 01:34:31 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id BFE4040852;
	Tue,  4 Mar 2014 10:34:30 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id E682C668;
	Tue,  4 Mar 2014 10:16:04 +0400 (MSK)
Received: (nullmailer pid 16586 invoked by uid 1000);
	Tue, 04 Mar 2014 06:16:03 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue,  4 Mar 2014 10:15:56 +0400
Message-Id: <1393913761-16516-9-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1393913761-16516-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1393913761-16516-1-git-send-email-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 08/13] qjson.h: Remove spurious GCC_FMT_ATTR
	markup from qobject_from_json() declaration
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
X-List-Received-Date: Tue, 04 Mar 2014 06:34:50 -0000

From: Peter Maydell <peter.maydell@linaro.org>

The function qobject_from_json() doesn't actually allow its
argument to be a format string -- it passes a NULL va_list*
to qobject_from_jsonv(), and the parser code will then never
actually interpret %-escape sequences (it tests whether the
va_list pointer is NULL and will stop with a parse error).

The spurious attribute markup causes clang warnings in some
of the test cases where we programmatically construct JSON
to feed to qobject_from_json():

 tests/test-qmp-input-visitor.c:76:35: warning: format string is not a
 string literal (potentially insecure) [-Wformat-security]
    data->obj =3D qobject_from_json(json_string);
                                  ^~~~~~~~~~~

Remove the incorrect attribute.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Andreas F=C3=A4rber <afaerber@suse.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 include/qapi/qmp/qjson.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/qapi/qmp/qjson.h b/include/qapi/qmp/qjson.h
index 73351ed..ee4d31a 100644
--- a/include/qapi/qmp/qjson.h
+++ b/include/qapi/qmp/qjson.h
@@ -19,7 +19,7 @@
 #include "qapi/qmp/qobject.h"
 #include "qapi/qmp/qstring.h"
=20
-QObject *qobject_from_json(const char *string) GCC_FMT_ATTR(1, 0);
+QObject *qobject_from_json(const char *string);
 QObject *qobject_from_jsonf(const char *string, ...) GCC_FMT_ATTR(1, 2);
 QObject *qobject_from_jsonv(const char *string, va_list *ap) GCC_FMT_ATT=
R(1, 0);
=20
--=20
1.7.10.4


