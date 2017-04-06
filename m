Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cwBTm-0007MS-3E
	for mharc-qemu-trivial@gnu.org; Thu, 06 Apr 2017 13:45:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57118)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcody@redhat.com>) id 1cwBTj-0007LG-Be
	for qemu-trivial@nongnu.org; Thu, 06 Apr 2017 13:45:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jcody@redhat.com>) id 1cwBTi-0001sB-8e
	for qemu-trivial@nongnu.org; Thu, 06 Apr 2017 13:45:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34984)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jcody@redhat.com>)
	id 1cwBTc-0001pD-L2; Thu, 06 Apr 2017 13:45:44 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 41F0C64D9D;
	Thu,  6 Apr 2017 17:45:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 41F0C64D9D
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=jcody@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 41F0C64D9D
Received: from localhost (ovpn-116-76.phx2.redhat.com [10.3.116.76])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B72D19C90;
	Thu,  6 Apr 2017 17:45:42 +0000 (UTC)
From: Jeff Cody <jcody@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, kwolf@redhat.com, berrange@redhat.com,
	mreitz@redhat.com
Date: Thu,  6 Apr 2017 13:45:42 -0400
Message-Id: <433d922c5ad43020493323c5e065b4c4ef4157ab.1491500481.git.jcody@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Thu, 06 Apr 2017 17:45:43 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 1/1] qemu-img: img_create does not support
 image-opts, fix docs
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
X-List-Received-Date: Thu, 06 Apr 2017 17:45:52 -0000

The documentation and help for qemu-img claims that 'qemu-img create'
will take the '--image-opts' argument.  This is not true, so this
patch removes those claims.

Signed-off-by: Jeff Cody <jcody@redhat.com>
---
 qemu-img-cmds.hx | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qemu-img-cmds.hx b/qemu-img-cmds.hx
index 9c9702c..8ac7822 100644
--- a/qemu-img-cmds.hx
+++ b/qemu-img-cmds.hx
@@ -22,9 +22,9 @@ STEXI
 ETEXI
 
 DEF("create", img_create,
-    "create [-q] [--object objectdef] [--image-opts] [-f fmt] [-o options] filename [size]")
+    "create [-q] [--object objectdef] [-f fmt] [-o options] filename [size]")
 STEXI
-@item create [--object @var{objectdef}] [--image-opts] [-q] [-f @var{fmt}] [-o @var{options}] @var{filename} [@var{size}]
+@item create [--object @var{objectdef}] [-q] [-f @var{fmt}] [-o @var{options}] @var{filename} [@var{size}]
 ETEXI
 
 DEF("commit", img_commit,
-- 
2.9.3


