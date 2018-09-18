Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1g2CJA-0004rI-BL
	for mharc-qemu-trivial@gnu.org; Tue, 18 Sep 2018 05:28:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34473)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1g2CJ8-0004qQ-RR
	for qemu-trivial@nongnu.org; Tue, 18 Sep 2018 05:28:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1g2CJ8-0001wA-7Q
	for qemu-trivial@nongnu.org; Tue, 18 Sep 2018 05:28:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60210)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1g2CJ2-0001ov-9D; Tue, 18 Sep 2018 05:28:28 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DEA68356DF;
	Tue, 18 Sep 2018 09:28:26 +0000 (UTC)
Received: from donizetti.redhat.com (ovpn-117-124.ams2.redhat.com
	[10.36.117.124])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E82A078DCD;
	Tue, 18 Sep 2018 09:28:25 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Date: Tue, 18 Sep 2018 11:28:24 +0200
Message-Id: <20180918092824.10532-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Tue, 18 Sep 2018 09:28:26 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] hvf: drop unused variable
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
X-List-Received-Date: Tue, 18 Sep 2018 09:28:35 -0000

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/hvf/hvf.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index 5db167df98..9f52bc413a 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -72,7 +72,6 @@
 #include "sysemu/sysemu.h"
 #include "target/i386/cpu.h"
 
-pthread_rwlock_t mem_lock = PTHREAD_RWLOCK_INITIALIZER;
 HVFState *hvf_state;
 int hvf_disabled = 1;
 
-- 
2.17.1


