Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1izgcX-00014i-Dm
	for mharc-qemu-trivial@gnu.org; Thu, 06 Feb 2020 07:51:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56313)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1izgcV-0000z2-5c
 for qemu-trivial@nongnu.org; Thu, 06 Feb 2020 07:51:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1izgcU-0005us-3P
 for qemu-trivial@nongnu.org; Thu, 06 Feb 2020 07:50:59 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:57101)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1izgcT-0005qx-Qu; Thu, 06 Feb 2020 07:50:58 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MyJx6-1jj0DB0NUy-00yjFj; Thu, 06 Feb 2020 13:50:45 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org,
 qemu-block@nongnu.org, Joel Stanley <joel@jms.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Helge Deller <deller@gmx.de>
Subject: [PULL 07/12] MAINTAINERS: Cover hppa-softmmu.mak in the HP-PARISC
 Machines section
Date: Thu,  6 Feb 2020 13:50:22 +0100
Message-Id: <20200206125027.1926263-8-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200206125027.1926263-1-laurent@vivier.eu>
References: <20200206125027.1926263-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:AnBQfhgGBWDNaHxLS/Q0ayMp/lBlof3BqLNVOHGMqFEab2mi9pb
 PtsEatNcZuX3ZltEGvVdqdX3kg5kc3io+FdHsY8t8FZ+N/VQhK6+AdvfJc1YQd70esmcB72
 mFqIkfK0wqVkR5qtUsJo0UM5EbXRRQe1jJwFOFmNVRqPJXpc0TFASaTbohde3uNDRNyxQeJ
 Nky+yguP/NsBo4X/CWjbQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:8VFWjTevfTI=:wolqUyxQLtCo2o9zTCRU+a
 71MTWfGicdMB84j8pc3Ouy2mZubYHMiqjV6gW28L7B1q6UwaXdbSM5erNcH9GG8gxujlvCDOW
 +KJ6jQD4RcQPs7j7wLM5XtF341YySWqsU9OSVuw55Ow5yrT/i6JtbrxSyS7elUsGl/Y0s1o9b
 wKvBQmYf8vM0fCHPq+UM+KoAJ6ZO/e+Byy4TldBN+O13Zty8Tw/kStYKJDb+beWjACHkYw9vP
 ZRbf6C4ZUkklKnueY1u6XtVJp8ZKQHmDQya2E5T2aqimYuTyJ7vOnA3Y7RQ/kgmfxke/m1FFT
 icJW1q+J2M+Lt9npLVouCfTyx6J3ZYdrcRUzMK+fpV2Y+WsCoFk60V6RqpmmXWMvIGV9vx+C9
 FtVnzXifyGewi6mzjl3zhmV9eCDY690QqWGqHadxN2zuKt17oKsrjYv/T/0hnm0GXdFknXrox
 50f55f7z85DQy217Sev6MSOl5dcL/QUJVyCGTHjM4noydKJVNZToVz9xUt1dNGaTvGFJ2A+kn
 MhkyyzolHC/DP9HbWUgVNzyhaFJNCQ/RIJFCGzAeBO7j2TI3BfkwrQHBmvHWz/1/qixdlzZ2f
 uhvdlFFwhb968Ty1b8cD/XvGlhHnWKEjErvxRN3h6s7FgKm0QvVsSnYOOpz4VKyoKTgVHDKQi
 798WTUOK6rJQrcj30BbfTaOfRuCTM676igGKe+FjPh9Aq9Ya9M7zF2aGX8x4Tb5QY8m6ZUqZO
 tSPNh4Pzs3T6/xoT7Sunwq+MPxj4wVcEw8f+1zjjauDwtSvzqXSUb/xOi/3/hrsUO9Sw97Xwy
 2x2cz3pXCO/DMze58k0TpRjGWGpZ86TGf8UDywzZvTsjxbSkmcE4s8D5yWxQUtMu2ezf0Rc
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.135
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
X-List-Received-Date: Thu, 06 Feb 2020 12:51:00 -0000

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Modifications to default-configs/hppa-softmmu.mak should be
reviewed by the hppa-softmmu users (currently a single machine).

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Helge Deller <deller@gmx.de>
Message-Id: <20200129190316.16901-1-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 259688174ace..9d45ac274ed7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -896,6 +896,7 @@ HP B160L
 M: Richard Henderson <rth@twiddle.net>
 R: Helge Deller <deller@gmx.de>
 S: Odd Fixes
+F: default-configs/hppa-softmmu.mak
 F: hw/hppa/
 F: pc-bios/hppa-firmware.img
 
-- 
2.24.1


