Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e2vjV-0003su-Ik
	for mharc-qemu-trivial@gnu.org; Fri, 13 Oct 2017 04:54:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34664)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1e2vjT-0003rH-Qz
	for qemu-trivial@nongnu.org; Fri, 13 Oct 2017 04:54:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1e2vjT-0000np-1Q
	for qemu-trivial@nongnu.org; Fri, 13 Oct 2017 04:54:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33110)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <famz@redhat.com>)
	id 1e2vjP-0000kX-0I; Fri, 13 Oct 2017 04:54:11 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 01CC4C047B97;
	Fri, 13 Oct 2017 08:54:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 01CC4C047B97
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=famz@redhat.com
Received: from lemon.redhat.com (ovpn-12-113.pek2.redhat.com [10.72.12.113])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0246960841;
	Fri, 13 Oct 2017 08:54:06 +0000 (UTC)
From: Fam Zheng <famz@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Date: Fri, 13 Oct 2017 16:53:55 +0800
Message-Id: <20171013085355.7563-4-famz@redhat.com>
In-Reply-To: <20171013085355.7563-1-famz@redhat.com>
References: <20171013085355.7563-1-famz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Fri, 13 Oct 2017 08:54:10 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH v2 3/3] MAINTAINERS: Track
 default-configs/pci.mak
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
X-List-Received-Date: Fri, 13 Oct 2017 08:54:16 -0000

Suggested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Fam Zheng <famz@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3938ccbf8a..7cb237babc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -934,6 +934,7 @@ F: hw/pci/*
 F: hw/pci-bridge/*
 F: docs/pci*
 F: docs/specs/*pci*
+F: default-configs/pci.mak
 
 ACPI/SMBIOS
 M: Michael S. Tsirkin <mst@redhat.com>
-- 
2.13.5


