Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d3vZP-0001rX-P1
	for mharc-qemu-trivial@gnu.org; Thu, 27 Apr 2017 22:23:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35548)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1d3vZM-0001q0-OF
	for qemu-trivial@nongnu.org; Thu, 27 Apr 2017 22:23:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1d3vZL-0008U8-UL
	for qemu-trivial@nongnu.org; Thu, 27 Apr 2017 22:23:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45720)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1d3vZF-0008Os-T9; Thu, 27 Apr 2017 22:23:34 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 87044BDD4;
	Fri, 28 Apr 2017 02:23:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 87044BDD4
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 87044BDD4
Received: from red.redhat.com (ovpn-123-177.rdu2.redhat.com [10.10.123.177])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C62C48498E;
	Fri, 28 Apr 2017 02:23:31 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	thuth@redhat.com,
	dgilbert@redhat.com
Date: Thu, 27 Apr 2017 21:23:29 -0500
Message-Id: <20170428022329.30726-1-eblake@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 28 Apr 2017 02:23:32 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] tests: Ignore another built executable
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
X-List-Received-Date: Fri, 28 Apr 2017 02:23:41 -0000

Commit 78f86a2b7 added a new test, but forgot to exclude the built
binary from version control.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 tests/.gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/.gitignore b/tests/.gitignore
index 5ab00a9..40c2e3e 100644
--- a/tests/.gitignore
+++ b/tests/.gitignore
@@ -40,6 +40,7 @@ test-crypto-tlssession-server/
 test-crypto-xts
 test-cutils
 test-hbitmap
+test-hmp
 test-int128
 test-iov
 test-io-channel-buffer
-- 
2.9.3


