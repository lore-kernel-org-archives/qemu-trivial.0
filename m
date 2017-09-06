Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dpW2S-0005os-9C
	for mharc-qemu-trivial@gnu.org; Wed, 06 Sep 2017 04:50:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54530)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rjones@redhat.com>) id 1dpW2Q-0005nj-Cq
	for qemu-trivial@nongnu.org; Wed, 06 Sep 2017 04:50:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rjones@redhat.com>) id 1dpW2P-0004d2-IW
	for qemu-trivial@nongnu.org; Wed, 06 Sep 2017 04:50:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45968)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <rjones@redhat.com>)
	id 1dpW2L-0004aj-Oc; Wed, 06 Sep 2017 04:50:17 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C55AC356C7;
	Wed,  6 Sep 2017 08:50:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com C55AC356C7
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=rjones@redhat.com
Received: from moo.home.annexia.org (ovpn-117-64.ams2.redhat.com
	[10.36.117.64])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B9DA019E0A;
	Wed,  6 Sep 2017 08:50:09 +0000 (UTC)
From: "Richard W.M. Jones" <rjones@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com, famz@redhat.com, kwolf@redhat.com,
	qemu-trivial@nongnu.org, mjt@tls.msk.ru
Date: Wed,  6 Sep 2017 09:50:06 +0100
Message-Id: <20170906085006.26983-1-rjones@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Wed, 06 Sep 2017 08:50:15 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH for-2.10] qemu-options: Document the -drive
 locking parameter.
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
X-List-Received-Date: Wed, 06 Sep 2017 08:50:23 -0000

Commit 16b48d5d66d2 ("file-posix: Add 'locking' option") added this
option, but as it was not documented in the -help output it was not
easily possible to tell if a particular qemu binary supports it.

Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
---
 qemu-options.hx | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 9f6e2adfff..f8f95eb498 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -796,7 +796,7 @@ DEF("drive", HAS_ARG, QEMU_OPTION_drive,
     "       [,cache=writethrough|writeback|none|directsync|unsafe][,format=f]\n"
     "       [,serial=s][,addr=A][,rerror=ignore|stop|report]\n"
     "       [,werror=ignore|stop|report|enospc][,id=name][,aio=threads|native]\n"
-    "       [,readonly=on|off][,copy-on-read=on|off]\n"
+    "       [,readonly=on|off][,copy-on-read=on|off][,locking=off|auto|on]\n"
     "       [,discard=ignore|unmap][,detect-zeroes=on|off|unmap]\n"
     "       [[,bps=b]|[[,bps_rd=r][,bps_wr=w]]]\n"
     "       [[,iops=i]|[[,iops_rd=r][,iops_wr=w]]]\n"
-- 
2.13.2


