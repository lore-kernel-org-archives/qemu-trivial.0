Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bDDTk-000607-5m
	for mharc-qemu-trivial@gnu.org; Wed, 15 Jun 2016 12:15:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33719)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bDDTi-0005yY-GC
	for qemu-trivial@nongnu.org; Wed, 15 Jun 2016 12:15:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bDDTd-0003tP-Bh
	for qemu-trivial@nongnu.org; Wed, 15 Jun 2016 12:15:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43527)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>)
	id 1bDDTW-0003ql-MQ; Wed, 15 Jun 2016 12:15:30 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2492E80507;
	Wed, 15 Jun 2016 16:15:30 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-112-40.ams2.redhat.com [10.36.112.40])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5FGElUr011275; Wed, 15 Jun 2016 12:15:28 -0400
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Date: Wed, 15 Jun 2016 18:14:34 +0200
Message-Id: <1466007277-17525-5-git-send-email-lvivier@redhat.com>
In-Reply-To: <1466007277-17525-1-git-send-email-lvivier@redhat.com>
References: <1466007277-17525-1-git-send-email-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Wed, 15 Jun 2016 16:15:30 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 4/7] tricore: remove useless cast
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
X-List-Received-Date: Wed, 15 Jun 2016 16:15:43 -0000

This patch is the result of coccinelle script
scripts/coccinelle/typecast.cocci

CC: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 hw/tricore/tricore_testboard.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/tricore/tricore_testboard.c b/hw/tricore/tricore_testboard.c
index 8d3520f..19dd587 100644
--- a/hw/tricore/tricore_testboard.c
+++ b/hw/tricore/tricore_testboard.c
@@ -46,7 +46,7 @@ static void tricore_load_kernel(CPUTriCoreState *env)
     long kernel_size;
 
     kernel_size = load_elf(tricoretb_binfo.kernel_filename, NULL,
-                           NULL, (uint64_t *)&entry, NULL,
+                           NULL, &entry, NULL,
                            NULL, 0,
                            EM_TRICORE, 1, 0);
     if (kernel_size <= 0) {
-- 
2.5.5


