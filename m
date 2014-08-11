Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XGkhg-000265-3G
	for mharc-qemu-trivial@gnu.org; Mon, 11 Aug 2014 04:11:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38676)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XGkhZ-0001sz-Et
	for qemu-trivial@nongnu.org; Mon, 11 Aug 2014 04:11:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XGkhU-00027w-Gz
	for qemu-trivial@nongnu.org; Mon, 11 Aug 2014 04:11:33 -0400
Received: from szxga01-in.huawei.com ([119.145.14.64]:60189)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1XGkhF-00024f-T3; Mon, 11 Aug 2014 04:11:14 -0400
Received: from 172.24.2.119 (EHLO szxeml463-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CAC25410; Mon, 11 Aug 2014 16:11:04 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml463-hub.china.huawei.com
	(10.82.67.206) with Microsoft SMTP Server id 14.3.158.1;
	Mon, 11 Aug 2014 16:10:57 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Mon, 11 Aug 2014 16:10:25 +0800
Message-ID: <1407744626-4984-2-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
In-Reply-To: <1407744626-4984-1-git-send-email-arei.gonglei@huawei.com>
References: <1407744626-4984-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com,
	Gonglei <arei.gonglei@huawei.com>, weidong.huang@huawei.com, mst@redhat.com
Subject: [Qemu-trivial] [PATCH 1/2] pci-host: update obsolete reference
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
X-List-Received-Date: Mon, 11 Aug 2014 08:11:38 -0000

From: Gonglei <arei.gonglei@huawei.com>

piix_pci.c has been renamed into piix.c at commit
c0907c9e6417cb959dfd9ef6873221536ec91351

update the obsolete reference.

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
 hw/isa/lpc_ich9.c         | 2 +-
 hw/pci-host/pam.c         | 2 +-
 hw/pci-host/q35.c         | 2 +-
 include/hw/pci-host/pam.h | 2 +-
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
1.7.12.4



