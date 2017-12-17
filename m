Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eQkxS-0005e6-G5
	for mharc-qemu-trivial@gnu.org; Sun, 17 Dec 2017 21:15:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54178)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1eQkxN-0005WT-LO
	for qemu-trivial@nongnu.org; Sun, 17 Dec 2017 21:15:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1eQkxM-0007ji-Qc
	for qemu-trivial@nongnu.org; Sun, 17 Dec 2017 21:15:05 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:55073)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1eQkxH-0007bu-1O; Sun, 17 Dec 2017 21:14:59 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id E112F411AA;
	Mon, 18 Dec 2017 05:14:55 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id CB6C9CE1;
	Mon, 18 Dec 2017 00:25:46 +0300 (MSK)
Received: (nullmailer pid 30901 invoked by uid 1000);
	Sun, 17 Dec 2017 21:28:08 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Date: Mon, 18 Dec 2017 00:27:14 +0300
Message-Id: <e85e01a94c852cd0b160a88625447f7cabcffc86.1513545944.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
References: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
References: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 09/61] memory: remove unused
 memory_region_set_global_locking()
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
X-List-Received-Date: Mon, 18 Dec 2017 02:15:06 -0000

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

This was never used since its introduction in commit
196ea13104f8 ("memory: Add global-locking property to memory
regions").

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 include/exec/memory.h | 12 ------------
 memory.c              |  5 -----
 2 files changed, 17 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 5ed4042f87..a4cabdf44c 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -1241,18 +1241,6 @@ void memory_region_set_flush_coalesced(MemoryRegio=
n *mr);
 void memory_region_clear_flush_coalesced(MemoryRegion *mr);
=20
 /**
- * memory_region_set_global_locking: Declares the access processing requ=
ires
- *                                   QEMU's global lock.
- *
- * When this is invoked, accesses to the memory region will be processed=
 while
- * holding the global lock of QEMU. This is the default behavior of memo=
ry
- * regions.
- *
- * @mr: the memory region to be updated.
- */
-void memory_region_set_global_locking(MemoryRegion *mr);
-
-/**
  * memory_region_clear_global_locking: Declares that access processing d=
oes
  *                                     not depend on the QEMU global loc=
k.
  *
diff --git a/memory.c b/memory.c
index e26e5a3b1d..4b41fb837b 100644
--- a/memory.c
+++ b/memory.c
@@ -2189,11 +2189,6 @@ void memory_region_clear_flush_coalesced(MemoryReg=
ion *mr)
     }
 }
=20
-void memory_region_set_global_locking(MemoryRegion *mr)
-{
-    mr->global_locking =3D true;
-}
-
 void memory_region_clear_global_locking(MemoryRegion *mr)
 {
     mr->global_locking =3D false;
--=20
2.11.0


