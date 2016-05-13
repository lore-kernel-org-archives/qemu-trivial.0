Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b179k-0000Rn-1a
	for mharc-qemu-trivial@gnu.org; Fri, 13 May 2016 03:05:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54728)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1b179d-0000B6-IC
	for qemu-trivial@nongnu.org; Fri, 13 May 2016 03:05:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1b179W-0003Sm-7J
	for qemu-trivial@nongnu.org; Fri, 13 May 2016 03:04:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42591)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1b179O-0003Pg-Ls; Fri, 13 May 2016 03:04:42 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 332297EBC0;
	Fri, 13 May 2016 07:04:42 +0000 (UTC)
Received: from thh440s.fritz.box (vpn1-7-225.ams2.redhat.com [10.36.7.225])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4D74Xka010464; Fri, 13 May 2016 03:04:40 -0400
From: Thomas Huth <thuth@redhat.com>
To: Samuel Thibault <samuel.thibault@ens-lyon.org>, qemu-devel@nongnu.org
Cc: Jan Kiszka <jan.kiszka@siemens.com>, qemu-trivial@nongnu.org
Date: Fri, 13 May 2016 09:04:32 +0200
Message-Id: <1463123072-30603-5-git-send-email-thuth@redhat.com>
In-Reply-To: <1463123072-30603-1-git-send-email-thuth@redhat.com>
References: <1463123072-30603-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Fri, 13 May 2016 07:04:42 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 4/4] slirp: Clean up osdep.h related header
 inclusions
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
X-List-Received-Date: Fri, 13 May 2016 07:05:02 -0000

qemu/osdep.h is included in some headers twice - one time
should be sufficient.
Also remove the inclusion of time.h since that is already
done by osdep.h, too (this makes scripts/clean-includes
happy again).

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 slirp/ip6_icmp.c | 1 -
 slirp/ip_input.c | 1 -
 slirp/udp6.c     | 1 -
 3 files changed, 3 deletions(-)

diff --git a/slirp/ip6_icmp.c b/slirp/ip6_icmp.c
index 09571bc..48016a9 100644
--- a/slirp/ip6_icmp.c
+++ b/slirp/ip6_icmp.c
@@ -9,7 +9,6 @@
 #include "qemu/timer.h"
 #include "qemu/error-report.h"
 #include "qemu/log.h"
-#include <time.h>
 
 #define NDP_Interval g_rand_int_range(slirp->grand, \
         NDP_MinRtrAdvInterval, NDP_MaxRtrAdvInterval)
diff --git a/slirp/ip_input.c b/slirp/ip_input.c
index cdd5483..34fba2b 100644
--- a/slirp/ip_input.c
+++ b/slirp/ip_input.c
@@ -40,7 +40,6 @@
 
 #include "qemu/osdep.h"
 #include <slirp.h>
-#include <qemu/osdep.h>
 #include "ip_icmp.h"
 
 static struct ip *ip_reass(Slirp *slirp, struct ip *ip, struct ipq *fp);
diff --git a/slirp/udp6.c b/slirp/udp6.c
index a23026f..94efb13 100644
--- a/slirp/udp6.c
+++ b/slirp/udp6.c
@@ -6,7 +6,6 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "slirp.h"
-#include "qemu/osdep.h"
 #include "udp.h"
 
 void udp6_input(struct mbuf *m)
-- 
1.8.3.1


