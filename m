Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iUT3h-0003TI-Vo
	for mharc-qemu-trivial@gnu.org; Tue, 12 Nov 2019 05:06:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53467)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1iUT3f-0003PV-H9
 for qemu-trivial@nongnu.org; Tue, 12 Nov 2019 05:06:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1iUT3e-0002uC-EP
 for qemu-trivial@nongnu.org; Tue, 12 Nov 2019 05:05:59 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:42235)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1iUT3e-0002tt-5d; Tue, 12 Nov 2019 05:05:58 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1M4aEC-1iV1Ge40TW-001ecg; Tue, 12 Nov 2019 11:04:35 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-trivial@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, Bruce Rogers <brogers@suse.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Sergio Lopez <slp@redhat.com>
Subject: [PULL 1/5] Makefile: install bios-microvm like other binary blobs
Date: Tue, 12 Nov 2019 11:04:25 +0100
Message-Id: <20191112100429.11957-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191112100429.11957-1-laurent@vivier.eu>
References: <20191112100429.11957-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:wQcXvqEXPICCirYZlSZvjkx3LuTDZcRc7s3EElSKSd+fTn7WzjT
 tUJ9zljPWfz5aMWi3rs+SoDAmdCC/bZQ4x/SpUhhX77RNGYG+PCzYF9ZnnHixvcKUwzaMwE
 5d0cdrYbzoE7lIKbYcr571PYuFyokWRATEBcXNSP7ufz0mMvNzO2EZb8XSyl9NqMgOTP6/9
 69+Rh4blqz60h5hYjpyTw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:FGgFTlr4xOU=:wDyAspUSsh4YfTI6HTFB9R
 VNYU9RD9vF8qMTNjSx9XJOsLQKVM4IzAN/bW1Vfl2JBdynV+POi4z4FMRvYLboRkPZ/pvcnvB
 h3or7UMQtFSImsQ72GuW5nN/WkRWfsUDEePcXpqRdXh+2eh/JxQLCLNyOJAgKPscIGOLoPjMy
 KgG6GcYZhy5sHZNpwJeJJnepDlMZCTBqfgL3geTaAX5yCh/S89Gb9TSxpKmHEn8doWRlTEm6n
 ve+lEI7WR+gYtzEkF1yWa1rt3xOr68TBJFRF26w4L6oIPOvpN0+QZrWIdZ0/nCLOwl0/NEUfQ
 imosS59MLihzFYg71GbYD96x+ePViPlalP1ztBcUAzEW3mgaSgEjX+cIU6tLHnbsbsDPtmaqZ
 Zj6xF2S5EUfpKdl7VPG4C3VtQK4p1tNIx5FQHad6cT/QUPnhgrD9kAory8TfmvMymKB2OtAE0
 Wncnr36ZpGMyntxii9i8ItUseyuYhfZck5tCR60TQnZlEtG1k08yt8rKgbZlCnwJtjovj37OY
 QFz3Ha6rEnq2gmIKRN3oOa4KjfQweDA4wUjoTl3ULeUdFpIeowu/chnoE2nqk+7JXYgj4wWVL
 bJQh4z3lgjdm5tXiDibVooBZBl5vzKknp1+UMA5Y+VaGrsZ73B0nvoMa2XvTgcApjLcPEBPoH
 y+GzFKb3qFy3KfBiV7FYzMyLyxDgOqOmDBtIgGOU9HsR2ijCyy8HDnAse/dI3cQG8qJCZOoho
 uvSOumj+jyfJsltD6+8BR8kYuc9bSSeMFxQM7s6IFOOEVSGsACzd67HuAN9eryjuLSgyNUGuf
 HMZEWJPPeTRdX6QCp7nYUsaf4GFI9gKKJLvHWMTGI64wRirobcKvAB8iANNRZ8fnP0Yu1n1ke
 UD4bsp88Lkb8N4gD9pguj1SZDQCI+j6TZRAgsY0vo=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.227.17.10
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
X-List-Received-Date: Tue, 12 Nov 2019 10:06:00 -0000

From: Bruce Rogers <brogers@suse.com>

Commit 0d5fae3e52e introduced bios-microvm.bin but forgot to add
it to the list of blobs being installed.
Add it to the list of BLOBS that get installed.

Fixes: 0d5fae3e52e "roms: add microvm-bios (qboot) as binary"
Signed-off-by: Bruce Rogers <brogers@suse.com>
[PMD: Reworded description]
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Reviewed-by: Sergio Lopez <slp@redhat.com>
Message-Id: <20191102114346.6445-1-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index aa9d1a42aa91..a8998fe5cf79 100644
--- a/Makefile
+++ b/Makefile
@@ -771,7 +771,7 @@ de-ch  es     fo  fr-ca  hu     ja  mk  pt  sl     tr \
 bepo    cz
 
 ifdef INSTALL_BLOBS
-BLOBS=bios.bin bios-256k.bin sgabios.bin vgabios.bin vgabios-cirrus.bin \
+BLOBS=bios.bin bios-256k.bin bios-microvm.bin sgabios.bin vgabios.bin vgabios-cirrus.bin \
 vgabios-stdvga.bin vgabios-vmware.bin vgabios-qxl.bin vgabios-virtio.bin \
 vgabios-ramfb.bin vgabios-bochs-display.bin vgabios-ati.bin \
 ppc_rom.bin openbios-sparc32 openbios-sparc64 openbios-ppc QEMU,tcx.bin QEMU,cgthree.bin \
-- 
2.21.0


