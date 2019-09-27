Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iDqRF-00017k-Up
	for mharc-qemu-trivial@gnu.org; Fri, 27 Sep 2019 09:37:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37628)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fziglio@redhat.com>) id 1iDqR8-00011c-Gk
 for qemu-trivial@nongnu.org; Fri, 27 Sep 2019 09:37:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <fziglio@redhat.com>) id 1iDqR6-0002wI-Cq
 for qemu-trivial@nongnu.org; Fri, 27 Sep 2019 09:37:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34160)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <fziglio@redhat.com>) id 1iDqR6-0002vu-6j
 for qemu-trivial@nongnu.org; Fri, 27 Sep 2019 09:37:28 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id F001D3003AFE;
 Fri, 27 Sep 2019 10:32:56 +0000 (UTC)
Received: from fziglio.remote.csb (unknown [10.33.32.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0063960BE2;
 Fri, 27 Sep 2019 10:32:53 +0000 (UTC)
From: Frediano Ziglio <fziglio@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>,
	Laurent Vivier <laurent@vivier.eu>
Cc: qemu-trivial@nongnu.org,
	Frediano Ziglio <fziglio@redhat.com>
Subject: [PATCH 3/3] qemu-timer: reuse MIN macro in qemu_timeout_ns_to_ms
Date: Fri, 27 Sep 2019 11:32:33 +0100
Message-Id: <20190927103233.20901-3-fziglio@redhat.com>
In-Reply-To: <20190927103233.20901-1-fziglio@redhat.com>
References: <20190927103233.20901-1-fziglio@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Fri, 27 Sep 2019 10:32:57 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Sep 2019 13:37:36 -0000

Signed-off-by: Frediano Ziglio <fziglio@redhat.com>
---
 util/qemu-timer.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/util/qemu-timer.c b/util/qemu-timer.c
index d428fec567..9bd173ecda 100644
--- a/util/qemu-timer.c
+++ b/util/qemu-timer.c
@@ -322,11 +322,7 @@ int qemu_timeout_ns_to_ms(int64_t ns)
     ms =3D DIV_ROUND_UP(ns, SCALE_MS);
=20
     /* To avoid overflow problems, limit this to 2^31, i.e. approx 25 da=
ys */
-    if (ms > (int64_t) INT32_MAX) {
-        ms =3D INT32_MAX;
-    }
-
-    return (int) ms;
+    return (int) MIN(ms, INT32_MAX);
 }
=20
=20
--=20
2.21.0


