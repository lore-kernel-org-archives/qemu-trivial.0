Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WnRGp-00082V-8p
	for mharc-qemu-trivial@gnu.org; Thu, 22 May 2014 07:34:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55362)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <saravanakumar.punith@gmail.com>) id 1WnRGe-0007od-7Z
	for qemu-trivial@nongnu.org; Thu, 22 May 2014 07:34:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <saravanakumar.punith@gmail.com>) id 1WnRGV-0002mi-8I
	for qemu-trivial@nongnu.org; Thu, 22 May 2014 07:34:36 -0400
Received: from mail-pa0-x231.google.com ([2607:f8b0:400e:c03::231]:44011)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <saravanakumar.punith@gmail.com>)
	id 1WnRGC-0002iv-TS; Thu, 22 May 2014 07:34:09 -0400
Received: by mail-pa0-f49.google.com with SMTP id lj1so2409531pab.22
	for <multiple recipients>; Thu, 22 May 2014 04:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=PraMavroFsbYNIyTn+f0zkI21ZY+XRt3xPyV17hyUME=;
	b=r6H5y1RICe5nPxqVTVx8Kq8B7LvjLI3eKoeYORBWL32PqRdLSRSTq+GDcZq6aG5Dhm
	lViHNcleRAGF5jj0IadHu9Zw493mwtXXBIjQJ2W7VkiD+PL3+a7RrcUYJHga5fDL/aSo
	ivuK3A7XbjGD3pTjKor/JB7nC41tdC7RKL2hFUl3fNvW8FtaQCh1CULB0JDA6yQcYifT
	QMwq9W5eM0XlGCHHBtBmk3XV4wWlxytFE62IBp6DoQp0V2qnabbFiQoGjq0tyZw8DtXe
	20H0jCAh28pyJ8uEgEOeZda98wk+ijvqFtnNpanwk6zdazp7vUsFtqJwHeoLbsavLrZg
	aARw==
X-Received: by 10.68.218.231 with SMTP id pj7mr66327348pbc.95.1400758447620;
	Thu, 22 May 2014 04:34:07 -0700 (PDT)
Received: from localhost.localdomain ([111.93.218.67])
	by mx.google.com with ESMTPSA id
	bw2sm118879417pad.46.2014.05.22.04.34.05 for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Thu, 22 May 2014 04:34:06 -0700 (PDT)
From: Saravanakumar <saravanakumar.punith@gmail.com>
To: qemu-devel@nongnu.org
Date: Thu, 22 May 2014 17:03:50 +0530
Message-Id: <1400758430-32697-1-git-send-email-saravanakumar.punith@gmail.com>
X-Mailer: git-send-email 1.7.6.5
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c03::231
Cc: qemu-trivial@nongnu.org, Saravanakumar <saravanakumar.punith@gmail.com>,
	mst@redhat.com
Subject: [Qemu-trivial] [PATCH] pci: move dereferencing of root only after
	verifying valid root pointer.
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
X-List-Received-Date: Thu, 22 May 2014 11:34:46 -0000

Move dereferencing of root only after verifying valid root pointer.


Signed-off-by: Saravanakumar <saravanakumar.punith@gmail.com>
---
 hw/pci/pci.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 22fe5ee..8d6a8d4 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -605,13 +605,13 @@ PCIBus *pci_get_bus_devfn(int *devfnp, PCIBus *root, const char *devaddr)
     int dom, bus;
     unsigned slot;
 
-    assert(!root->parent_dev);
-
     if (!root) {
         fprintf(stderr, "No primary PCI bus\n");
         return NULL;
     }
 
+    assert(!root->parent_dev);
+
     if (!devaddr) {
         *devfnp = -1;
         return pci_find_bus_nr(root, 0);
-- 
1.7.6.5


