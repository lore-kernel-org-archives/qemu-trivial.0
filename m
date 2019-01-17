Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gkAJ1-0002Vm-4e
	for mharc-qemu-trivial@gnu.org; Thu, 17 Jan 2019 11:14:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51116)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gkAIz-0002TM-5p
	for qemu-trivial@nongnu.org; Thu, 17 Jan 2019 11:14:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gkAIy-0004yJ-Lp
	for qemu-trivial@nongnu.org; Thu, 17 Jan 2019 11:14:09 -0500
Received: from mx1.redhat.com ([209.132.183.28]:34816)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1gkAIw-0004ur-4s; Thu, 17 Jan 2019 11:14:06 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5C48E89AE4;
	Thu, 17 Jan 2019 16:14:05 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-42.brq.redhat.com [10.40.204.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 331D61048109;
	Thu, 17 Jan 2019 16:13:57 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Date: Thu, 17 Jan 2019 17:13:55 +0100
Message-Id: <20190117161355.18204-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 17 Jan 2019 16:14:05 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] MAINTAINERS: Fix utf-8 mangling
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
X-List-Received-Date: Thu, 17 Jan 2019 16:14:10 -0000

Patch incorrectly applied as 15ffb43cbf4.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
Paolo can this be a patchew bug?
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index af339b86db..fd3d4de3fa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1639,7 +1639,7 @@ F: include/hw/display/edid.h
 F: qemu-edid.c
=20
 Firmware configuration (fw_cfg)
-M: Philippe Mathieu-Daud=C3=83=C2=A9 <philmd@redhat.com>
+M: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
 R: Laszlo Ersek <lersek@redhat.com>
 R: Gerd Hoffmann <kraxel@redhat.com>
 S: Supported
--=20
2.17.2


