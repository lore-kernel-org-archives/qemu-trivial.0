Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YVJBy-0008O2-92
	for mharc-qemu-trivial@gnu.org; Tue, 10 Mar 2015 08:23:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37370)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YVJBt-0008Ik-Lx
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 08:23:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YVJBp-0007It-FE
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 08:23:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47178)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1YVJBk-0007Dm-58; Tue, 10 Mar 2015 08:23:08 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t2ACN7VQ023796
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Tue, 10 Mar 2015 08:23:07 -0400
Received: from blackfin.pond.sub.org (ovpn-116-56.ams2.redhat.com
	[10.36.116.56])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t2ACN5t6003470
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 10 Mar 2015 08:23:06 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 7D42C303FEBB; Tue, 10 Mar 2015 13:23:04 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 10 Mar 2015 13:23:04 +0100
Message-Id: <1425990184-30913-1-git-send-email-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] hmp: Fix texinfo documentation
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
X-List-Received-Date: Tue, 10 Mar 2015 12:23:20 -0000

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
---
 hmp-commands.hx | 41 +++++++++++++++--------------------------
 1 file changed, 15 insertions(+), 26 deletions(-)

diff --git a/hmp-commands.hx b/hmp-commands.hx
index d5022d8..1cf0081 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -205,7 +205,6 @@ ETEXI
 STEXI
 @item change @var{device} @var{setting}
 @findex change
-
 Change the configuration of a device.
 
 @table @option
@@ -523,7 +522,6 @@ ETEXI
 STEXI
 @item p or print/@var{fmt} @var{expr}
 @findex print
-
 Print expression value. Only the @var{format} part of @var{fmt} is
 used.
 ETEXI
@@ -537,6 +535,8 @@ ETEXI
     },
 
 STEXI
+@item i/@var{fmt} @var{addr} [.@var{index}]
+@findex i
 Read I/O port.
 ETEXI
 
@@ -549,6 +549,8 @@ ETEXI
     },
 
 STEXI
+@item o/@var{fmt} @var{addr} @var{val}
+@findex o
 Write to I/O port.
 ETEXI
 
@@ -564,7 +566,6 @@ ETEXI
 STEXI
 @item sendkey @var{keys}
 @findex sendkey
-
 Send @var{keys} to the guest. @var{keys} could be the name of the
 key or the raw value in hexadecimal format. Use @code{-} to press
 several keys simultaneously. Example:
@@ -587,7 +588,6 @@ ETEXI
 STEXI
 @item system_reset
 @findex system_reset
-
 Reset the system.
 ETEXI
 
@@ -602,7 +602,6 @@ ETEXI
 STEXI
 @item system_powerdown
 @findex system_powerdown
-
 Power down the system (if supported).
 ETEXI
 
@@ -617,7 +616,6 @@ ETEXI
 STEXI
 @item sum @var{addr} @var{size}
 @findex sum
-
 Compute the checksum of a memory region.
 ETEXI
 
@@ -632,7 +630,6 @@ ETEXI
 STEXI
 @item usb_add @var{devname}
 @findex usb_add
-
 Add the USB device @var{devname}.  For details of available devices see
 @ref{usb_devices}
 ETEXI
@@ -648,7 +645,6 @@ ETEXI
 STEXI
 @item usb_del @var{devname}
 @findex usb_del
-
 Remove the USB device @var{devname} from the QEMU virtual USB
 hub. @var{devname} has the syntax @code{bus.addr}. Use the monitor
 command @code{info usb} to see the devices you can remove.
@@ -667,7 +663,6 @@ ETEXI
 STEXI
 @item device_add @var{config}
 @findex device_add
-
 Add device.
 ETEXI
 
@@ -683,7 +678,6 @@ ETEXI
 STEXI
 @item device_del @var{id}
 @findex device_del
-
 Remove device @var{id}.
 ETEXI
 
@@ -824,7 +818,6 @@ ETEXI
 STEXI
 @item boot_set @var{bootdevicelist}
 @findex boot_set
-
 Define new values for the boot device list. Those values will override
 the values specified on the command line through the @code{-boot} option.
 
@@ -1523,9 +1516,9 @@ ETEXI
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
@@ -1537,9 +1530,9 @@ ETEXI
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
@@ -1553,7 +1546,6 @@ ETEXI
 STEXI
 @item set_password [ vnc | spice ] password [ action-if-connected ]
 @findex set_password
-
 Change spice/vnc password.  Use zero to make the password stay valid
 forever.  @var{action-if-connected} specifies what should happen in
 case a connection is established: @var{fail} makes the password change
@@ -1573,7 +1565,6 @@ ETEXI
 STEXI
 @item expire_password [ vnc | spice ] expire-time
 @findex expire_password
-
 Specify when a password for spice/vnc becomes
 invalid. @var{expire-time} accepts:
 
@@ -1604,9 +1595,8 @@ ETEXI
     },
 
 STEXI
-@item chardev_add args
-@findex chardev_add
-
+@item chardev-add args
+@findex chardev-add
 chardev_add accepts the same parameters as the -chardev command line switch.
 
 ETEXI
@@ -1621,9 +1611,8 @@ ETEXI
     },
 
 STEXI
-@item chardev_remove id
-@findex chardev_remove
-
+@item chardev-remove id
+@findex chardev-remove
 Removes the chardev @var{id}.
 
 ETEXI
@@ -1639,7 +1628,6 @@ ETEXI
 STEXI
 @item qemu-io @var{device} @var{command}
 @findex qemu-io
-
 Executes a qemu-io command on the given block device.
 
 ETEXI
@@ -1654,6 +1642,7 @@ ETEXI
 
 STEXI
 @item cpu-add @var{id}
+@findex cpu-add
 Add CPU with id @var{id}
 ETEXI
 
-- 
1.9.3


