Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Rqkto-0005sj-U5
	for mharc-qemu-trivial@gnu.org; Fri, 27 Jan 2012 07:27:24 -0500
Received: from eggs.gnu.org ([140.186.70.92]:38646)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1Rqktd-0005HY-19
	for qemu-trivial@nongnu.org; Fri, 27 Jan 2012 07:27:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1Rqktb-0003mY-F9
	for qemu-trivial@nongnu.org; Fri, 27 Jan 2012 07:27:12 -0500
Received: from david.siemens.de ([192.35.17.14]:27662)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>)
	id 1RqktM-0003kG-KZ; Fri, 27 Jan 2012 07:26:56 -0500
Received: from mail1.siemens.de (localhost [127.0.0.1])
	by david.siemens.de (8.13.6/8.13.6) with ESMTP id q0RCQb1I016140;
	Fri, 27 Jan 2012 13:26:37 +0100
Received: from mchn199C.mchp.siemens.de ([139.25.109.49])
	by mail1.siemens.de (8.13.6/8.13.6) with ESMTP id q0RCQZFZ021523;
	Fri, 27 Jan 2012 13:26:35 +0100
Message-ID: <4F2297FB.2040508@siemens.com>
Date: Fri, 27 Jan 2012 13:26:35 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de;
	rv:1.8.1.12) Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12
	Mnenhy/0.7.5.666
MIME-Version: 1.0
To: qemu-devel <qemu-devel@nongnu.org>, qemu-trivial <qemu-trivial@nongnu.org>
References: <4F1DA82F.4090808@siemens.com>
In-Reply-To: <4F1DA82F.4090808@siemens.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6, seldom 2.4 (older,
	4)
X-Received-From: 192.35.17.14
Cc: =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>,
	Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PATCH v2] optionroms: Silence intermediate file
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
X-List-Received-Date: Fri, 27 Jan 2012 12:27:23 -0000

The build process of optionroms spits out an "rm ..." line. Moreover, it
removes all .o files that can be handy for debugging purposes.

Disable automatic intermediate removal and only clean up the unneeded
and large .img and .raw files.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---

Changes in v2:
 - comment on .SECONDARY purpose
 - make rm -rf dependent on success of build command

 pc-bios/optionrom/Makefile |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/pc-bios/optionrom/Makefile b/pc-bios/optionrom/Makefile
index 51da288..4e7275b 100644
--- a/pc-bios/optionrom/Makefile
+++ b/pc-bios/optionrom/Makefile
@@ -16,14 +16,17 @@ QEMU_CFLAGS = $(CFLAGS)
 
 build-all: multiboot.bin linuxboot.bin
 
+# suppress auto-removal of intermediate files
+.SECONDARY:
+
 %.img: %.o
 	$(call quiet-command,$(LD) -Ttext 0 -e _start -s -o $@ $<,"  Building $(TARGET_DIR)$@")
 
 %.raw: %.img
-	$(call quiet-command,$(OBJCOPY) -O binary -j .text $< $@,"  Building $(TARGET_DIR)$@")
+	$(call quiet-command,$(OBJCOPY) -O binary -j .text $< $@ && rm -f $<,"  Building $(TARGET_DIR)$@")
 
 %.bin: %.raw
-	$(call quiet-command,$(SHELL) $(SRC_PATH)/scripts/signrom.sh $< $@,"  Signing $(TARGET_DIR)$@")
+	$(call quiet-command,$(SHELL) $(SRC_PATH)/scripts/signrom.sh $< $@ && rm -f $<,"  Signing $(TARGET_DIR)$@")
 
 clean:
 	rm -f *.o *.d *.raw *.img *.bin *~
-- 
1.7.3.4

