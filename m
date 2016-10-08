Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bso42-0007BQ-UC
	for mharc-qemu-trivial@gnu.org; Sat, 08 Oct 2016 05:37:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49854)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bso40-00077f-FI
	for qemu-trivial@nongnu.org; Sat, 08 Oct 2016 05:37:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bso3y-0003Qm-EP
	for qemu-trivial@nongnu.org; Sat, 08 Oct 2016 05:37:03 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:44073)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bso3u-0003Km-PA; Sat, 08 Oct 2016 05:36:58 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 3002140EDC;
	Sat,  8 Oct 2016 12:36:49 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id E5CB6B3E;
	Sat,  8 Oct 2016 11:58:16 +0300 (MSK)
Received: (nullmailer pid 19258 invoked by uid 1000);
	Sat, 08 Oct 2016 08:58:14 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Date: Sat,  8 Oct 2016 11:58:04 +0300
Message-Id: <efee678d6df6ea2f531425e38825883008b3c1a0.1475917008.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
References: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
References: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 18/26] exec: remove unused compacted argument
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
X-List-Received-Date: Sat, 08 Oct 2016 09:37:05 -0000

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

Since commit b35ba30f8f when it was introduced, phys_page_compact()
takes an unused compacted argument.

ubsan complains about it when launching qemu-x86_64 without arguments:
qemu/exec.c:310:5: runtime error: variable length array bound evaluates t=
o non-positive value 0

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 exec.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/exec.c b/exec.c
index c8389f9..374c364 100644
--- a/exec.c
+++ b/exec.c
@@ -255,7 +255,7 @@ static void phys_page_set(AddressSpaceDispatch *d,
 /* Compact a non leaf page entry. Simply detect that the entry has a sin=
gle child,
  * and update our entry so we can skip it and go directly to the destina=
tion.
  */
-static void phys_page_compact(PhysPageEntry *lp, Node *nodes, unsigned l=
ong *compacted)
+static void phys_page_compact(PhysPageEntry *lp, Node *nodes)
 {
     unsigned valid_ptr =3D P_L2_SIZE;
     int valid =3D 0;
@@ -275,7 +275,7 @@ static void phys_page_compact(PhysPageEntry *lp, Node=
 *nodes, unsigned long *com
         valid_ptr =3D i;
         valid++;
         if (p[i].skip) {
-            phys_page_compact(&p[i], nodes, compacted);
+            phys_page_compact(&p[i], nodes);
         }
     }
=20
@@ -307,10 +307,8 @@ static void phys_page_compact(PhysPageEntry *lp, Nod=
e *nodes, unsigned long *com
=20
 static void phys_page_compact_all(AddressSpaceDispatch *d, int nodes_nb)
 {
-    DECLARE_BITMAP(compacted, nodes_nb);
-
     if (d->phys_map.skip) {
-        phys_page_compact(&d->phys_map, d->map.nodes, compacted);
+        phys_page_compact(&d->phys_map, d->map.nodes);
     }
 }
=20
--=20
2.1.4


