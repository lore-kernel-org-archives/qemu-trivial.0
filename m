Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jBK3b-0001H4-VZ
	for mharc-qemu-trivial@gnu.org; Mon, 09 Mar 2020 11:11:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34476)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1jBK3S-00017D-3j
 for qemu-trivial@nongnu.org; Mon, 09 Mar 2020 11:10:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1jBK3Q-0008Ub-PM
 for qemu-trivial@nongnu.org; Mon, 09 Mar 2020 11:10:54 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:57057)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1jBK3H-0008M0-1F; Mon, 09 Mar 2020 11:10:43 -0400
Received: from localhost.localdomain ([82.252.135.106]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MwQKp-1jSA6N3Q1t-00sMOB; Mon, 09 Mar 2020 16:09:59 +0100
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
 Paolo Bonzini <pbonzini@redhat.com>, Chen Qun <kuhn.chenqun@huawei.com>,
 Euler Robot <euler.robot@huawei.com>
Subject: [PULL 32/33] display/exynos4210_fimd: Remove redundant statement in
 exynos4210_fimd_update()
Date: Mon,  9 Mar 2020 16:08:36 +0100
Message-Id: <20200309150837.3193387-33-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200309150837.3193387-1-laurent@vivier.eu>
References: <20200309150837.3193387-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:vnjbFk+4XeEO6Y7jzUGToROLl3IXCk9V3Q5V/w1bgIDJkoBbJUq
 Rt0UUGtbZQ9WFlsz9dJscI+gw//SWSi9MfbBkqjjXKYpyN0yeYDgQa0RXsS1YWnRVRctQHr
 8Zoo+VCnvsd8plirugAetWJF6BpPX+FDPAB0sPsKc7ItAAdMWEb/R/RHixvLLe3SoAedMN3
 5trKziwslXaWxH1wEVdZg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:PVN/VKUgigo=:FhbXvK/Xvtl+yIGhXW2hn/
 P2HCxe6JY1samg9teh4w1/0xqyRec41DWzYWFe/K4ij3wWtUBemc0JfvtHYVGPuWYlT48H3Vi
 8qNNchT3iOWYHS6BnXTZcLysjs5cvKjmQPfNt143SaG5CLPhAmf52SLT26YUxrfjWNiGOJuVx
 k1skcHA4l8jTUcZNgR1v9TCm+uwDlkjYZM3Z6gIrzFTeCsI4+8iI6WKibm9VfGXX1wokHZxkS
 CBp6avvIci1O7W5063i84wbe9ZNgFswO3vtGBm3sUox12292pJglT4kDnjZIoIbsyDP94brSf
 LcqZKKwyiRnezy6O0G9fgA8iqR5OdZHgpPR2ab0aHJ+e+1IqqWkXNVHKD79MiV/SUjJo7Jx5F
 vMUccIiHeFx+tMAA/49HUev95X5LO3xjpvxkfNyLms5GsLse4kckQ/fsVwQS7X9HJ8YqO5BYl
 WbWQpJU9ChtZU0G7UZDfKexxFIDKkxavPEQgHhvH8vgntSm3J+NiTkqGPEeJCn0GDi8q2qCW7
 ysrMJQUdYhH+k2evorDPHrs8qH6wMdKPDaPwHKw8fR7EAaUY7BGcIvwFVO9hyuY5zASkddG0+
 p67nOAEI0/aeqo2qkQqCPA022zwKQjWojO5CEmi0MQOURQG/QMcZUSq/1eyzQ/sgjUEm8/5AV
 XMBwZ0SwuWYAzD3qIjp43D1bz35Fd2HPJw8SGlEC/6OHyscKZ3iZIWM14a+p/fKNbyq2Ls5+J
 YVvARaG6BkQmE/Jm93qb+TUk6nrdjJV+31bIIXw8AD09Tx/AaSdizSp997Bg/HBol6/3QgEMF
 YJYWBL1UGqfMZVVfEGqfx4CS0OulIbE2TPRBvOmcrVPppAO6KbEDTl/YjdA6XfDe9taftKo
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.75
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
X-List-Received-Date: Mon, 09 Mar 2020 15:10:58 -0000

From: Chen Qun <kuhn.chenqun@huawei.com>

Clang static code analyzer show warning:
hw/display/exynos4210_fimd.c:1313:17: warning: Value stored to 'is_dirty' is never read
                is_dirty = false;

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20200302130715.29440-9-kuhn.chenqun@huawei.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/display/exynos4210_fimd.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/display/exynos4210_fimd.c b/hw/display/exynos4210_fimd.c
index ec6776680e41..1c0266ce9f2d 100644
--- a/hw/display/exynos4210_fimd.c
+++ b/hw/display/exynos4210_fimd.c
@@ -1311,7 +1311,6 @@ static void exynos4210_fimd_update(void *opaque)
                 }
                 host_fb_addr += inc_size;
                 fb_line_addr += inc_size;
-                is_dirty = false;
             }
             g_free(snap);
             blend = true;
-- 
2.24.1


