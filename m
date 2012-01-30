Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RroSy-0007LH-MQ
	for mharc-qemu-trivial@gnu.org; Mon, 30 Jan 2012 05:28:04 -0500
Received: from eggs.gnu.org ([140.186.70.92]:56934)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1RroSs-0006yM-N3
	for qemu-trivial@nongnu.org; Mon, 30 Jan 2012 05:28:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1RroSn-00063G-0F
	for qemu-trivial@nongnu.org; Mon, 30 Jan 2012 05:27:58 -0500
Received: from david.siemens.de ([192.35.17.14]:34235)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>)
	id 1RroSb-00061R-PN; Mon, 30 Jan 2012 05:27:42 -0500
Received: from mail1.siemens.de (localhost [127.0.0.1])
	by david.siemens.de (8.13.6/8.13.6) with ESMTP id q0UARYuk011575;
	Mon, 30 Jan 2012 11:27:35 +0100
Received: from mchn199C.mchp.siemens.de ([139.25.109.49])
	by mail1.siemens.de (8.13.6/8.13.6) with ESMTP id q0UARXfi025321;
	Mon, 30 Jan 2012 11:27:33 +0100
Message-ID: <4F267095.6010207@siemens.com>
Date: Mon, 30 Jan 2012 11:27:33 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de;
	rv:1.8.1.12) Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12
	Mnenhy/0.7.5.666
MIME-Version: 1.0
To: qemu-devel <qemu-devel@nongnu.org>, qemu-trivial <qemu-trivial@nongnu.org>
References: <4F1DA82F.4090808@siemens.com> <4F2297FB.2040508@siemens.com>
In-Reply-To: <4F2297FB.2040508@siemens.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6, seldom 2.4 (older,
	4)
X-Received-From: 192.35.17.14
Cc: =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>,
	Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PATCH v3] optionroms: Silence intermediate file
	removal
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
X-List-Received-Date: Mon, 30 Jan 2012 10:28:02 -0000

The build process of optionroms spits out an "rm ..." line. Moreover, it
removes all .o files that can be handy for debugging purposes. So
disable automatic intermediate removal.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---

Changes in v3:
 - do not remove intermediate file manually, it breaks parallel build

 pc-bios/optionrom/Makefile |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/pc-bios/optionrom/Makefile b/pc-bios/optionrom/Makefile
index 51da288..2caf7e6 100644
--- a/pc-bios/optionrom/Makefile
+++ b/pc-bios/optionrom/Makefile
@@ -16,6 +16,9 @@ QEMU_CFLAGS = $(CFLAGS)
 
 build-all: multiboot.bin linuxboot.bin
 
+# suppress auto-removal of intermediate files
+.SECONDARY:
+
 %.img: %.o
 	$(call quiet-command,$(LD) -Ttext 0 -e _start -s -o $@ $<,"  Building $(TARGET_DIR)$@")
 
-- 
1.7.3.4

