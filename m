Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b7mfh-0005wa-9W
	for mharc-qemu-trivial@gnu.org; Tue, 31 May 2016 12:37:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37678)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1b7mff-0005sm-FO
	for qemu-trivial@nongnu.org; Tue, 31 May 2016 12:37:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1b7mfe-0003Wx-FL
	for qemu-trivial@nongnu.org; Tue, 31 May 2016 12:37:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55999)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>)
	id 1b7mfX-0003Ry-Ky; Tue, 31 May 2016 12:37:27 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1AB66821C7;
	Tue, 31 May 2016 16:37:27 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-112-32.ams2.redhat.com [10.36.112.32])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4VGa8QQ011053; Tue, 31 May 2016 12:37:24 -0400
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>
Date: Tue, 31 May 2016 18:36:01 +0200
Message-Id: <1464712565-14857-13-git-send-email-lvivier@redhat.com>
In-Reply-To: <1464712565-14857-1-git-send-email-lvivier@redhat.com>
References: <1464712565-14857-1-git-send-email-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 31 May 2016 16:37:27 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 12/16] slirp: Use DIV_ROUND_UP
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
X-List-Received-Date: Tue, 31 May 2016 16:37:36 -0000

Replace (((n) + (d) - 1) /(d)) by DIV_ROUND_UP(n,d).

This patch is the result of coccinelle script
scripts/coccinelle/round.cocci

CC: Samuel Thibault <samuel.thibault@ens-lyon.org>
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 slirp/dnssearch.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/slirp/dnssearch.c b/slirp/dnssearch.c
index aed2f13..9b16757 100644
--- a/slirp/dnssearch.c
+++ b/slirp/dnssearch.c
@@ -262,7 +262,7 @@ int translate_dnssearch(Slirp *s, const char **names)
     }
 
     /* reserve extra 2 header bytes for each 255 bytes of output */
-    memreq += ((memreq + MAX_OPT_LEN - 1) / MAX_OPT_LEN) * OPT_HEADER_LEN;
+    memreq += DIV_ROUND_UP(memreq, MAX_OPT_LEN) * OPT_HEADER_LEN;
     result = g_malloc(memreq * sizeof(*result));
 
     outptr = result;
@@ -289,7 +289,7 @@ int translate_dnssearch(Slirp *s, const char **names)
     domain_mkxrefs(domains, domains + num_domains - 1, 0);
     memreq = domain_compactify(domains, num_domains);
 
-    blocks = (memreq + MAX_OPT_LEN - 1) / MAX_OPT_LEN;
+    blocks = DIV_ROUND_UP(memreq, MAX_OPT_LEN);
     bsrc_end = memreq;
     bsrc_start = (blocks - 1) * MAX_OPT_LEN;
     bdst_start = bsrc_start + blocks * OPT_HEADER_LEN;
-- 
2.5.5


