Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jBK39-0000c7-2d
	for mharc-qemu-trivial@gnu.org; Mon, 09 Mar 2020 11:10:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33997)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1jBK32-0000Tb-TX
 for qemu-trivial@nongnu.org; Mon, 09 Mar 2020 11:10:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1jBK2x-00085S-VK
 for qemu-trivial@nongnu.org; Mon, 09 Mar 2020 11:10:28 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:47881)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1jBK2m-0007yk-Pi; Mon, 09 Mar 2020 11:10:14 -0400
Received: from localhost.localdomain ([82.252.135.106]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1Mzhax-1jXeIs1XM1-00veBL; Mon, 09 Mar 2020 16:08:59 +0100
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
 Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Subject: [PULL 07/33] virtfs-proxy-helper: Make the helper_opts[] array const
Date: Mon,  9 Mar 2020 16:08:11 +0100
Message-Id: <20200309150837.3193387-8-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200309150837.3193387-1-laurent@vivier.eu>
References: <20200309150837.3193387-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:J0ElaOma/BrvYx5wmtzVLW2iD0CdbHsBWhXdnly3lXC/+3tUaSh
 PDNcOP401aIpi92ruYia3szL0I1ky8SlEY7+g6MyJYTtROe+iO+sr98eXL8jA7dIHcV/mZc
 O/fK5VV3+4tMDbqK/IDi4pFehQv4HXNnWu8b8QaJLgX2f1J5WMOLWHXtAgHh5R0MwEJoYdU
 /ml8kexxfQBFrDBK4H3ZQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:WFSktFvnpCA=:UyCBB0Kfxm+Xa0FW34RDDR
 FdPZbFMKs8DR2oIqBnrndUmSNhPSP1q34Wh1yB1rExeIMkHFGSEl+EycJqkQTwphfgugMwEwO
 kIUFW4/7eiraRV8UpI7U82Tu1Z9O5/bHePpMpYfZRF1yBAYYZj28A1XI+oItd4qLTdTTXpq6D
 YN7yNF6q2W1ZTgIOUUQEAk2bTkLPPA9b5UjdDcSJgcOJFIDsre/cu9FAOSUUfnf6brJaK4SLR
 yu/Q6oxUEKuNrjg68ZWQKeTClHYX2+BbfZGqFUSdvlbTOWZbQw9s0jRF5ENckp1zwrqqiv9Tz
 oqnrclWPcy1kNhBanue7hHzXs2gaJI8lUmPoczmRe81MNVei2GjWHr8F0eciXsQmKyN7eFRin
 fioKWt/s4sAAl4qOzSbZtGCg987eaRqEbOnRefEo6jF4o0HfaU9knh6iBFng1r8WQ6bbGgKey
 fbBombimekyD4cPef7xbAc4JWSEL9irKuzIhVQmG7meXd+/07Ib2nPmu1NXNsLkCovj3VxvhO
 408m1cekIFZ81ZjTrU00i5GTWhjpkIVrEHdf3G83uX582Q5y5f5yBNiFt04NWwv6yTR8NlbRZ
 NaPOVp8P9NmjwZWx3Bj7sE4ejSEGsqRWKUHxVHgDnJSqpyKW+4vfe2UQ73+QWGMGOjr+rI5Re
 92xik3YYztKO8s1CqznYPwAfvscXA+25eekCi356utVnH18SoSAgsrkoS0LUu+BlMm+7x3r4Q
 BHNAkq1AnrGaeqxpl6GTpZdTrCTr73e9nxG2xu5Qo2dVPzqSaKxNjG4kn8h3A9y6TuICgFtrU
 Fs5RznH8eq/FTdtRLxcs6eKVbYYRgFM7rc+Bgvt7bvK/ahov7c9pac9XgCDg97hotz1mUVT
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
X-List-Received-Date: Mon, 09 Mar 2020 15:10:32 -0000

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Reduce a bit the memory footprint by making the helper_opts[]
array const.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Greg Kurz <groug@kaod.org>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Message-Id: <20200305010446.17029-4-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 fsdev/virtfs-proxy-helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fsdev/virtfs-proxy-helper.c b/fsdev/virtfs-proxy-helper.c
index aa1ab2590d42..de061a8a0eaa 100644
--- a/fsdev/virtfs-proxy-helper.c
+++ b/fsdev/virtfs-proxy-helper.c
@@ -43,7 +43,7 @@
 #define BTRFS_SUPER_MAGIC 0x9123683E
 #endif
 
-static struct option helper_opts[] = {
+static const struct option helper_opts[] = {
     {"fd", required_argument, NULL, 'f'},
     {"path", required_argument, NULL, 'p'},
     {"nodaemon", no_argument, NULL, 'n'},
-- 
2.24.1


