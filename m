Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e2vjM-0003nL-PM
	for mharc-qemu-trivial@gnu.org; Fri, 13 Oct 2017 04:54:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34603)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1e2vjL-0003m3-Bc
	for qemu-trivial@nongnu.org; Fri, 13 Oct 2017 04:54:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1e2vjK-0000fD-HU
	for qemu-trivial@nongnu.org; Fri, 13 Oct 2017 04:54:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37080)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <famz@redhat.com>)
	id 1e2vjI-0000aG-Cx; Fri, 13 Oct 2017 04:54:04 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 575157EAB0;
	Fri, 13 Oct 2017 08:54:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 575157EAB0
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=famz@redhat.com
Received: from lemon.redhat.com (ovpn-12-113.pek2.redhat.com [10.72.12.113])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3D9C760841;
	Fri, 13 Oct 2017 08:53:59 +0000 (UTC)
From: Fam Zheng <famz@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Date: Fri, 13 Oct 2017 16:53:53 +0800
Message-Id: <20171013085355.7563-2-famz@redhat.com>
In-Reply-To: <20171013085355.7563-1-famz@redhat.com>
References: <20171013085355.7563-1-famz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Fri, 13 Oct 2017 08:54:03 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH v2 1/3] MAINTAINERS: Clean up SCSI device
 section
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
X-List-Received-Date: Fri, 13 Oct 2017 08:54:08 -0000

1. Remove nonexistent file util/scsi*.
2. Drop useless section for LSI53C895A.
3. Leave include/scsi to "Block SCSI subsystem" section.

Suggested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Fam Zheng <famz@redhat.com>
---
 MAINTAINERS | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 772ac209e1..18ddaf4070 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -980,16 +980,10 @@ SCSI
 M: Paolo Bonzini <pbonzini@redhat.com>
 S: Supported
 F: include/hw/scsi/*
-F: include/scsi/*
 F: hw/scsi/*
-F: util/scsi*
 F: tests/virtio-scsi-test.c
 T: git git://github.com/bonzini/qemu.git scsi-next
 
-LSI53C895A
-S: Orphan
-F: hw/scsi/lsi53c895a.c
-
 SSI
 M: Peter Crosthwaite <crosthwaite.peter@gmail.com>
 M: Alistair Francis <alistair.francis@xilinx.com>
-- 
2.13.5


