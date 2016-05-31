Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b7mfx-0006Jk-Nu
	for mharc-qemu-trivial@gnu.org; Tue, 31 May 2016 12:37:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37847)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1b7mft-0006Dj-EM
	for qemu-trivial@nongnu.org; Tue, 31 May 2016 12:37:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1b7mfs-0003kY-HF
	for qemu-trivial@nongnu.org; Tue, 31 May 2016 12:37:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56059)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>)
	id 1b7mfl-0003eG-2Z; Tue, 31 May 2016 12:37:41 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A6D17821C7;
	Tue, 31 May 2016 16:37:40 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-112-32.ams2.redhat.com [10.36.112.32])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4VGa8QT011053; Tue, 31 May 2016 12:37:38 -0400
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 31 May 2016 18:36:04 +0200
Message-Id: <1464712565-14857-16-git-send-email-lvivier@redhat.com>
In-Reply-To: <1464712565-14857-1-git-send-email-lvivier@redhat.com>
References: <1464712565-14857-1-git-send-email-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 31 May 2016 16:37:40 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 15/16] qemu-timer: Use DIV_ROUND_UP
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
X-List-Received-Date: Tue, 31 May 2016 16:37:52 -0000

Replace (((n) + (d) - 1) /(d)) by DIV_ROUND_UP(n,d).

This patch is the result of coccinelle script
scripts/coccinelle/round.cocci

CC: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 qemu-timer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-timer.c b/qemu-timer.c
index 4441fe6..eb22e92 100644
--- a/qemu-timer.c
+++ b/qemu-timer.c
@@ -292,7 +292,7 @@ int qemu_timeout_ns_to_ms(int64_t ns)
     /* Always round up, because it's better to wait too long than to wait too
      * little and effectively busy-wait
      */
-    ms = (ns + SCALE_MS - 1) / SCALE_MS;
+    ms = DIV_ROUND_UP(ns, SCALE_MS);
 
     /* To avoid overflow problems, limit this to 2^31, i.e. approx 25 days */
     if (ms > (int64_t) INT32_MAX) {
-- 
2.5.5


