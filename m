Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h95In-00014K-Cb
	for mharc-qemu-trivial@gnu.org; Wed, 27 Mar 2019 05:56:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37747)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sgarzare@redhat.com>) id 1h95Il-00012S-7h
	for qemu-trivial@nongnu.org; Wed, 27 Mar 2019 05:56:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sgarzare@redhat.com>) id 1h95Ii-0002v3-Vu
	for qemu-trivial@nongnu.org; Wed, 27 Mar 2019 05:56:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51018)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sgarzare@redhat.com>)
	id 1h95IZ-0002q3-Ul; Wed, 27 Mar 2019 05:56:44 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3C212C066467;
	Wed, 27 Mar 2019 09:56:43 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-116-197.ams2.redhat.com
	[10.36.116.197])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7EE1E5BBB7;
	Wed, 27 Mar 2019 09:56:39 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: qemu-devel@nongnu.org
Cc: Max Reitz <mreitz@redhat.com>, John Snow <jsnow@redhat.com>,
	qemu-trivial@nongnu.org, Jeff Cody <codyprime@gmail.com>,
	qemu-block@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Kevin Wolf <kwolf@redhat.com>
Date: Wed, 27 Mar 2019 10:56:33 +0100
Message-Id: <20190327095634.53038-2-sgarzare@redhat.com>
In-Reply-To: <20190327095634.53038-1-sgarzare@redhat.com>
References: <20190327095634.53038-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 27 Mar 2019 09:56:43 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH v2 1/2] block/vhdx: Remove redundant IEC
 binary prefixes definition
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
X-List-Received-Date: Wed, 27 Mar 2019 09:56:56 -0000

IEC binary prefixes are already defined in "qemu/units.h",
so we can remove redundant definitions in "block/vhdx.h".

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 block/vhdx.c | 3 ++-
 block/vhdx.h | 6 +-----
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/block/vhdx.c b/block/vhdx.c
index b785aef4b7..7cd1fc3731 100644
--- a/block/vhdx.c
+++ b/block/vhdx.c
@@ -1889,7 +1889,8 @@ static int coroutine_fn vhdx_co_create(BlockdevCrea=
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
index 1bfb4e4f73..bf72090c8f 100644
--- a/block/vhdx.h
+++ b/block/vhdx.h
@@ -17,11 +17,7 @@
=20
 #ifndef BLOCK_VHDX_H
 #define BLOCK_VHDX_H
-
-#define KiB              (1 * 1024)
-#define MiB            (KiB * 1024)
-#define GiB            (MiB * 1024)
-#define TiB ((uint64_t) GiB * 1024)
+#include "qemu/units.h"
=20
 #define DEFAULT_LOG_SIZE 1048576 /* 1MiB */
 /* Structures and fields present in the VHDX file */
--=20
2.20.1


