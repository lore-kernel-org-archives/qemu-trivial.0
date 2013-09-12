Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VKBYy-0007te-DJ
	for mharc-qemu-trivial@gnu.org; Thu, 12 Sep 2013 14:24:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54457)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.millescamps@6wind.com>) id 1VKBYr-0007kL-9i
	for qemu-trivial@nongnu.org; Thu, 12 Sep 2013 14:24:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <damien.millescamps@6wind.com>) id 1VKBYe-0005P1-VL
	for qemu-trivial@nongnu.org; Thu, 12 Sep 2013 14:24:13 -0400
Received: from mail-wi0-f180.google.com ([209.85.212.180]:47205)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.millescamps@6wind.com>) id 1VKBYe-0005N7-Oq
	for qemu-trivial@nongnu.org; Thu, 12 Sep 2013 14:24:00 -0400
Received: by mail-wi0-f180.google.com with SMTP id hj3so192024wib.13
	for <qemu-trivial@nongnu.org>; Thu, 12 Sep 2013 11:23:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=m9Yw3aj9Nqm2hrzzwS78en1aiC2ySJwHeWXOmmSiYk8=;
	b=bgdmn5dlhgwYdrR5S447vyeEaQEzfbB2PJbGsOdjTD6jIPr0zBRMiYqBV4QWHERMFU
	y9QCHwbNrQC3V5wdLIwtbpS+cJMekmRpAg11hagisn238ePYNC9RprByud1wC9gYFsz8
	CblSvgz43gotqnAgFeq+Xr0SlGOLXQKfDljPpes3nz4QITCaxGvmBOd8juQtfuNIkHXG
	LOSyLK3BFRe9UDVEIkK26EQysp5OQvF7gSYe7lVCHBVnbXI3pi8kwdOzcI9IQeOUCWoB
	9VwCJQydXdHySZ2Z7nZQOxeQnX7GuLiV4AJfEvDN86uJJPAUcsW6XGvq28IIkgc/qzIO
	oTAA==
X-Gm-Message-State: ALoCoQk0vkYZ3bgzLuPPTu0GMK8L6nHs7rOAznwjEb445drNsVKNfKLPaf1bIPpI3aSbTgUmXKQY
X-Received: by 10.194.5.35 with SMTP id p3mr2940847wjp.47.1379010238659;
	Thu, 12 Sep 2013 11:23:58 -0700 (PDT)
Received: from 6wind.com (guy78-3-82-239-227-177.fbx.proxad.net.
	[82.239.227.177])
	by mx.google.com with ESMTPSA id ey4sm6345335wic.11.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=RC4-SHA bits=128/128);
	Thu, 12 Sep 2013 11:23:57 -0700 (PDT)
From: Damien Millescamps <damien.millescamps@6wind.com>
To: qemu-devel@nongnu.org
Date: Thu, 12 Sep 2013 20:23:48 +0200
Message-Id: <1379010228-15324-1-git-send-email-damien.millescamps@6wind.com>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.212.180
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] ivshmem: allow the sharing of hugepages
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
X-List-Received-Date: Thu, 12 Sep 2013 18:24:19 -0000

According to shm_open specifications:

 A shared memory object should be identified by a name of the form /somename;
 that is, a null-terminated string of up to NAME_MAX (i.e., 255) characters
 consisting of an initial slash, followed by one or more characters, none of
 which are slashes.

This patch permits to share memory areas that do not specifically belong to
/dev/shmem.

A use case for this patch is sharing huge pages available through a
hugetlbfs mountpoint.

Signed-off-by: Damien Millescamps <damien.millescamps@6wind.com>
---
 hw/misc/ivshmem.c |   16 +++++++++++++++-
 1 files changed, 15 insertions(+), 1 deletions(-)

diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c
index 2838866..9020bb2 100644
--- a/hw/misc/ivshmem.c
+++ b/hw/misc/ivshmem.c
@@ -751,9 +751,23 @@ static int pci_ivshmem_init(PCIDevice *dev)
 
         IVSHMEM_DPRINTF("using shm_open (shm object = %s)\n", s->shmobj);
 
+        /* 
+         * A shared memory object should be identified by a name of the form /somename; 
+         * that is, a null-terminated string of up to NAME_MAX (i.e., 255) characters 
+         * consisting of an initial slash, followed by one or more characters, none of 
+         * which are slashes.
+         */
+        if (s->shmobj && s->shmobj[0] == '/' && strstr(&s->shmobj[1], "/")) {
+            /* This can't be a shared memory object. */
+            fd = open(s->shmobj, O_RDWR);
+            if (fd < 0) {
+                perror("ivshmem - open");
+                exit(-1);
+            }
+        }
         /* try opening with O_EXCL and if it succeeds zero the memory
          * by truncating to 0 */
-        if ((fd = shm_open(s->shmobj, O_CREAT|O_RDWR|O_EXCL,
+        else if ((fd = shm_open(s->shmobj, O_CREAT|O_RDWR|O_EXCL,
                         S_IRWXU|S_IRWXG|S_IRWXO)) > 0) {
            /* truncate file to length PCI device's memory */
             if (ftruncate(fd, s->ivshmem_size) != 0) {
-- 
1.7.2.5


