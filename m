Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dMsnJ-00056Q-9W
	for mharc-qemu-trivial@gnu.org; Mon, 19 Jun 2017 05:16:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45239)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dMsnG-000555-UB
	for qemu-trivial@nongnu.org; Mon, 19 Jun 2017 05:16:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dMsnG-0004bz-0g
	for qemu-trivial@nongnu.org; Mon, 19 Jun 2017 05:16:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37440)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1dMsn9-0004YF-Mt; Mon, 19 Jun 2017 05:16:15 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A0DE8C04B93A;
	Mon, 19 Jun 2017 09:16:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com A0DE8C04B93A
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=thuth@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com A0DE8C04B93A
Received: from thh440s.redhat.com (ovpn-116-149.ams2.redhat.com
	[10.36.116.149])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2E65E863D3;
	Mon, 19 Jun 2017 09:16:12 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>
Cc: qemu-trivial@nongnu.org
Date: Mon, 19 Jun 2017 11:16:11 +0200
Message-Id: <1497863771-24929-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Mon, 19 Jun 2017 09:16:14 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] qemu-doc: Add missing "@c man end" statements
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
X-List-Received-Date: Mon, 19 Jun 2017 09:16:24 -0000

Since commit 3f2ce724f1f1 ("Move the qemu-ga description into a
separate chapter"), the qemu.1 man page looks pretty much screwed
up, e.g. the title was "qemu-ga - QEMU Guest Agent" instead of
"qemu-doc - QEMU Emulator User Documentation". However, that movement
of the gemu-ga chapter is not the real problem, it just triggered
another bug in the qemu-doc.texi: There are some parts in the file
which introduce a "@c man begin OPTIONS" section, but never close
it again with "@c man end". After adding the proper end tags here,
the title of the man page is right again and the previously wrongly
tagged sections now also show up correctly in the man page, too.

Reported-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 qemu-doc.texi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/qemu-doc.texi b/qemu-doc.texi
index 965ba59..d23c796 100644
--- a/qemu-doc.texi
+++ b/qemu-doc.texi
@@ -2565,6 +2565,8 @@ so should only be used with trusted guest OS.
 
 @end table
 
+@c man end
+
 @node ColdFire System emulator
 @section ColdFire System emulator
 @cindex system emulation (ColdFire)
@@ -2609,6 +2611,8 @@ so should only be used with trusted guest OS.
 
 @end table
 
+@c man end
+
 @node Cris System emulator
 @section Cris System emulator
 @cindex system emulation (Cris)
@@ -2681,6 +2685,8 @@ so should only be used with trusted guest OS.
 
 @end table
 
+@c man end
+
 @node QEMU Guest Agent
 @chapter QEMU Guest Agent invocation
 
-- 
1.8.3.1


