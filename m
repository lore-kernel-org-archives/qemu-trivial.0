Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h6uNP-0005Ot-JL
	for mharc-qemu-trivial@gnu.org; Thu, 21 Mar 2019 05:52:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35892)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sgarzare@redhat.com>) id 1h6uNM-0005CY-9S
	for qemu-trivial@nongnu.org; Thu, 21 Mar 2019 05:52:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sgarzare@redhat.com>) id 1h6uBe-00044P-Jg
	for qemu-trivial@nongnu.org; Thu, 21 Mar 2019 05:40:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47390)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sgarzare@redhat.com>)
	id 1h6uBR-0003of-Ff; Thu, 21 Mar 2019 05:40:24 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E307931688FA;
	Thu, 21 Mar 2019 09:40:15 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-116-238.ams2.redhat.com
	[10.36.116.238])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DF9B419C57;
	Thu, 21 Mar 2019 09:40:13 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: qemu-devel@nongnu.org
Cc: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org,
	Jeff Cody <codyprime@gmail.com>, Kevin Wolf <kwolf@redhat.com>,
	qemu-trivial@nongnu.org
Date: Thu, 21 Mar 2019 10:40:12 +0100
Message-Id: <20190321094012.36541-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Thu, 21 Mar 2019 09:40:16 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] block/vhdx: Use IEC binary prefixes from
 "qemu/units.h"
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
X-List-Received-Date: Thu, 21 Mar 2019 09:52:41 -0000

IEC binary prefixes are defined in "qemu/units.h", so we
can remove redundant definitions in "block/vhdx.h".

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 block/vhdx-log.c | 1 +
 block/vhdx.c     | 4 +++-
 block/vhdx.h     | 5 -----
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/block/vhdx-log.c b/block/vhdx-log.c
index 3149ff08d8..ad9905eb6d 100644
--- a/block/vhdx-log.c
+++ b/block/vhdx-log.c
@@ -18,6 +18,7 @@
  *
  */
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qapi/error.h"
 #include "qemu-common.h"
 #include "block/block_int.h"
diff --git a/block/vhdx.c b/block/vhdx.c
index b785aef4b7..e9b16c5ef6 100644
--- a/block/vhdx.c
+++ b/block/vhdx.c
@@ -16,6 +16,7 @@
  */
=20
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qapi/error.h"
 #include "block/block_int.h"
 #include "block/qdict.h"
@@ -1889,7 +1890,8 @@ static int coroutine_fn vhdx_co_create(BlockdevCrea=
teOptions *opts,
         return -EINVAL;
     }
     if (block_size > VHDX_BLOCK_SIZE_MAX) {
-        error_setg(errp, "Block size must not exceed %d", VHDX_BLOCK_SIZ=
E_MAX);
+        error_setg(errp, "Block size must not exceed %" PRId64,
+                   VHDX_BLOCK_SIZE_MAX);
         return -EINVAL;
     }
=20
diff --git a/block/vhdx.h b/block/vhdx.h
index 1bfb4e4f73..deb6e362ad 100644
--- a/block/vhdx.h
+++ b/block/vhdx.h
@@ -18,11 +18,6 @@
 #ifndef BLOCK_VHDX_H
 #define BLOCK_VHDX_H
=20
-#define KiB              (1 * 1024)
-#define MiB            (KiB * 1024)
-#define GiB            (MiB * 1024)
-#define TiB ((uint64_t) GiB * 1024)
-
 #define DEFAULT_LOG_SIZE 1048576 /* 1MiB */
 /* Structures and fields present in the VHDX file */
=20
--=20
2.20.1


