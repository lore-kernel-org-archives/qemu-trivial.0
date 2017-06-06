Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dIFyJ-0006LX-5d
	for mharc-qemu-trivial@gnu.org; Tue, 06 Jun 2017 11:00:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41987)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1dIFyD-0006Ii-ML
	for qemu-trivial@nongnu.org; Tue, 06 Jun 2017 11:00:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1dIFy9-0004Or-9m
	for qemu-trivial@nongnu.org; Tue, 06 Jun 2017 11:00:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46468)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1dIFy0-0004LS-BZ; Tue, 06 Jun 2017 11:00:20 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BEB1C90905;
	Tue,  6 Jun 2017 15:00:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com BEB1C90905
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=pbonzini@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com BEB1C90905
Received: from donizetti.redhat.com (ovpn-117-248.ams2.redhat.com
	[10.36.117.248])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v56F0HX6025267; Tue, 6 Jun 2017 11:00:17 -0400
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Date: Tue,  6 Jun 2017 17:00:16 +0200
Message-Id: <20170606150016.17143-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 06 Jun 2017 15:00:18 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] qemu-doc: do not refer to years-old version
 numbers
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
X-List-Received-Date: Tue, 06 Jun 2017 15:00:37 -0000

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qemu-doc.texi | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/qemu-doc.texi b/qemu-doc.texi
index 8e5c4a951f..51046ef9d1 100644
--- a/qemu-doc.texi
+++ b/qemu-doc.texi
@@ -386,11 +386,9 @@ CPU registers by prefixing them with @emph{$}.
 @node disk_images
 @section Disk Images
 
-Since version 0.6.1, QEMU supports many disk image formats, including
-growable disk images (their size increase as non empty sectors are
-written), compressed and encrypted disk images. Version 0.8.3 added
-the new qcow2 disk image format which is essential to support VM
-snapshots.
+QEMU supports many disk image formats, including growable disk images
+(their size increase as non empty sectors are written), compressed and
+encrypted disk images.
 
 @menu
 * disk_images_quickstart::    Quick start for disk image creation
-- 
2.13.0


