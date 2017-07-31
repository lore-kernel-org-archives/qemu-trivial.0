Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dc7pk-0004Bs-0K
	for mharc-qemu-trivial@gnu.org; Mon, 31 Jul 2017 06:21:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50986)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dc7pg-00047Z-5t
	for qemu-trivial@nongnu.org; Mon, 31 Jul 2017 06:21:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dc7pf-0006Bl-DH
	for qemu-trivial@nongnu.org; Mon, 31 Jul 2017 06:21:52 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:32833)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dc7pb-00068X-30; Mon, 31 Jul 2017 06:21:47 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 341EF42ABF;
	Mon, 31 Jul 2017 13:21:46 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 2691BB78;
	Mon, 31 Jul 2017 13:21:44 +0300 (MSK)
Received: (nullmailer pid 5558 invoked by uid 1000);
	Mon, 31 Jul 2017 10:21:45 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Date: Mon, 31 Jul 2017 13:21:29 +0300
Message-Id: <f80ac75d0e6e6e7481d61cdb86e5a741a442f100.1501496349.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1501496349.git.mjt@msgid.tls.msk.ru>
References: <cover.1501496349.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1501496349.git.mjt@msgid.tls.msk.ru>
References: <cover.1501496349.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 10/25] qcow2: fix null pointer dereference
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
X-List-Received-Date: Mon, 31 Jul 2017 10:21:53 -0000

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

It seems this assert() was somehow misplaced.

block/qcow2-refcount.c:2193:42: warning: Array access (from variable 'on_=
disk_reftable') results in a null pointer dereference
        on_disk_reftable[refblock_index] =3D refblock_offset;
        ~~~~~~~~~~~~~~~~                 ^

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 block/qcow2-refcount.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index c9b0dcb4f3..168fc32e7b 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -2189,6 +2189,8 @@ write_refblocks:
              * this will leak that range, but we can easily fix that by =
running
              * a leak-fixing check after this rebuild operation */
             reftable_offset =3D -1;
+        } else {
+            assert(on_disk_reftable);
         }
         on_disk_reftable[refblock_index] =3D refblock_offset;
=20
@@ -2258,8 +2260,6 @@ write_refblocks:
         goto write_refblocks;
     }
=20
-    assert(on_disk_reftable);
-
     for (refblock_index =3D 0; refblock_index < reftable_size; refblock_=
index++) {
         cpu_to_be64s(&on_disk_reftable[refblock_index]);
     }
--=20
2.11.0


