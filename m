Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dfltG-0004n8-1k
	for mharc-qemu-trivial@gnu.org; Thu, 10 Aug 2017 07:44:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34613)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dfltD-0004lR-Gf
	for qemu-trivial@nongnu.org; Thu, 10 Aug 2017 07:44:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dfltC-0000cc-Gz
	for qemu-trivial@nongnu.org; Thu, 10 Aug 2017 07:44:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49742)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1dflt7-0000aJ-U9; Thu, 10 Aug 2017 07:44:30 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A4F063E2D7;
	Thu, 10 Aug 2017 11:44:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com A4F063E2D7
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from thh440s.redhat.com (ovpn-116-37.ams2.redhat.com [10.36.116.37])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4CBDC77D4A;
	Thu, 10 Aug 2017 11:44:27 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Daniel Berrange <berrange@redhat.com>,
	qemu-trivial@nongnu.org
Date: Thu, 10 Aug 2017 13:44:26 +0200
Message-Id: <1502365466-19432-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Thu, 10 Aug 2017 11:44:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] qemu-doc: Fix "-net van" typo
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
X-List-Received-Date: Thu, 10 Aug 2017 11:44:36 -0000

While Andrew S. Tanenbaum has a point by saying "Never underestimate the
bandwidth of a station wagon full of tapes hurtling down the highway",
we don't support that way of transportation in QEMU yet, so replace the
typo with the correct word "vlan".

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 qemu-doc.texi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-doc.texi b/qemu-doc.texi
index 92d50f1..9811476 100644
--- a/qemu-doc.texi
+++ b/qemu-doc.texi
@@ -3243,7 +3243,7 @@ the ``-netdev user,guestfwd=ARGS'' argument instead.
 
 @subsection -net vlan (since 2.9.0)
 
-The ``-net van=NN'' argument is partially replaced with the
+The ``-net vlan=NN'' argument is partially replaced with the
 new ``-netdev'' argument. The remaining use cases will no
 longer be directly supported in QEMU.
 
-- 
1.8.3.1


