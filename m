Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jtmwX-0007C7-ME
	for mharc-qemu-trivial@gnu.org; Fri, 10 Jul 2020 02:55:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jtmwW-0007By-Le
 for qemu-trivial@nongnu.org; Fri, 10 Jul 2020 02:55:32 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:44293
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jtmwU-00026U-Le
 for qemu-trivial@nongnu.org; Fri, 10 Jul 2020 02:55:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594364130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=dtkTGLlrL7utWqk1B9ekfPUSEt/hltKmp8Zu5f5/dlo=;
 b=bBqkn0DhYv9ezmH2t5IQ+Zs6csUj4aUt5y8XgrN9b29+xYmsZ3qHS+ri7CPFKXXW3qvrGL
 BpHZxfYdVe0Yhd48h2btLm+mYVfwtSMYrD4/uPCpdZSjx1halSUKTvY5gtqHPVFpbdEvTE
 EmVjO9QiIUAN54w866OSPc6VBo5WsQA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-484-r5gXUP60Oqya8jMLjjWZxA-1; Fri, 10 Jul 2020 02:55:27 -0400
X-MC-Unique: r5gXUP60Oqya8jMLjjWZxA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8DE01100CC84;
 Fri, 10 Jul 2020 06:55:26 +0000 (UTC)
Received: from thuth.com (ovpn-112-68.ams2.redhat.com [10.36.112.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 704046106A;
 Fri, 10 Jul 2020 06:55:22 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
	qemu-trivial@nongnu.org
Subject: [PATCH] docs/qdev-device-use: Clean up the sentences related to
 -usbdevice
Date: Fri, 10 Jul 2020 08:55:20 +0200
Message-Id: <20200710065520.24784-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=205.139.110.61; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/09 22:08:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 10 Jul 2020 06:55:32 -0000

Most of the -usbdevice paramaters have been removed already. Update
the doc accordingly.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/qdev-device-use.txt | 28 +++-------------------------
 1 file changed, 3 insertions(+), 25 deletions(-)

diff --git a/docs/qdev-device-use.txt b/docs/qdev-device-use.txt
index 4bbbcf561f..f8d0d2fe29 100644
--- a/docs/qdev-device-use.txt
+++ b/docs/qdev-device-use.txt
@@ -125,12 +125,7 @@ The -device argument differs in detail for each type of drive:
 
 * if=pflash, if=mtd, if=sd, if=xen are not yet available with -device
 
-For USB devices, the old way is actually different:
-
-    -usbdevice disk:format=FMT:FILENAME
-
-Provides much less control than -drive's OPTS...  The new way fixes
-that:
+For USB storage devices, you can use something like:
 
     -device usb-storage,drive=DRIVE-ID,removable=RMB
 
@@ -177,8 +172,6 @@ The appropriate DEVNAME depends on the machine type.  For type "pc":
 
   This lets you control I/O ports and IRQs.
 
-* -usbdevice serial::chardev becomes -device usb-serial,chardev=dev.
-
 * -usbdevice braille doesn't support LEGACY-CHARDEV syntax.  It always
   uses "braille".  With -device, this useful default is gone, so you
   have to use something like
@@ -238,10 +231,6 @@ The old way to define the guest part looks like this:
 
     -net nic,netdev=NET-ID,macaddr=MACADDR,model=MODEL,name=ID,addr=STR,vectors=V
 
-Except for USB it looks like this:
-
-    -usbdevice net:netdev=NET-ID,macaddr=MACADDR,name=ID
-
 The new way is -device:
 
     -device DEVNAME,netdev=NET-ID,mac=MACADDR,DEV-OPTS...
@@ -336,12 +325,7 @@ The new way is -device DEVNAME,DEV-OPTS...  Details depend on DRIVER:
 * mouse           -device usb-mouse
 * tablet          -device usb-tablet
 * wacom-tablet    -device usb-wacom-tablet
-* host:...        See "Host Device Assignment"
-* disk:...        See "Block Devices"
-* serial:...      See "Character Devices"
 * braille         See "Character Devices"
-* net:...         See "Network Devices"
-* bt:...          not yet available with -device
 
 === Watchdog Devices ===
 
@@ -358,17 +342,11 @@ and host USB devices.  PCI devices can only be assigned with -device:
 
     -device vfio-pci,host=ADDR,id=ID
 
-The old way to assign a host USB device is
-
-    -usbdevice host:auto:BUS.ADDR:VID:PRID
-
-where any of BUS, ADDR, VID, PRID can be the wildcard *.
-
-The new way is
+To assign a host USB device use:
 
     -device usb-host,hostbus=BUS,hostaddr=ADDR,vendorid=VID,productid=PRID
 
-Omitted options match anything, just like the old way's wildcard.
+Omitted options match anything.
 
 === Default Devices ===
 
-- 
2.18.1


