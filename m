Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZaMP2-0005jJ-Da
	for mharc-qemu-trivial@gnu.org; Fri, 11 Sep 2015 07:22:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33184)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZaMOv-0005Ux-2G
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 07:21:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZaMOu-00027H-8G
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 07:21:53 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:56921)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZaMOp-000225-Mh; Fri, 11 Sep 2015 07:21:47 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 0A4624143C;
	Fri, 11 Sep 2015 14:21:46 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 0687BA7D;
	Fri, 11 Sep 2015 14:03:54 +0300 (MSK)
Received: (nullmailer pid 22793 invoked by uid 1000);
	Fri, 11 Sep 2015 11:03:51 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri, 11 Sep 2015 14:03:44 +0300
Message-Id: <33b23b4b5e15923acaf315b01a535c15b239483b.1441969369.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1441969369.git.mjt@msgid.tls.msk.ru>
References: <cover.1441969369.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 20/26] qapi-schema: remove legacy<> from doc
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
X-List-Received-Date: Fri, 11 Sep 2015 11:21:59 -0000

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

The legacy<> type is no longer used since 7ce7ffe02.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qapi-schema.json | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/qapi-schema.json b/qapi-schema.json
index 67fef37..4060b78 100644
--- a/qapi-schema.json
+++ b/qapi-schema.json
@@ -1632,13 +1632,10 @@
 #        1) A primitive type such as 'u8', 'u16', 'bool', 'str', or 'dou=
ble'.
 #           These types are mapped to the appropriate JSON type.
 #
-#        2) A legacy type in the form 'legacy<subtype>' where subtype is=
 the
-#           legacy qdev typename.  These types are always treated as str=
ings.
-#
-#        3) A child type in the form 'child<subtype>' where subtype is a=
 qdev
+#        2) A child type in the form 'child<subtype>' where subtype is a=
 qdev
 #           device type name.  Child properties create the composition t=
ree.
 #
-#        4) A link type in the form 'link<subtype>' where subtype is a q=
dev
+#        3) A link type in the form 'link<subtype>' where subtype is a q=
dev
 #           device type name.  Link properties form the device model gra=
ph.
 #
 # Since: 1.2
@@ -1689,10 +1686,10 @@
 #
 # @property: The property name to read
 #
-# Returns: The property value.  The type depends on the property type.  =
legacy<>
-#          properties are returned as #str.  child<> and link<> properti=
es are
-#          returns as #str pathnames.  All integer property types (u8, u=
16, etc)
-#          are returned as #int.
+# Returns: The property value.  The type depends on the property
+#          type. child<> and link<> properties are returned as #str
+#          pathnames.  All integer property types (u8, u16, etc) are
+#          returned as #int.
 #
 # Since: 1.2
 ##
--=20
2.1.4


