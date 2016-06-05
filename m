Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b9W7u-0001fc-C9
	for mharc-qemu-trivial@gnu.org; Sun, 05 Jun 2016 07:21:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35306)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9W7o-0001Vu-M0
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 07:21:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9W7j-0003mI-Rc
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 07:21:47 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:43125)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1b9W7b-0003jn-3T; Sun, 05 Jun 2016 07:21:35 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 9E3144091F;
	Sun,  5 Jun 2016 14:21:29 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 482A1B38;
	Sun,  5 Jun 2016 10:43:40 +0300 (MSK)
Received: (nullmailer pid 1188 invoked by uid 1000);
	Sun, 05 Jun 2016 07:43:32 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-trivial@nongnu.org,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sun,  5 Jun 2016 10:43:25 +0300
Message-Id: <29bb5d2dbc2a33c7f7cbd3163144e1a380a75861.1465112552.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
References: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 48/52] slirp: Use DIV_ROUND_UP
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
X-List-Received-Date: Sun, 05 Jun 2016 11:21:53 -0000

From: Laurent Vivier <lvivier@redhat.com>

Replace (((n) + (d) - 1) /(d)) by DIV_ROUND_UP(n,d).

This patch is the result of coccinelle script
scripts/coccinelle/round.cocci

CC: Samuel Thibault <samuel.thibault@ens-lyon.org>
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Acked-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 slirp/dnssearch.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/slirp/dnssearch.c b/slirp/dnssearch.c
index 4c70a64..8fb5633 100644
--- a/slirp/dnssearch.c
+++ b/slirp/dnssearch.c
@@ -261,7 +261,7 @@ int translate_dnssearch(Slirp *s, const char **names)
     }
 
     /* reserve extra 2 header bytes for each 255 bytes of output */
-    memreq += ((memreq + MAX_OPT_LEN - 1) / MAX_OPT_LEN) * OPT_HEADER_LEN;
+    memreq += DIV_ROUND_UP(memreq, MAX_OPT_LEN) * OPT_HEADER_LEN;
     result = g_malloc(memreq * sizeof(*result));
 
     outptr = result;
@@ -288,7 +288,7 @@ int translate_dnssearch(Slirp *s, const char **names)
     domain_mkxrefs(domains, domains + num_domains - 1, 0);
     memreq = domain_compactify(domains, num_domains);
 
-    blocks = (memreq + MAX_OPT_LEN - 1) / MAX_OPT_LEN;
+    blocks = DIV_ROUND_UP(memreq, MAX_OPT_LEN);
     bsrc_end = memreq;
     bsrc_start = (blocks - 1) * MAX_OPT_LEN;
     bdst_start = bsrc_start + blocks * OPT_HEADER_LEN;
-- 
2.1.4


