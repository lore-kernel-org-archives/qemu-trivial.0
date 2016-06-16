Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bDbAv-0006cW-KR
	for mharc-qemu-trivial@gnu.org; Thu, 16 Jun 2016 13:33:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46696)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1bDbAs-0006Zi-Kq
	for qemu-trivial@nongnu.org; Thu, 16 Jun 2016 13:33:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1bDbAo-0003E8-IF
	for qemu-trivial@nongnu.org; Thu, 16 Jun 2016 13:33:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38373)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1bDbAl-0003Dn-8r; Thu, 16 Jun 2016 13:33:43 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4C04FCF604;
	Thu, 16 Jun 2016 17:33:41 +0000 (UTC)
Received: from thh440s.fritz.box (vpn1-7-37.ams2.redhat.com [10.36.7.37])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5GHXcGu010692; Thu, 16 Jun 2016 13:33:39 -0400
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: Blue Swirl <blauwirbel@gmail.com>, Artyom Tarasenko <atar4qemu@gmail.com>, 
	qemu-trivial@nongnu.org
Date: Thu, 16 Jun 2016 19:33:38 +0200
Message-Id: <1466098418-26899-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Thu, 16 Jun 2016 17:33:41 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] sparc: Use g_memdup() instead of g_new0() +
 memcpy()
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
X-List-Received-Date: Thu, 16 Jun 2016 17:33:51 -0000

There is no need to make sure that the memory is zeroed after the
allocation if we also immediatly fill the whole buffer afterwards
with memcpy(). Thus g_new0 should be g_new instead. But since we
are also doing a memcpy() here, we can also simply replace both
with g_memdup() instead.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target-sparc/cpu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target-sparc/cpu.c b/target-sparc/cpu.c
index 5b74cfc..7b43192 100644
--- a/target-sparc/cpu.c
+++ b/target-sparc/cpu.c
@@ -115,8 +115,7 @@ static int cpu_sparc_register(SPARCCPU *cpu, const char *cpu_model)
         return -1;
     }
 
-    env->def = g_new0(sparc_def_t, 1);
-    memcpy(env->def, def, sizeof(*def));
+    env->def = g_memdup(def, sizeof(*def));
 
     featurestr = strtok(NULL, ",");
     cc->parse_features(CPU(cpu), featurestr, &err);
-- 
1.8.3.1


