Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jBK2W-0007yV-Kf
	for mharc-qemu-trivial@gnu.org; Mon, 09 Mar 2020 11:09:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33336)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1jBK2S-0007og-Bq
 for qemu-trivial@nongnu.org; Mon, 09 Mar 2020 11:09:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1jBK2R-0007gF-AI
 for qemu-trivial@nongnu.org; Mon, 09 Mar 2020 11:09:52 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:56317)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1jBK2O-0007dx-Ih; Mon, 09 Mar 2020 11:09:48 -0400
Received: from localhost.localdomain ([82.252.135.106]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MlwBh-1jbc562ffX-00j3HZ; Mon, 09 Mar 2020 16:08:47 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Greg Kurz <groug@kaod.org>, qemu-block@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <rth@twiddle.net>, Jason Wang <jasowang@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Michael Tokarev <mjt@tls.msk.ru>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Fam Zheng <fam@euphon.net>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Andrzej Zaborowski <balrogg@gmail.com>, Helge Deller <deller@gmx.de>,
 qemu-trivial@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Subject: [PULL 02/33] maint: Include top-level *.rst files early in git diff
Date: Mon,  9 Mar 2020 16:08:06 +0100
Message-Id: <20200309150837.3193387-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200309150837.3193387-1-laurent@vivier.eu>
References: <20200309150837.3193387-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:mld9B2FysAyq/JRuJU+HFs/fY2Io+TPiAPpRJFtmcONIGZ7Rto7
 jJngslIHaKNCPsm6Jad44FfZYle4J+6wCXsvIg+eevB7FPsW8i/2B6S/wQ0UuUmvv+k4XfL
 MhUkN6utxBSs6g0zJ1g4BnqSzC/pU7OydL3bgdaqwI450A+P7TjcOC7DelGlHUzvqN/mkrg
 jffHr+MimU0GPcCXXHKIg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:fI/dpnRvQCE=:004FYDGB+IXXAKS5m2OuEq
 iZgWkTOPZvx6OXWgcaA9G2+5FYYFSvkdty/JRl2zEMtKq+HtDm3zKoZprgiJISrSF/Dc5Undy
 VsA+CGtFua24pZWKwQdfHUCVozfTllzbtvnVMO78pvGM8WMqgKXaCSyi6DoQ/piNMTX9io4eJ
 8PPXAQjP0oX1eVe/o60yV+uHdmLuztVi8EReo13c+8x2a3tl5Umz4UTAg9rYOXwNxCfBgMXAB
 iizvsmBPQoz3dARVsTTBSuwVkVaANhJVNEE1N02y0x/zaembnwNc2eF4pQsnGoQJf1ClnV6dO
 yHFVAmld2/6rMW3NDdm6dB1lRlYeNrDuZSCvN8q+1ttOqmZA7dsCCBF0AoR1/Ise2ScB89cK8
 vOrr/JvvhaEvTr0zOtXrV7G+8ZbIieoPyJvEsWQgLSS7gI0KLeTLRNwNjLqciriZm/NE/bXRn
 +rI6PCih5nYdVR8reMjX8TY/RKRIH/C+qXsObPHg5w7/shoQrDQrTAbVtL4rJmoIDwgXrQamy
 cUnhRPJPMuLKa+14MSDSxYvT8An7GWFRo2GiwONhSlpRVnLAzndyMJ6WLP1oRABdQ3pRziGld
 tMfjT5igKE4yAH6SlhMjvCCb/snjW65pfOO/g1C5H90SfEXEggtXj1DOU9eEk47t9UXHmKRMG
 srR2YiIkNBUZ6HxwuZj3sa2o169Ayoo1VpytZyjr2HZVk/Ht+BPFiBpSluUBfbr4pnpomCI+g
 QFvkFDPavc07FsHHb2bCUdZIncL7QRH9yWZOj6iT8fp7IZZZKpFyAhiXPEEPSeRpGCSOFwLH8
 Kb8JYqmKFMJ00Sh6NzMvtAeRRnu+l9Iwczk+nXXCMhUMrNanwc3h5+pNBEAfApeHjJQnf/8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.74
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
X-List-Received-Date: Mon, 09 Mar 2020 15:09:53 -0000

From: Eric Blake <eblake@redhat.com>

We are converting more doc files to *.rst rather than *.texi.  Most
doc files are already listed early in diffs due to our catchall
docs/*, but a few top-level files get missed by that glob.

Signed-off-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Message-Id: <20200220162214.3474280-1-eblake@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 scripts/git.orderfile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/git.orderfile b/scripts/git.orderfile
index 7cf22e0bf546..73fd818d7f3e 100644
--- a/scripts/git.orderfile
+++ b/scripts/git.orderfile
@@ -11,6 +11,7 @@
 
 # Documentation
 docs/*
+*.rst
 *.texi
 
 # build system
-- 
2.24.1


