Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e2oip-0004YP-Et
	for mharc-qemu-trivial@gnu.org; Thu, 12 Oct 2017 21:25:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44709)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1e2oin-0004Vw-AF
	for qemu-trivial@nongnu.org; Thu, 12 Oct 2017 21:25:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1e2oim-000171-JT
	for qemu-trivial@nongnu.org; Thu, 12 Oct 2017 21:25:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59518)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <famz@redhat.com>)
	id 1e2oik-00012N-J1; Thu, 12 Oct 2017 21:25:02 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9F007883B8;
	Fri, 13 Oct 2017 01:25:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 9F007883B8
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=famz@redhat.com
Received: from lemon.redhat.com (ovpn-12-49.pek2.redhat.com [10.72.12.49])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 60F635D9CB;
	Fri, 13 Oct 2017 01:25:00 +0000 (UTC)
From: Fam Zheng <famz@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Date: Fri, 13 Oct 2017 09:24:55 +0800
Message-Id: <20171013012455.10737-3-famz@redhat.com>
In-Reply-To: <20171013012455.10737-1-famz@redhat.com>
References: <20171013012455.10737-1-famz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Fri, 13 Oct 2017 01:25:01 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 2/2] MAINTAINERS: Drop Sun4v nonexistent file
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
X-List-Received-Date: Fri, 13 Oct 2017 01:25:06 -0000

Signed-off-by: Fam Zheng <famz@redhat.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index da3c78df47..731c5c7ec2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -778,7 +778,6 @@ F: pc-bios/openbios-sparc64
 Sun4v
 M: Artyom Tarasenko <atar4qemu@gmail.com>
 S: Maintained
-F: hw/sparc64/sun4v.c
 F: hw/timer/sun4v-rtc.c
 F: include/hw/timer/sun4v-rtc.h
 
-- 
2.13.5


