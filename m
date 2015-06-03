Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z0DeI-0001eA-KM
	for mharc-qemu-trivial@gnu.org; Wed, 03 Jun 2015 14:44:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42357)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1Z0DeC-0001Vc-3Y
	for qemu-trivial@nongnu.org; Wed, 03 Jun 2015 14:44:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1Z0De7-0005Dc-CV
	for qemu-trivial@nongnu.org; Wed, 03 Jun 2015 14:44:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41626)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>)
	id 1Z0Ddv-0004bS-V2; Wed, 03 Jun 2015 14:44:00 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 4C234B7A71;
	Wed,  3 Jun 2015 18:43:59 +0000 (UTC)
Received: from dgilbert-t530.redhat.com (ovpn-116-110.ams2.redhat.com
	[10.36.116.110])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t53Ihvqq022030; Wed, 3 Jun 2015 14:43:58 -0400
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  3 Jun 2015 19:43:56 +0100
Message-Id: <1433357036-19160-1-git-send-email-dgilbert@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, eblake@redhat.com
Subject: [Qemu-trivial] [PATCH] Grammar: 'as to'->'as for'
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
X-List-Received-Date: Wed, 03 Jun 2015 18:44:21 -0000

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Fixup migrate-incoming text as requested by Eric in:

 http://lists.nongnu.org/archive/html/qemu-devel/2015-03/msg03362.html

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 qmp-commands.hx | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qmp-commands.hx b/qmp-commands.hx
index 14e109e..ab5b11b 100644
--- a/qmp-commands.hx
+++ b/qmp-commands.hx
@@ -686,7 +686,7 @@ Notes:
 
 (1) QEMU must be started with -incoming defer to allow migrate-incoming to
     be used
-(2) The uri format is the same as to -incoming
+(2) The uri format is the same as for -incoming
 
 EQMP
     {
-- 
2.4.2


