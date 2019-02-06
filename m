Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1grP8A-0000Il-Sf
	for mharc-qemu-trivial@gnu.org; Wed, 06 Feb 2019 10:28:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55979)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1grP87-0000Dy-Le
	for qemu-trivial@nongnu.org; Wed, 06 Feb 2019 10:28:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1grP84-0004SL-0l
	for qemu-trivial@nongnu.org; Wed, 06 Feb 2019 10:28:49 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:38107)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1grP7k-0004Kk-SZ; Wed, 06 Feb 2019 10:28:30 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MKsaz-1gYtjh21YT-00LDQP; Wed, 06 Feb 2019 16:28:16 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Eduardo Habkost <ehabkost@redhat.com>,
	qemu-trivial@nongnu.org, Anthony Green <green@moxielogic.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
	Andrzej Zaborowski <balrogg@gmail.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
	Michael Tokarev <mjt@tls.msk.ru>, Peter Maydell <peter.maydell@linaro.org>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Eric Blake <eblake@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Date: Wed,  6 Feb 2019 16:28:01 +0100
Message-Id: <20190206152807.31896-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190206152807.31896-1-laurent@vivier.eu>
References: <20190206152807.31896-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:FxcW8Sbtvzn7pG9lhKTO7bT45vhL3DRvt26w18Fw9BB+hhujV4d
	4YEout9mI8xg6+/zoKBmhkvhD/XPdNDcO2B7djPEe7YM3acTIaHwF53qdSiCYwymEMfI3tC
	+W2MwbJLhQ012RfqK9TbXQM20XRWqIXbmY28xe9XkKczdgzn6jijXRqiWzMSx83lu9euZmc
	UMCSTvVY6cloBBDgDYbzw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:gXltWkK9geg=:Ro4Ih6JrW9jLPYEFHmFtWJ
	BX0Z6E8mpQs2NwRda3C3eEDnYu1zH2MJZ1rbhuSm6jQbA9Tufd18zDwMiHD6jUorQob2wjG65
	CQq/MRTHTTpeot/lqVZguhhhD/Sbr6TCwz88LGx7eCRfpYsLWsaAJ3hTnfFP2YKeqqWveg63k
	kCy/I0Rs6dgV6hQpnfGC5gEiyx5854/DZwigh+Af8NkbTUlt4TwPKpddle2L30g8xjTsGhBf7
	srTx244hD5GC9tF0ho3KkBQKyGaUArM37PgyjYjUTyYQ7X+9PFEM7TAaGh1PVc9M1vpJm3vZY
	fWLm198BKAHgd6dBNkz/Hy9AscAT6z4RS+MM5jysETWcEl3r9geg6GfT8X+ElKBcBsEufrM1c
	PrECp28Cdz6nSwi0f6Yv8Uzi89mq9UkmKqieLG/PmV8ISNTMiFDkCCcyoTNwEW2AkrXYny0fo
	oggDhPHjX9G+0so03lE48A8wrbAvjK2ApBKb+b7KxWQNyVvCRVwXW+uci6Ec9Uk49PDiMgg7u
	9oCjoAH57424PfdbtwQF96rBh5ecdP1cc5GiiVvWbUVvHL4kGVwdnf9Jl3uGcoCPJAH3US5c+
	tA2W/QUo9iA03L8NUlOspbX8f/lt/FJ4JyyI2Kvxik3uwMF3PlLrU29wYppgazUZfWLslmq3O
	JFStrbLAR8htN0NFjGTFxisOcDIH/RdalPGwrQ+M8/PLn7G1YiuraYbefAEYOTsKUCdOHCobY
	vHPKaUZUN72V4wRg4GDl0f7OACiEFh7HLdPCXC4002up/0Ew2K3FN9EedN4=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.133
Subject: [Qemu-trivial] [PULL 1/7] qemu-common.h: Update copyright string
 for 2019
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
X-List-Received-Date: Wed, 06 Feb 2019 15:28:52 -0000

From: Peter Maydell <peter.maydell@linaro.org>

Update the copyright string we use in version/help output,
since we're well into the new year now.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20190201173655.4567-1-peter.maydell@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 include/qemu-common.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/qemu-common.h b/include/qemu-common.h
index ed60ba251d..a102245519 100644
--- a/include/qemu-common.h
+++ b/include/qemu-common.h
@@ -17,7 +17,7 @@
 #define TFR(expr) do { if ((expr) != -1) break; } while (errno == EINTR)
 
 /* Copyright string for -version arguments, About dialogs, etc */
-#define QEMU_COPYRIGHT "Copyright (c) 2003-2018 " \
+#define QEMU_COPYRIGHT "Copyright (c) 2003-2019 " \
     "Fabrice Bellard and the QEMU Project developers"
 
 /* Bug reporting information for --help arguments, About dialogs, etc */
-- 
2.20.1


