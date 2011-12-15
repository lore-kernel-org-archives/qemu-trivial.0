Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RbC2H-0006xE-LX
	for mharc-qemu-trivial@gnu.org; Thu, 15 Dec 2011 09:11:49 -0500
Received: from eggs.gnu.org ([140.186.70.92]:42398)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1RbC2F-0006wu-Kq
	for qemu-trivial@nongnu.org; Thu, 15 Dec 2011 09:11:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1RbC2A-0005kl-3b
	for qemu-trivial@nongnu.org; Thu, 15 Dec 2011 09:11:47 -0500
Received: from mail-gy0-f173.google.com ([209.85.160.173]:55139)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1RbC1y-0005jG-JK; Thu, 15 Dec 2011 09:11:30 -0500
Received: by ghbg19 with SMTP id g19so1812597ghb.4
	for <multiple recipients>; Thu, 15 Dec 2011 06:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=rASJGHbZmMcpORLOnG+kvahTNMcUldGJsdRe2MBzu9o=;
	b=p6Sbt/mpkpY+0fuqeECyx6mNO23pjX1NgRYYdYIL6k8+0eR+rpqe3JvRqXIIH2fQb8
	jwwWsyPnnilsLWUk02gGk8Fe8CJ6JffW/XdNn7tPVMvwgv5Ld1PhjLHGWP2JKUKjO6+k
	awT9/kUPRCdjyEg7WqTj2OdJXz2CrYIk5Hscc=
Received: by 10.101.176.6 with SMTP id d6mr1395132anp.26.1323958289112;
	Thu, 15 Dec 2011 06:11:29 -0800 (PST)
Received: from localhost.localdomain (93-34-178-147.ip50.fastwebnet.it.
	[93.34.178.147])
	by mx.google.com with ESMTPS id q5sm9192838yhm.7.2011.12.15.06.11.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Dec 2011 06:11:27 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 15 Dec 2011 15:11:16 +0100
Message-Id: <1323958276-29225-1-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.7.7.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.160.173
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] ide: drop argument to dma_buf_commit
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
X-List-Received-Date: Thu, 15 Dec 2011 14:11:48 -0000

The argument is unused and even wrong when the function is called
by ide_handle_rw_error.  Drop it.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/ide/core.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/ide/core.c b/hw/ide/core.c
index de9ed41..56b219b 100644
--- a/hw/ide/core.c
+++ b/hw/ide/core.c
@@ -493,7 +493,7 @@ void ide_sector_read(IDEState *s)
     }
 }
 
-static void dma_buf_commit(IDEState *s, int is_write)
+static void dma_buf_commit(IDEState *s)
 {
     qemu_sglist_destroy(&s->sg);
 }
@@ -532,7 +532,7 @@ static int ide_handle_rw_error(IDEState *s, int error, int op)
         bdrv_iostatus_set_err(s->bs, error);
     } else {
         if (op & BM_STATUS_DMA_RETRY) {
-            dma_buf_commit(s, 0);
+            dma_buf_commit(s);
             ide_dma_error(s);
         } else {
             ide_rw_error(s);
@@ -565,7 +565,7 @@ void ide_dma_cb(void *opaque, int ret)
     n = s->io_buffer_size >> 9;
     sector_num = ide_get_sector(s);
     if (n > 0) {
-        dma_buf_commit(s, ide_cmd_is_read(s));
+        dma_buf_commit(s);
         sector_num += n;
         ide_set_sector(s, sector_num);
         s->nsector -= n;
-- 
1.7.7.1


