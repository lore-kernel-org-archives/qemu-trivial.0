Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gWmPO-0008Ud-LK
	for mharc-qemu-trivial@gnu.org; Tue, 11 Dec 2018 13:05:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43225)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gWmPK-0008LD-G4
	for qemu-trivial@nongnu.org; Tue, 11 Dec 2018 13:05:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gWmPJ-0007fm-OW
	for qemu-trivial@nongnu.org; Tue, 11 Dec 2018 13:05:22 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:33675)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gWmPB-0007SI-22; Tue, 11 Dec 2018 13:05:13 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1N79Ey-1hXCo63jMC-017S89; Tue, 11 Dec 2018 19:04:23 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>, Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
	Paolo Bonzini <pbonzini@redhat.com>, Li Qiang <liq3ea@gmail.com>
Date: Tue, 11 Dec 2018 19:03:48 +0100
Message-Id: <20181211180352.19644-27-laurent@vivier.eu>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181211180352.19644-1-laurent@vivier.eu>
References: <20181211180352.19644-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:TfBc39R1gqgYmeYs60xgxrMx1awgfhcdR6+POxml+lr6Tw3Kyk5
	UKsfusz0MlSlFv4v7Z3mO4Wfd82YApzfE3uLXJyKSblQB7moBvR3vIXbVJCVBUaB4YfnOGt
	0Kk2Kfz59AaMg0Cf4exucqn0DL9aQ4chLt1HvIydg1PdnjXKgH7v/6fMYVCpn8SynoIYRa8
	IY9EqocI9KQJqtmSaLyTA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:grtkNio4TSo=:fuGLZV2bhrkGeLb1NxmVAs
	wIvC0Tll908NqB7INw5bmR28vvyMhHa/CQk4QjzpQmd4Vt+ShcLppeNYT9f9JoQwz5aaADsFf
	SJma9rZRBtUozayPaJS2Jl82zN3ZSXWaR4L2EzSFuy8xZ1CrE1C40UI8nI8GsLLsYqLmOWKal
	9G7sTJYhBTDXrcEcAoXf0tszBgrYELcU1lxGmIkbQ5nTQmk+aJjGZeJzFqDQoKZH6nXgd/sgb
	VOtDG5NrWULZsdKWScd9HegVf5UqR4H5om4tR5k9TJcOi1UCaQPiUMObIyx4dlfkP4I7Euwme
	qE4U41nA0+Ke0fIbw1Jqi9/Vs+STt9GF282oPwLzOlUvFhnRWB32SPwLEYSntfOgNMp7z+0mk
	Iu16G8uc4B/mA+hkk2pfdXS77IGP1FI0udfgYrkAUQVlap1hd+9RMVqNfKr+6JUza6Q6vUxh7
	d/mEiKVlUOtY3PXv8w0L0dQPCgY02JZenG10qRttp5vGZL26eK2RQlloJq3LM6jIrflFDNIaG
	osnhJWR2vGfZWCr24N6xalJ2jpsphZ5aX/meeDDBtAAKBftAVjGm8IdC+C0rA1QgsRt7yw2QL
	wtCKcMylXMEbtAfXIAGMn3uh6vetXOkYBrVxDpijZXez0U453/dhtrJzIrVzJMVtO4UJ3uGv+
	Rnmk9AuwIGiIHmsDneH0FwVLclbd40S56boeFhMGdK1ZJ7ieOgOhH0MDj5+XOGCmh/BUgeNVZ
	1oVUQnSjCJcaHn94Xaqx9ZrgiTBxNKw0sDw7Kjy+v2sVBVEr1CMZCwauYKE=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.134
Subject: [Qemu-trivial] [PULL 26/30] util: vfio-helpers: use ARRAY_SIZE in
 qemu_vfio_init_pci()
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
X-List-Received-Date: Tue, 11 Dec 2018 18:05:23 -0000

From: Li Qiang <liq3ea@gmail.com>

Cc: qemu-trivial@nongnu.org

Signed-off-by: Li Qiang <liq3ea@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <1543571638-2892-1-git-send-email-liq3ea@gmail.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 util/vfio-helpers.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c
index cccc9cd42e..342d4a2285 100644
--- a/util/vfio-helpers.c
+++ b/util/vfio-helpers.c
@@ -348,7 +348,7 @@ static int qemu_vfio_init_pci(QEMUVFIOState *s, const char *device,
         goto fail;
     }
 
-    for (i = 0; i < 6; i++) {
+    for (i = 0; i < ARRAY_SIZE(s->bar_region_info); i++) {
         ret = qemu_vfio_pci_init_bar(s, i, errp);
         if (ret) {
             goto fail;
-- 
2.19.2


