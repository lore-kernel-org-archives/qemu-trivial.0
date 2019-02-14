Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1guEYy-0002R9-2X
	for mharc-qemu-trivial@gnu.org; Thu, 14 Feb 2019 05:48:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50261)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1guEYl-0002IL-W0
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 05:48:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1guEYj-0002kH-OR
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 05:48:03 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:36237)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1guEYj-0002Ry-7r; Thu, 14 Feb 2019 05:48:01 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MNc5b-1gjSli2iJX-00P365; Thu, 14 Feb 2019 11:47:41 +0100
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
	Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Date: Thu, 14 Feb 2019 11:47:10 +0100
Message-Id: <20190214104717.3543-8-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190214104717.3543-1-laurent@vivier.eu>
References: <20190214104717.3543-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:LEi8iVxFcJaDz5gPX+ZYRsQHg8ggi6pDPEYJihnlM//Ea2EfxQf
	MXIu+Owh299+SlKSlPDUtDhp6h4hzmKOry2VR8vyOYiR8Zz8GhEohi+XurXKvPd/nimwOIV
	3XLrWX+BHj2TlfLcj2SeYIlib8koa+G+n/VW4X/Gr6brYg8txoTRq9euRSgKOpyA9KSjSgb
	icTMcofZxRsRIBoAQvoRA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:iRDg/sQmhhY=:5Mf6c0zaNWdiG/LfBsIjhb
	QOwMbSZ7e+78N8R1v3EFtcQW/ZgEss0pxfB1bd9GYtbb9vv0tjmZftMQoiqbqwCDP3OvHTYfN
	uqg3AMQT++G6UZcOwUSOSaYNfbJmX3YEFFKoriPFRJwunvs3oSizX1ANtXI/rRUQ3gEsjApXp
	H+FMKCApEQFTmAJeqpqEdc1zKtrdimYPApCjiXoruZKT+yJj9k37XyTuhKQjQ8wWdwR6JGIgL
	cNZ7lhKYWv2l78Cm9Vq8itYGP8kCJDqqYnpYBZl+dbQj/095+mNlZNy2X1QDj21iWtX6aTksB
	nl2ciEYDHgw1A7llGU54YKubOKFIXO1SENEbAcy0uwcJ02XDld5mZMds0HRkOIWuy9zgOxCuZ
	w08VuhMmMDC80Hiwe+kTceOnU1YPxEdPD+g/s+KaojJ44pK56KJhmBbn0jF9Ir4u/pvJGyMYg
	byj4+K5T2MIIvmRt4EMMgKzw9SN2g8wOhw2oEFeNPvro98vy4Ed6OUGclEmLH7mw55+CXcq3y
	m/saOiwnrkCzRRJzscRkStpAh8FE28Py5XpEIaWd3I9OHCV5Coz4ZPIYiLoO8BXw0ul9klQ66
	yvZVDbyAydjSShWQ0vgPd9oqYq5sYh8fhRyZMoG5ZJj7dE8l6hr0VSxUpxrHS/bEjniHTqbZa
	KzclpyxMU3HMkLBitKwzDmT1gBgZzUfo703YnXF5T7loz2SIqhqssIPmtsKRqB4VCn7pLLAEG
	WTYv6jgnwwZBDOkoOt0soKBo+vLu+lW/nV4InkcLiUPC9aD35OwF6iTrPrg=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.133
Subject: [Qemu-trivial] [PULL 07/14] configure: Make
 -Waddress-of-packed-member warnings be errors
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
X-List-Received-Date: Thu, 14 Feb 2019 10:48:11 -0000

From: Peter Maydell <peter.maydell@linaro.org>

We have now managed to eradicate all the places in the codebase
that triggered clang's -Waddress-of-packed-member warning. Remove
the compiler flag that exempted it from our usual -Werror policy.
This will prevent any new problematic code being added in future.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20190208132112.31493-1-peter.maydell@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 configure | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configure b/configure
index 649ef1b158d1..c0f278141823 100755
--- a/configure
+++ b/configure
@@ -1882,7 +1882,6 @@ gcc_flags="-Wno-missing-include-dirs -Wempty-body -Wnested-externs $gcc_flags"
 gcc_flags="-Wendif-labels -Wno-shift-negative-value $gcc_flags"
 gcc_flags="-Wno-initializer-overrides -Wexpansion-to-defined $gcc_flags"
 gcc_flags="-Wno-string-plus-int $gcc_flags"
-gcc_flags="-Wno-error=address-of-packed-member $gcc_flags"
 # Note that we do not add -Werror to gcc_flags here, because that would
 # enable it for all configure tests. If a configure test failed due
 # to -Werror this would just silently disable some features,
-- 
2.20.1


