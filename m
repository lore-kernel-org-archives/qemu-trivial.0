Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1g84GH-0004k5-5c
	for mharc-qemu-trivial@gnu.org; Thu, 04 Oct 2018 10:05:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53989)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1g84GF-0004iU-2z
	for qemu-trivial@nongnu.org; Thu, 04 Oct 2018 10:05:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1g84GB-0003zE-03
	for qemu-trivial@nongnu.org; Thu, 04 Oct 2018 10:05:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54960)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1g84G5-0003er-Ez; Thu, 04 Oct 2018 10:05:42 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EF57E3083393;
	Thu,  4 Oct 2018 14:05:31 +0000 (UTC)
Received: from red.redhat.com (ovpn-126-73.rdu2.redhat.com [10.10.126.73])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D9E6F690F5;
	Thu,  4 Oct 2018 14:05:29 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com,
	qemu-trivial@nongnu.org
Date: Thu,  4 Oct 2018 09:05:22 -0500
Message-Id: <20181004140522.945682-1-eblake@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Thu, 04 Oct 2018 14:05:32 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] edid: Ignore built binary
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
X-List-Received-Date: Thu, 04 Oct 2018 14:05:51 -0000

Added in commit 72d277a7.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 .gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitignore b/.gitignore
index 5668d027824..64efdfd9292 100644
--- a/.gitignore
+++ b/.gitignore
@@ -107,6 +107,7 @@
 /qemu-doc.html
 /qemu-doc.info
 /qemu-doc.txt
+/qemu-edid
 /qemu-img
 /qemu-nbd
 /qemu-options.def
-- 
2.17.1


