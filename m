Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jBK3b-0001Ft-Kj
	for mharc-qemu-trivial@gnu.org; Mon, 09 Mar 2020 11:11:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34531)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1jBK3X-00019o-FV
 for qemu-trivial@nongnu.org; Mon, 09 Mar 2020 11:11:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1jBK3W-00005Q-A0
 for qemu-trivial@nongnu.org; Mon, 09 Mar 2020 11:10:59 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:43841)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1jBK3L-0008RQ-IP; Mon, 09 Mar 2020 11:10:47 -0400
Received: from localhost.localdomain ([82.252.135.106]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MplPf-1jhdfT0Kcv-00qBcx; Mon, 09 Mar 2020 16:09:54 +0100
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
Subject: [PULL 30/33] scsi/scsi-disk: Remove redundant statement in
 scsi_disk_emulate_command()
Date: Mon,  9 Mar 2020 16:08:34 +0100
Message-Id: <20200309150837.3193387-31-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200309150837.3193387-1-laurent@vivier.eu>
References: <20200309150837.3193387-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:6U5wEHkdFwT3kDr22VsD0fPTXG5OlUqnb2ZOctZu9kWAsabqMPX
 /lsz5U72zKPEX8SKZiKzfqb7OGburV/dBCDU6bo7WqyC+E8BPUckivUuhMEiR9HfOs9xcvi
 4o3TFnrXxHanpwoOCuJcIGS2XD7qdFGKi1H1PVzXALWeT+4mnoIqJu2NExqZ48ue1LEvuyu
 +et7iqnwBNGqjOIsuHhCg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:EKnD7kcJ+Hk=:hC1YPwabFBImO5nS5mLgVl
 nOtTkJ7R+S3ycDX3BfxIEPA3JgfxL2pOuNqS7IxjKEVfmMWwvSY0uT93gdnPkRWF8tpmNovFO
 Fwfu8LfXuJSEPPs2/5qOa9MtOUgwvsew3t3Nx7wrSZ9nyqolYNR0cI9S8FEnLVFVOwDEZ5vlk
 h0D6/LVwym0nthv9tDfBNxLFlprKjjP5+juVlUWExS9ku5XY6FwYSgBF5oWdxJV8lAekbjUh0
 Fb6L1znfPbLYn4K3ueM/Wu2Wi7PVOY9WgYIQ6s0Pd2DC7JyyBCR6LWhdOhFD6/rqxrbYVruQq
 LskQm3AbbJmbHlD7NUx4a64H+KvW1wQzSfcMdMxitVXIvbH6B+gNjBJ40FuX1BF6fyojFxfGV
 c7ndvWn755btxIE/2DnGq1xnq/tCx9lyixwWQ0u8D+h67fyJvnN7KkKSSoJgFhd/8Ryhaah1g
 rBMq672qGOnOSArZ1T0Dj0udF9pR6vxPsVNaOCQA7sLdRhp+nYZveycScl+TmDhq5fnFPiywx
 +3BtjiBGVElddVZeIwPKh8zhbVqyUed660ZlfPCh2tSuGdHyLsr7BT1JuElr/SsM3ar6Sy33Q
 N6Os1qQ+zkKE6KZ+zCMEy4d7sh/gz3cFfw+Mr9yOecL3/9IHIAmhqBq8CgfwM3m6g8zULo5cm
 cWYsSN9geXwdImFXBmpyVdqeHZRoVPHoHuO8C25M6wVLidzsoTT8zTc9gTHgvxnV/EtL5hfQy
 AjQrIaakojbf4pdXe0KDgAfA4sTVB5FJZNfjpZMsKaAE2TMQpa7HodD4bruCI1hyq2PCxQLmQ
 DTSNR2dBp78JRVgOPVkOsbs+O2Ybp6MnSdlzPTWe/I2EGnb8TrfSBphOWYsqtCuLBo9Ru03
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.13
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
X-List-Received-Date: Mon, 09 Mar 2020 15:11:00 -0000

From: Chen Qun <kuhn.chenqun@huawei.com>

Clang static code analyzer show warning:
scsi/scsi-disk.c:1918:5: warning: Value stored to 'buflen' is never read
    buflen = req->cmd.xfer;
    ^        ~~~~~~~~~~~~~

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20200302130715.29440-7-kuhn.chenqun@huawei.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/scsi/scsi-disk.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index 10d0794d60f1..1c0cb63a6fe0 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -1915,7 +1915,6 @@ static int32_t scsi_disk_emulate_command(SCSIRequest *req, uint8_t *buf)
         r->iov.iov_base = blk_blockalign(s->qdev.conf.blk, r->buflen);
     }
 
-    buflen = req->cmd.xfer;
     outbuf = r->iov.iov_base;
     memset(outbuf, 0, r->buflen);
     switch (req->cmd.buf[0]) {
-- 
2.24.1


