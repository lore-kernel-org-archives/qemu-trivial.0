Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UnRiJ-0006iz-6j
	for mharc-qemu-trivial@gnu.org; Fri, 14 Jun 2013 06:58:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57041)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UnRiB-0006dH-IA
	for qemu-trivial@nongnu.org; Fri, 14 Jun 2013 06:58:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UnRi9-0006hl-SJ
	for qemu-trivial@nongnu.org; Fri, 14 Jun 2013 06:58:31 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:48296)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UnRhz-0006d1-Re; Fri, 14 Jun 2013 06:58:20 -0400
Received: from gandalf.tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 2BE6C4165A;
	Fri, 14 Jun 2013 14:58:19 +0400 (MSK)
Received: by gandalf.tls.msk.ru (Postfix, from userid 1000)
	id CDE5E520; Fri, 14 Jun 2013 14:50:47 +0400 (MSK)
From: Michael Tokarev <mjt@tls.msk.ru>
To: Anthony Liguori <aliguori@us.ibm.com>
Date: Fri, 14 Jun 2013 14:50:33 +0400
Message-Id: <1371207042-17980-18-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1371207042-17980-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1371207042-17980-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org, qemu-stable@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>, Cam Macdonell <cam@cs.ualberta.ca>
Subject: [Qemu-trivial] [PULL 17/26] ivshmem: add missing error exit(2)
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
X-List-Received-Date: Fri, 14 Jun 2013 10:58:33 -0000

From: Stefan Hajnoczi <stefanha@redhat.com>

If the user fails to specify 'chardev' or 'shm' then we cannot continue.
Exit right away so that we don't invoke shm_open(3) with a NULL pointer.

It would be nice to replace exit(1) with error returns in the PCI device
.init() function, but leave that for another patch since exit(1) is
currently used elsewhere.

Spotted by Coverity.

Cc: Cam Macdonell <cam@cs.ualberta.ca>
Cc: qemu-stable@nongnu.org
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/misc/ivshmem.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c
index a19a6d6..5658f73 100644
--- a/hw/misc/ivshmem.c
+++ b/hw/misc/ivshmem.c
@@ -735,6 +735,7 @@ static int pci_ivshmem_init(PCIDevice *dev)
 
         if (s->shmobj == NULL) {
             fprintf(stderr, "Must specify 'chardev' or 'shm' to ivshmem\n");
+            exit(1);
         }
 
         IVSHMEM_DPRINTF("using shm_open (shm object = %s)\n", s->shmobj);
-- 
1.7.10.4


