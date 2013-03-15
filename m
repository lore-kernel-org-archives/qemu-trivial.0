Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UGOBQ-0007In-Vi
	for mharc-qemu-trivial@gnu.org; Fri, 15 Mar 2013 02:32:04 -0400
Received: from eggs.gnu.org ([208.118.235.92]:47061)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hutao@cn.fujitsu.com>) id 1UGOBO-0007IY-VR
	for qemu-trivial@nongnu.org; Fri, 15 Mar 2013 02:32:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hutao@cn.fujitsu.com>) id 1UGOBN-0004dy-LW
	for qemu-trivial@nongnu.org; Fri, 15 Mar 2013 02:32:02 -0400
Received: from [222.73.24.84] (port=2847 helo=song.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hutao@cn.fujitsu.com>)
	id 1UGOBN-0004bt-B0; Fri, 15 Mar 2013 02:32:01 -0400
X-IronPort-AV: E=Sophos;i="4.84,850,1355068800"; 
   d="scan'208";a="6877397"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 15 Mar 2013 14:29:28 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id r2F6VsV3012523;
	Fri, 15 Mar 2013 14:31:54 +0800
Received: from localhost.localdomain ([10.167.233.156])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013031514303710-893282 ;
	Fri, 15 Mar 2013 14:30:37 +0800 
From: Hu Tao <hutao@cn.fujitsu.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri, 15 Mar 2013 14:32:01 +0800
Message-Id: <1363329121-20625-1-git-send-email-hutao@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.1.4
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/03/15 14:30:37,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/03/15 14:30:37,
	Serialize complete at 2013/03/15 14:30:37
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 222.73.24.84
Subject: [Qemu-trivial] [PATCH] memory: fix a bug of detection of memory
	region collision
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
X-List-Received-Date: Fri, 15 Mar 2013 06:32:04 -0000

The collision reports before and after this patch are:

before:

warning: subregion collision cfc/4 (pci-conf-data) vs cf8/4 (pci-conf-idx)
warning: subregion collision 8000000/f8000000 (pci-hole) vs 0/8000000 (ram-below-4g)
warning: subregion collision 100000000/4000000000000000 (pci-hole64) vs 8000000/f8000000 (pci-hole)
warning: subregion collision 4d1/1 (kvm-elcr) vs 4d0/1 (kvm-elcr)
warning: subregion collision fec00000/1000 (kvm-ioapic) vs 8000000/f8000000 (pci-hole)
warning: subregion collision 80/1 (ioport80) vs 7e/2 (kvmvapic)
warning: subregion collision fed00000/400 (hpet) vs 8000000/f8000000 (pci-hole)
warning: subregion collision 81/3 (dma-page) vs 80/1 (ioport80)
warning: subregion collision 8/8 (dma-cont) vs 0/8 (dma-chan)
warning: subregion collision d0/10 (dma-cont) vs c0/10 (dma-chan)
warning: subregion collision 0/80 (ich9-pm) vs 8/8 (dma-cont)
warning: subregion collision 0/80 (ich9-pm) vs 0/8 (dma-chan)
warning: subregion collision 0/80 (ich9-pm) vs 64/1 (i8042-cmd)
warning: subregion collision 0/80 (ich9-pm) vs 60/1 (i8042-data)
warning: subregion collision 0/80 (ich9-pm) vs 61/1 (elcr)
warning: subregion collision 0/80 (ich9-pm) vs 40/4 (kvm-pit)
warning: subregion collision 0/80 (ich9-pm) vs 70/2 (rtc)
warning: subregion collision 0/80 (ich9-pm) vs 20/2 (kvm-pic)
warning: subregion collision 0/80 (ich9-pm) vs 7e/2 (kvmvapic)
warning: subregion collision 4/2 (acpi-cnt) vs 0/4 (acpi-evt)
warning: subregion collision 30/8 (apci-smi) vs 20/10 (apci-gpe0)
warning: subregion collision b0000000/10000000 (pcie-mmcfg) vs 8000000/f8000000 (pci-hole)

after:

warning: subregion collision fec00000/1000 (kvm-ioapic) vs 8000000/f8000000 (pci-hole)
warning: subregion collision fed00000/400 (hpet) vs 8000000/f8000000 (pci-hole)
warning: subregion collision 0/80 (ich9-pm) vs 8/8 (dma-cont)
warning: subregion collision 0/80 (ich9-pm) vs 0/8 (dma-chan)
warning: subregion collision 0/80 (ich9-pm) vs 64/1 (i8042-cmd)
warning: subregion collision 0/80 (ich9-pm) vs 60/1 (i8042-data)
warning: subregion collision 0/80 (ich9-pm) vs 61/1 (elcr)
warning: subregion collision 0/80 (ich9-pm) vs 40/4 (kvm-pit)
warning: subregion collision 0/80 (ich9-pm) vs 70/2 (rtc)
warning: subregion collision 0/80 (ich9-pm) vs 20/2 (kvm-pic)
warning: subregion collision 0/80 (ich9-pm) vs 7e/2 (kvmvapic)
warning: subregion collision b0000000/10000000 (pcie-mmcfg) vs 8000000/f8000000 (pci-hole)

Signed-off-by: Hu Tao <hutao@cn.fujitsu.com>
---
 memory.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/memory.c b/memory.c
index 92a2196..75ca281 100644
--- a/memory.c
+++ b/memory.c
@@ -1321,7 +1321,7 @@ static void memory_region_add_subregion_common(MemoryRegion *mr,
         if (subregion->may_overlap || other->may_overlap) {
             continue;
         }
-        if (int128_gt(int128_make64(offset),
+        if (int128_ge(int128_make64(offset),
                       int128_add(int128_make64(other->addr), other->size))
             || int128_le(int128_add(int128_make64(offset), subregion->size),
                          int128_make64(other->addr))) {
-- 
1.8.1.4


