Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h3QL7-0005QB-QY
	for mharc-qemu-trivial@gnu.org; Mon, 11 Mar 2019 15:11:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60127)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1h3QL5-0005NT-HC
	for qemu-trivial@nongnu.org; Mon, 11 Mar 2019 15:11:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1h3QL4-0003WR-Qd
	for qemu-trivial@nongnu.org; Mon, 11 Mar 2019 15:11:55 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:46901)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1h3QL4-0003Uo-Du; Mon, 11 Mar 2019 15:11:54 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA
	(Nemesis)
	id 1MkYkC-1gdPhl2LxW-00m6PW; Mon, 11 Mar 2019 20:11:39 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Laszlo Ersek <lersek@redhat.com>,
	Riku Voipio <riku.voipio@iki.fi>, Paolo Bonzini <pbonzini@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, Peter Maydell <peter.maydell@linaro.org>,
	Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>
Date: Mon, 11 Mar 2019 20:11:27 +0100
Message-Id: <20190311191128.30562-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190311191128.30562-1-laurent@vivier.eu>
References: <20190311191128.30562-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ixxF0H+MoBCgnQiepnZhCOBCG3pviUjJCeH8j2JQGbKgx2eaGVl
	FfZZ2KOYE8VVbH8sg+C+7FX8I2yC3up0z/7IHObzUu2Mh8DAycUe5luCSvcSG4+Z8BBXdxI
	4HRxvo+cZNwO87v0ztJAsXSKUZxKPbcIjEK6Sen3N4R3QSGfBrZ3+P9F8b2KfULVZoZDdY3
	kaBt4sem+ldeMER1yac5w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:0mxlzMy3Pso=:LOy2L9wK+lq+U1aevPq0II
	N8rQyYujvQaOioGRaU35FCGPRpIPhkyaVwWJbvDfNb6QbQzsUjwxNhFb+hSby68y/gthN2ObO
	TskrqDDJupodKDhfCbMwcznFmpa88ecjL5WdFdKsdFUTkchIUQCuwtUNQzP02gA9UY0jlyuzB
	DF4uBnw/DUM8vknjm3T1sphTeGVHDfXu27o5Xca1gDRgolEhwkYp3PIIUlf37f4Uu29Txzvhk
	3ADvMnvuIneTvLSsqTPTa+oRziJbqLZoYEJ7smP3n5x5V/nALydo8kntrStcauTlYuzZTqMuC
	T5R2X3p3bByV1mMv2mKao2MIm1Kuv9jjqsNcrcvQEvy8x5f0zqOvGPkQnT33MXxmlytSgjPC+
	9LtdL/Jr/wW9Knb6UZdxP53Sp/1Fdl4AkappQnENYP08h8Nt2EMjr4PYHsDUSXUOwM5+ugm07
	+g6btYWQRgwxbRFKLcCF29kgAgx8/CTddnVuTo+mLoeXPwk4/sGDSh6rBN4KDulZ0Ljgzrlm+
	fdrhY4/c4sXUAAj8G/ibjggCT8STomOpYZewczOaIizUfXN0b5MjOeFpL7+YmWyKNy/IBHCiO
	6JucCkdfaeTkvUs59J9xmEVOI87k2M+dd12uHuhYAGicm6abOAD8Pz4uDgDtHOqtsgMqwzJVQ
	MosRjL9TyMSuxXZEjlEOqcUHopuO0+bNSmryX+dZC+hEE184ZCUifhpIL72qmJlXQJs1CY4vE
	osHY/1YYIffyo7RGl1gTMTvHERR149VKOyKz31R30+DED0KYHXUEZUG9Y8k=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.74
Subject: [Qemu-trivial] [PULL 4/5] hw/arm/virt: Remove null-check in
 virt_build_smbios()
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
X-List-Received-Date: Mon, 11 Mar 2019 19:11:56 -0000

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Since commit 578f3c7b0835 ("arm: add fw_cfg to "virt" board",
2014-12-22), the machvirt_init() unconditionally creates the
fw_cfg object.  Later, commit c30e15658b1b ("smbios: implement
smbios support for mach-virt", 2015-09-07) added a superfluous
null-check on it.
Remove this superfluous check.

Reviewed-by: Laszlo Ersek <lersek@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20190309181920.30553-2-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/arm/virt.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 7f66ddad89f6..377e95a4cdb0 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1281,10 +1281,6 @@ static void virt_build_smbios(VirtMachineState *vms)
     size_t smbios_tables_len, smbios_anchor_len;
     const char *product = "QEMU Virtual Machine";
 
-    if (!vms->fw_cfg) {
-        return;
-    }
-
     if (kvm_enabled()) {
         product = "KVM Virtual Machine";
     }
-- 
2.20.1


