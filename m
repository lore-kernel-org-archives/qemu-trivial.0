Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cbnYY-00009g-3t
	for mharc-qemu-trivial@gnu.org; Thu, 09 Feb 2017 07:10:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48290)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1cbnYT-000089-Jp
	for qemu-trivial@nongnu.org; Thu, 09 Feb 2017 07:10:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1cbnYS-0002nI-Pz
	for qemu-trivial@nongnu.org; Thu, 09 Feb 2017 07:10:29 -0500
Received: from mx1.redhat.com ([209.132.183.28]:49472)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1cbnYM-0002jn-8o; Thu, 09 Feb 2017 07:10:22 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6B79D7304C;
	Thu,  9 Feb 2017 12:10:21 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-117-163.ams2.redhat.com
	[10.36.117.163])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v19CAIZv022519; Thu, 9 Feb 2017 07:10:19 -0500
From: Thomas Huth <thuth@redhat.com>
To: qemu-block@nongnu.org, Hitoshi Mitake <mitake.hitoshi@lab.ntt.co.jp>,
	Liu Yuan <namei.unix@gmail.com>, Jeff Cody <jcody@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Thu,  9 Feb 2017 13:10:18 +0100
Message-Id: <1486642218-18520-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Thu, 09 Feb 2017 12:10:21 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] qemu-options: Fix broken sheepdog URL
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
X-List-Received-Date: Thu, 09 Feb 2017 12:10:32 -0000

The sheepdog URL is broken twice: First it uses a duplicated
http:// prefix, second the website seems to have moved to
https://sheepdog.github.io/sheepdog/ instead.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 qemu-options.hx | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index ad2f8fc..38113b9 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2583,7 +2583,7 @@ Example
 qemu-system-i386 --drive file=sheepdog://192.0.2.1:30000/MyVirtualMachine
 @end example
 
-See also @url{http://http://www.osrg.net/sheepdog/}.
+See also @url{https://sheepdog.github.io/sheepdog/}.
 
 @item GlusterFS
 GlusterFS is a user space distributed file system.
-- 
1.8.3.1


