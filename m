Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1guEYn-0002J9-NR
	for mharc-qemu-trivial@gnu.org; Thu, 14 Feb 2019 05:48:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50166)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1guEYj-0002H3-Nd
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 05:48:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1guEYi-0002hZ-Gq
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 05:48:01 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:57451)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1guEYi-0002QJ-3Z; Thu, 14 Feb 2019 05:48:00 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MmDVA-1hKnwi1Lt2-00iExa; Thu, 14 Feb 2019 11:47:40 +0100
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
	Kamil Rytarowski <n54@gmx.com>
Date: Thu, 14 Feb 2019 11:47:09 +0100
Message-Id: <20190214104717.3543-7-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190214104717.3543-1-laurent@vivier.eu>
References: <20190214104717.3543-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:LybyNIzL5PtJPYuxTsW6vJRXiHRfDatM9TBDBQYLmYe156TCeeS
	YYBn5noBCb0Y/NC4pJyzsZOvAu7jIjs/7VVKx8zip5t6vE5z30JT4bC8AgDgeUn5C34lTwh
	mvdxCA4fA2PgYM/IYamwvYaGS8qB24rkbCATnO2qwS9ZXUqYGmH/IgTAiuNC+7QQrEV7U2j
	Nb1mnM1leCn/vpxqJ5U/Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:XgyjFiGsFus=:x0oWvUqLdg/3czLC9FyQCG
	RUH1c2Nzwj61CSLdBcTOQs4stuVX23iCbwsNuuVCKVomEhAOjkvsiKHj1M6T5suHfctz8qj/a
	0pE5QdxvCCO5Ul4DwglDkokSBgjALfzdadTDEF57+DN51Hcz3g8X0m7Uq8aMWYb/BZ1OnvQKw
	kPz7RY8AB3akAjLWAR7b66j2FuQl/hwuF1IHg1I7fELtbLgSVT/hKXDWt58J2nhXuInFNBzp7
	jEydQNAloBktTW8q1NfQNlrJaYrOpH/XhHrwvEqSyfS6p7vLr2Mm6gp0xQfAHSpzFU4MPyyAd
	hsUZaEO2HLU79L9x0dDlm0wSgOQNB6EHujunGbPTDfeNr+f6TVaQI/wzuC+0nXNFVQY0NEvyj
	3S01L5lIzezIWJ3SGnhNlTgIZ7sv6RZTPUEMQaWUcgZ5Pd5aJgB6+OCdt3+OIcsb3VrWY1lqR
	eq4JXQTBMb/QuCHz5C7rqY94BJlr3b3hNirbOpBVTsmx1uKfl6b/JVbi76uHT5eMZCIGW9LLc
	oBCHT7prK8y0xGYvGOMZdkZ6aYd/0P92sqUCGZiMp0Cy331EXtns0Y7xICQmI2Rsi2EQHIpiK
	9paQK+UOPrbYEDmMSPxAs/Ult2NSdkvyExg1lVLOCGp9cGBbrqEVFAkIbGoTYKNNtdAjAxxNh
	3t+qUHTKGty5bOOr1oAIG3hLtEaC9sYW4OOnG3pZ9JSYc/QR4/gz/aN/ZIs+7pTpLC+EQPF7+
	u8FXVrLZL+u08/cj1qazWE8qUfbToeCZuXTygw==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.134
Subject: [Qemu-trivial] [PULL 06/14] configure: Add HAX support in NetBSD
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
X-List-Received-Date: Thu, 14 Feb 2019 10:48:03 -0000

From: Kamil Rytarowski <n54@gmx.com>

The NetBSD support in Intel HAXM has beem merged upstream and is functional.

Signed-off-by: Kamil Rytarowski <n54@gmx.com>
Message-Id: <20190207233704.29978-1-n54@gmx.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 configure | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configure b/configure
index c8fc1647fe69..649ef1b158d1 100755
--- a/configure
+++ b/configure
@@ -817,6 +817,7 @@ DragonFly)
 ;;
 NetBSD)
   bsd="yes"
+  hax="yes"
   make="${MAKE-gmake}"
   audio_drv_list="oss try-sdl"
   audio_possible_drivers="oss sdl"
-- 
2.20.1


