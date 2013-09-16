Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VLYM3-0001aV-0E
	for mharc-qemu-trivial@gnu.org; Mon, 16 Sep 2013 08:56:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54160)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.millescamps@6wind.com>) id 1VLYLu-0001Rb-G8
	for qemu-trivial@nongnu.org; Mon, 16 Sep 2013 08:56:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <damien.millescamps@6wind.com>) id 1VLYLm-0003Gq-Q5
	for qemu-trivial@nongnu.org; Mon, 16 Sep 2013 08:56:30 -0400
Received: from mail-bk0-f52.google.com ([209.85.214.52]:60608)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.millescamps@6wind.com>) id 1VLYLm-0003GS-Je
	for qemu-trivial@nongnu.org; Mon, 16 Sep 2013 08:56:22 -0400
Received: by mail-bk0-f52.google.com with SMTP id e11so1528065bkh.11
	for <qemu-trivial@nongnu.org>; Mon, 16 Sep 2013 05:56:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=MXd6sgza8jwWd7NUhN4WCQRmFVfZmZgVXbsjmfdLwak=;
	b=dcs0MMx/pIj0ScW8pK3NksJpDiD6ULt/Mp1yyvWW8JmdNmdWPuxw4YBXjMoMh60yZz
	THtGh+BEOOdrGf++bUXDO7KHwuvd8Zx6fx+CVipmb955juH6zPDg3mfzVvXIMNG+I8JO
	q6up0TxeZv/xU7V9K4ENfALCQtJL8TGuS2uxzsqIetb5bE8oparTHOXoy5sOcdHVngyg
	BhvcD6oOx8pVNeF3/OtesTPEdLFKdoKWf9qpe5gipjzYiGg6N7a4WK/MOzOB9EVnlZ0V
	TgIVE0H40ac4MnKNmfEScLRw4kl5QIuDo7boopZLtFZxDuH8OC7vuuFtP5rNNquUJOMh
	fYJA==
X-Gm-Message-State: ALoCoQn3IkJpxOYsR6AVptRRRyy0vqU3OXBpI1FMSZ+qDThJkyfAqYwwtbdPWOwlrOljni+lkMKp
X-Received: by 10.205.24.131 with SMTP id re3mr24076807bkb.8.1379336181215;
	Mon, 16 Sep 2013 05:56:21 -0700 (PDT)
Received: from 6wind.com (guy78-3-82-239-227-177.fbx.proxad.net.
	[82.239.227.177])
	by mx.google.com with ESMTPSA id a4sm7573008bko.11.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=RC4-SHA bits=128/128);
	Mon, 16 Sep 2013 05:56:20 -0700 (PDT)
From: Damien Millescamps <damien.millescamps@6wind.com>
To: qemu-devel@nongnu.org
Date: Mon, 16 Sep 2013 14:56:15 +0200
Message-Id: <1379336175-822-1-git-send-email-damien.millescamps@6wind.com>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.214.52
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH RESEND] ivshmem: allow the sharing of
	hugepages
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
X-List-Received-Date: Mon, 16 Sep 2013 12:56:36 -0000

This patch permits to share memory areas that do not specifically belong to
/dev/shm. In such case, the file must be already present when launching qemu.

A use case for this patch is sharing huge pages available through a
hugetlbfs mountpoint.

Signed-off-by: Damien Millescamps <damien.millescamps@6wind.com>
---
 docs/specs/ivshmem_device_spec.txt |    5 +++--
 hw/misc/ivshmem.c                  |   10 +++++++---
 2 files changed, 10 insertions(+), 5 deletions(-)

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
index 2838866..9178ccc 100644
--- a/hw/misc/ivshmem.c
+++ b/hw/misc/ivshmem.c
@@ -762,9 +762,13 @@ static int pci_ivshmem_init(PCIDevice *dev)
 
         } else if ((fd = shm_open(s->shmobj, O_CREAT|O_RDWR,
                         S_IRWXU|S_IRWXG|S_IRWXO)) < 0) {
-            fprintf(stderr, "ivshmem: could not open shared file\n");
-            exit(-1);
-
+            /* Try with open() in case the file is not in /dev/shm/
+             * This is usefull for sharing hugepages for example */
+            fd = open(s->shmobj, O_RDWR);
+            if (fd < 0) {
+                fprintf(stderr, "ivshmem: could not open shared file\n");
+                exit(-1);
+            }
         }
 
         if (check_shm_size(s, fd) == -1) {
-- 
1.7.2.5


