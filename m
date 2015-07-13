Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZEcO3-0004O5-5c
	for mharc-qemu-trivial@gnu.org; Mon, 13 Jul 2015 07:59:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60135)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1ZEcNv-0004Dg-08
	for qemu-trivial@nongnu.org; Mon, 13 Jul 2015 07:59:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1ZEcNu-00032q-1f
	for qemu-trivial@nongnu.org; Mon, 13 Jul 2015 07:58:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59124)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1ZEcNn-00031u-U3; Mon, 13 Jul 2015 07:58:52 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id C06D691582;
	Mon, 13 Jul 2015 11:58:50 +0000 (UTC)
Received: from nilsson.home.kraxel.org (ovpn-116-52.ams2.redhat.com
	[10.36.116.52])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t6DBwn8a003732; Mon, 13 Jul 2015 07:58:50 -0400
Received: by nilsson.home.kraxel.org (Postfix, from userid 500)
	id 569CA80B8B; Mon, 13 Jul 2015 13:58:49 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 13 Jul 2015 13:58:46 +0200
Message-Id: <1436788726-20590-1-git-send-email-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [Qemu-trivial] [PATCH] virtio-vga: enable for i386
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
X-List-Received-Date: Mon, 13 Jul 2015 11:59:05 -0000

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-trivial@nongnu.org
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 default-configs/i386-softmmu.mak | 1 +
 1 file changed, 1 insertion(+)

diff --git a/default-configs/i386-softmmu.mak b/default-configs/i386-softmmu.mak
index 48b5762..6f042e2 100644
--- a/default-configs/i386-softmmu.mak
+++ b/default-configs/i386-softmmu.mak
@@ -7,6 +7,7 @@ CONFIG_QXL=$(CONFIG_SPICE)
 CONFIG_VGA_ISA=y
 CONFIG_VGA_CIRRUS=y
 CONFIG_VMWARE_VGA=y
+CONFIG_VIRTIO_VGA=y
 CONFIG_VMMOUSE=y
 CONFIG_SERIAL=y
 CONFIG_PARALLEL=y
-- 
1.8.3.1


