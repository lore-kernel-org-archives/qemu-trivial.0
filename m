Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bDDTV-0005ob-DV
	for mharc-qemu-trivial@gnu.org; Wed, 15 Jun 2016 12:15:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33587)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bDDTQ-0005j5-0S
	for qemu-trivial@nongnu.org; Wed, 15 Jun 2016 12:15:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bDDTP-0003oz-29
	for qemu-trivial@nongnu.org; Wed, 15 Jun 2016 12:15:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33268)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>)
	id 1bDDTM-0003oW-P9; Wed, 15 Jun 2016 12:15:20 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3F24BC00DDF0;
	Wed, 15 Jun 2016 16:15:20 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-112-40.ams2.redhat.com [10.36.112.40])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5FGElUq011275; Wed, 15 Jun 2016 12:15:18 -0400
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
	Cornelia Huck <cornelia.huck@de.ibm.com>
Date: Wed, 15 Jun 2016 18:14:33 +0200
Message-Id: <1466007277-17525-4-git-send-email-lvivier@redhat.com>
In-Reply-To: <1466007277-17525-1-git-send-email-lvivier@redhat.com>
References: <1466007277-17525-1-git-send-email-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Wed, 15 Jun 2016 16:15:20 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 3/7] s390x: remove useless cast
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
X-List-Received-Date: Wed, 15 Jun 2016 16:15:28 -0000

This patch is the result of coccinelle script
scripts/coccinelle/typecast.cocci

CC: Cornelia Huck <cornelia.huck@de.ibm.com>
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 hw/s390x/sclp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/s390x/sclp.c b/hw/s390x/sclp.c
index fca37f5..feeb0da 100644
--- a/hw/s390x/sclp.c
+++ b/hw/s390x/sclp.c
@@ -406,7 +406,7 @@ int sclp_service_call(CPUS390XState *env, uint64_t sccb, uint32_t code)
         goto out;
     }
 
-    sclp_c->execute(sclp, (SCCB *)&work_sccb, code);
+    sclp_c->execute(sclp, &work_sccb, code);
 
     cpu_physical_memory_write(sccb, &work_sccb,
                               be16_to_cpu(work_sccb.h.length));
-- 
2.5.5


