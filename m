Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1igqRg-0002xj-L0
	for mharc-qemu-trivial@gnu.org; Mon, 16 Dec 2019 08:29:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47397)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1igqRe-0002xW-Ij
 for qemu-trivial@nongnu.org; Mon, 16 Dec 2019 08:29:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1igqRd-0003FN-95
 for qemu-trivial@nongnu.org; Mon, 16 Dec 2019 08:29:54 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:27867
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1igqRd-0003D7-6A
 for qemu-trivial@nongnu.org; Mon, 16 Dec 2019 08:29:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576502992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3kaJcfh0spaMxjl6LwdbDaL7zBIZf7w01TlpxB0raCQ=;
 b=C7SJOCddmkPo7/QZnvLD70TvFb+3OwJ+gHIdEDLQgq/3BRReeq2jcsSa39RKOb4zK0HWvt
 qXnJcnYCMkA6645MPdduOh32dRsdD4b38t5vNdncuYaHNei5PA/6xCrdnSw3gLM2K6cuTY
 K6QqTcXFU8yS4UEMm8XLgBPB/lc7XsA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223-_r_D6h3EN-eHUwkt-LGveQ-1; Mon, 16 Dec 2019 08:29:48 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A6DCD100DF2F;
 Mon, 16 Dec 2019 13:29:47 +0000 (UTC)
Received: from thuth.com (ovpn-117-164.ams2.redhat.com [10.36.117.164])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 55A3126343;
 Mon, 16 Dec 2019 13:29:45 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Michael Roth <mdroth@linux.vnet.ibm.com>,
	qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH] qemu-doc: Remove the unused "Guest Agent" node
Date: Mon, 16 Dec 2019 14:29:41 +0100
Message-Id: <20191216132941.25729-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: _r_D6h3EN-eHUwkt-LGveQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Dec 2019 13:29:55 -0000

The node has been removed from the texi file some months ago, so we
should remove it from the menu section, too.

Fixes: 27a296fce982 ("qemu-ga: Convert invocation documentation to rST")
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 qemu-doc.texi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/qemu-doc.texi b/qemu-doc.texi
index 3ddf5c0a68..4b62b23264 100644
--- a/qemu-doc.texi
+++ b/qemu-doc.texi
@@ -38,7 +38,6 @@
 * Introduction::
 * QEMU PC System emulator::
 * QEMU System emulator for non PC targets::
-* QEMU Guest Agent::
 * QEMU User space emulator::
 * System requirements::
 * Security::
--=20
2.18.1


