Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RpNUh-0004LV-6h
	for mharc-qemu-trivial@gnu.org; Mon, 23 Jan 2012 12:15:47 -0500
Received: from eggs.gnu.org ([140.186.70.92]:43139)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thigdon@akamai.com>) id 1RpNUa-0003yz-0I
	for qemu-trivial@nongnu.org; Mon, 23 Jan 2012 12:15:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thigdon@akamai.com>) id 1RpNUU-0008Ja-7j
	for qemu-trivial@nongnu.org; Mon, 23 Jan 2012 12:15:39 -0500
Received: from prod-mail-xrelay02.akamai.com ([72.246.2.14]:38003)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thigdon@akamai.com>)
	id 1RpNUN-0008I6-Ph; Mon, 23 Jan 2012 12:15:27 -0500
Received: from prod-mail-xrelay02.akamai.com (localhost [127.0.0.1])
	by postfix.imss70 (Postfix) with ESMTP id 0734427C00;
	Mon, 23 Jan 2012 17:15:26 +0000 (GMT)
Received: from prod-mail-relay06.akamai.com (prod-mail-relay06.akamai.com
	[172.17.120.126])
	by prod-mail-xrelay02.akamai.com (Postfix) with ESMTP id E15FB27BFF;
	Mon, 23 Jan 2012 17:15:25 +0000 (GMT)
Received: from texas.kendall.corp.akamai.com (texas.kendall.corp.akamai.com
	[172.28.11.142])
	by prod-mail-relay06.akamai.com (Postfix) with ESMTP id DB4AB47BD2;
	Mon, 23 Jan 2012 17:15:25 +0000 (GMT)
Received: from thigdon by texas.kendall.corp.akamai.com with local (Exim 4.71)
	(envelope-from <thigdon@akamai.com>)
	id 1RpNUL-0003eC-Ry; Mon, 23 Jan 2012 12:15:25 -0500
Date: Mon, 23 Jan 2012 12:15:25 -0500
From: Thomas Higdon <thigdon@akamai.com>
To: qemu-devel@nongnu.org
Message-ID: <20120123171525.GM32632@akamai.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.20 (2009-06-14)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 72.246.2.14
Cc: kwolf@redhat.com, qemu-trivial@nongnu.org, paul@codesourcery.com
Subject: [Qemu-trivial] [PATCH] scsi: restrict buffer length to
 req->cmd.xfer for responses to INQUIRY commands.
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
X-List-Received-Date: Mon, 23 Jan 2012 17:15:46 -0000

This prevents the emulated SCSI device from trying to DMA more bytes to the
initiator than are expected. Without this, the SCRIPTS code in the emulated LSI
device eventually raises a DMA interrupt for a data overrun when an INQUIRY
command whose buflen exceeds req->cmd.xfer is processed. It's the
responsibility of the client to provide a request buffer and allocation
length that are large enough for the result of the command.

I'm no expert on SCSI (or qemu), but this appears to be more correct behavior
than before, and makes my SCSI INQUIRY commands more successful.

Before patch:

# echo setverbose 2 > /proc/scsi/sym53c8xx/0
# sginfo -s -TT /dev/sda
  cdb:     12 00 00 00 24 00
  inquiry response:
     00 00 05 02 1f 00 00 12 51 45 4d 55 20 20 20 20
     51 45 4d 55 20 48 41 52 44 44 49 53 4b 20 20 20
     31 2e 30 2e
  cdb:     12 01 00 00 04 00
[  237.014083] sd 0:0:0:0: extraneous data discarded.
[  237.014437] sd 0:0:0:0: COMMAND FAILED (87 0 1).
do_scsi_io: opcode=0x12: Host_status=0x07 [DID_ERROR]
No serial number (error doing INQUIRY, supported VPDs)

After:

# echo setverbose 2 > /proc/scsi/sym53c8xx/0
# sginfo -s -TT /dev/sda
  cdb:     12 00 00 00 24 00
  inquiry response:
     00 00 05 02 1f 00 00 12 51 45 4d 55 20 20 20 20
     51 45 4d 55 20 48 41 52 44 44 49 53 4b 20 20 20
     31 2e 30 2e
  cdb:     12 01 00 00 04 00
  cdb:     12 01 80 00 04 00
  cdb:     12 01 80 00 06 00
  inquiry (evpd page (0x80) response:
    00 80 00 02 32 37
Serial Number '27'

Command line:
/usr/bin/qemu-system-x86_64 -S -M pc -enable-kvm -m 1024 -smp 1,sockets=1,cores=1,threads=1 -nodefconfig -nodefaults -chardev socket,id=charmonitor,path=/var/lib/libvirt/qemu/monitor,server,nowait -mon chardev=charmonitor,id=monitor,mode=readline -rtc base=utc -boot d -device lsi,id=scsi0,bus=pci.0,addr=0x5 -drive file=disk.0,if=none,id=drive-scsi0-0-0,format=qcow2 -device scsi-disk,bus=scsi0.0,scsi-id=0,drive=drive-scsi0-0-0,id=scsi0-0-0,serial=27 -drive file=disk.2,if=none,media=cdrom,id=drive-ide0-0-0,readonly=on,format=raw -device ide-drive,bus=ide.0,unit=0,drive=drive-ide0-0-0,id=ide0-0-0  -usb -vnc 0.0.0.0:80 -vga cirrus

Signed-off-by: Thomas Higdon <thigdon@akamai.com>
---
 hw/scsi-disk.c |    3 +++
  1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/hw/scsi-disk.c b/hw/scsi-disk.c
index 5d8bf53..71fe2a3 100644
--- a/hw/scsi-disk.c
+++ b/hw/scsi-disk.c
@@ -477,6 +477,9 @@ static int scsi_disk_emulate_inquiry(SCSIRequest *req, uint8_t *outbuf)
                  "buffer size %zd\n", page_code, req->cmd.xfer);
             return -1;
         }
+        if (buflen > req->cmd.xfer) {
+            buflen = req->cmd.xfer;
+        }
         /* done with EVPD */
         return buflen;
     }

