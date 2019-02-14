Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1guEZ4-0002YV-5A
	for mharc-qemu-trivial@gnu.org; Thu, 14 Feb 2019 05:48:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50524)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1guEYw-0002Om-7u
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 05:48:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1guEYt-0002wa-2c
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 05:48:14 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:49387)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1guEYi-0002Nm-7l; Thu, 14 Feb 2019 05:48:00 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1M5Q2f-1gsqyQ1MRh-001Rxr; Thu, 14 Feb 2019 11:47:35 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org, libvir-list@redhat.com,
	"Michael S. Tsirkin" <mst@redhat.com>, Eric Blake <eblake@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-trivial@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
	Kamil Rytarowski <kamil@netbsd.org>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Feb 2019 11:47:05 +0100
Message-Id: <20190214104717.3543-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190214104717.3543-1-laurent@vivier.eu>
References: <20190214104717.3543-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:QF78azORv0wvVxM7jiTEXMMiFSvQ1oiB3VlThMMO6pvauyqaXEv
	MqBRhELUnAjqOX15TWBaS3ZBeaHB3a0798SV9S2Oip7wobwjm3oRGimoHal3sP9qB7UqraZ
	10ardED7BSnq/Hh3Xzs98Ln5Ra+B/eaSw8BrdZvmntLsPVUdEE/TQt9eEZrucKopCCcdZ41
	k1kCRLzTeWm3tpXPhcPLA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:1c8XzALaI5o=:r4S2hp7pAVFOeMPR93XUon
	sTKpkfQxSLdWjxl/lcyh+iY+5DcO7p6/OxZZCHcIWc8DiiGP4VSVJQanBpnsANprr5rTuuqT1
	DGKzzfb1pBRyfYq5sXAtJK9lux6mXCOnsm8D5kka3HKlHv/PmvFau+gE5sium58R42E2f58Qz
	uEsp87RiFChChrRGoUuzfieoWIKDhcj62Xt4oB2pXfRm7HK0AtWcausVz2tvlvW61hVSEdHso
	tt16AX8eGJEGi5394sApf1WWpLL3fKFKVSh7PC5pj7xRyZNW2w5VcIesA9BCNTz6ufGzKyEwx
	RqW2dwEYe8XTPwjhkHJyPETNXHr8kOIj9LYUXUSZ92N+sywQ1RSIMyAp9w+chqrYdYjuAW4mo
	MpTIRIyHt1ZSwKJ8aeijES04yFmWC5Pgz5GYPk4AbNsSGfCzLfA8HN5BavFvPz8/MX1cDLbZ3
	N88TccAP86eCpkyFiwEmLPNVat56NbXDZ/3RpXgGccstkZ1FFJBsrito/gS0yKPHDKGxl3beS
	DSncp0bIHav5ZSL0UyvhfuLRZeXMXWqWrl6ZeXjloZki4lu8ZVb6SYHT+0ya1rXxbs5djmNcu
	nr4DPAKtCzJCy12EbAKpyRSeI3b2Wgu9vpnl5P/LneRPGCjqj+m4GaX7fE2IvHUksuUehToyu
	ejKJKRx+DcoojLFb4FEMblLTTVYJZWhXuqSfKuoKbcOeirVegrDbPHgpMEvmGEZNcan0y0EQ2
	188KHoWqbkfVnCiI4TCFQbEseY+roK/SKC/0rg==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.133
Subject: [Qemu-trivial] [PULL 02/14] qemu-deprecated: Remove -virtioconsole
 and -no-frame for good
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
X-List-Received-Date: Thu, 14 Feb 2019 10:48:16 -0000

From: Thomas Huth <thuth@redhat.com>

The two sections have accidentally been added again during the
merge of Paolo's and Gerd's trees.

Fixes: 3e29da9fd81002a0c03041aaa26dea6d9dd9bd65
Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <1549545296-18903-2-git-send-email-thuth@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 qemu-deprecated.texi | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/qemu-deprecated.texi b/qemu-deprecated.texi
index 80b0702ad5b2..90e5860fd1a6 100644
--- a/qemu-deprecated.texi
+++ b/qemu-deprecated.texi
@@ -37,18 +37,6 @@ would automatically enable USB support on the machine type.
 If using the new syntax, USB support must be explicitly
 enabled via the ``-machine usb=on'' argument.
 
-@subsection -virtioconsole (since 3.0.0)
-
-Option @option{-virtioconsole} has been replaced by
-@option{-device virtconsole}.
-
-@subsection -no-frame (since 2.12.0)
-
-The @code{--no-frame} argument works with SDL 1.2 only. The other user
-interfaces never implemented this in the first place. So this will be
-removed together with SDL 1.2 support.
->>>>>>> remotes/bonzini/tags/for-upstream
-
 @subsection -clock (since 3.0.0)
 
 The @code{-clock} option is ignored since QEMU version 1.7.0. There is no
-- 
2.20.1


