Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dwrZP-0005w6-Ho
	for mharc-qemu-trivial@gnu.org; Tue, 26 Sep 2017 11:14:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49008)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dwrZN-0005uh-0O
	for qemu-trivial@nongnu.org; Tue, 26 Sep 2017 11:14:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dwrZM-0005w5-CK
	for qemu-trivial@nongnu.org; Tue, 26 Sep 2017 11:14:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60150)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1dwrZD-0005pI-HC; Tue, 26 Sep 2017 11:14:35 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 79F6FD7136;
	Tue, 26 Sep 2017 15:14:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 79F6FD7136
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eblake@redhat.com
Received: from red.redhat.com (ovpn-124-97.rdu2.redhat.com [10.10.124.97])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A4F8678131;
	Tue, 26 Sep 2017 15:14:31 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com,
	qemu-trivial@nongnu.org
Date: Tue, 26 Sep 2017 10:14:21 -0500
Message-Id: <20170926151421.14557-1-eblake@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 26 Sep 2017 15:14:34 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] scsi: Ignore executable for in-tree builds
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
X-List-Received-Date: Tue, 26 Sep 2017 15:14:45 -0000

The new qemu-pr-helper (commit b855f8d17) should not be checked in,
even when doing in-tree builds.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 .gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitignore b/.gitignore
index 40acfcb9e2..3a7e01dc6a 100644
--- a/.gitignore
+++ b/.gitignore
@@ -49,6 +49,7 @@
 /qemu-version.h
 /qemu-version.h.tmp
 /module_block.h
+/scsi/qemu-pr-helper
 /vscclient
 /vhost-user-scsi
 /fsdev/virtfs-proxy-helper
-- 
2.13.5


