Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gVJba-0001Xx-VE
	for mharc-qemu-trivial@gnu.org; Fri, 07 Dec 2018 12:07:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60067)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1gVJbY-0001V0-4V
	for qemu-trivial@nongnu.org; Fri, 07 Dec 2018 12:07:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1gVJbS-0000pc-9m
	for qemu-trivial@nongnu.org; Fri, 07 Dec 2018 12:07:56 -0500
Received: from mx1.redhat.com ([209.132.183.28]:31253)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1gVJbH-0000da-MJ; Fri, 07 Dec 2018 12:07:39 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0B17430842D0;
	Fri,  7 Dec 2018 17:07:39 +0000 (UTC)
Received: from red.redhat.com (ovpn-125-104.rdu2.redhat.com [10.10.125.104])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 110D25C1A1;
	Fri,  7 Dec 2018 17:07:37 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	berrange@redhat.com
Date: Fri,  7 Dec 2018 11:07:33 -0600
Message-Id: <20181207170733.129532-1-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Fri, 07 Dec 2018 17:07:39 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] maint: Grammar fix to mailmap
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
X-List-Received-Date: Fri, 07 Dec 2018 17:07:57 -0000

Make the sentence read better.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 .mailmap | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.mailmap b/.mailmap
index ed8faa57192..b8e08297c90 100644
--- a/.mailmap
+++ b/.mailmap
@@ -34,6 +34,6 @@ Justin Terry (VM) <juterry@microsoft.com> Justin Terry =
(VM) via Qemu-devel <qemu


 # Also list preferred name forms where people have changed their
-# git author config, or having utf8/latin1 encoding issues.
+# git author config, or had utf8/latin1 encoding issues.
 Daniel P. Berrang=C3=A9 <berrange@redhat.com>
 Reimar D=C3=B6ffinger <Reimar.Doeffinger@gmx.de>
--=20
2.17.2


