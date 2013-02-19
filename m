Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U7wBT-0004Q2-BA
	for mharc-qemu-trivial@gnu.org; Tue, 19 Feb 2013 18:01:11 -0500
Received: from eggs.gnu.org ([208.118.235.92]:58300)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crobinso@redhat.com>) id 1U7vsd-0002av-E7
	for qemu-trivial@nongnu.org; Tue, 19 Feb 2013 17:41:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crobinso@redhat.com>) id 1U7vsY-00005p-Nn
	for qemu-trivial@nongnu.org; Tue, 19 Feb 2013 17:41:43 -0500
Received: from mx1.redhat.com ([209.132.183.28]:28611)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crobinso@redhat.com>)
	id 1U7vsT-0008Vh-6D; Tue, 19 Feb 2013 17:41:33 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r1JMfWHF001582
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 19 Feb 2013 17:41:32 -0500
Received: from colepc.redhat.com (ovpn-113-128.phx2.redhat.com [10.3.113.128])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id r1JMfVaW003031; Tue, 19 Feb 2013 17:41:31 -0500
From: Cole Robinson <crobinso@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 19 Feb 2013 17:41:28 -0500
Message-Id: <c6ae3e0f8f1c3aa615871b6ae6b6f975effa4e6e.1361313688.git.crobinso@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Cole Robinson <crobinso@redhat.com>
Subject: [Qemu-trivial] [PATCH] .gitignore: Ignore optionrom/*.asm
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
X-List-Received-Date: Tue, 19 Feb 2013 23:01:10 -0000


Signed-off-by: Cole Robinson <crobinso@redhat.com>
---
 .gitignore | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/.gitignore b/.gitignore
index 53fe9c3..27ad002 100644
--- a/.gitignore
+++ b/.gitignore
@@ -83,12 +83,15 @@ fsdev/virtfs-proxy-helper.pod
 patches
 pc-bios/bios-pq/status
 pc-bios/vgabios-pq/status
+pc-bios/optionrom/linuxboot.asm
 pc-bios/optionrom/linuxboot.bin
 pc-bios/optionrom/linuxboot.raw
 pc-bios/optionrom/linuxboot.img
+pc-bios/optionrom/multiboot.asm
 pc-bios/optionrom/multiboot.bin
 pc-bios/optionrom/multiboot.raw
 pc-bios/optionrom/multiboot.img
+pc-bios/optionrom/kvmvapic.asm
 pc-bios/optionrom/kvmvapic.bin
 pc-bios/optionrom/kvmvapic.raw
 pc-bios/optionrom/kvmvapic.img
-- 
1.8.1.2


