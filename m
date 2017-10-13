Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e2oio-0004XB-93
	for mharc-qemu-trivial@gnu.org; Thu, 12 Oct 2017 21:25:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44690)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1e2oil-0004Uv-UD
	for qemu-trivial@nongnu.org; Thu, 12 Oct 2017 21:25:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1e2oil-00014f-4Z
	for qemu-trivial@nongnu.org; Thu, 12 Oct 2017 21:25:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59474)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <famz@redhat.com>)
	id 1e2oii-00010p-N9; Thu, 12 Oct 2017 21:25:00 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C5FF5883C2;
	Fri, 13 Oct 2017 01:24:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com C5FF5883C2
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=famz@redhat.com
Received: from lemon.redhat.com (ovpn-12-49.pek2.redhat.com [10.72.12.49])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 616F25D9CB;
	Fri, 13 Oct 2017 01:24:58 +0000 (UTC)
From: Fam Zheng <famz@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Date: Fri, 13 Oct 2017 09:24:54 +0800
Message-Id: <20171013012455.10737-2-famz@redhat.com>
In-Reply-To: <20171013012455.10737-1-famz@redhat.com>
References: <20171013012455.10737-1-famz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Fri, 13 Oct 2017 01:24:59 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 1/2] MAINTAINERS: Fix scsi path
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
X-List-Received-Date: Fri, 13 Oct 2017 01:25:04 -0000

Signed-off-by: Fam Zheng <famz@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 772ac209e1..da3c78df47 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -982,7 +982,7 @@ S: Supported
 F: include/hw/scsi/*
 F: include/scsi/*
 F: hw/scsi/*
-F: util/scsi*
+F: scsi/*
 F: tests/virtio-scsi-test.c
 T: git git://github.com/bonzini/qemu.git scsi-next
 
-- 
2.13.5


