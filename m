Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1azlBx-0001xx-Qv
	for mharc-qemu-trivial@gnu.org; Mon, 09 May 2016 09:25:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55958)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1azlBq-0001e2-M0
	for qemu-trivial@nongnu.org; Mon, 09 May 2016 09:25:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1azlBf-00044D-OS
	for qemu-trivial@nongnu.org; Mon, 09 May 2016 09:25:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56767)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>)
	id 1azlBW-00042B-8t; Mon, 09 May 2016 09:25:18 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D8D4AC000417;
	Mon,  9 May 2016 13:25:17 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-112-28.ams2.redhat.com [10.36.112.28])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u49DP4ci017024; Mon, 9 May 2016 09:25:16 -0400
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Cc: Richard Henderson <rth@twiddle.net>, Laurent Vivier <lvivier@redhat.com>
Date: Mon,  9 May 2016 15:24:59 +0200
Message-Id: <1462800299-12641-6-git-send-email-lvivier@redhat.com>
In-Reply-To: <1462800299-12641-1-git-send-email-lvivier@redhat.com>
References: <1462800299-12641-1-git-send-email-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Mon, 09 May 2016 13:25:17 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH v2 5/5] ppc: Remove a potential overflow in
 muldiv64()
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
X-List-Received-Date: Mon, 09 May 2016 13:25:44 -0000

The coccinelle script:
scripts/coccinelle/overflow_muldiv64.cocci
gives us a list of potential overflows in muldiv64()
(the two first parameters are 64bit values).

This patch fixes one, as the fix seems obvious:

replace muldiv64(a, b, c) by muldiv64(b, a, c)
as "a" and "b" are 64bit values but a <= NANOSECONDS_PER_SECOND.
(10^9 -> 30bit value).

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 hw/ppc/ppc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
index 38ff2e1..07ea47c 100644
--- a/hw/ppc/ppc.c
+++ b/hw/ppc/ppc.c
@@ -880,7 +880,7 @@ static int timebase_post_load(void *opaque, int version_id)
     host_ns = qemu_clock_get_ns(QEMU_CLOCK_HOST);
     ns_diff = MAX(0, host_ns - tb_remote->time_of_the_day_ns);
     migration_duration_ns = MIN(NANOSECONDS_PER_SECOND, ns_diff);
-    migration_duration_tb = muldiv64(migration_duration_ns, freq,
+    migration_duration_tb = muldiv64(freq, migration_duration_ns,
                                      NANOSECONDS_PER_SECOND);
     guest_tb = tb_remote->guest_timebase + MIN(0, migration_duration_tb);
 
-- 
2.5.5


