Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gG4Jm-0005NK-Kc
	for mharc-qemu-trivial@gnu.org; Fri, 26 Oct 2018 11:46:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50276)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gG4Ji-0004cv-AC
	for qemu-trivial@nongnu.org; Fri, 26 Oct 2018 11:46:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gG46c-000579-4B
	for qemu-trivial@nongnu.org; Fri, 26 Oct 2018 11:33:01 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:45359)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gG46b-0004wW-LK; Fri, 26 Oct 2018 11:32:57 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1Mv3M8-1fPTTZ0ozo-00r0dP; Fri, 26 Oct 2018 17:32:21 +0200
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1Mv3M8-1fPTTZ0ozo-00r0dP; Fri, 26 Oct 2018 17:32:21 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
	Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
	Michael Walle <michael@walle.cc>, Laurent Vivier <lvivier@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Cleber Rosa <crosa@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, xen-devel@lists.xenproject.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
	Fam Zheng <famz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Aurelien Jarno <aurelien@aurel32.net>, Kevin Wolf <kwolf@redhat.com>,
	qemu-block@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
	qemu-trivial@nongnu.org, Riku Voipio <riku.voipio@iki.fi>,
	Eduardo Habkost <ehabkost@redhat.com>
Date: Fri, 26 Oct 2018 17:31:25 +0200
Message-Id: <20181026153125.24738-21-laurent@vivier.eu>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181026153125.24738-1-laurent@vivier.eu>
References: <20181026153125.24738-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:KclRKIrIPGBTOGMjoqcysLNDM8QxCF5ssfwQakHXJ9Nqg9/6fxz
	/1aniyI3DJXYydjEE1QS3TSzttpEMiuvyJFGSFkv/63u3VFFF417jlGodsTsOHP7fqZ6dke
	5EV9QB95RAdcFyvGs4QkymIceWgtU1iyqM2pX6UcyLxikvjo1Imv7atLScwLaSktlS1rQr3
	ldOWvFO7er8LMfVe1x/LA==
X-UI-Out-Filterresults: notjunk:1;V01:K0:2s2VV2pj5yM=:HjZv4m41rAcvloX/Ghjz63
	m+hNHTf6s7a1a7XQtxkbpnbfVXbli5kTCxigU+CU0YBvVfVbgduFIZeZn4iKDgmaqOqNkm8bX
	FA/dVNYyQyFxWz0XKEMprHHg68T+RCkw/CdeNRHjbUWfhIsjE2dEuHdC9J/6RNh5sxJAGle/3
	I+xV5YTmQVz1Ws9Ii6ybl7B0n6HJtSayg+rc5dQB5E1uum2o+syGCfYBcYP9SYWW9kJytwxcA
	KbtacHALrDYQ0XMARTGSWxR283QCcbAY0DJeIRht2zqrwB+WTY+Y+DoTrMIkKic3qvTK6I2cS
	Ze84KA70qyGeWshHl5rBusNyw5mBXDh4ZGPODlAswUQkrNgzMSHR8T1cDxFmW7DHSizRUNXo7
	1wUpnqmSIL1zpbQsDdtgf65svyynic2j2Cq8cfO1kZavOprfQ5/oEMPPWv1U3R/4h4Xeyd3jX
	ncLLBmwYJc9BU9GsUOBlQLTgER7RM7BS5XQBjIEAhQxRNh0rxMxopOQpKx8SqbBpdsolUxF0Y
	nHfv2fLogDSSwJ+OSPjrmWFjoICJP1cdowZ+oSTN/lJUnni/XNqqn9p5W0GmJiUyjrXUiuKFE
	59AoqcoHp0JXFvEoQZA2Kqc+SmpRm0a5GUYMHIZ+OCBfLv7X4lqSPcdzbRFml0r84P7wkXnE5
	uG6MXLtT8uFM1BJR5BReguM2/SL0IFidTx/G+HhD7p5VayEIHnppMI86j1P49oEX3SfC+F7lb
	UDbN1MpfG58zcPo/
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.135
Subject: [Qemu-trivial] [PULL 20/20] ppc: move at24c to its own CONFIG_
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
X-List-Received-Date: Fri, 26 Oct 2018 15:46:33 -0000

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


