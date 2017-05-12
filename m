Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d9GGl-0005r7-Io
	for mharc-qemu-trivial@gnu.org; Fri, 12 May 2017 15:30:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43896)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1d9GGi-0005lL-Li
	for qemu-trivial@nongnu.org; Fri, 12 May 2017 15:30:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1d9GGh-0000ht-Sr
	for qemu-trivial@nongnu.org; Fri, 12 May 2017 15:30:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42974)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1d9GGb-0000Y7-IA; Fri, 12 May 2017 15:30:21 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2F156824;
	Fri, 12 May 2017 19:30:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 2F156824
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 2F156824
Received: from red.redhat.com (ovpn-125-65.rdu2.redhat.com [10.10.125.65])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 93CF519810;
	Fri, 12 May 2017 19:30:18 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Date: Fri, 12 May 2017 14:30:15 -0500
Message-Id: <20170512193015.22155-1-eblake@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 12 May 2017 19:30:20 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] block: Correct documentation for
 BLOCK_WRITE_THRESHOLD
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
X-List-Received-Date: Fri, 12 May 2017 19:30:29 -0000

Use the correct command name.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 qapi/block-core.json | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 614181b..206e33b 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -3582,7 +3582,7 @@
 # means the device should be extended to avoid pausing for
 # disk exhaustion.
 # The event is one shot. Once triggered, it needs to be
-# re-registered with another block-set-threshold command.
+# re-registered with another block-set-write-threshold command.
 #
 # @node-name: graph node name on which the threshold was exceeded.
 #
-- 
2.9.3


