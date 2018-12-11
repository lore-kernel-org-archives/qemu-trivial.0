Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gWmPQ-00005w-Dw
	for mharc-qemu-trivial@gnu.org; Tue, 11 Dec 2018 13:05:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43105)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gWmPH-0008GR-Em
	for qemu-trivial@nongnu.org; Tue, 11 Dec 2018 13:05:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gWmPG-0007bu-72
	for qemu-trivial@nongnu.org; Tue, 11 Dec 2018 13:05:19 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:53583)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gWmP0-0007Gs-Gz; Tue, 11 Dec 2018 13:05:06 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MMH2M-1gmeqP28sY-00JIDb; Tue, 11 Dec 2018 19:04:07 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>, Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Date: Tue, 11 Dec 2018 19:03:30 +0100
Message-Id: <20181211180352.19644-9-laurent@vivier.eu>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181211180352.19644-1-laurent@vivier.eu>
References: <20181211180352.19644-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:IPcWV76ghmUQa9NSIvaUeJtqsQjdsGS8Oyvqf+CfrLULyFyI2i3
	qlPSWlclCEjyw3tOteDxxKVJ6sH7Xtwqmf9qZhm1vq60GGFdzEnyejCrmKJoYh8vN6qbfEX
	9A5vpVfCzEv/yj+2M6FrrNQYqt205k74U4cJ4COH+yca05iAIrCn0VueSe1A++VVXOG3OP+
	uAlbNDnn+m+9Yy3m2MiYw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:bdz2lwp5f3Y=:hW+9/Fxy0HLVpfDe9UwDbV
	USvM2TOFYVqXUwkaDcLaL2j3AUXZKxKJvQq0yCihXcQpKtEaNDFktKGsTbe4CtGnqh6BpQOLI
	mUK+WDkYf/Wdg/767pYFE8zJDg4knKgx3JR6TcgN6IyerBkZyV6dCPqie3v0GUdtvHe5fKpwi
	+kSZR+w3Tb3i4AJ5vT4LUKsmZEDXaLTwqPu502wcPXQFmBW5VRT4q6SuKNVQPG75h43ZmzmN3
	kDP2ww2BxctJxXrjRe2X+rrrNtpu/KXKh3Pupj7NiFqgQNJ6x8Wo3Fj2c7NuqM6WrDTK8fyTL
	oy6gX9n0t8HlZDJ64R+j03DZM4os1RKKbEacg8ESeTbKEWbDx1HWe0Mfeq8qU6Uwfp7fl+I1+
	o6N1bUMejZkZDs1vlBK1swjTwvdNNHYwrYo0c90LjZJgg88xePkSTGnX9Aro19JXHLGLsUVwf
	Z0GDa/+mZqJ48tg0Rx/CbElTHdC6jrfsm0HghciMM/mBnxlSS2gMibQ5O9TzjJzP1M8OZzOIh
	G+eUXBtToo8QUkILnMj/+NMnEslCEEaMOxuYHOthsZRD1C4gvCxx945eqybS6ubgSvX3LzViy
	6Ct2shLd+pkTgKJSi9TA/nnk0KZaXzS0ZkwDzhvEqQCOFGQCc69oOMwRgK4FP0aACqZsNvnyG
	6mJhu3Hbc5HotDUO4oQ3jbhuG39hPTgHb9c6YHDQsH44nacb4SxSXjj8LFw65uZUPnsHz5Tqp
	EEE3HWdgjhOxxhF2cRR+ybGOaMuCVQyKn8gQ3w==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.133
Subject: [Qemu-trivial] [PULL 08/30] MAINTAINERS: Add nios2-related files to
 the Nios2 section
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
X-List-Received-Date: Tue, 11 Dec 2018 18:05:23 -0000

From: Thomas Huth <thuth@redhat.com>

nios2_iic.c and the default-configs/nios2-softmmu.mak file are
currently "unmaintained" according to the get_maintainers.pl script.
Move them to the Nios2 section where they obviously belong to.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <1542899500-23346-1-git-send-email-thuth@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 059c775a06..f5ef20d359 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -233,7 +233,9 @@ M: Marek Vasut <marex@denx.de>
 S: Maintained
 F: target/nios2/
 F: hw/nios2/
+F: hw/intc/nios2_iic.c
 F: disas/nios2.c
+F: default-configs/nios2-softmmu.mak
 
 OpenRISC
 M: Stafford Horne <shorne@gmail.com>
-- 
2.19.2


