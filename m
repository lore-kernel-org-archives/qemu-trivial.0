Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XIJSt-0000bi-7r
	for mharc-qemu-trivial@gnu.org; Fri, 15 Aug 2014 11:30:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33422)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XIJSl-0000X2-Mv
	for qemu-trivial@nongnu.org; Fri, 15 Aug 2014 11:30:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XIJSh-0002IF-Bl
	for qemu-trivial@nongnu.org; Fri, 15 Aug 2014 11:30:43 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:44128)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XIJSX-0002Bg-JT; Fri, 15 Aug 2014 11:30:29 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id CBAF443050;
	Fri, 15 Aug 2014 19:30:28 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 7D8166E5;
	Fri, 15 Aug 2014 19:15:14 +0400 (MSK)
Received: (nullmailer pid 17910 invoked by uid 1000);
	Fri, 15 Aug 2014 15:15:13 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri, 15 Aug 2014 19:14:55 +0400
Message-Id: <1408115711-17836-5-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1408115711-17836-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1408115711-17836-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 04/20] pci-host: update obsolete reference
	about piix_pci.c
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
X-List-Received-Date: Fri, 15 Aug 2014 15:30:49 -0000

From: Gonglei <arei.gonglei@huawei.com>

piix_pci.c has been renamed into piix.c at commit
c0907c9e6417cb959dfd9ef6873221536ec91351

update the obsolete reference.

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/isa/lpc_ich9.c         |    2 +-
 hw/pci-host/pam.c         |    2 +-
 hw/pci-host/q35.c         |    2 +-
 include/hw/pci-host/pam.h |    2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index b846d81..177023b 100644
--- a/hw/isa/lpc_ich9.c
+++ b/hw/isa/lpc_ich9.c
@@ -7,7 +7,7 @@
  *               VA Linux Systems Japan K.K.
  * Copyright (C) 2012 Jason Baron <jbaron@redhat.com>
  *
- * This is based on piix_pci.c, but heavily modified.
+ * This is based on piix.c, but heavily modified.
  *
  * Permission is hereby granted, free of charge, to any person obtaining a copy
  * of this software and associated documentation files (the "Software"), to deal
diff --git a/hw/pci-host/pam.c b/hw/pci-host/pam.c
index e1e95aa..6abee4f 100644
--- a/hw/pci-host/pam.c
+++ b/hw/pci-host/pam.c
@@ -6,7 +6,7 @@
  *                    VA Linux Systems Japan K.K.
  * Copyright (c) 2012 Jason Baron <jbaron@redhat.com>
  *
- * Split out from piix_pci.c
+ * Split out from piix.c
  *
  * Permission is hereby granted, free of charge, to any person obtaining a copy
  * of this software and associated documentation files (the "Software"), to deal
diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
index a0a3068..37f228e 100644
--- a/hw/pci-host/q35.c
+++ b/hw/pci-host/q35.c
@@ -7,7 +7,7 @@
  *               VA Linux Systems Japan K.K.
  * Copyright (C) 2012 Jason Baron <jbaron@redhat.com>
  *
- * This is based on piix_pci.c, but heavily modified.
+ * This is based on piix.c, but heavily modified.
  *
  * Permission is hereby granted, free of charge, to any person obtaining a copy
  * of this software and associated documentation files (the "Software"), to deal
diff --git a/include/hw/pci-host/pam.h b/include/hw/pci-host/pam.h
index a8b87b8..4d03e4b 100644
--- a/include/hw/pci-host/pam.h
+++ b/include/hw/pci-host/pam.h
@@ -7,7 +7,7 @@
  *               VA Linux Systems Japan K.K.
  * Copyright (c) 2012 Jason Baron <jbaron@redhat.com>
  *
- * Split out from piix_pci.c
+ * Split out from piix.c
  *
  * Permission is hereby granted, free of charge, to any person obtaining a copy
  * of this software and associated documentation files (the "Software"), to deal
-- 
1.7.10.4


