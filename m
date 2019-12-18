Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ihYxJ-0002Gi-PM
	for mharc-qemu-trivial@gnu.org; Wed, 18 Dec 2019 08:01:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54880)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1ihYxF-0002Ag-Hr
 for qemu-trivial@nongnu.org; Wed, 18 Dec 2019 08:01:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1ihYxE-0000Pb-DH
 for qemu-trivial@nongnu.org; Wed, 18 Dec 2019 08:01:29 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:42271)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1ihYxB-00005n-TW; Wed, 18 Dec 2019 08:01:26 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MsqIi-1homXU0ebo-00t8pm; Wed, 18 Dec 2019 14:01:08 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Michael Tokarev <mjt@tls.msk.ru>,
 Markus Armbruster <armbru@redhat.com>, qemu-trivial@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PULL 1/7] MAINTAINERS: Add hw/sd/ssi-sd.c in the SD section
Date: Wed, 18 Dec 2019 14:00:59 +0100
Message-Id: <20191218130105.125981-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191218130105.125981-1-laurent@vivier.eu>
References: <20191218130105.125981-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:H0iJ5V14a+z9VxdL4py7Qe+joQunLfLWCTfWcdla0vw7mCe3RtU
 iZIYtCMXyPuoBuFDGja5xtjkwu++5mLSTNBMJnD2IPKbLXe3g+zJ59dgCnkUnMks0DkegkW
 TXFuJXJcp550EqQnuy5BYE/GEFJyRuq16ZeNtYJJn76mu/g0BSBZJAaNrbLih3clACc6alm
 5tBitA1YHXvrYdKKtVsSQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:0ikTxwVX5PA=:pqMEtogl00ZGefZ3YcksLG
 58xGlG0axzH2Praegv9H22ABJv3FCt5mKdQ5nW+83MF97PNPY6ypSrZ7T243mgA0r7c9O689K
 uJkqU6xpiAeRd7pX/ChEsGakJser0s8JeApsiIMSynzDbWXjCVUyu4jI0fj0JrkUHEjrtGiB3
 fRR+BZ1clKKq1AExRpYuQ9VMMNua4xUFI5nfL7PDonEPIESSrFhm//IrOLgMCV1XqhDJvAzfq
 quJW4kVwWRCmcI2ORrJ52/cqitIs7Mvel+iED3mU2gLes0xOAgRimZTkMoPpWvq2qOcxNtyvP
 2o33DLc/hGZY85vITDFozP8BSYyXxahRZFFWbRZJgN4mGcJkwhfos1eXVx7Rmt+wB3XJddGoK
 JWtWd4mvIY+c0zCwYL6OdZl6K2Q7K6CbH9EMTv2X79iAXjGjGIZov9Z7vIF72dMON2vt33OG2
 Q8D1M+AADgcVHyqQLWGBSnFUo2eHODnrwbVY6HD5JsZoclGnKilnl5hHbJh593ggiAAgjXsgX
 GFRQw4kAg7eoEpIWjx1EnsbvpXr6Mv2GPX7nCAXfdqmQyZMs8mfbMeMU4ttqzeHfG+k9S71Ns
 +I8tOM1MsEl8iBrsTtci2QvFRvwFX4jEL5RMi+cU6WwdklGNWbDlZhozKRR1YzFHYp23X5ZVL
 sRDNR1Fe/lhcpPveVSHLdluLg6B5V2jb4+N7pMjnagRtLnS6VRJKoXKb+0LZTkJ5HT6MF1Skr
 hbB8yLkCsKSntdnavZsR8yUwELXihMWnQWHnhCRF8YpYJf3ssv0XjqAMQ1xWfGgb6ZTHtzGUH
 3lFmPcrrvGVh/65jQa4MxFOKindEnaQ64cDIFp2SYBljco8ZLnRTR/HlEymf7UOCTYsSlrOBI
 5H19DSl1dNDRUs7ZwgJA==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.227.126.131
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
X-List-Received-Date: Wed, 18 Dec 2019 13:01:31 -0000

From: Philippe Mathieu-Daudé <philmd@redhat.com>

The hw/sd/ssi-sd.c file is orphean, add it to the SD section.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20191012065426.10772-2-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 740401bcbb86..388415bb592e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1482,6 +1482,7 @@ S: Odd Fixes
 F: include/hw/sd/sd*
 F: hw/sd/core.c
 F: hw/sd/sd*
+F: hw/sd/ssi-sd.c
 F: tests/sd*
 
 USB
-- 
2.24.1


