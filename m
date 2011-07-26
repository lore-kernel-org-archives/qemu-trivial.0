Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Qlihf-0008Aq-EJ
	for mharc-qemu-trivial@gnu.org; Tue, 26 Jul 2011 10:33:47 -0400
Received: from eggs.gnu.org ([140.186.70.92]:58807)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>) id 1QlihY-0008AQ-Dm
	for qemu-trivial@nongnu.org; Tue, 26 Jul 2011 10:33:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>) id 1QlihW-00055m-UR
	for qemu-trivial@nongnu.org; Tue, 26 Jul 2011 10:33:40 -0400
Received: from e5.ny.us.ibm.com ([32.97.182.145]:34375)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>)
	id 1QlihW-00055Z-Rq; Tue, 26 Jul 2011 10:33:38 -0400
Received: from d01relay03.pok.ibm.com (d01relay03.pok.ibm.com [9.56.227.235])
	by e5.ny.us.ibm.com (8.14.4/8.13.1) with ESMTP id p6QE4UhS008435;
	Tue, 26 Jul 2011 10:04:30 -0400
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
	by d01relay03.pok.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	p6QEXadC110730; Tue, 26 Jul 2011 10:33:36 -0400
Received: from d01av04.pok.ibm.com (loopback [127.0.0.1])
	by d01av04.pok.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
	p6QEXZTn015323; Tue, 26 Jul 2011 10:33:35 -0400
Received: from [9.59.241.154] (d941e-10.watson.ibm.com [9.59.241.154])
	by d01av04.pok.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	p6QEXX5p015153; Tue, 26 Jul 2011 10:33:33 -0400
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
To: aliguori@us.ibm.com, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 26 Jul 2011 10:33:11 -0400
Message-ID: <1311690791.7898.6.camel@d941e-10>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 (2.32.2-1.fc14) 
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by e5.ny.us.ibm.com id
	p6QE4UhS008435
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6, seldom 2.4 (older,
	4)
X-Received-From: 32.97.182.145
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH] Fix a compilation error in xen-mapcache.c
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
X-List-Received-Date: Tue, 26 Jul 2011 14:33:45 -0000

This patch fixes a compilation error in xen-mapcache.c .

/home/stefanb/qemu/qemu-git/xen-mapcache.c: In function =E2=80=98xen_ram_=
addr_from_mapcache=E2=80=99:
/home/stefanb/qemu/qemu-git/xen-mapcache.c:240:42: error: variable =E2=80=
=98pentry=E2=80=99 set but not used [-Werror=3Dunused-but-set-variable]
cc1: all warnings being treated as errors

Signed-off-by: Stefan Berger <stefanb@linux.vnet.ibm.com>

---
 xen-mapcache.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

Index: qemu-git/xen-mapcache.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- qemu-git.orig/xen-mapcache.c
+++ qemu-git/xen-mapcache.c
@@ -237,7 +237,7 @@ uint8_t *xen_map_cache(target_phys_addr_
=20
 ram_addr_t xen_ram_addr_from_mapcache(void *ptr)
 {
-    MapCacheEntry *entry =3D NULL, *pentry =3D NULL;
+    MapCacheEntry *entry =3D NULL;
     MapCacheRev *reventry;
     target_phys_addr_t paddr_index;
     target_phys_addr_t size;
@@ -263,7 +263,6 @@ ram_addr_t xen_ram_addr_from_mapcache(vo
=20
     entry =3D &mapcache->entry[paddr_index % mapcache->nr_buckets];
     while (entry && (entry->paddr_index !=3D paddr_index || entry->size =
!=3D size)) {
-        pentry =3D entry;
         entry =3D entry->next;
     }
     if (!entry) {


