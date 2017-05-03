Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d5rYO-0005jx-GJ
	for mharc-qemu-trivial@gnu.org; Wed, 03 May 2017 06:30:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54964)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1d5rYJ-0005iW-VT
	for qemu-trivial@nongnu.org; Wed, 03 May 2017 06:30:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1d5rYJ-0003yu-39
	for qemu-trivial@nongnu.org; Wed, 03 May 2017 06:30:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36360)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1d5rYB-0003vd-8s; Wed, 03 May 2017 06:30:27 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 08CCF3B714;
	Wed,  3 May 2017 10:30:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 08CCF3B714
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=pbonzini@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 08CCF3B714
Received: from donizetti.redhat.com (ovpn-118-18.ams2.redhat.com
	[10.36.118.18] (may be forged))
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v43AUNmQ018256; Wed, 3 May 2017 06:30:24 -0400
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, qemu-trivial@nongnu.org, famz@redhat.com
Date: Wed,  3 May 2017 12:30:23 +0200
Message-Id: <20170503103023.9247-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Wed, 03 May 2017 10:30:26 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] MAINTAINERS: Update paths for AioContext
 implementation
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
X-List-Received-Date: Wed, 03 May 2017 10:30:36 -0000

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 46cf4870f9..62d62a6675 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1177,8 +1177,8 @@ M: Stefan Hajnoczi <stefanha@redhat.com>
 M: Fam Zheng <famz@redhat.com>
 L: qemu-block@nongnu.org
 S: Supported
-F: async.c
-F: aio-*.c
+F: util/async.c
+F: util/aio-*.c
 F: block/io.c
 F: migration/block*
 F: include/block/aio.h
-- 
2.12.2


