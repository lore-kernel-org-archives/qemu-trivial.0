Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h8v8k-0002PI-Vd
	for mharc-qemu-trivial@gnu.org; Tue, 26 Mar 2019 19:05:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47569)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.williamson@redhat.com>) id 1h8v8i-0002Nm-Rz
	for qemu-trivial@nongnu.org; Tue, 26 Mar 2019 19:05:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.williamson@redhat.com>) id 1h8v8i-0004kA-1a
	for qemu-trivial@nongnu.org; Tue, 26 Mar 2019 19:05:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55688)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alex.williamson@redhat.com>)
	id 1h8v8e-0004g8-9w; Tue, 26 Mar 2019 19:05:48 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9C8663007C28;
	Tue, 26 Mar 2019 23:05:47 +0000 (UTC)
Received: from gimli.home (ovpn-116-99.phx2.redhat.com [10.3.116.99])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4751E4DC56;
	Tue, 26 Mar 2019 23:05:39 +0000 (UTC)
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, marcel.apfelbaum@gmail.com, pbonzini@redhat.com,
	rth@twiddle.net, ehabkost@redhat.com, peterx@redhat.com,
	qemu-trivial@nongnu.org
Date: Tue, 26 Mar 2019 17:05:38 -0600
Message-ID: <155364147432.16467.15898335025013220939.stgit@gimli.home>
User-Agent: StGit/0.19-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Tue, 26 Mar 2019 23:05:47 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] intel_iommu: Correct caching-mode error
 message
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
X-List-Received-Date: Tue, 26 Mar 2019 23:05:53 -0000

If we try to use the intel-iommu device with vfio-pci devices without
caching mode enabled, we're told:

  qemu-system-x86_64: We need to set caching-mode=1 for intel-iommu to enable
  device assignment with IOMMU protection.

But to enable caching mode, the option is actually "caching-mode=on".

Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
---
 hw/i386/intel_iommu.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index b90de6c66461..b62badd4f08d 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -2919,7 +2919,7 @@ static void vtd_iommu_notify_flag_changed(IOMMUMemoryRegion *iommu,
     IntelIOMMUState *s = vtd_as->iommu_state;
 
     if (!s->caching_mode && new & IOMMU_NOTIFIER_MAP) {
-        error_report("We need to set caching-mode=1 for intel-iommu to enable "
+        error_report("We need to set caching-mode=on for intel-iommu to enable "
                      "device assignment with IOMMU protection.");
         exit(1);
     }


