Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YYWVX-0002U6-Rv
	for mharc-qemu-trivial@gnu.org; Thu, 19 Mar 2015 05:12:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60581)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YYWVR-0002ID-Iu
	for qemu-trivial@nongnu.org; Thu, 19 Mar 2015 05:12:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YYWVQ-0007mK-A5
	for qemu-trivial@nongnu.org; Thu, 19 Mar 2015 05:12:45 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:58887)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YYWVJ-0007ib-G8; Thu, 19 Mar 2015 05:12:37 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id B760741E48;
	Thu, 19 Mar 2015 12:12:36 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id BA6DD93A;
	Thu, 19 Mar 2015 12:05:46 +0300 (MSK)
Received: (nullmailer pid 367 invoked by uid 1000);
	Thu, 19 Mar 2015 09:05:44 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 19 Mar 2015 12:05:39 +0300
Message-Id: <b76d799ea5ba233a768939c3192105099f84798d.1426755483.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1426755483.git.mjt@msgid.tls.msk.ru>
References: <cover.1426755483.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Markus Armbruster <armbru@redhat.com>
Subject: [Qemu-trivial] [PULL 21/24] hmp: Fix texinfo documentation
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
X-List-Received-Date: Thu, 19 Mar 2015 09:12:50 -0000

From: Markus Armbruster <armbru@redhat.com>

Several issues:

* Commands i and o lack @item.  Their one-liner documentation gets
  squashed into the preceding command print.  Add the obvious @item.

* Commands i, o and cpu-add lack @findex.  The function index doesn't
  have them.  Add the obvious @findex.

* Commit 727f005 put block_set_io_throttle was added in the middle of
  block_passwd.  Move it.

* Correct spelling of commands chardev-add and chardev-remove in @item
  and @findex.

* Some commands have a blank line between @item/@findex and the text,
  most don't.  Normalize to no blank line.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hmp-commands.hx | 41 +++++++++++++++--------------------------
 1 file changed, 15 insertions(+), 26 deletions(-)

diff --git a/hmp-commands.hx b/hmp-commands.hx
index 6fd5336..3089533 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -204,7 +204,6 @@ ETEXI
 STEXI
 @item change @var{device} @var{setting}
 @findex change
-
 Change the configuration of a device.
 
 @table @option
@@ -522,7 +521,6 @@ ETEXI
 STEXI
 @item p or print/@var{fmt} @var{expr}
 @findex print
-
 Print expression value. Only the @var{format} part of @var{fmt} is
 used.
 ETEXI
@@ -536,6 +534,8 @@ ETEXI
     },
 
 STEXI
+@item i/@var{fmt} @var{addr} [.@var{index}]
+@findex i
 Read I/O port.
 ETEXI
 
@@ -548,6 +548,8 @@ ETEXI
     },
 
 STEXI
+@item o/@var{fmt} @var{addr} @var{val}
+@findex o
 Write to I/O port.
 ETEXI
 
@@ -563,7 +565,6 @@ ETEXI
 STEXI
 @item sendkey @var{keys}
 @findex sendkey
-
 Send @var{keys} to the guest. @var{keys} could be the name of the
 key or the raw value in hexadecimal format. Use @code{-} to press
 several keys simultaneously. Example:
@@ -586,7 +587,6 @@ ETEXI
 STEXI
 @item system_reset
 @findex system_reset
-
 Reset the system.
 ETEXI
 
@@ -601,7 +601,6 @@ ETEXI
 STEXI
 @item system_powerdown
 @findex system_powerdown
-
 Power down the system (if supported).
 ETEXI
 
@@ -616,7 +615,6 @@ ETEXI
 STEXI
 @item sum @var{addr} @var{size}
 @findex sum
-
 Compute the checksum of a memory region.
 ETEXI
 
@@ -631,7 +629,6 @@ ETEXI
 STEXI
 @item usb_add @var{devname}
 @findex usb_add
-
 Add the USB device @var{devname}.  For details of available devices see
 @ref{usb_devices}
 ETEXI
@@ -647,7 +644,6 @@ ETEXI
 STEXI
 @item usb_del @var{devname}
 @findex usb_del
-
 Remove the USB device @var{devname} from the QEMU virtual USB
 hub. @var{devname} has the syntax @code{bus.addr}. Use the monitor
 command @code{info usb} to see the devices you can remove.
@@ -666,7 +662,6 @@ ETEXI
 STEXI
 @item device_add @var{config}
 @findex device_add
-
 Add device.
 ETEXI
 
@@ -682,7 +677,6 @@ ETEXI
 STEXI
 @item device_del @var{id}
 @findex device_del
-
 Remove device @var{id}.
 ETEXI
 
@@ -823,7 +817,6 @@ ETEXI
 STEXI
 @item boot_set @var{bootdevicelist}
 @findex boot_set
-
 Define new values for the boot device list. Those values will override
 the values specified on the command line through the @code{-boot} option.
 
@@ -1538,9 +1531,9 @@ ETEXI
     },
 
 STEXI
-@item block_set_io_throttle @var{device} @var{bps} @var{bps_rd} @var{bps_wr} @var{iops} @var{iops_rd} @var{iops_wr}
-@findex block_set_io_throttle
-Change I/O throttle limits for a block drive to @var{bps} @var{bps_rd} @var{bps_wr} @var{iops} @var{iops_rd} @var{iops_wr}
+@item block_passwd @var{device} @var{password}
+@findex block_passwd
+Set the encrypted device @var{device} password to @var{password}
 ETEXI
 
     {
@@ -1552,9 +1545,9 @@ ETEXI
     },
 
 STEXI
-@item block_passwd @var{device} @var{password}
-@findex block_passwd
-Set the encrypted device @var{device} password to @var{password}
+@item block_set_io_throttle @var{device} @var{bps} @var{bps_rd} @var{bps_wr} @var{iops} @var{iops_rd} @var{iops_wr}
+@findex block_set_io_throttle
+Change I/O throttle limits for a block drive to @var{bps} @var{bps_rd} @var{bps_wr} @var{iops} @var{iops_rd} @var{iops_wr}
 ETEXI
 
     {
@@ -1568,7 +1561,6 @@ ETEXI
 STEXI
 @item set_password [ vnc | spice ] password [ action-if-connected ]
 @findex set_password
-
 Change spice/vnc password.  Use zero to make the password stay valid
 forever.  @var{action-if-connected} specifies what should happen in
 case a connection is established: @var{fail} makes the password change
@@ -1588,7 +1580,6 @@ ETEXI
 STEXI
 @item expire_password [ vnc | spice ] expire-time
 @findex expire_password
-
 Specify when a password for spice/vnc becomes
 invalid. @var{expire-time} accepts:
 
@@ -1619,9 +1610,8 @@ ETEXI
     },
 
 STEXI
-@item chardev_add args
-@findex chardev_add
-
+@item chardev-add args
+@findex chardev-add
 chardev_add accepts the same parameters as the -chardev command line switch.
 
 ETEXI
@@ -1636,9 +1626,8 @@ ETEXI
     },
 
 STEXI
-@item chardev_remove id
-@findex chardev_remove
-
+@item chardev-remove id
+@findex chardev-remove
 Removes the chardev @var{id}.
 
 ETEXI
@@ -1654,7 +1643,6 @@ ETEXI
 STEXI
 @item qemu-io @var{device} @var{command}
 @findex qemu-io
-
 Executes a qemu-io command on the given block device.
 
 ETEXI
@@ -1669,6 +1657,7 @@ ETEXI
 
 STEXI
 @item cpu-add @var{id}
+@findex cpu-add
 Add CPU with id @var{id}
 ETEXI
 
-- 
2.1.4


