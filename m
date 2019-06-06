Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hYqFc-0000bl-Rk
	for mharc-qemu-trivial@gnu.org; Thu, 06 Jun 2019 07:08:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60704)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hYqFX-0000Yk-Mb
	for qemu-trivial@nongnu.org; Thu, 06 Jun 2019 07:08:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hYqFW-0003sE-QW
	for qemu-trivial@nongnu.org; Thu, 06 Jun 2019 07:08:03 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:40829)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1hYqFS-0003kp-WE; Thu, 06 Jun 2019 07:07:59 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA
	(Nemesis)
	id 1Mjjvp-1gpIoc0oep-00lIOV; Thu, 06 Jun 2019 13:07:05 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Aleksandar Rikalo <arikalo@wavecomp.com>,
	Juan Quintela <quintela@redhat.com>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Fam Zheng <fam@euphon.net>, Michael Walle <michael@walle.cc>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, David Hildenbrand <david@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Yuval Shaia <yuval.shaia@oracle.com>, qemu-trivial@nongnu.org,
	Halil Pasic <pasic@linux.ibm.com>, Richard Henderson <rth@twiddle.net>,
	qemu-s390x@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Date: Thu,  6 Jun 2019 13:06:25 +0200
Message-Id: <20190606110625.32127-17-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190606110625.32127-1-laurent@vivier.eu>
References: <20190606110625.32127-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:bl0xDPOBLSFyaA6yuciGO6yWHbSUzI/Taafs3MPVPDjQvSPq2FO
	n6XAL3not5uDhjPw7QdREwMHMqCv3HP2WfHkrW3kJZ0ay6L9pndG/dp1Dt4pPzTs5EeJw6u
	1V+u6VXkuVastSw4iolcMlezkMrmvDF5WnpikF+fvoqBLA+wyljyEMTK3E9u4SO4wdbfSy3
	XnHHHxVxZ1g5nQ0Uka1fQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:B/2HZW/kxEQ=:IBY9o2em4spVu6pcr0bD5N
	4qbMMRjgEyOBMgFfTs8RKny4+saGSRYEv1xWFSYqFG5c13q0jtDJdNc1lDvFgk/wxM9G75xVu
	1MzOz7WbfU35OEX8xX4SGzALQ1gBajW97yxYyX2HUfFUhTPgqPeHEOiHp7wbqEaG3yNBBZugy
	+FltJC6MifGu8Ebu8uHTliWZtsqmsxxB1cOzRVLwo++swCivYQsz9PS+bs9sUL6XmAa9EDACp
	I4gI2i5hWbmtWISlim8JXm2rVqpxqKMN54KHL2hwbys7e7wsil/54oUEBQJPu4gdVylrq0Nqy
	Ov1owG4ToUZOGq8iOce0wTHpcY16y1bywwLRLAfpBML42UHHlcvBMxVDwkSHar65sg3uvtKMi
	YtU5+GpjVmeaelGyfY43SNQCDXVWy+hRlCxo/vWM3EVIj3hf0qtxHx3EssyOD51iZ9kmstQgj
	qk+S+MEBV9/+cWr8Z90TZ4EixwcbpliQlyGCaSlvudNAgo9FuRsHd0p7lz2NCMRwYsyz2TsKN
	+flqumUZQnv3GhLb2M4D1em2avUDq3PCTXSX+0Tfe3+QnCCSwuV8VaRqz+uM+J6kQXP/YQaTz
	TnrdStmsQnynmKN3dWjmA2WfBAe82kIgiqTV8WfaA+d/U+2HSnt3ieRjs3YmDY4pNvppbOUr1
	7oagnQw4SODMvXVuBxJVFlu+plQymHQX4iOCsC2uAcH+FJeE3BYbrlO1JF4B2DAA5IVowEdE6
	EiR3ncUqoE/SMYsiect/LdiFieqFj8omHC6H+HJ2CAgchrjwbRiAGlGH1/c=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.10
Subject: [Qemu-trivial] [PULL 16/16] hw/watchdog/wdt_i6300esb: Use DEVICE()
 macro to access DeviceState.qdev
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
X-List-Received-Date: Thu, 06 Jun 2019 11:08:04 -0000

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Rather than looking inside the definition of a DeviceState with
"s->qdev", use the QOM prefered style: "DEVICE(s)".

This patch was generated using the following Coccinelle script:

    // Use DEVICE() macros to access DeviceState.qdev
    @use_device_macro_to_access_qdev@
    expression obj;
    identifier dev;
    @@
    -&obj->dev.qdev
    +DEVICE(obj)

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20190528164020.32250-11-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/watchdog/wdt_i6300esb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/watchdog/wdt_i6300esb.c b/hw/watchdog/wdt_i6300esb.c
index 1c6eddf86aea..f2d1e86526f2 100644
--- a/hw/watchdog/wdt_i6300esb.c
+++ b/hw/watchdog/wdt_i6300esb.c
@@ -200,7 +200,7 @@ static void i6300esb_timer_expired(void *vp)
         if (d->reboot_enabled) {
             d->previous_reboot_flag = 1;
             watchdog_perform_action(); /* This reboots, exits, etc */
-            i6300esb_reset(&d->dev.qdev);
+            i6300esb_reset(DEVICE(d));
         }
 
         /* In "free running mode" we start stage 1 again. */
-- 
2.21.0


