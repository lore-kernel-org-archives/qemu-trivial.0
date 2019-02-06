Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1grP8F-0000W8-TF
	for mharc-qemu-trivial@gnu.org; Wed, 06 Feb 2019 10:28:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56037)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1grP8A-0000Id-RU
	for qemu-trivial@nongnu.org; Wed, 06 Feb 2019 10:28:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1grP88-0004WY-Bf
	for qemu-trivial@nongnu.org; Wed, 06 Feb 2019 10:28:54 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:39701)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1grP7w-0004Mn-5i; Wed, 06 Feb 2019 10:28:42 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MGQaz-1guuhR0FnZ-00GroH; Wed, 06 Feb 2019 16:28:24 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Eduardo Habkost <ehabkost@redhat.com>,
	qemu-trivial@nongnu.org, Anthony Green <green@moxielogic.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
	Andrzej Zaborowski <balrogg@gmail.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
	Michael Tokarev <mjt@tls.msk.ru>, Peter Maydell <peter.maydell@linaro.org>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Luc Michel <luc.michel@greensocs.com>,
	Alistair Francis <alistair.francis@wdc.com>
Date: Wed,  6 Feb 2019 16:28:06 +0100
Message-Id: <20190206152807.31896-7-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190206152807.31896-1-laurent@vivier.eu>
References: <20190206152807.31896-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:iH7TvnHM38z1/6cxlo1cF6tH0prcGWKywSJfD6wk1p6glvnKHGo
	+f41ev8cv64xgJLwtLFO3TLWh4Wf9XJnFZJV2JsUPwnAgO7e/FXcB1U5sH8JuMnQ6OqR6Vx
	4BBAxGLBeEQ26ZG5ly50DvbdQP0hu9ukvJx4PJMBiEAOhp23Kz4z2tE7bSuVzETs8s13WZO
	E9Nu7k3xIawLVYOLvfQyA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:wS66bhI8fKI=:hpycvEs1pT+hfG2C6EnRXG
	YuXez5QyOm8WVGa8+ub9Kv17A0SQJbeMqkzgvqKkq9ICSdN47t5HweOr+YtJl8vzw6R7EJ/P+
	qyd91ZBlbcZMqUE/tI1ytk2ib9GWCQUiPNLnDGN41GximCxwANRIlab59aUSWNRzqx9D3powh
	WNmDqr9G2A2QFfhpilU4D8gd6mNxKvuC24hmJRvKdNsq7QWG4/wtZ2jwigb6e+F8zQWrtz3Li
	MdeXISdJerTqYxcpSH82wFro3EMMbnE3i5hvLjegz2wQJFS1P8s9q1mQD9NQTcM58W4R3/iIY
	j0oMcn3fa/LJSizR6QFJxYztbpHjdpm6JGB3hBXwqXeQa6X76AMxTKkIUTkRPZCjUHGbBTZ3V
	FfAw3nnIs+MA66pqps0OOKN4ppOWMJtA1jUYK7FBxgjQ3EFXxpeM8tOnwEqAgAWYPfphQnA8L
	oGwTE9gAg0ZqszaLSfZX3tp0PZidBNDEYXIbLdCjIXcZPLiYyKFWQBt8GGUW8qEQF4cjs7j4S
	EE6xEmqrikwqM3hqHMM/YnIR62TbgIlSBuWxnJfhyHOTV2DH5CFhNfbTririLFL50hxrBxlaA
	Q0zhrRnERz8h7UA8Dc9P70Sd0bW4hVdMhUYMyAjW+Tvb13i568T1CbEPh1MhPxV1ehbBhovrW
	ivqMLqi36RxhQpHT5TxTHqe3PCw75k4coo6s0OTURLyhMEUBYTo+ALQ9cZ3KeLKl8mB5DwMI8
	Kc6ntktSLKZsF2a06X2z2+cwEaa0VqHn2VTm3tchOCe3b4CNtPvzxx44VwE=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.133
Subject: [Qemu-trivial] [PULL 6/7] hw/cpu/cluster: Mark the cpu-cluster
 device with user_creatable = false
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
X-List-Received-Date: Wed, 06 Feb 2019 15:28:55 -0000

From: Thomas Huth <thuth@redhat.com>

The device can not be instantiated by the user and QEMU currently
aborts when you try to use it:

$ x86_64-softmmu/qemu-system-x86_64 -device cpu-cluster
qemu-system-x86_64: hw/cpu/cluster.c:73: cpu_cluster_realize:
 Assertion `cbdata.cpu_count > 0' failed.
Aborted (core dumped)

Since this is an internal device only, mark it with user_creatable = false.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Luc Michel <luc.michel@greensocs.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <1549371525-29899-1-git-send-email-thuth@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/cpu/cluster.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/cpu/cluster.c b/hw/cpu/cluster.c
index 25f90702b1..6f5f037b3c 100644
--- a/hw/cpu/cluster.c
+++ b/hw/cpu/cluster.c
@@ -79,6 +79,9 @@ static void cpu_cluster_class_init(ObjectClass *klass, void *data)
 
     dc->props = cpu_cluster_properties;
     dc->realize = cpu_cluster_realize;
+
+    /* This is not directly for users, CPU children must be attached by code */
+    dc->user_creatable = false;
 }
 
 static const TypeInfo cpu_cluster_type_info = {
-- 
2.20.1


