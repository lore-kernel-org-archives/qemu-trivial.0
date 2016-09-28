Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bpE7K-0001ig-Nw
	for mharc-qemu-trivial@gnu.org; Wed, 28 Sep 2016 08:37:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52975)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1bpE7F-0001dj-LS
	for qemu-trivial@nongnu.org; Wed, 28 Sep 2016 08:37:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1bpE7D-0006gr-KV
	for qemu-trivial@nongnu.org; Wed, 28 Sep 2016 08:37:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53838)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>)
	id 1bpE78-0006bP-1J; Wed, 28 Sep 2016 08:37:30 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AA51431B321;
	Wed, 28 Sep 2016 12:37:28 +0000 (UTC)
Received: from localhost (ovpn-116-77.phx2.redhat.com [10.3.116.77])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8SCbQZd020884; Wed, 28 Sep 2016 08:37:27 -0400
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, qemu-trivial@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Date: Wed, 28 Sep 2016 16:37:20 +0400
Message-Id: <20160928123720.21171-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Wed, 28 Sep 2016 12:37:28 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] exec: remove unused compacted argument
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
X-List-Received-Date: Wed, 28 Sep 2016 12:37:41 -0000

Since commit b35ba30f8f when it was introduced, phys_page_compact()
takes an unused compacted argument.

ubsan complains about it when launching qemu-x86_64 without arguments:
qemu/exec.c:310:5: runtime error: variable length array bound evaluates t=
o non-positive value 0

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 exec.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/exec.c b/exec.c
index c81d5ab..fc7e902 100644
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
2.10.0


