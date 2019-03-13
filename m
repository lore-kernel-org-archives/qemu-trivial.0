Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h459A-0003Za-B3
	for mharc-qemu-trivial@gnu.org; Wed, 13 Mar 2019 10:46:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34327)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1h4593-0003VZ-UI
	for qemu-trivial@nongnu.org; Wed, 13 Mar 2019 10:46:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1h4591-0004sQ-1F
	for qemu-trivial@nongnu.org; Wed, 13 Mar 2019 10:46:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39518)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1h458t-0004Zu-VB; Wed, 13 Mar 2019 10:46:06 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 56F89C06644D;
	Wed, 13 Mar 2019 14:46:00 +0000 (UTC)
Received: from blue.redhat.com (ovpn-118-35.phx2.redhat.com [10.3.118.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 026966B8D0;
	Wed, 13 Mar 2019 14:45:59 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Date: Wed, 13 Mar 2019 09:45:57 -0500
Message-Id: <20190313144557.8845-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 13 Mar 2019 14:46:00 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH for-4.0] maint: Ignore built elf2dmp
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
X-List-Received-Date: Wed, 13 Mar 2019 14:46:19 -0000

Commit 3fa2d384 added a binary 'elf2dmp' but did not ignore it
during an in-tree build.

Signed-off-by: Eric Blake <eblake@redhat.com>
---

Yes, I know we want to get rid of in-tree builds for 4.1; but
for 4.0, this patch may still make sense.

 .gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitignore b/.gitignore
index 77522561b8e..42d2d473559 100644
--- a/.gitignore
+++ b/.gitignore
@@ -6,6 +6,7 @@
 /config-target.*
 /config.status
 /config-temp
+/elf2dmp
 /trace-events-all
 /trace/generated-events.h
 /trace/generated-events.c
--=20
2.20.1


