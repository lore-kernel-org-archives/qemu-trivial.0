Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fSyGp-0002BI-Fl
	for mharc-qemu-trivial@gnu.org; Wed, 13 Jun 2018 01:24:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51384)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fSyGn-0002A9-Er
	for qemu-trivial@nongnu.org; Wed, 13 Jun 2018 01:24:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fSyGm-0008H7-9D
	for qemu-trivial@nongnu.org; Wed, 13 Jun 2018 01:24:33 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:45248 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fSyGh-0008FU-Nk; Wed, 13 Jun 2018 01:24:28 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 447D0401EF05;
	Wed, 13 Jun 2018 05:24:27 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-24.ams2.redhat.com [10.36.116.24])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7599A20345E2;
	Wed, 13 Jun 2018 05:24:26 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Date: Wed, 13 Jun 2018 07:24:25 +0200
Message-Id: <1528867465-26696-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Wed, 13 Jun 2018 05:24:27 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Wed, 13 Jun 2018 05:24:27 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-trivial] [PATCH] trivial: Make bios files and source files
 non-executable
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
X-List-Received-Date: Wed, 13 Jun 2018 05:24:34 -0000

These files can not be executed on the host, so they should not be
marked as executable.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 block/blkreplay.c                  |   0
 pc-bios/hppa-firmware.img          | Bin
 pc-bios/palcode-clipper            | Bin
 pc-bios/u-boot-sam460-20100605.bin | Bin
 pc-bios/u-boot.e500                | Bin
 replay/replay-char.c               |   0
 6 files changed, 0 insertions(+), 0 deletions(-)
 mode change 100755 => 100644 block/blkreplay.c
 mode change 100755 => 100644 pc-bios/hppa-firmware.img
 mode change 100755 => 100644 pc-bios/palcode-clipper
 mode change 100755 => 100644 pc-bios/u-boot-sam460-20100605.bin
 mode change 100755 => 100644 pc-bios/u-boot.e500
 mode change 100755 => 100644 replay/replay-char.c

diff --git a/block/blkreplay.c b/block/blkreplay.c
old mode 100755
new mode 100644
diff --git a/pc-bios/hppa-firmware.img b/pc-bios/hppa-firmware.img
old mode 100755
new mode 100644
diff --git a/pc-bios/palcode-clipper b/pc-bios/palcode-clipper
old mode 100755
new mode 100644
diff --git a/pc-bios/u-boot-sam460-20100605.bin b/pc-bios/u-boot-sam460-20100605.bin
old mode 100755
new mode 100644
diff --git a/pc-bios/u-boot.e500 b/pc-bios/u-boot.e500
old mode 100755
new mode 100644
diff --git a/replay/replay-char.c b/replay/replay-char.c
old mode 100755
new mode 100644
-- 
1.8.3.1


