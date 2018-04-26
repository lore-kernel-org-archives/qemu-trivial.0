Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fBcXH-0001QR-K7
	for mharc-qemu-trivial@gnu.org; Thu, 26 Apr 2018 04:45:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42460)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcel@redhat.com>) id 1fBcXA-0001Ki-T0
	for qemu-trivial@nongnu.org; Thu, 26 Apr 2018 04:45:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcel@redhat.com>) id 1fBcXA-0002N5-1A
	for qemu-trivial@nongnu.org; Thu, 26 Apr 2018 04:45:44 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:51618 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcel@redhat.com>)
	id 1fBcX4-0002Jr-8m; Thu, 26 Apr 2018 04:45:38 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 72A49406C74B;
	Thu, 26 Apr 2018 08:45:32 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.35.206.57])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 22E7610EE6C7;
	Thu, 26 Apr 2018 08:45:24 +0000 (UTC)
From: Marcel Apfelbaum <marcel@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: ehabkost@redhat.com,
	yuval.shaia@oracle.com,
	mst@redhat.com
Date: Thu, 26 Apr 2018 11:45:23 +0300
Message-Id: <20180426084523.10565-1-marcel@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Thu, 26 Apr 2018 08:45:32 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Thu, 26 Apr 2018 08:45:32 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'marcel@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-trivial] [Qemu-devel] [PATCH] MAINTAINERS: update Marcel
 Apfelbaum email
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
X-List-Received-Date: Thu, 26 Apr 2018 08:45:49 -0000

Use my gmail account for maintainer tasks.

Signed-off-by: Marcel Apfelbaum <marcel@redhat.com>
---
 MAINTAINERS | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 24b70169bc..459e3594e1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -909,7 +909,7 @@ X86 Machines
 ------------
 PC
 M: Michael S. Tsirkin <mst@redhat.com>
-M: Marcel Apfelbaum <marcel@redhat.com>
+M: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
 S: Supported
 F: include/hw/i386/
 F: hw/i386/
@@ -959,7 +959,7 @@ F: include/hw/timer/mc146818rtc*
 
 Machine core
 M: Eduardo Habkost <ehabkost@redhat.com>
-M: Marcel Apfelbaum <marcel@redhat.com>
+M: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
 S: Supported
 F: hw/core/machine.c
 F: hw/core/null-machine.c
@@ -1033,7 +1033,7 @@ F: hw/ipack/
 
 PCI
 M: Michael S. Tsirkin <mst@redhat.com>
-M: Marcel Apfelbaum <marcel@redhat.com>
+M: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
 S: Supported
 F: include/hw/pci/*
 F: hw/misc/pci-testdev.c
@@ -2075,7 +2075,7 @@ F: docs/block-replication.txt
 
 PVRDMA
 M: Yuval Shaia <yuval.shaia@oracle.com>
-M: Marcel Apfelbaum <marcel@redhat.com>
+M: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
 S: Maintained
 F: hw/rdma/*
 F: hw/rdma/vmw/*
-- 
2.13.6


