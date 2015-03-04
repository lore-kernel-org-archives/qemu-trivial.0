Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YTF63-0006hu-Ie
	for mharc-qemu-trivial@gnu.org; Wed, 04 Mar 2015 14:36:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43160)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTF60-0006dT-RN
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 14:36:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTF60-0001UO-0B
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 14:36:40 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:51923)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YTF5u-0001SD-GB; Wed, 04 Mar 2015 14:36:34 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 9F752408F7;
	Wed,  4 Mar 2015 22:36:31 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 6BDCF944;
	Wed,  4 Mar 2015 20:07:07 +0300 (MSK)
Received: (nullmailer pid 17501 invoked by uid 1000);
	Wed, 04 Mar 2015 17:07:05 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  4 Mar 2015 20:06:26 +0300
Message-Id: <93e4e5c47ce0b71c7ee0e7f8c84d4630e0d180c7.1425488753.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
References: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PULL 09/47] Add copyright and author after file
	split
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
X-List-Received-Date: Wed, 04 Mar 2015 19:36:41 -0000

From: Stefan Berger <stefanb@linux.vnet.ibm.com>

Signed-off-by: Stefan Berger <stefanb@linux.vnet.ibm.com>
Reviewed-by:  Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
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
2.1.4


