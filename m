Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z7NMD-0005ZP-7c
	for mharc-qemu-trivial@gnu.org; Tue, 23 Jun 2015 08:31:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33167)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mprivozn@redhat.com>) id 1Z7NM9-0005RG-1M
	for qemu-trivial@nongnu.org; Tue, 23 Jun 2015 08:31:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mprivozn@redhat.com>) id 1Z7NM7-0001OD-Hr
	for qemu-trivial@nongnu.org; Tue, 23 Jun 2015 08:31:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33932)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mprivozn@redhat.com>)
	id 1Z7NM3-0001MT-4F; Tue, 23 Jun 2015 08:31:07 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id C38113679F9;
	Tue, 23 Jun 2015 12:31:06 +0000 (UTC)
Received: from lisa.brq.redhat.com (dhcp129-181.brq.redhat.com [10.34.129.181])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t5NCV4WF001475; Tue, 23 Jun 2015 08:31:06 -0400
From: Michal Privoznik <mprivozn@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 23 Jun 2015 14:30:20 +0200
Message-Id: <5a1b06f5d050beab1b9b6d8ff6d5185f4576e3fa.1435062620.git.mprivozn@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] gitignore: Ignore shader generated files
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
X-List-Received-Date: Tue, 23 Jun 2015 12:31:15 -0000

As of d98bc0b65 there are two files that are automatically generated:
ui/shader/texture-blit-frag.h and /ui/shader/texture-blit-vert.h. None
of them is wanted to be tracked by git. Put them into the ignore file
then.

Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
---
 .gitignore | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/.gitignore b/.gitignore
index aed0e1f..61bc492 100644
--- a/.gitignore
+++ b/.gitignore
@@ -17,6 +17,8 @@
 /trace/generated-tcg-tracers.h
 /trace/generated-ust-provider.h
 /trace/generated-ust.c
+/ui/shader/texture-blit-frag.h
+/ui/shader/texture-blit-vert.h
 /libcacard/trace/generated-tracers.c
 *-timestamp
 /*-softmmu
--=20
2.3.6


