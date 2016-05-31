Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b7mff-0005s7-0O
	for mharc-qemu-trivial@gnu.org; Tue, 31 May 2016 12:37:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37615)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1b7mfb-0005kI-9m
	for qemu-trivial@nongnu.org; Tue, 31 May 2016 12:37:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1b7mfZ-0003SQ-BP
	for qemu-trivial@nongnu.org; Tue, 31 May 2016 12:37:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39436)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>)
	id 1b7mfM-0003Ox-IL; Tue, 31 May 2016 12:37:16 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1E8BE3B72C;
	Tue, 31 May 2016 16:37:16 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-112-32.ams2.redhat.com [10.36.112.32])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4VGa8QO011053; Tue, 31 May 2016 12:37:08 -0400
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Scott Feldman <sfeldma@gmail.com>
Date: Tue, 31 May 2016 18:35:59 +0200
Message-Id: <1464712565-14857-11-git-send-email-lvivier@redhat.com>
In-Reply-To: <1464712565-14857-1-git-send-email-lvivier@redhat.com>
References: <1464712565-14857-1-git-send-email-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Tue, 31 May 2016 16:37:16 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 10/16] rocker: Use DIV_ROUND_UP
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
X-List-Received-Date: Tue, 31 May 2016 16:37:34 -0000

Replace (((n) + (d) - 1) /(d)) by DIV_ROUND_UP(n,d).

This patch is the result of coccinelle script
scripts/coccinelle/round.cocci

CC: Scott Feldman <sfeldma@gmail.com>
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 hw/net/rocker/rocker_of_dpa.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/net/rocker/rocker_of_dpa.c b/hw/net/rocker/rocker_of_dpa.c
index 0a134eb..9b1e0d2 100644
--- a/hw/net/rocker/rocker_of_dpa.c
+++ b/hw/net/rocker/rocker_of_dpa.c
@@ -103,9 +103,8 @@ typedef struct of_dpa_flow_key {
 
 /* Width of key which includes field 'f' in u64s, rounded up */
 #define FLOW_KEY_WIDTH(f) \
-    ((offsetof(OfDpaFlowKey, f) + \
-      sizeof(((OfDpaFlowKey *)0)->f) + \
-      sizeof(uint64_t) - 1) / sizeof(uint64_t))
+    DIV_ROUND_UP(offsetof(OfDpaFlowKey, f) + sizeof(((OfDpaFlowKey *)0)->f), \
+    sizeof(uint64_t))
 
 typedef struct of_dpa_flow_action {
     uint32_t goto_tbl;
-- 
2.5.5


