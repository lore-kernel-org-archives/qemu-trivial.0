Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VLZ8H-0008JR-PL
	for mharc-qemu-trivial@gnu.org; Mon, 16 Sep 2013 09:46:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39384)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.millescamps@6wind.com>) id 1VLZ8A-0008Hb-DI
	for qemu-trivial@nongnu.org; Mon, 16 Sep 2013 09:46:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <damien.millescamps@6wind.com>) id 1VLZ82-0002FJ-VP
	for qemu-trivial@nongnu.org; Mon, 16 Sep 2013 09:46:22 -0400
Received: from mail-bk0-f42.google.com ([209.85.214.42]:34140)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.millescamps@6wind.com>) id 1VLZ82-0002F0-M8
	for qemu-trivial@nongnu.org; Mon, 16 Sep 2013 09:46:14 -0400
Received: by mail-bk0-f42.google.com with SMTP id my10so1582070bkb.1
	for <qemu-trivial@nongnu.org>; Mon, 16 Sep 2013 06:46:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=/BOdhMU7Q50KCSwIZ72H6muCyWw2bmVWWsvHLMIWSoI=;
	b=V85Sj3WrFtG36yLKOu0b/dP7XCyM1IQaplEh7OJsuM+0Lp13xtBjrb/K2TCwZVnOgl
	BzKAqJJVY4y+t4uqeU7BK3Wqqaldbo4qxem4JWsdqGvBUBd0aXJtbjYlvPtBQgOXHta9
	Sgn95yXSFyvxpLwXI3xUaSAF04gK+f3n/y6UKWCsZ+5syuUxL3zsZGOj8a7te2hPDGTY
	noEVeiapRfDersg0jDiPoS2z9B8Xy3lECzwUMqVSrW5vU5ajapl1c3ucS+p7rE9XQcmb
	RbPIyKFBkg/QmuNIHM6qvsoo2hpYrKSwWEosgScoC9UFrGuKHn+46MDBpAyDpEiioHT3
	NEhg==
X-Gm-Message-State: ALoCoQm3NLpLWohqiRZoyh4P2nOsWYoXxMmBZWK/cHpAg1iM6c6bhhqvwQpkOmetQTnK42zX2bMY
X-Received: by 10.205.36.70 with SMTP id sz6mr24008255bkb.12.1379339173654;
	Mon, 16 Sep 2013 06:46:13 -0700 (PDT)
Received: from 6wind.com (guy78-3-82-239-227-177.fbx.proxad.net.
	[82.239.227.177])
	by mx.google.com with ESMTPSA id zl3sm7702315bkb.4.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=RC4-SHA bits=128/128);
	Mon, 16 Sep 2013 06:46:12 -0700 (PDT)
From: Damien Millescamps <damien.millescamps@6wind.com>
To: qemu-devel@nongnu.org
Date: Mon, 16 Sep 2013 15:46:07 +0200
Message-Id: <1379339167-1428-1-git-send-email-damien.millescamps@6wind.com>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.214.42
Cc: qemu-trivial@nongnu.org, berrange@redhat.com
Subject: [Qemu-trivial] [PATCH v3] ivshmem: allow the sharing of hugepages
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
X-List-Received-Date: Mon, 16 Sep 2013 13:46:28 -0000

This patch permits to share memory areas that do not specifically belong to
/dev/shm. In such case, the file must be already present when launching qemu.
A new parameter 'file' has been added to specify the file to use.

A use case for this patch is sharing huge pages available through a
hugetlbfs mountpoint.

Signed-off-by: Damien Millescamps <damien.millescamps@6wind.com>
---
 docs/specs/ivshmem_device_spec.txt |    5 ++-
 hw/misc/ivshmem.c                  |   52 +++++++++++++++++++++++------------
 2 files changed, 37 insertions(+), 20 deletions(-)

diff --git a/docs/specs/ivshmem_device_spec.txt b/docs/specs/ivshmem_device_spec.txt
index 667a862..3137e60 100644
--- a/docs/specs/ivshmem_device_spec.txt
+++ b/docs/specs/ivshmem_device_spec.txt
@@ -4,8 +4,9 @@ Device Specification for Inter-VM shared memory device
 
 The Inter-VM shared memory device is designed to share a region of memory to
 userspace in multiple virtual guests.  The memory region does not belong to any
-guest, but is a POSIX memory object on the host.  Optionally, the device may
-support sending interrupts to other guests sharing the same memory region.
+guest, but is a either a POSIX memory object or a mmap'd file (such as a
+hugepage) on the host.  Optionally, the device may support sending interrupts
+to other guests sharing the same memory region.
 
 
 The Inter-VM PCI device
diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c
index 2838866..a9f268d 100644
--- a/hw/misc/ivshmem.c
+++ b/hw/misc/ivshmem.c
@@ -98,6 +98,7 @@ typedef struct IVShmemState {
     Error *migration_blocker;
 
     char * shmobj;
+    char * fileobj;
     char * sizearg;
     char * role;
     int role_val;   /* scalar to avoid multiple string comparisons */
@@ -715,9 +716,9 @@ static int pci_ivshmem_init(PCIDevice *dev)
         /* if we get a UNIX socket as the parameter we will talk
          * to the ivshmem server to receive the memory region */
 
-        if (s->shmobj != NULL) {
+        if (s->shmobj != NULL || s->fileobj != NULL) {
             fprintf(stderr, "WARNING: do not specify both 'chardev' "
-                                                "and 'shm' with ivshmem\n");
+                            "and 'shm' or 'file' with ivshmem\n");
         }
 
         IVSHMEM_DPRINTF("using shared memory server (socket = %s)\n",
@@ -743,28 +744,42 @@ static int pci_ivshmem_init(PCIDevice *dev)
     } else {
         /* just map the file immediately, we're not using a server */
         int fd;
+        int is_shm = !!(s->shmobj != NULL);
+        int is_file = !!(s->fileobj != NULL);
 
-        if (s->shmobj == NULL) {
-            fprintf(stderr, "Must specify 'chardev' or 'shm' to ivshmem\n");
+        if (!(is_shm ^ is_file)) {
+            fprintf(stderr, "Must specify one, and only one, in 'chardev',"
+                            "  'file'  or 'shm' to ivshmem\n");
             exit(1);
         }
 
-        IVSHMEM_DPRINTF("using shm_open (shm object = %s)\n", s->shmobj);
-
-        /* try opening with O_EXCL and if it succeeds zero the memory
-         * by truncating to 0 */
-        if ((fd = shm_open(s->shmobj, O_CREAT|O_RDWR|O_EXCL,
-                        S_IRWXU|S_IRWXG|S_IRWXO)) > 0) {
-           /* truncate file to length PCI device's memory */
-            if (ftruncate(fd, s->ivshmem_size) != 0) {
-                fprintf(stderr, "ivshmem: could not truncate shared file\n");
+        if (is_shm) {
+            IVSHMEM_DPRINTF("using shm_open (shm object = %s)\n", s->shmobj);
+
+            /* try opening with O_EXCL and if it succeeds zero the memory
+             * by truncating to 0 */
+            if ((fd = shm_open(s->shmobj, O_CREAT|O_RDWR|O_EXCL,
+                            S_IRWXU|S_IRWXG|S_IRWXO)) > 0) {
+               /* truncate file to length PCI device's memory */
+                if (ftruncate(fd, s->ivshmem_size) != 0) {
+                    fprintf(stderr, "ivshmem: could not truncate"
+                                    " shared file\n");
+                }
+
+            } else if ((fd = shm_open(s->shmobj, O_CREAT|O_RDWR,
+                            S_IRWXU|S_IRWXG|S_IRWXO)) < 0) {
+                fprintf(stderr, "ivshmem: could not open shared file\n");
+                exit(-1);
             }
+        } else {
+            IVSHMEM_DPRINTF("using open (file object = %s)\n", s->fileobj);
 
-        } else if ((fd = shm_open(s->shmobj, O_CREAT|O_RDWR,
-                        S_IRWXU|S_IRWXG|S_IRWXO)) < 0) {
-            fprintf(stderr, "ivshmem: could not open shared file\n");
-            exit(-1);
-
+            /* try opening a mmap's file. This file must have been previously
+             * created on the host */
+            if ((fd = open(s->fileobj, O_RDWR)) < 0) {
+                fprintf(stderr, "ivshmem: could not open mmap'd file\n");
+                exit(-1);
+            }
         }
 
         if (check_shm_size(s, fd) == -1) {
@@ -804,6 +819,7 @@ static Property ivshmem_properties[] = {
     DEFINE_PROP_BIT("ioeventfd", IVShmemState, features, IVSHMEM_IOEVENTFD, false),
     DEFINE_PROP_BIT("msi", IVShmemState, features, IVSHMEM_MSI, true),
     DEFINE_PROP_STRING("shm", IVShmemState, shmobj),
+    DEFINE_PROP_STRING("file", IVShmemState, fileobj),
     DEFINE_PROP_STRING("role", IVShmemState, role),
     DEFINE_PROP_UINT32("use64", IVShmemState, ivshmem_64bit, 1),
     DEFINE_PROP_END_OF_LIST(),
-- 
1.7.2.5


