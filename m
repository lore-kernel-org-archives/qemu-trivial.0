Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aldb8-0003Rs-Nd
	for mharc-qemu-trivial@gnu.org; Thu, 31 Mar 2016 10:29:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53850)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1aldb1-0003IO-K6
	for qemu-trivial@nongnu.org; Thu, 31 Mar 2016 10:29:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1aldaw-0008AV-Ll
	for qemu-trivial@nongnu.org; Thu, 31 Mar 2016 10:29:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60483)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1aldal-00088V-Pl; Thu, 31 Mar 2016 10:28:59 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 33A9CAED3B;
	Thu, 31 Mar 2016 14:28:59 +0000 (UTC)
Received: from donizetti.redhat.com (ovpn-112-23.ams2.redhat.com
	[10.36.112.23])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2VESuhU000465; Thu, 31 Mar 2016 10:28:57 -0400
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 31 Mar 2016 16:28:56 +0200
Message-Id: <1459434536-28145-1-git-send-email-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, jasowang@redhat.com
Subject: [Qemu-trivial] [PATCH] net: fix OptsVisitor memory leak
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
X-List-Received-Date: Thu, 31 Mar 2016 14:29:20 -0000

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 net/net.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/net.c b/net/net.c
index 594c3b8..3847a13 100644
--- a/net/net.c
+++ b/net/net.c
@@ -1100,6 +1100,7 @@ int net_client_init(QemuOpts *opts, int is_netdev, Error **errp)
     }
 
     error_propagate(errp, err);
+    opts_visitor_cleanup(ov);
     return ret;
 }
 
-- 
2.5.5


