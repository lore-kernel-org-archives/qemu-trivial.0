Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fdhx5-0000ey-Fk
	for mharc-qemu-trivial@gnu.org; Thu, 12 Jul 2018 16:12:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54257)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stweil@ub-blade-01.bib.uni-mannheim.de>)
	id 1fdhx1-0000cf-JN
	for qemu-trivial@nongnu.org; Thu, 12 Jul 2018 16:12:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stweil@ub-blade-01.bib.uni-mannheim.de>)
	id 1fdhx0-0002oe-96
	for qemu-trivial@nongnu.org; Thu, 12 Jul 2018 16:12:31 -0400
Received: from smtp.mail.uni-mannheim.de ([134.155.96.80]:48150)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stweil@ub-blade-01.bib.uni-mannheim.de>)
	id 1fdhwv-00022V-Ah; Thu, 12 Jul 2018 16:12:25 -0400
Received: from localhost (localhost [127.0.0.1])
	by smtp.mail.uni-mannheim.de (Postfix) with ESMTP id C51BA102400;
	Thu, 12 Jul 2018 22:01:53 +0200 (CEST)
X-Virus-Scanned: amavisd-new at uni-mannheim.de
Received: from smtp.mail.uni-mannheim.de ([134.155.96.80])
	by localhost (mail-r83.rz.uni-mannheim.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id ayltRjhdZaar; Thu, 12 Jul 2018 22:01:53 +0200 (CEST)
Received: from ub-blade-01.bib.uni-mannheim.de
	(ub-blade-01.bib.uni-mannheim.de [134.155.36.5])
	by smtp.mail.uni-mannheim.de (Postfix) with ESMTPS id A47701023A6;
	Thu, 12 Jul 2018 22:01:53 +0200 (CEST)
Received: from stweil by ub-blade-01.bib.uni-mannheim.de with local (Exim 4.89)
	(envelope-from <stweil@ub-blade-01.bib.uni-mannheim.de>)
	id 1fdhmj-0007RU-HM; Thu, 12 Jul 2018 22:01:53 +0200
From: Stefan Weil <sw@weilnetz.de>
To: QEMU Developer <qemu-devel@nongnu.org>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	zhanghailiang <zhang.zhanghailiang@huawei.com>,
	Stefan Weil <sw@weilnetz.de>
Date: Thu, 12 Jul 2018 22:01:52 +0200
Message-Id: <20180712200152.28569-1-sw@weilnetz.de>
X-Mailer: git-send-email 2.11.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 134.155.96.80
Subject: [Qemu-trivial] [PATCH] docs: Fix some typos (most found by
 codespell)
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Jul 2018 20:12:33 -0000

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 docs/COLO-FT.txt                     | 2 +-
 docs/config/mach-virt-graphical.cfg  | 2 +-
 docs/config/mach-virt-serial.cfg     | 2 +-
 docs/config/q35-emulated.cfg         | 2 +-
 docs/config/q35-virtio-graphical.cfg | 2 +-
 docs/config/q35-virtio-serial.cfg    | 2 +-
 docs/interop/vhost-user.txt          | 4 ++--
 docs/replay.txt                      | 2 +-
 docs/specs/tpm.txt                   | 2 +-
 9 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/docs/COLO-FT.txt b/docs/COLO-FT.txt
index d7c7dcda8f..70cfb9ce7d 100644
--- a/docs/COLO-FT.txt
+++ b/docs/COLO-FT.txt
@@ -104,7 +104,7 @@ Primary side.
 COLO Proxy:
 Delivers packets to Primary and Seconday, and then compare the responses from
 both side. Then decide whether to start a checkpoint according to some rules.
-Please refer to docs/colo-proxy.txt for more informations.
+Please refer to docs/colo-proxy.txt for more information.
 
 Note:
 HeartBeat has not been implemented yet, so you need to trigger failover process
diff --git a/docs/config/mach-virt-graphical.cfg b/docs/config/mach-virt-graphical.cfg
index 0fdf6846dd..d6d31b17f5 100644
--- a/docs/config/mach-virt-graphical.cfg
+++ b/docs/config/mach-virt-graphical.cfg
@@ -185,7 +185,7 @@
 # attached to it.
 #
 # We also create an optical disk, mostly for installation
-# purposes: once the guest OS has been succesfully
+# purposes: once the guest OS has been successfully
 # installed, the guest will no longer boot from optical
 # media. If you don't want, or no longer want, to have an
 # optical disk in the guest you can safely comment out
diff --git a/docs/config/mach-virt-serial.cfg b/docs/config/mach-virt-serial.cfg
index aee9f1c5a1..18a7c83731 100644
--- a/docs/config/mach-virt-serial.cfg
+++ b/docs/config/mach-virt-serial.cfg
@@ -191,7 +191,7 @@
 # attached to it.
 #
 # We also create an optical disk, mostly for installation
-# purposes: once the guest OS has been succesfully
+# purposes: once the guest OS has been successfully
 # installed, the guest will no longer boot from optical
 # media. If you don't want, or no longer want, to have an
 # optical disk in the guest you can safely comment out
diff --git a/docs/config/q35-emulated.cfg b/docs/config/q35-emulated.cfg
index c6416d6545..99ac918e78 100644
--- a/docs/config/q35-emulated.cfg
+++ b/docs/config/q35-emulated.cfg
@@ -130,7 +130,7 @@
 # it to that controller so that the guest can use it.
 #
 # We also create an optical disk, mostly for installation
-# purposes: once the guest OS has been succesfully
+# purposes: once the guest OS has been successfully
 # installed, the guest will no longer boot from optical
 # media. If you don't want, or no longer want, to have an
 # optical disk in the guest you can safely comment out
diff --git a/docs/config/q35-virtio-graphical.cfg b/docs/config/q35-virtio-graphical.cfg
index 28bde2fc57..4207f11e4f 100644
--- a/docs/config/q35-virtio-graphical.cfg
+++ b/docs/config/q35-virtio-graphical.cfg
@@ -136,7 +136,7 @@
 # attached to it.
 #
 # We also create an optical disk, mostly for installation
-# purposes: once the guest OS has been succesfully
+# purposes: once the guest OS has been successfully
 # installed, the guest will no longer boot from optical
 # media. If you don't want, or no longer want, to have an
 # optical disk in the guest you can safely comment out
diff --git a/docs/config/q35-virtio-serial.cfg b/docs/config/q35-virtio-serial.cfg
index c33c9cc07a..d2830aec5e 100644
--- a/docs/config/q35-virtio-serial.cfg
+++ b/docs/config/q35-virtio-serial.cfg
@@ -141,7 +141,7 @@
 # attached to it.
 #
 # We also create an optical disk, mostly for installation
-# purposes: once the guest OS has been succesfully
+# purposes: once the guest OS has been successfully
 # installed, the guest will no longer boot from optical
 # media. If you don't want, or no longer want, to have an
 # optical disk in the guest you can safely comment out
diff --git a/docs/interop/vhost-user.txt b/docs/interop/vhost-user.txt
index d51fd58242..0d8aa3ba7d 100644
--- a/docs/interop/vhost-user.txt
+++ b/docs/interop/vhost-user.txt
@@ -666,12 +666,12 @@ Master message types
       Equivalent ioctl: VHOST_SET_VRING_ENDIAN
       Master payload: vring state description
 
-      Set the endianess of a VQ for legacy devices. Little-endian is indicated
+      Set the endianness of a VQ for legacy devices. Little-endian is indicated
       with state.num set to 0 and big-endian is indicated with state.num set
       to 1. Other values are invalid.
       This request should be sent only when VHOST_USER_PROTOCOL_F_CROSS_ENDIAN
       has been negotiated.
-      Backends that negotiated this feature should handle both endianesses
+      Backends that negotiated this feature should handle both endiannesses
       and expect this message once (per VQ) during device configuration
       (ie. before the master starts the VQ).
 
diff --git a/docs/replay.txt b/docs/replay.txt
index 2e21e9ccb0..3497585f5a 100644
--- a/docs/replay.txt
+++ b/docs/replay.txt
@@ -320,7 +320,7 @@ Here is the list of events that are written into the log:
    async event id from the following list:
      - REPLAY_ASYNC_EVENT_BH. Bottom-half callback. This event synchronizes
        callbacks that affect virtual machine state, but normally called
-       asyncronously.
+       asynchronously.
        Argument: 8-byte operation id.
      - REPLAY_ASYNC_EVENT_INPUT. Input device event. Contains
        parameters of keyboard and mouse input operations
diff --git a/docs/specs/tpm.txt b/docs/specs/tpm.txt
index 70ad4a0cba..0e9bbebe1d 100644
--- a/docs/specs/tpm.txt
+++ b/docs/specs/tpm.txt
@@ -252,7 +252,7 @@ swtpm socket --tpmstate dir=/tmp/mytpm1 \
   --ctrl type=unixio,path=/tmp/mytpm1/swtpm-sock \
   --log level=20 --tpm2
 
-In the 2nd terminal restore the state of the VM using the additonal
+In the 2nd terminal restore the state of the VM using the additional
 '-incoming' option.
 
 qemu-system-x86_64 -display sdl -accel kvm \
-- 
2.11.0


