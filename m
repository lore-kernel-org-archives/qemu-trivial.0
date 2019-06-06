Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hYqFd-0000cm-8P
	for mharc-qemu-trivial@gnu.org; Thu, 06 Jun 2019 07:08:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60612)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hYqFT-0000V4-Bl
	for qemu-trivial@nongnu.org; Thu, 06 Jun 2019 07:08:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hYqFS-0003lA-C5
	for qemu-trivial@nongnu.org; Thu, 06 Jun 2019 07:07:59 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:48335)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1hYqFM-0003XM-8B; Thu, 06 Jun 2019 07:07:52 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA
	(Nemesis)
	id 1MF45G-1hJOpv4BHE-00FVwS; Thu, 06 Jun 2019 13:07:00 +0200
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
Date: Thu,  6 Jun 2019 13:06:22 +0200
Message-Id: <20190606110625.32127-14-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190606110625.32127-1-laurent@vivier.eu>
References: <20190606110625.32127-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:fzaLTWynTwDqw6BjWmgpLb2j0IKt7+qM8X08zaQ6i9wGrXiov9X
	wSpTCy06OGdyElX7Nu4C3qjeTx82I/dXttSwj8u7Um3YjV8hbFFJFfij/5g9aVoTRZMBsgU
	qRFZL0xYRoujggCov1NFhZcDbnqII1+ueWrGKkHuP6rsAW5OyeZ+lG4bUnfHOe4LlnTqIjF
	O/l0SKuUv7l8LcvaDxYGg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Hbvzz2t+sbA=:O/5Xg9ZXO9P0MYOLKekIUO
	42O8iR3bR2OTpFSjE/mr0VGHbSNoL+DgTUJeZf8rtvpC2oqiQbZGMbj7L5TDfU9RPivEzId1S
	tQsl5ZlOhBnJQxMT80vywmOoJgoeLDLz32hbMu6fs2w+eOwu5I1Fee2Hc+FBS23MIYWTURf51
	tmbHnhTWGWetV1ZmPRGamqojQNd8KznKwpt+le0Qmj0fnW7y+BFc4lxktjt3sDLSQsuYbhBN/
	LGKbYA2X/dnvmILr1zYmyEAR/gzKAA5OzgwO1sGjr8suE3Evekh/qOLxDD3zEtE1Zm9q3pYGh
	7ftFN6nvFnvZvN+wl5L2LdgZSBKhaX6m1VDIvKy6WWAdNIQWgeYNy4xxE5UhMKGLggTbdQD3o
	wZEppG7j7ZoVHJp9qw6gS1wtnNYsofIxKWDmnq3dke1b+vb3Qjz3eTuj7tSeDFI8XuqwQ9KEb
	39v75ZQggF9F7r0UFwTd/ujaWqvQgzPe80YweWAEzxiZ6RLqkvHSmyxVtK+j+lA72H+8uRLoK
	w05IjZqJP4RXFYSNvkBHTu6+l8ppc/qG6e1NzPjJoDE8RHXjYWZjxoSSGcpV59W15K2pH6o22
	ZTeMQK0dxgXX75rxPLRnqhvjOMlEyOnqasQ3/8+MH/s9mAkhptO2jmWN3SwWRWAhucN4hjCIB
	jUZYJ/HboaJs+kHcYLgD9NBDSRnwDL5YZucpvfmRZf5sQCcFcpFxgCO5hBqG+JBigvCWc0ZcR
	ngA0FWEl9uDMvfez9BUfX7onzPQB12WuPnCop8J1c+JrbzPVolK2NnTNJJk=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.10
Subject: [Qemu-trivial] [PULL 13/16] hw/audio/ac97: Use the QOM DEVICE()
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
X-List-Received-Date: Thu, 06 Jun 2019 11:08:00 -0000

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Rather than looking inside the definition of a DeviceState with
"s->qdev", use the QOM prefered style: "DEVICE(s)".

This patch was generated using the following Coccinelle script
(with a bit of manual fix-up, removing an extra space to please
checkpatch.pl):

    // Use DEVICE() macros to access DeviceState.qdev
    @use_device_macro_to_access_qdev@
    expression obj;
    identifier dev;
    @@
    -&obj->dev.qdev
    +DEVICE(obj)

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>.
Message-Id: <20190528164020.32250-7-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/audio/ac97.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/audio/ac97.c b/hw/audio/ac97.c
index 2265622d44a2..a4e8d99e7775 100644
--- a/hw/audio/ac97.c
+++ b/hw/audio/ac97.c
@@ -1388,7 +1388,7 @@ static void ac97_realize(PCIDevice *dev, Error **errp)
     pci_register_bar (&s->dev, 0, PCI_BASE_ADDRESS_SPACE_IO, &s->io_nam);
     pci_register_bar (&s->dev, 1, PCI_BASE_ADDRESS_SPACE_IO, &s->io_nabm);
     AUD_register_card ("ac97", &s->card);
-    ac97_on_reset (&s->dev.qdev);
+    ac97_on_reset(DEVICE(s));
 }
 
 static void ac97_exit(PCIDevice *dev)
-- 
2.21.0


