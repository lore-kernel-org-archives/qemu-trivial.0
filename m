Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gX8LI-00075w-Gi
	for mharc-qemu-trivial@gnu.org; Wed, 12 Dec 2018 12:30:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35240)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1gX8LF-00071a-D3
	for qemu-trivial@nongnu.org; Wed, 12 Dec 2018 12:30:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1gX8LE-0001Ft-DD
	for qemu-trivial@nongnu.org; Wed, 12 Dec 2018 12:30:37 -0500
Received: from mx1.redhat.com ([209.132.183.28]:57476)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1gX8L6-000103-Lk; Wed, 12 Dec 2018 12:30:30 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1DEE4356CD;
	Wed, 12 Dec 2018 17:30:25 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-204-190.brq.redhat.com
	[10.40.204.190])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5000960C44;
	Wed, 12 Dec 2018 17:30:23 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-trivial@nongnu.org, Guan Xuetao <gxt@mprc.pku.edu.cn>,
	Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <lvivier@redhat.com>
Date: Wed, 12 Dec 2018 18:30:07 +0100
Message-Id: <20181212173007.11407-7-lvivier@redhat.com>
In-Reply-To: <20181212173007.11407-1-lvivier@redhat.com>
References: <20181212173007.11407-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Wed, 12 Dec 2018 17:30:25 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 6/6] unicore32/puv3: remove definition of
 DPRINTF
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
X-List-Received-Date: Wed, 12 Dec 2018 17:30:38 -0000

As previous patches have removed the use of DPRINTF from puv3 files,
we can remove the definition from puv3.h

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 include/hw/unicore32/puv3.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/include/hw/unicore32/puv3.h b/include/hw/unicore32/puv3.h
index f587a1f622..a876f21dfb 100644
--- a/include/hw/unicore32/puv3.h
+++ b/include/hw/unicore32/puv3.h
@@ -30,11 +30,4 @@
 #define PUV3_IRQS_PS2_AUX       (23)
 #define PUV3_IRQS_OST0          (26)
=20
-/* All puv3_*.c use DPRINTF for debug. */
-#ifdef DEBUG_PUV3
-#define DPRINTF(fmt, ...) printf("%s: " fmt , __func__, ## __VA_ARGS__)
-#else
-#define DPRINTF(fmt, ...) do {} while (0)
-#endif
-
 #endif /* QEMU_HW_PUV3_H */
--=20
2.19.2


