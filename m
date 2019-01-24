Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gmeSN-0001Dw-Ch
	for mharc-qemu-trivial@gnu.org; Thu, 24 Jan 2019 07:50:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44346)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gmeSK-00019w-B6
	for qemu-trivial@nongnu.org; Thu, 24 Jan 2019 07:50:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gmeSJ-00015v-A9
	for qemu-trivial@nongnu.org; Thu, 24 Jan 2019 07:50:04 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:51883)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gmeS5-0000sH-HY; Thu, 24 Jan 2019 07:49:53 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA
	(Nemesis)
	id 1Mi23L-1hPowj2XTN-00e8ca; Thu, 24 Jan 2019 13:49:28 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-ppc@nongnu.org,
	Richard Henderson <rth@twiddle.net>, Michael Tokarev <mjt@tls.msk.ru>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Date: Thu, 24 Jan 2019 13:49:02 +0100
Message-Id: <20190124124906.16653-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190124124906.16653-1-laurent@vivier.eu>
References: <20190124124906.16653-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:aDhyQ+rTW5lP5Syqj6Fbn72JpLvFO0Adg5br1eAD5HHrewObqOG
	zmJuXHNAF+v4mKjdIDkD75DpP4rmrDX+FVGAOWgo0tkLCZZtNEPxX3pFCkVm57kaJJYg9uO
	Z/m0rbnSSBQnfLSV71f1ylKVql8/HRmfjrKZGqBVGO3fs5s1IdjU3Vu6Lxaj4Qr/J4P2HGW
	zcp7XQ46GUI37NY3hEq5A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:CP3XhI7gn5g=:KGaqdc3EPLS0hPISaKMhoV
	MGM/bUeAGZxrtvE+oi4+phnCkr7MLA2tIJ9CFO+YUSVi2mh8AgIFCgFVwNm53yPWIKZbX2WFA
	YK3Dog2/ZdaJnaRmCjxYTHkVr3/wv75OjqvoWEwiBixxH+3Zg1C2AJ9A0A2Gl1maYAxZH/9aA
	tDraVtX1pJ3YGkJMEzQoy+6FevogTN85Ir3h4B/db8Uu8dKB4J25IZeyoQUojYUJXQ3LSLxtc
	G0o5BZXNOUCwrUjzxz09/rsBk59wa4w0VwoYWnHUrVKAf4KRjyaIvh3IL1lZhGQJp1UhSz3CK
	h/PCPDr/+aR42eVZOtTwvjwcmdjuFx0q7ak3EDkM+isx0TNUIAptbQTt9TE+2PRa6OLEHJjKI
	vIcPT5jfoJEF7jVBOWe9lrvVlFH6o9gkKPQf8lIkp/wKYkBAX8L41yKxqLZK70Ir9c7X2aMYQ
	7C1K/0j32aecK1qvwbngBMDUpwDhJI8tijKZeDmFNTR4sbM7lwu8RyCLR5VFDeAuSmxx2nPTs
	iYJnTvTI3muf5ORNcdxpCysnSYDhC6gJxpxyw9MpBzNU4R1ZUTLlQAymme8JMJdelYdAUlGMW
	2KraYiGPBwHAZ4hHYmUUv1mkLT6lwSMHYlsP/tvmK/AcAE6HOxIZ0SEsJb4hEG0nKZoHSEp9B
	K1pSfXKSLFtKiteE3yacEVTSrh9AnZHbZpZzXspp43E2CXmV/lDfjVBjIBuLkNsCaytJswboI
	cA15bcJJp1pTtuM1YZyvB4EqEW/h45oJjX5vR0+hlieVCK9F/nHLwrQsGKI=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.75
Subject: [Qemu-trivial] [PULL 1/5] MAINTAINERS: Fix utf-8 mangling
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
X-List-Received-Date: Thu, 24 Jan 2019 12:50:06 -0000

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Patch incorrectly applied as 15ffb43cbf4.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20190117161355.18204-1-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index af339b86db..fd3d4de3fa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1639,7 +1639,7 @@ F: include/hw/display/edid.h
 F: qemu-edid.c
 
 Firmware configuration (fw_cfg)
-M: Philippe Mathieu-DaudÃ© <philmd@redhat.com>
+M: Philippe Mathieu-Daudé <philmd@redhat.com>
 R: Laszlo Ersek <lersek@redhat.com>
 R: Gerd Hoffmann <kraxel@redhat.com>
 S: Supported
-- 
2.20.1


