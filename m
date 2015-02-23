Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YPtpy-0007BU-HV
	for mharc-qemu-trivial@gnu.org; Mon, 23 Feb 2015 09:18:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54457)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>) id 1YPtpv-00078H-Sc
	for qemu-trivial@nongnu.org; Mon, 23 Feb 2015 09:18:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>) id 1YPtpq-000890-4Q
	for qemu-trivial@nongnu.org; Mon, 23 Feb 2015 09:18:15 -0500
Received: from e7.ny.us.ibm.com ([32.97.182.137]:38087)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>) id 1YPtpq-00083k-0n
	for qemu-trivial@nongnu.org; Mon, 23 Feb 2015 09:18:10 -0500
Received: from /spool/local
	by e7.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <stefanb@linux.vnet.ibm.com>;
	Mon, 23 Feb 2015 09:17:46 -0500
Received: from d01dlp01.pok.ibm.com (9.56.250.166)
	by e7.ny.us.ibm.com (192.168.1.107) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Mon, 23 Feb 2015 09:17:43 -0500
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
	[9.57.198.28])
	by d01dlp01.pok.ibm.com (Postfix) with ESMTP id 2586C38C805F;
	Mon, 23 Feb 2015 09:17:48 -0500 (EST)
Received: from d01av02.pok.ibm.com (d01av02.pok.ibm.com [9.56.224.216])
	by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
	t1NEHgwU29294722; Mon, 23 Feb 2015 14:17:42 GMT
Received: from d01av02.pok.ibm.com (localhost [127.0.0.1])
	by d01av02.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
	t1NEHfm4002889; Mon, 23 Feb 2015 09:17:41 -0500
Received: from localhost.localdomain (dhcp-9-2-140-32.watson.ibm.com
	[9.2.140.32])
	by d01av02.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
	t1NEHevv002873; Mon, 23 Feb 2015 09:17:41 -0500
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
To: qemu-trivial@nongnu.org
Date: Mon, 23 Feb 2015 09:17:34 -0500
Message-Id: <1424701054-26192-1-git-send-email-stefanb@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.9.3
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15022314-0037-0000-0000-000000B22F23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 32.97.182.137
Cc: qemu-devel@nongnu.org, Stefan Berger <stefanb@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PATCH] Add copyright and author after file split
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 23 Feb 2015 14:18:16 -0000

Signed-off-by: Stefan Berger <stefanb@linux.vnet.ibm.com>

---
 migration/qemu-file-buf.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/migration/qemu-file-buf.c b/migration/qemu-file-buf.c
index e97e0bd..e56a8ad 100644
--- a/migration/qemu-file-buf.c
+++ b/migration/qemu-file-buf.c
@@ -2,6 +2,10 @@
  * QEMU System Emulator
  *
  * Copyright (c) 2003-2008 Fabrice Bellard
+ * Copyright (c) 2014 IBM Corp.
+ *
+ * Authors:
+ *  Stefan Berger <stefanb@linux.vnet.ibm.com>
  *
  * Permission is hereby granted, free of charge, to any person obtaining a copy
  * of this software and associated documentation files (the "Software"), to deal
-- 
1.9.3


