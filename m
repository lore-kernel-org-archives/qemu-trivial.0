Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i0wD9-0005Xx-UQ
	for mharc-qemu-trivial@gnu.org; Thu, 22 Aug 2019 19:09:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53200)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1i0wD6-0005Qw-0e
 for qemu-trivial@nongnu.org; Thu, 22 Aug 2019 19:09:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1i0wD1-0004m4-Pc
 for qemu-trivial@nongnu.org; Thu, 22 Aug 2019 19:09:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39004)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1i0wCt-0004gZ-FI; Thu, 22 Aug 2019 19:09:27 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C138E18C890E;
 Thu, 22 Aug 2019 23:09:26 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7179319C65;
 Thu, 22 Aug 2019 23:09:25 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Date: Fri, 23 Aug 2019 01:09:15 +0200
Message-Id: <20190822230916.576-3-philmd@redhat.com>
In-Reply-To: <20190822230916.576-1-philmd@redhat.com>
References: <20190822230916.576-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.70]); Thu, 22 Aug 2019 23:09:26 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 2/3] mailmap: Update philmd email address
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Aug 2019 23:09:41 -0000

Use the email address where I spend most of my time.

Suggested-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index e1fdc88d25..e68ddd26e6 100644
--- a/.mailmap
+++ b/.mailmap
@@ -32,6 +32,7 @@ Aleksandar Markovic <amarkovic@wavecomp.com> <aleksanda=
r.markovic@imgtec.com>
 Paul Burton <pburton@wavecomp.com> <paul.burton@mips.com>
 Paul Burton <pburton@wavecomp.com> <paul.burton@imgtec.com>
 Paul Burton <pburton@wavecomp.com> <paul@archlinuxmips.org>
+Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> <f4bug@amsat.org>
 Yongbok Kim <yongbok.kim@mips.com> <yongbok.kim@imgtec.com>
=20
 # Also list preferred name forms where people have changed their
--=20
2.20.1


