Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QrplE-0001TS-5b
	for mharc-qemu-trivial@gnu.org; Fri, 12 Aug 2011 07:18:44 -0400
Received: from eggs.gnu.org ([140.186.70.92]:52813)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1QrplB-0001Kx-8o
	for qemu-trivial@nongnu.org; Fri, 12 Aug 2011 07:18:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1QrplA-0006tw-3Q
	for qemu-trivial@nongnu.org; Fri, 12 Aug 2011 07:18:41 -0400
Received: from mail-qy0-f173.google.com ([209.85.216.173]:60781)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1Qrpl7-0006tY-UQ; Fri, 12 Aug 2011 07:18:38 -0400
Received: by qyk31 with SMTP id 31so302968qyk.4
	for <multiple recipients>; Fri, 12 Aug 2011 04:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=rrUpWuDGNMMRGjG6vQx8Nlm4isKY5xDlcRwtkPe8yQA=;
	b=CIrd1oG5qzAcXQWyLrEm+PxFWpTBPbelTfSKZhhHAGV7/jbQ8rF8tHdkwtG9mvbMOR
	/IoORY+EUWPrh+d1yyjqGPswOY/ux5r534cKNH5rXb3rU+oiRWOYII1WG9JVg3369OmU
	LXPt0u21iBU6Z3+fRHL/j7y71g9CAptDDcpv0=
Received: by 10.229.41.69 with SMTP id n5mr184272qce.279.1313147916999;
	Fri, 12 Aug 2011 04:18:36 -0700 (PDT)
Received: from localhost.localdomain (93-34-199-31.ip51.fastwebnet.it
	[93.34.199.31])
	by mx.google.com with ESMTPS id b3sm2192696qcu.28.2011.08.12.04.18.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 12 Aug 2011 04:18:36 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 12 Aug 2011 13:18:14 +0200
Message-Id: <1313147894-12524-1-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.7.6
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.216.173
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] fix QLIST usage for RAM list
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
X-List-Received-Date: Fri, 12 Aug 2011 11:18:42 -0000

Spotted while reviewing the migration thread patches.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 cpu-all.h |    2 +-
 exec.c    |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/cpu-all.h b/cpu-all.h
index fa0205c..f5c82cd 100644
--- a/cpu-all.h
+++ b/cpu-all.h
@@ -488,7 +488,7 @@ typedef struct RAMBlock {
 
 typedef struct RAMList {
     uint8_t *phys_dirty;
-    QLIST_HEAD(ram, RAMBlock) blocks;
+    QLIST_HEAD(, RAMBlock) blocks;
 } RAMList;
 extern RAMList ram_list;
 
diff --git a/exec.c b/exec.c
index 476b507..253f42c 100644
--- a/exec.c
+++ b/exec.c
@@ -110,7 +110,7 @@ static uint8_t *code_gen_ptr;
 int phys_ram_fd;
 static int in_migration;
 
-RAMList ram_list = { .blocks = QLIST_HEAD_INITIALIZER(ram_list) };
+RAMList ram_list = { .blocks = QLIST_HEAD_INITIALIZER(ram_list.blocks) };
 
 static MemoryRegion *system_memory;
 
-- 
1.7.6


