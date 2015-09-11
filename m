Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZaM7f-0004hh-Pe
	for mharc-qemu-trivial@gnu.org; Fri, 11 Sep 2015 07:04:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57720)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZaM7c-0004cC-2B
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 07:04:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZaM7b-0006sB-9r
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 07:04:00 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:60711)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZaM7W-0006oq-20; Fri, 11 Sep 2015 07:03:54 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 29BE84143A;
	Fri, 11 Sep 2015 14:03:52 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id BF87FA58;
	Fri, 11 Sep 2015 14:03:51 +0300 (MSK)
Received: (nullmailer pid 22778 invoked by uid 1000);
	Fri, 11 Sep 2015 11:03:51 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri, 11 Sep 2015 14:03:37 +0300
Message-Id: <71e0e067b2bef8823c389c3705a8bcbb2bb12429.1441969369.git.mjt@msgid.tls.msk.ru>
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
Subject: [Qemu-trivial] [PULL 13/26] docs: fix a qga/qapi-schema.json comment
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
X-List-Received-Date: Fri, 11 Sep 2015 11:04:01 -0000

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

For consistency with the rest of the comment blocks.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qga/qapi-schema.json | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json
index 6b0bd16..82894c6 100644
--- a/qga/qapi-schema.json
+++ b/qga/qapi-schema.json
@@ -12,6 +12,7 @@
 ##
=20
 ##
+# @guest-sync-delimited:
 #
 # Echo back a unique integer value, and prepend to response a
 # leading sentinel byte (0xFF) the client can check scan for.
@@ -41,7 +42,7 @@
 # Returns: The unique integer id passed in by the client
 #
 # Since: 1.1
-# ##
+##
 { 'command': 'guest-sync-delimited',
   'data':    { 'id': 'int' },
   'returns': 'int' }
--=20
2.1.4


