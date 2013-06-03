Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UjQbe-0001ho-In
	for mharc-qemu-trivial@gnu.org; Mon, 03 Jun 2013 04:59:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56431)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1UjQbW-0001SF-OH
	for qemu-trivial@nongnu.org; Mon, 03 Jun 2013 04:59:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1UjQbQ-0007jN-G6
	for qemu-trivial@nongnu.org; Mon, 03 Jun 2013 04:59:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37474)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>)
	id 1UjQbC-0007h9-Jg; Mon, 03 Jun 2013 04:58:42 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r538weMY025471
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 3 Jun 2013 04:58:40 -0400
Received: from localhost (ovpn-112-30.ams2.redhat.com [10.36.112.30])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r538wcuZ024333; Mon, 3 Jun 2013 04:58:39 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: <qemu-devel@nongnu.org>
Date: Mon,  3 Jun 2013 10:58:31 +0200
Message-Id: <1370249911-19708-3-git-send-email-stefanha@redhat.com>
In-Reply-To: <1370249911-19708-1-git-send-email-stefanha@redhat.com>
References: <1370249911-19708-1-git-send-email-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-stable@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Cam Macdonell <cam@cs.ualberta.ca>, Eric Blake <eblake@redhat.com>
Subject: [Qemu-trivial] [PATCH v2 2/2] ivshmem: add missing error exit(2)
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
X-List-Received-Date: Mon, 03 Jun 2013 08:59:09 -0000

If the user fails to specify 'chardev' or 'shm' then we cannot continue.
Exit right away so that we don't invoke shm_open(3) with a NULL pointer.

It would be nice to replace exit(1) with error returns in the PCI device
.init() function, but leave that for another patch since exit(1) is
currently used elsewhere.

Spotted by Coverity.

Cc: Cam Macdonell <cam@cs.ualberta.ca>
Cc: qemu-stable@nongnu.org
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/misc/ivshmem.c | 1 +
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
1.8.1.4


