Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WQN5q-0000ty-O6
	for mharc-qemu-trivial@gnu.org; Wed, 19 Mar 2014 16:28:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44901)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <m.smarduch@samsung.com>) id 1WQKEq-0002Tc-IW
	for qemu-trivial@nongnu.org; Wed, 19 Mar 2014 13:25:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <m.smarduch@samsung.com>) id 1WQKEi-00058c-Tp
	for qemu-trivial@nongnu.org; Wed, 19 Mar 2014 13:25:12 -0400
Received: from mailout4.w2.samsung.com ([211.189.100.14]:15945
	helo=usmailout4.samsung.com) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <m.smarduch@samsung.com>)
	id 1WQKET-0004yD-Fo; Wed, 19 Mar 2014 13:24:49 -0400
Received: from uscpsbgex1.samsung.com
	(u122.gpu85.samsung.co.kr [203.254.195.122]) by usmailout4.samsung.com
	(Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit
	(built Nov
	17 2011)) with ESMTP id <0N2P0007A1P9P250@usmailout4.samsung.com>; Wed,
	19 Mar 2014 13:24:45 -0400 (EDT)
X-AuditID: cbfec37a-b7fc06d00000555a-b5-5329d2dd5696
Received: from usmmp1.samsung.com ( [203.254.195.77])	by uscpsbgex1.samsung.com
	(USCPEXMTA) with SMTP id B4.8D.21850.DD2D9235; Wed,
	19 Mar 2014 13:24:45 -0400 (EDT)
Received: from sisasmtp.sisa.samsung.com ([105.144.21.116])
	by usmmp1.samsung.com
	(Oracle Communications Messaging Server 7u4-27.01(7.0.4.27.0) 64bit
	(built Aug
	30 2012)) with ESMTP id <0N2P00G4A1P99300@usmmp1.samsung.com>; Wed,
	19 Mar 2014 13:24:45 -0400 (EDT)
Received: from [105.144.129.76] (105.144.129.76) by SISAEX02SJ.sisa.samsung.com
	(105.144.21.116) with Microsoft SMTP Server (TLS) id 14.1.421.2; Wed,
	19 Mar 2014 10:24:44 -0700
Message-id: <5329D2CA.6020909@samsung.com>
Date: Wed, 19 Mar 2014 10:24:26 -0700
From: Mario Smarduch <m.smarduch@samsung.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:17.0) Gecko/20130804
	Thunderbird/17.0.8
MIME-version: 1.0
To: qemu-devel <qemu-devel@nongnu.org>
Content-type: text/plain; charset=ISO-8859-1
Content-transfer-encoding: 7bit
X-Originating-IP: [105.144.129.76]
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprLLMWRmVeSWpSXmKPExsVy+t9hX927lzSDDY6fNLU43ruDxWLtmbms
	DkweT65tZgpgjOKySUnNySxLLdK3S+DK2HJqDmPBAbaKc6172RoYf7B0MXJySAiYSKz4/4UJ
	whaTuHBvPVsXIxeHkMAyRom5NzeygSSEBHqZJF72ZULYWxgldu+KA7F5BbQkPhw4ANbMIqAq
	cfzsdXYQm01AV2L/vY1gtqhAhMSf0/tYIeoFJX5Mvge2WERATWLprd+MIDazgLTEyu8rmEFs
	YQFPiY7uFjaIuI7E/tZpULa8xOY1b5khblCV2HbzOVAvB9DRShKrj5hPYBSchWTDLCTds5B0
	L2BkXsUoVlqcXFCclJ5aYahXnJhbXJqXrpecn7uJERKkVTsY73y1OcQowMGoxMO7Yo9msBBr
	YllxZe4hRgkOZiUR3lcgId6UxMqq1KL8+KLSnNTiQ4xMHJxSDYwlQWvTZyYJuDNyOJsW/Rdo
	vL/Nvdj6meyrGcqSD4yL23Z4z3986cMEZd8SowdbN7qdPN3B8D2W9+fV24x8GSlfZ2z4a7lK
	onBxqiD31j08U3jFPq1t5W4w1vR8dPj8nEsr0nq9nGN1tl57xrGN81HGj+cW37VVbmx1uHBG
	e8uX5KXmmhG//kkpsRRnJBpqMRcVJwIAtkswzDACAAA=
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 211.189.100.14
X-Mailman-Approved-At: Wed, 19 Mar 2014 16:28:06 -0400
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [Qemu-devel][PATCH] fix return check for
	KVM_GET_DIRTY_LOG ioctl
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
X-List-Received-Date: Wed, 19 Mar 2014 17:25:20 -0000


Fix return condition check from kvm_vm_ioctl(s, KVM_GET_DIRTY_LOG, &d) to
handle internal failures or no support for memory slot dirty bitmap.
Otherwise the ioctl succeeds and continues with migration.
Addresses BUG# 1294227

Signed-off-by: Mario Smarduch <m.smarduch@samsung.com>
---
 kvm-all.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kvm-all.c b/kvm-all.c
index 82a9119..cd4111d 100644
--- a/kvm-all.c
+++ b/kvm-all.c
@@ -441,7 +441,7 @@ static int kvm_physical_sync_dirty_bitmap(MemoryRegionSection *section)
 
         d.slot = mem->slot;
 
-        if (kvm_vm_ioctl(s, KVM_GET_DIRTY_LOG, &d) == -1) {
+        if (kvm_vm_ioctl(s, KVM_GET_DIRTY_LOG, &d) < 0) {
             DPRINTF("ioctl failed %d\n", errno);
             ret = -1;
             break;
-- 
1.7.9.5




