Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bzrDI-0001on-9x
	for mharc-qemu-trivial@gnu.org; Thu, 27 Oct 2016 16:23:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44555)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bzrDG-0001nO-J3
	for qemu-trivial@nongnu.org; Thu, 27 Oct 2016 16:23:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bzrDF-0003D1-Q3
	for qemu-trivial@nongnu.org; Thu, 27 Oct 2016 16:23:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34032)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1bzrD8-000375-UD; Thu, 27 Oct 2016 16:23:39 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EB9B1445EC;
	Thu, 27 Oct 2016 20:23:37 +0000 (UTC)
Received: from red.redhat.com (ovpn-116-106.phx2.redhat.com [10.3.116.106])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9RKNamr015711; Thu, 27 Oct 2016 16:23:37 -0400
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: kwolf@redhat.com, qemu-trivial@nongnu.org, qemu-block@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Date: Thu, 27 Oct 2016 15:23:33 -0500
Message-Id: <1477599813-6845-1-git-send-email-eblake@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Thu, 27 Oct 2016 20:23:38 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] block: Mention replication in BlockdevDriver
 enum docs
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
X-List-Received-Date: Thu, 27 Oct 2016 20:23:47 -0000

Missed in commit 82ac554.

Signed-off-by: Eric Blake <eblake@redhat.com>
---

Requires: Kevin's current block branch

Could also go through trivial tree

 qapi/block-core.json | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 0f2b703..4316528 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -1703,7 +1703,7 @@
 #
 # @host_device, @host_cdrom: Since 2.1
 # @gluster: Since 2.7
-# @nbd, @ssh: Since 2.8
+# @nbd, @replication, @ssh: Since 2.8
 #
 # Since: 2.0
 ##
-- 
2.7.4


