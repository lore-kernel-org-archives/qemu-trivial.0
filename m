Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dCuKk-000451-Ba
	for mharc-qemu-trivial@gnu.org; Mon, 22 May 2017 16:53:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60923)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dCuKh-00043s-UK
	for qemu-trivial@nongnu.org; Mon, 22 May 2017 16:53:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dCuKh-0002GM-49
	for qemu-trivial@nongnu.org; Mon, 22 May 2017 16:53:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41598)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1dCuKc-0002FT-NW; Mon, 22 May 2017 16:53:34 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 639C12D9FDC;
	Mon, 22 May 2017 20:53:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 639C12D9FDC
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=thuth@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 639C12D9FDC
Received: from thh440s.redhat.com (ovpn-116-116.ams2.redhat.com
	[10.36.116.116])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 86C10173BD;
	Mon, 22 May 2017 20:53:30 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: Michael Roth <mdroth@linux.vnet.ibm.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 22 May 2017 22:53:29 +0200
Message-Id: <1495486409-5197-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Mon, 22 May 2017 20:53:33 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] qemu-doc: Move the qemu-ga description into
 a separate chapter
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
X-List-Received-Date: Mon, 22 May 2017 20:53:40 -0000

The qemu-ga description is currently a subsection of the Disk Images
chapter - which does not make much sense since the qemu-ga is not
directly related to disk images. So let's move this information
into a separate chapter instead.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 qemu-doc.texi | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/qemu-doc.texi b/qemu-doc.texi
index b0bfd84..965ba59 100644
--- a/qemu-doc.texi
+++ b/qemu-doc.texi
@@ -34,6 +34,7 @@
 * Introduction::
 * QEMU PC System emulator::
 * QEMU System emulator for non PC targets::
+* QEMU Guest Agent::
 * QEMU User space emulator::
 * Implementation notes::
 * License::
@@ -396,7 +397,6 @@ snapshots.
 * vm_snapshots::              VM snapshots
 * qemu_img_invocation::       qemu-img Invocation
 * qemu_nbd_invocation::       qemu-nbd Invocation
-* qemu_ga_invocation::        qemu-ga Invocation
 * disk_images_formats::       Disk image file formats
 * host_drives::               Using host drives
 * disk_images_fat_images::    Virtual FAT disk images
@@ -490,11 +490,6 @@ state is not saved or restored properly (in particular USB).
 
 @include qemu-nbd.texi
 
-@node qemu_ga_invocation
-@subsection @code{qemu-ga} Invocation
-
-@include qemu-ga.texi
-
 @node disk_images_formats
 @subsection Disk image file formats
 
@@ -2685,6 +2680,12 @@ Note that this allows guest direct access to the host filesystem,
 so should only be used with trusted guest OS.
 
 @end table
+
+@node QEMU Guest Agent
+@chapter QEMU Guest Agent invocation
+
+@include qemu-ga.texi
+
 @node QEMU User space emulator
 @chapter QEMU User space emulator
 
-- 
1.8.3.1


