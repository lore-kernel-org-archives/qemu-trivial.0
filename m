Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VN5Xt-0004Dl-8f
	for mharc-qemu-trivial@gnu.org; Fri, 20 Sep 2013 14:35:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44120)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.millescamps@6wind.com>) id 1VN5Xk-00047n-6l
	for qemu-trivial@nongnu.org; Fri, 20 Sep 2013 14:35:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <damien.millescamps@6wind.com>) id 1VN5Xa-0003I0-OF
	for qemu-trivial@nongnu.org; Fri, 20 Sep 2013 14:35:04 -0400
Received: from mail-wg0-f45.google.com ([74.125.82.45]:61248)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.millescamps@6wind.com>) id 1VN5Xa-0003Hh-FC
	for qemu-trivial@nongnu.org; Fri, 20 Sep 2013 14:34:54 -0400
Received: by mail-wg0-f45.google.com with SMTP id y10so884101wgg.0
	for <qemu-trivial@nongnu.org>; Fri, 20 Sep 2013 11:34:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6TCMkBSiPHZkyhkG4Z3VFlqWls1G5IHCAP1pY8RZmSw=;
	b=HB/+AAuQ6hsIpG6ybQnnbW7TItxsrhO0OGIXBYuU5BU+dU3B6phwXXphBwA5ix+a3v
	CByH8VG4cX9S5JvjDuEKhJ/N8J/WZJ4nykW3wtJTdSH9y+SgBjZp1iJUzKCovk/Op4p6
	ItKxsQEInlIjpQnmd6R3QE0dKTyVaQWXEYrdawTzCLoYiREqkOi0BfKYYNKEe5Orc0gH
	DpDwMXi5OWSDbqZ8ABINrCSTa4KLfXmJX7neD8zuwkZlsnvAXuN3xN+SBNlaXeqsjV34
	iSgyfEd6O08cUkgAlFmXVpoXYsvAoeo6JDaw3OabRZu6ppenfnu/H+7aOjkHkDrfAn0W
	k8Gw==
X-Gm-Message-State: ALoCoQk63VbKL+DnyNTTJnB7LCoHy03dbt1pPGxYGkCAbDFKZykUWIAOTY0Nxk57nnN3d/gGEhPf
X-Received: by 10.180.187.2 with SMTP id fo2mr3745345wic.65.1379702093212;
	Fri, 20 Sep 2013 11:34:53 -0700 (PDT)
Received: from 6wind.com (6wind.net2.nerim.net. [213.41.180.237])
	by mx.google.com with ESMTPSA id iz19sm6841881wic.9.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=RC4-SHA bits=128/128);
	Fri, 20 Sep 2013 11:34:52 -0700 (PDT)
From: Damien Millescamps <damien.millescamps@6wind.com>
To: qemu-devel@nongnu.org
Date: Fri, 20 Sep 2013 20:34:47 +0200
Message-Id: <1379702087-8653-1-git-send-email-damien.millescamps@6wind.com>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.45
Cc: qemu-trivial@nongnu.org, mjt@tls.msk.ru
Subject: [Qemu-trivial] [PATCH v4] ivshmem: allow the sharing of mmap'd files
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
X-List-Received-Date: Fri, 20 Sep 2013 18:35:11 -0000

This patch permits to share memory areas that do not specifically belong to
/dev/shm. In such case, the file must be already present when launching qemu.
A new parameter 'file' has been added to specify the file to use.

A use case for this patch is sharing huge pages available through a
hugetlbfs mountpoint.

Signed-off-by: Damien Millescamps <damien.millescamps@6wind.com>
---
 docs/specs/ivshmem_device_spec.txt |    7 +++-
 hw/misc/ivshmem.c                  |   56 +++++++++++++++++++++++------------
 2 files changed, 42 insertions(+), 21 deletions(-)

diff --git a/docs/specs/ivshmem_device_spec.txt b/docs/specs/ivshmem_device_spec.txt
index 667a862..cb7d310 100644
--- a/docs/specs/ivshmem_device_spec.txt
+++ b/docs/specs/ivshmem_device_spec.txt
@@ -4,8 +4,11 @@ Device Specification for Inter-VM shared memory device
 
 The Inter-VM shared memory device is designed to share a region of memory to
 userspace in multiple virtual guests.  The memory region does not belong to any
-guest, but is a POSIX memory object on the host.  Optionally, the device may
-support sending interrupts to other guests sharing the same memory region.
+guest, but is a either a POSIX memory object or a mmap'd file (including
+hugepage-backed file) on the host.
+
+Optionally, the device may support sending interrupts to other guests sharing
+the same memory region.
 
 
 The Inter-VM PCI device
diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c
index 2838866..5d991cf 100644
--- a/hw/misc/ivshmem.c
+++ b/hw/misc/ivshmem.c
@@ -98,6 +98,7 @@ typedef struct IVShmemState {
     Error *migration_blocker;
 
     char * shmobj;
+    char * fileobj;
     char * sizearg;
     char * role;
     int role_val;   /* scalar to avoid multiple string comparisons */
@@ -715,9 +716,10 @@ static int pci_ivshmem_init(PCIDevice *dev)
         /* if we get a UNIX socket as the parameter we will talk
          * to the ivshmem server to receive the memory region */
 
-        if (s->shmobj != NULL) {
-            fprintf(stderr, "WARNING: do not specify both 'chardev' "
-                                                "and 'shm' with ivshmem\n");
+        if (s->shmobj != NULL || s->fileobj != NULL) {
+            fprintf(stderr, "WARNING: both 'chardev' and '%s' specified.\n"
+                            "Falling back to 'chardev' only.\n",
+                            s->shmobj ? "shm" : "file");
         }
 
         IVSHMEM_DPRINTF("using shared memory server (socket = %s)\n",
@@ -743,28 +745,43 @@ static int pci_ivshmem_init(PCIDevice *dev)
     } else {
         /* just map the file immediately, we're not using a server */
         int fd;
+        int is_shm = !!(s->shmobj != NULL);
+        int is_file = !!(s->fileobj != NULL);
 
-        if (s->shmobj == NULL) {
-            fprintf(stderr, "Must specify 'chardev' or 'shm' to ivshmem\n");
+        if (!(is_shm ^ is_file)) {
+            fprintf(stderr, "ERROR: both 'file' and 'shm' specified for the "
+                            "same ivshmem device.\n");
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
+                                    " shared file: %m\n");
+                    exit(-1);
+                }
+
+            } else if ((fd = shm_open(s->shmobj, O_RDWR,
+                            S_IRWXU|S_IRWXG|S_IRWXO)) < 0) {
+                fprintf(stderr, "ivshmem: could not open shared file: %m\n");
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
+                fprintf(stderr, "ivshmem: could not open mmap'd file: %m\n");
+                exit(-1);
+            }
         }
 
         if (check_shm_size(s, fd) == -1) {
@@ -804,6 +821,7 @@ static Property ivshmem_properties[] = {
     DEFINE_PROP_BIT("ioeventfd", IVShmemState, features, IVSHMEM_IOEVENTFD, false),
     DEFINE_PROP_BIT("msi", IVShmemState, features, IVSHMEM_MSI, true),
     DEFINE_PROP_STRING("shm", IVShmemState, shmobj),
+    DEFINE_PROP_STRING("file", IVShmemState, fileobj),
     DEFINE_PROP_STRING("role", IVShmemState, role),
     DEFINE_PROP_UINT32("use64", IVShmemState, ivshmem_64bit, 1),
     DEFINE_PROP_END_OF_LIST(),
-- 
1.7.2.5


