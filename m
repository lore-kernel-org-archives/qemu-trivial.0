Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cVxaB-00066O-MY
	for mharc-qemu-trivial@gnu.org; Tue, 24 Jan 2017 04:40:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40938)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cVxa7-00062L-9S
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2017 04:40:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cVxa3-0000u7-Mh
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2017 04:40:03 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:38889)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1cVxZm-0000hD-Va; Tue, 24 Jan 2017 04:39:43 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 4CD3942103;
	Tue, 24 Jan 2017 12:39:42 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 935D355E;
	Tue, 24 Jan 2017 12:39:41 +0300 (MSK)
Received: (nullmailer pid 12626 invoked by uid 1000);
	Tue, 24 Jan 2017 09:39:41 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Date: Tue, 24 Jan 2017 12:39:13 +0300
Message-Id: <2c8c477ec1fe80e2b060c396d4126c81822af893.1485250702.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
References: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
References: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 09/31] object.h: spelling fix
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
X-List-Received-Date: Tue, 24 Jan 2017 09:40:04 -0000

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 include/qom/object.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/qom/object.h b/include/qom/object.h
index 5ecc2d1..c5e6fc1 100644
--- a/include/qom/object.h
+++ b/include/qom/object.h
@@ -432,7 +432,7 @@ struct Object
  * @class_base_init: This function is called for all base classes after =
all
  *   parent class initialization has occurred, but before the class itse=
lf
  *   is initialized.  This is the function to use to undo the effects of
- *   memcpy from the parent class to the descendents.
+ *   memcpy from the parent class to the descendants.
  * @class_finalize: This function is called during class destruction and=
 is
  *   meant to release and dynamic parameters allocated by @class_init.
  * @class_data: Data to pass to the @class_init, @class_base_init and
--=20
2.1.4


