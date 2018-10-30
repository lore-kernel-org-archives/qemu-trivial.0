Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gHS8r-0001lK-85
	for mharc-qemu-trivial@gnu.org; Tue, 30 Oct 2018 07:25:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58186)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gHS8n-0001gt-IW
	for qemu-trivial@nongnu.org; Tue, 30 Oct 2018 07:24:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gHS8m-0002qf-0W
	for qemu-trivial@nongnu.org; Tue, 30 Oct 2018 07:24:57 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:53357)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gHS8e-0002Y3-Lh; Tue, 30 Oct 2018 07:24:48 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1M5wgF-1gBeJH20Xj-007XYf; Tue, 30 Oct 2018 12:24:24 +0100
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1M5wgF-1gBeJH20Xj-007XYf; Tue, 30 Oct 2018 12:24:24 +0100
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
Date: Tue, 30 Oct 2018 12:23:36 +0100
Message-Id: <20181030112337.17973-20-laurent@vivier.eu>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181030112337.17973-1-laurent@vivier.eu>
References: <20181030112337.17973-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Onxu/4XDh0jaT2PjMMZ+DvHlJo5HYaBM3GOMvdxKAvezyiybZ4/
	+wBQgSHXjv9ia+tJuI9ezUmg2W7KXx3ekOySgDSHgV/JajGwABC9/HRq2jO/MBf08Lr4h4/
	hV1O3ULqiwllm49AcUbvDZJOM9Du49YN8PhQCdk1FEF3V2psI8EhxX1LNrKITzQ3c4F4ufp
	QiCrKnsLmPc+5mJDmIbvw==
X-UI-Out-Filterresults: notjunk:1;V01:K0:IBrtWAJUG3Q=:48MbjHQVjHgFfr+mUIdERq
	DbrYiHzyjdS2+pk0cHQxqT6IpblKYxCdeznEPdT8LaZutoiTIa8N1Pe8KAGqhukBzGYkjKsIw
	yHIAzJkPvELvEmU5SoWhtgtNhiOUPbC41r/r2NZ7HoZ0yYJgtLAzE40S9szAhaXTz4Kg1L60I
	1pHcaKd5wkutSo3idcx82Bs6z0Pkr7l//IGpWYzdeWd5GK9pQlGzZ7Xxe64TgywIjH08HxxF1
	djaZqniHhjzd1Or3u6w0nlJUQpxqhp1oW0YOxlO9l19fHGURCsgoerWDF2kvjPl2oCV7zxmuX
	G46Ie0uPrfDVXCIdBfTFoH0+3DMPENw5ICaPSlZ7XJrlMWGC7P06An52sSAoXgW4AVo7aoW1j
	wBHrwcJvqb8VW1bUrxOOrv8JtVHETg7N128QmamS79eqZuX4sLfimlXDG5wxLSapt7/c1VSDp
	GicZlsDDc4I1Dmcx6sxvzN/MB+pv7An3JbjEoboLFVZxaZC7K9fhgGLKBM270lepNqj9CZ7dt
	n8g5L15nh4xirzqp88vif7a9IBvR5hfti/VKWYZxCHShl9wdBNaa2YOY6l9stbcvaG6jWWkRT
	bocLUfLAOh8nTUaiPGnG5pjGRbFBtaIDbMtLs1ocdowapZme4xDYSGgdRfbCzDuxL41KGjXzo
	6eCHNit5O8NG20I69LtUdCaq4Ej1QWbm7QfAaPS2Bd4PhRsbOYrC+fTcw4TdLKOMtGUuruMn6
	seAvkdKV7Rrh6O9I
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.134
Subject: [Qemu-trivial] [PULL v2 19/20] ppc: move at24c to its own CONFIG_
 symbol
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
X-List-Received-Date: Tue, 30 Oct 2018 11:24:58 -0000

From: Paolo Bonzini <pbonzini@redhat.com>

AT24c EEPROM is currently gated by CONFIG_I2C, and as such it is
being included in all emulators that use I2C, even if they do not
really need it.  Separate it and, since it was added for the e500
machines, add it to qemu-system-ppc and qemu-system-ppc64.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20180522191743.12872-1-pbonzini@redhat.com>
[lv: rebase]
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 default-configs/ppc-softmmu.mak | 1 +
 hw/nvram/Makefile.objs          | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/default-configs/ppc-softmmu.mak b/default-configs/ppc-softmmu.mak
index 3181bbf163..23d871fb3e 100644
--- a/default-configs/ppc-softmmu.mak
+++ b/default-configs/ppc-softmmu.mak
@@ -28,6 +28,7 @@ CONFIG_SM501=y
 CONFIG_DDC=y
 CONFIG_IDE_SII3112=y
 CONFIG_I2C=y
+CONFIG_AT24C=y
 CONFIG_BITBANG_I2C=y
 CONFIG_M41T80=y
 CONFIG_VGA_CIRRUS=y
diff --git a/hw/nvram/Makefile.objs b/hw/nvram/Makefile.objs
index a912d25391..b318e53a43 100644
--- a/hw/nvram/Makefile.objs
+++ b/hw/nvram/Makefile.objs
@@ -1,6 +1,6 @@
 common-obj-$(CONFIG_DS1225Y) += ds1225y.o
 common-obj-y += eeprom93xx.o
-common-obj-$(CONFIG_I2C) += eeprom_at24c.o
+common-obj-$(CONFIG_AT24C) += eeprom_at24c.o
 common-obj-y += fw_cfg.o
 common-obj-y += chrp_nvram.o
 common-obj-$(CONFIG_MAC_NVRAM) += mac_nvram.o
-- 
2.17.2


