Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dQcBn-0002WR-Pv
	for mharc-qemu-trivial@gnu.org; Thu, 29 Jun 2017 12:21:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59222)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1dQcBl-0002V6-5L
	for qemu-trivial@nongnu.org; Thu, 29 Jun 2017 12:21:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1dQcBk-0005Si-2B
	for qemu-trivial@nongnu.org; Thu, 29 Jun 2017 12:21:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47760)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1dQcBe-0005OX-Qx; Thu, 29 Jun 2017 12:20:58 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E7AF0F5CE;
	Thu, 29 Jun 2017 16:20:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com E7AF0F5CE
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=berrange@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com E7AF0F5CE
Received: from t460.redhat.com (ovpn-117-156.ams2.redhat.com [10.36.117.156])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5D8AF5D6A6;
	Thu, 29 Jun 2017 16:20:51 +0000 (UTC)
From: "Daniel P. Berrange" <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, qemu-trivial@nongnu.org,
	"Daniel P. Berrange" <berrange@redhat.com>
Date: Thu, 29 Jun 2017 17:20:46 +0100
Message-Id: <20170629162046.4135-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 29 Jun 2017 16:20:58 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] backends: remove empty trace-events file
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
X-List-Received-Date: Thu, 29 Jun 2017 16:21:06 -0000

The content of the backends/trace-events file was entirely
removed in

  commit 6b10e573d15ef82dbc5c5b3726028e6642e134f6
  Author: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
  Date:   Mon May 29 12:39:42 2017 +0400

    char: move char devices to chardev/

Leaving the empty file around, causes tracetool to generate
an empty .dtrace file which makes the dtrace compiler throw
a syntax error.

Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
---
 Makefile.objs         | 1 -
 backends/trace-events | 0
 2 files changed, 1 deletion(-)
 delete mode 100644 backends/trace-events

diff --git a/Makefile.objs b/Makefile.objs
index b2e6322..8004d6d 100644
--- a/Makefile.objs
+++ b/Makefile.objs
@@ -122,7 +122,6 @@ trace-events-subdirs +=3D crypto
 trace-events-subdirs +=3D io
 trace-events-subdirs +=3D migration
 trace-events-subdirs +=3D block
-trace-events-subdirs +=3D backends
 trace-events-subdirs +=3D chardev
 trace-events-subdirs +=3D hw/block
 trace-events-subdirs +=3D hw/block/dataplane
diff --git a/backends/trace-events b/backends/trace-events
deleted file mode 100644
index e69de29..0000000
--=20
2.9.4


