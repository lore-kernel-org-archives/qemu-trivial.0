Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gHS9I-0002If-C4
	for mharc-qemu-trivial@gnu.org; Tue, 30 Oct 2018 07:25:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58676)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gHS9E-0002EN-G7
	for qemu-trivial@nongnu.org; Tue, 30 Oct 2018 07:25:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gHS97-0003Xi-9j
	for qemu-trivial@nongnu.org; Tue, 30 Oct 2018 07:25:22 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:50633)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gHS8n-0002qC-GU; Tue, 30 Oct 2018 07:24:57 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MdNoW-1fiOQE08I4-00ZSig; Tue, 30 Oct 2018 12:23:54 +0100
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MdNoW-1fiOQE08I4-00ZSig; Tue, 30 Oct 2018 12:23:54 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Cleber Rosa <crosa@redhat.com>,
	Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>, Anthony Perard <anthony.perard@citrix.com>,
	Aurelien Jarno <aurelien@aurel32.net>, Max Reitz <mreitz@redhat.com>,
	Fam Zheng <famz@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
	Kevin Wolf <kwolf@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Stefano Stabellini <sstabellini@kernel.org>, qemu-trivial@nongnu.org,
	qemu-block@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
	xen-devel@lists.xenproject.org, Gerd Hoffmann <kraxel@redhat.com>,
	Riku Voipio <riku.voipio@iki.fi>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <lvivier@redhat.com>,
	Michael Walle <michael@walle.cc>, Markus Armbruster <armbru@redhat.com>
Date: Tue, 30 Oct 2018 12:23:21 +0100
Message-Id: <20181030112337.17973-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181030112337.17973-1-laurent@vivier.eu>
References: <20181030112337.17973-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:F8l4smf1nL5W4DsrL/7cTra6H6sZJmx/uvzB/1jWx/wdKk/NVxp
	m/fq6/P0ALLGTaCdkdXooOLOe8GgI0XFOI0jqL6wU/uL32dCmmytmJOvG40vDdoivXgaMTY
	M4UmUveDPmCbjaUkB6SPRFzmAkBQ7ibaH2p90ew21v1SCeCuiT3cCz9p+K7+scs3WGgCzqc
	1kM4wMQC2oXZpiX9tZNjQ==
X-UI-Out-Filterresults: notjunk:1;V01:K0:OPbiJZFlUtg=:6UDHRGrOhs4uRU3/KtYvSw
	JPuR5jLG8ZkuaBXlmbxZ8h5Te0MlKiH1Sx9O8MbGT6Z0frkx3JC9bKvj/v3qO1oTwRu6/Lt2p
	+Mo3kkzwKoP4r3n2oZkuQDjVl+fvUtpdI19jyeG4Eblpnb7e5fdSt21hhhu8FgvADgAUlqTe7
	jYfDVl4kI9/CqArD5CQdKC2kd8xy0SzdqpyTrTuNBDwYtFLEEpngDGNDGBAftp26GqiExsGIX
	zzlBjrVD5gi0PXuN6jJQSI44BFgEgWn/m8MswbJXFMyyA6FZkccEpi2aNgUtAyP5tWlLb8ivA
	AQK7eTq7916LYMPAD+/bLYblvQ3Vw1VuMC4X8xTInVDfQl47b8ASDXSTzCKjEJZaXQ7G5bpe5
	8vzAlsOaCKeLJyOmSEODYlNJ2R5LPONDg7okAChcO5682rGabP4D1wEYeCyznLX/8ioMZq4tX
	d/0EYIEow0m/JKrKGeYs5aqGjN15l4aGDwp16ehnbBVbIkaHbgawNfl5INwQWMSTf6UyIfkuc
	bnkgdPtUBETO/Tm1DJlA+gtXb8w5TMX35TPmd1izoXoMzQWyjFXw+cISmGk5OgPvKhH7FJuwz
	g/RdPSoTYva8w+2/Qq93jWQstEOruf0zB5/bXlvvf4mi4CL+NR5v6wj/QJnyMngjvU02yN7K6
	d7XPWYuO6lv//2y430+cnd9rie9/F8D5R5qJDKMQjRsgz+QbPrpqX7WzIZNVC/g6UUN7AfLrh
	8a7Y/XO3wclCG/RS
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.134
Subject: [Qemu-trivial] [PULL v2 04/20] tests/tcg/README: fix location for
 lm32 tests
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
X-List-Received-Date: Tue, 30 Oct 2018 11:25:25 -0000

From: Cleber Rosa <crosa@redhat.com>

Point to the right and obvious location for lm32 tests.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Acked-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20181004161852.11673-3-crosa@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 tests/tcg/README | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/tcg/README b/tests/tcg/README
index a5643d33e7..2a58f9a058 100644
--- a/tests/tcg/README
+++ b/tests/tcg/README
@@ -10,6 +10,6 @@ with "make test-cris".
 
 LM32
 ====
-The testsuite for LM32 is in tests/tcg/cris.  You can run it
+The testsuite for LM32 is in tests/tcg/lm32.  You can run it
 with "make test-lm32".
 
-- 
2.17.2


