Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1icQTi-0002pB-6a
	for mharc-qemu-trivial@gnu.org; Wed, 04 Dec 2019 03:57:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43253)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <hhan@redhat.com>) id 1icQTe-0002li-RW
 for qemu-trivial@nongnu.org; Wed, 04 Dec 2019 03:57:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <hhan@redhat.com>) id 1icQTW-0002r9-Aa
 for qemu-trivial@nongnu.org; Wed, 04 Dec 2019 03:57:36 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:37989
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <hhan@redhat.com>) id 1icQTW-0002dK-5u
 for qemu-trivial@nongnu.org; Wed, 04 Dec 2019 03:57:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575449850;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=y23+RdbMvjvtLaFIS5I+BFj/BYYOnzn2u86o+c1g6LA=;
 b=fySXNFiDQpVPFh9eMXhb+nZUe1OtjMyEXbl1AcM+jjPHxh4FD4yDj8DJWarns56Hz+bkDE
 SWCAShMldcw51TLbBVAl52Y5ygW38BMaEStQdhE/202rXtSMbS4IXXBCcoh0H9fqZu0x78
 f6HopRo/4Yk3pmnK8qkZbPHtpswQC5s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-ZqwEjixHNB6hzj_KHzj07Q-1; Wed, 04 Dec 2019 03:57:26 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E6408026B9;
 Wed,  4 Dec 2019 08:57:25 +0000 (UTC)
Received: from hansolo.pek2.redhat.com (wlc-trust-29.pek2.redhat.com
 [10.72.3.29])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EC1F55DA60;
 Wed,  4 Dec 2019 08:57:22 +0000 (UTC)
From: Han Han <hhan@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, laurent@vivier.eu, dgilbert@redhat.com,
 Han Han <hhan@redhat.com>
Subject: [PATCH] Revert "qemu-options.hx: Update for reboot-timeout parameter"
Date: Wed,  4 Dec 2019 16:56:28 +0800
Message-Id: <20191204085628.2892-1-hhan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: ZqwEjixHNB6hzj_KHzj07Q-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
X-List-Received-Date: Wed, 04 Dec 2019 08:57:44 -0000

This reverts commit bbd9e6985ff342cbe15b9cb7eb30e842796fbbe8.

In 20a1922032 we allowed reboot-timeout=3D-1 again, so update the doc
accordingly.
---
 qemu-options.hx | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 65c9473b73..e14d88e9b2 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -327,8 +327,8 @@ format(true color). The resolution should be supported =
by the SVGA mode, so
 the recommended is 320x240, 640x480, 800x640.
=20
 A timeout could be passed to bios, guest will pause for @var{rb_timeout} m=
s
-when boot failed, then reboot. If @option{reboot-timeout} is not set,
-guest will not reboot by default. Currently Seabios for X86
+when boot failed, then reboot. If @var{rb_timeout} is '-1', guest will not
+reboot, qemu passes '-1' to bios by default. Currently Seabios for X86
 system support it.
=20
 Do strict boot via @option{strict=3Don} as far as firmware/BIOS
--=20
2.24.0.rc1


