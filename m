Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z70IH-0006ch-Hr
	for mharc-qemu-trivial@gnu.org; Mon, 22 Jun 2015 07:53:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60764)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z70I9-0006N9-6X
	for qemu-trivial@nongnu.org; Mon, 22 Jun 2015 07:53:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z70I7-0000QY-RW
	for qemu-trivial@nongnu.org; Mon, 22 Jun 2015 07:53:32 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:49344)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Z70I2-0000Nn-7p; Mon, 22 Jun 2015 07:53:26 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id F323641E51;
	Mon, 22 Jun 2015 14:53:24 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 8BA09A57;
	Mon, 22 Jun 2015 14:16:31 +0300 (MSK)
Received: (nullmailer pid 9244 invoked by uid 1000);
	Mon, 22 Jun 2015 11:16:30 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 22 Jun 2015 14:16:10 +0300
Message-Id: <0e8f3913d093beb081bc9014a15603330d48a9a2.1434971627.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1434971627.git.mjt@msgid.tls.msk.ru>
References: <cover.1434971627.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: [Qemu-trivial] [PULL 03/21] Grammar: 'as to'->'as for'
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
X-List-Received-Date: Mon, 22 Jun 2015 11:53:34 -0000

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Fixup migrate-incoming text as requested by Eric in:

 http://lists.nongnu.org/archive/html/qemu-devel/2015-03/msg03362.html

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qmp-commands.hx | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qmp-commands.hx b/qmp-commands.hx
index 1db6524..662b170 100644
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
2.1.4


