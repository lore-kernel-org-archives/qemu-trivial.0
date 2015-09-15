Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zblu4-00067P-JA
	for mharc-qemu-trivial@gnu.org; Tue, 15 Sep 2015 04:47:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36617)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1Zblu1-000655-R6
	for qemu-trivial@nongnu.org; Tue, 15 Sep 2015 04:47:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1Zblu1-0007Bz-2p
	for qemu-trivial@nongnu.org; Tue, 15 Sep 2015 04:47:49 -0400
Received: from mail-wi0-x22c.google.com ([2a00:1450:400c:c05::22c]:37845)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1Zbltv-00079p-2u; Tue, 15 Sep 2015 04:47:43 -0400
Received: by wicfx3 with SMTP id fx3so16898566wic.0;
	Tue, 15 Sep 2015 01:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=QKRwxSOX81dIPJayPqIiIUEh29ywYD6Ns11VcwQCc/A=;
	b=VNSG1Hhl0dCzkkc/qIRWWgLsmNLQl+26HbmwhLmfMnDm7xBmVs3v2np0Q9A0GF08CW
	nIe1PONUBbo457Mfcse6nBEoo5RrJQ89zja+opxEpYAcJvkVahM11jesHewihKG8/bAF
	da1v3sQrRfYIb0NHC+8Z2D7KY2/KBshIIaL1qNalabjePTkE1OYlCNN6OePgdixjeMeX
	j3e531hdINRlMyq7jkqM11O7aHUVcPKrxhWlpkHkCHEEQ+ECpTf+YqMjXeytf+lXaUZY
	4hOtqm/NwFkYrbGlG2PzSUHZ0qqvKAs4tUnQB0490iDoyACyu7nN5/SLjJw6jQL36eFQ
	ak4A==
X-Received: by 10.194.87.74 with SMTP id v10mr29748827wjz.114.1442306862444;
	Tue, 15 Sep 2015 01:47:42 -0700 (PDT)
Received: from donizetti.lan. ([94.39.138.45])
	by smtp.gmail.com with ESMTPSA id
	hk5sm19857193wjb.6.2015.09.15.01.47.41
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Sep 2015 01:47:41 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 15 Sep 2015 10:47:36 +0200
Message-Id: <1442306856-11153-1-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 2.5.0
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::22c
Cc: qemu-trivial@nongnu.org, Houcheng Lin <houcheng@gmail.com>
Subject: [Qemu-trivial] [PATCH] pci-assign: do not include sys/io.h
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
X-List-Received-Date: Tue, 15 Sep 2015 08:47:50 -0000

This file does not exist on bionic libc and the functions it defines
are in fact not used by pci-assign.c.  Remove it.

Reported-by: Houcheng Lin <houcheng@gmail.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/i386/kvm/pci-assign.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/i386/kvm/pci-assign.c b/hw/i386/kvm/pci-assign.c
index 57f14f1..3df8e6c 100644
--- a/hw/i386/kvm/pci-assign.c
+++ b/hw/i386/kvm/pci-assign.c
@@ -22,7 +22,6 @@
  */
 #include <stdio.h>
 #include <unistd.h>
-#include <sys/io.h>
 #include <sys/mman.h>
 #include <sys/types.h>
 #include <sys/stat.h>
-- 
2.5.0


