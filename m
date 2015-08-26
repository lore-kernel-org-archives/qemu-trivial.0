Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZUf5F-0004nl-9E
	for mharc-qemu-trivial@gnu.org; Wed, 26 Aug 2015 14:06:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50360)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1ZUf5B-0004ef-7v
	for qemu-trivial@nongnu.org; Wed, 26 Aug 2015 14:05:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1ZUf5A-0000iF-6n
	for qemu-trivial@nongnu.org; Wed, 26 Aug 2015 14:05:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55521)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>)
	id 1ZUf57-0000gt-O1; Wed, 26 Aug 2015 14:05:53 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 5AA4343;
	Wed, 26 Aug 2015 18:05:53 +0000 (UTC)
Received: from thinkpad.redhat.com (vpn1-5-59.ams2.redhat.com [10.36.5.59])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t7QI5cZS026740; Wed, 26 Aug 2015 14:05:52 -0400
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
	Jason Wang <jasowang@redhat.com>, qemu-trivial@nongnu.org
Date: Wed, 26 Aug 2015 20:05:38 +0200
Message-Id: <1440612338-5912-8-git-send-email-lvivier@redhat.com>
In-Reply-To: <1440612338-5912-1-git-send-email-lvivier@redhat.com>
References: <1440612338-5912-1-git-send-email-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH v2 7/7] net: remove muldiv64()
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
X-List-Received-Date: Wed, 26 Aug 2015 18:05:58 -0000

muldiv64() is used to convert nanoseconds to microseconds.

    x = muldiv64(qemu_clock_get_ns(..), 1000000, get_ticks_per_sec());

As  get_ticks_per_sec() is 10^9, it can be replaced by:

    x = qemu_clock_get_us(..);

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
v2: use qemu_clock_get_us() instead of qemu_clock_get_ns()/1000
 net/dump.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/dump.c b/net/dump.c
index 02c8064..08259af 100644
--- a/net/dump.c
+++ b/net/dump.c
@@ -69,7 +69,7 @@ static ssize_t dump_receive(NetClientState *nc, const uint8_t *buf, size_t size)
         return size;
     }
 
-    ts = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL), 1000000, get_ticks_per_sec());
+    ts = qemu_clock_get_us(QEMU_CLOCK_VIRTUAL);
     caplen = size > s->pcap_caplen ? s->pcap_caplen : size;
 
     hdr.ts.tv_sec = ts / 1000000 + s->start_ts;
-- 
2.1.0


