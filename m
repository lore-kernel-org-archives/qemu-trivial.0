Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QFStq-0005gn-TM
	for mharc-qemu-trivial@gnu.org; Thu, 28 Apr 2011 11:13:02 -0400
Received: from eggs.gnu.org ([140.186.70.92]:55476)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arun.thomas@gmail.com>) id 1QFSto-0005fc-Mm
	for qemu-trivial@nongnu.org; Thu, 28 Apr 2011 11:13:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arun.thomas@gmail.com>) id 1QFStn-0005JH-Tm
	for qemu-trivial@nongnu.org; Thu, 28 Apr 2011 11:13:00 -0400
Received: from mail-ew0-f45.google.com ([209.85.215.45]:59607)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arun.thomas@gmail.com>) id 1QFStn-0005J5-Pc
	for qemu-trivial@nongnu.org; Thu, 28 Apr 2011 11:12:59 -0400
Received: by ewy24 with SMTP id 24so1006825ewy.4
	for <qemu-trivial@nongnu.org>; Thu, 28 Apr 2011 08:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=Jg5IZJYwp2hlAUfNbgjy67HcKfVvmuAaxWBthhMqG2c=;
	b=OZlxOn2UsA4ASZX9kTjBZ73kbFqSPGKELqK/A1GjU7/tlJaP2DLeDpzEBnZ9Fcd7cQ
	1SJ+EXwk6nYBCawTd7J0n+xUfaHJ20x5yWjvEMjxtRrgjZXH9NHc6BCB7Irfuz+feQq9
	H5mPTXLpr7fm66PsVRzWPoQYEIodcq72oEifM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=gMdoLwOdRJGN4iclvkbcOYZnZhcvGvEOE/7Eu+1ehjUZ2i1ykpu6MLHTbN2UHc2peX
	xTcqqXfWd5QCBWQ9KApTzNVG0wCqN+nfQHO7bUxCl9DXw8080ZFg814A9lVwxk8pq6hd
	E5mXvmbiueB5RrfFJUkqz+W92JppJLOIuL8M4=
Received: by 10.213.111.13 with SMTP id q13mr1578850ebp.31.1304003578757;
	Thu, 28 Apr 2011 08:12:58 -0700 (PDT)
Received: from localhost.localdomain (skeletor.few.vu.nl [130.37.31.216])
	by mx.google.com with ESMTPS id u1sm1345258eeh.27.2011.04.28.08.12.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 28 Apr 2011 08:12:58 -0700 (PDT)
From: Arun Thomas <arun.thomas@gmail.com>
To: qemu-trivial@nongnu.org
Date: Thu, 28 Apr 2011 17:12:53 +0200
Message-Id: <1304003573-11910-1-git-send-email-arun.thomas@gmail.com>
X-Mailer: git-send-email 1.7.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.215.45
Cc: Arun Thomas <arun.thomas@gmail.com>
Subject: [Qemu-trivial] [PATCH] multiboot: set boot_device to first partition
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
X-List-Received-Date: Thu, 28 Apr 2011 15:13:01 -0000

The multiboot info struct's 'boot_device' field has 'part1' set to 0x01, which
maps to the second primary partition. To specify the first primary partition,
'part1' should be set to 0x00, since partition numbers start from zero
according to the multiboot spec.

Signed-off-by: Arun Thomas <arun.thomas@gmail.com>

---
 hw/multiboot.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/hw/multiboot.c b/hw/multiboot.c
index 394ed01..6e6cfb9 100644
--- a/hw/multiboot.c
+++ b/hw/multiboot.c
@@ -307,7 +307,7 @@ int load_multiboot(void *fw_cfg,
                                 | MULTIBOOT_FLAGS_MMAP);
     stl_p(bootinfo + MBI_MEM_LOWER,   640);
     stl_p(bootinfo + MBI_MEM_UPPER,   (ram_size / 1024) - 1024);
-    stl_p(bootinfo + MBI_BOOT_DEVICE, 0x8001ffff); /* XXX: use the -boot switch? */
+    stl_p(bootinfo + MBI_BOOT_DEVICE, 0x8000ffff); /* XXX: use the -boot switch? */
     stl_p(bootinfo + MBI_MMAP_ADDR,   ADDR_E820_MAP);
 
     mb_debug("multiboot: mh_entry_addr = %#x\n", mh_entry_addr);
-- 
tg: (d16e0f0..) bootdev (depends on: master)

