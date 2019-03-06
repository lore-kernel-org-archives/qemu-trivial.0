Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h1UPY-0005D3-N9
	for mharc-qemu-trivial@gnu.org; Wed, 06 Mar 2019 06:08:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35527)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1h1UPV-000566-8Z
	for qemu-trivial@nongnu.org; Wed, 06 Mar 2019 06:08:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1h1UPU-0002L3-Ek
	for qemu-trivial@nongnu.org; Wed, 06 Mar 2019 06:08:29 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:44943)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1h1UP7-00025X-23; Wed, 06 Mar 2019 06:08:05 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA
	(Nemesis)
	id 1N2E9Y-1h6Kgw3aIQ-013fhD; Wed, 06 Mar 2019 12:07:37 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
	Zhang Chen <zhangckid@gmail.com>,
	zhanghailiang <zhang.zhanghailiang@huawei.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Cornelia Huck <cohuck@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
	Richard Henderson <rth@twiddle.net>, Thomas Huth <thuth@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, Li Zhijian <lizhijian@cn.fujitsu.com>,
	John Snow <jsnow@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Laurent Vivier <laurent@vivier.eu>, Eduardo Habkost <ehabkost@redhat.com>,
	qemu-block@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Tony Krowiak <akrowiak@linux.ibm.com>, Max Reitz <mreitz@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	Laurent Vivier <lvivier@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-s390x@nongnu.org, Corey Minyard <minyard@acm.org>,
	Pierre Morel <pmorel@linux.ibm.com>, Greg Kurz <groug@kaod.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Date: Wed,  6 Mar 2019 12:07:08 +0100
Message-Id: <20190306110711.309-8-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190306110711.309-1-laurent@vivier.eu>
References: <20190306110711.309-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:iy9Fh4p9H/qBwx7KAA3FjBD/7mcP34RChIlch90zwVuNjpMHBiR
	VpyRCXmdKUUhW8/x4XWCFI5DVMeTKyM76C+5ut5aCOsSsQRXM2i2AH0BL3JTsVmlDp/976a
	iy85M1UuDtWYgmq8NwzYvUVYm/q8MKpEYuMey095OFgAikjulSvrk1ejgWp0dW3YuZn9VN+
	ZDdZ9hHXKcvkGotEiXJGw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:zkhO5HToiJE=:htkmcj3pW7ulyvj2jdrrV6
	FJW28DBRH2+ifVJKKz/wBolclcr0OSCbJ0BjAhY9N1ucSH0+grPm9VXAg4Wkzmz+IVmHnRsLF
	dFxXn4IsRHgnCqJC4GrAlLxWl7zPb2BTsw8iKID2bjwpIDlNSWJv04fujrus3NCcCKT6+zmyg
	A4jYNlsL7pBHkVOyW7siCsgFbewX19hOHM0ECyEKldUrLIEejhG7rnajGZDRc9dWuHdQNGWlf
	so4NiAd0niVpCAtqjxfrl2p+6uT+QDbp8kUJ7d8TEoRdtYYJkKLTWYrt7JqV+XbVJpYLEbKh0
	G4DnAfX7wAg5keBJ5gg+erakooBV+83OP2aKYdYx7bPVNdubVKyHt1sPNIvzqjs2dPr6ZDscJ
	LzESynRko1Fv0Of/OIP65IKo9fChFfIGRGMMTvc8G+Ch87ySSnWlszQYboOzBHarLKQ4sxbwN
	wU8HOn19h9y4FhkHzs5u+NpQBFf0ampLz7imaUQtIIGn23U8QG12GZ/2S2d0adGdLioks2Q2n
	k36PFt41NBh/YLjKKBGNlQVZG0o+bRxhnfhv34+a/48bX9ongLuxE8Dyo7/yfRsI/5WtFWY2v
	V/ePs463vZKKwr+Ewfy3zmr+rTpn/oaxB12+s0ZXYExRMVIrYuutYs/llgZhwHfF2jXgbnwQ5
	WKjXFDev+7QUQfwS8ci7Dt9NFlPRYXHSBRuqX3LUwgwf5ZoEKNcd+xmDHgV+UUBUGFJ/f1y1K
	7zI38N0ElM5H75NtVYBpGyY+n+zmCvu7Rx/1XqNUHNyB9CySyuXS4Xt3snY=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.10
Subject: [Qemu-trivial] [PULL 07/10] bswap: Fix accessors syntax in comment
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
X-List-Received-Date: Wed, 06 Mar 2019 11:08:30 -0000

From: Greg Kurz <groug@kaod.org>

All accessors that have an endian infix DO have an underscore between
{size} and {endian}.

Signed-off-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <155119086741.1037569.12734854713022304642.stgit@bahia.lan>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 include/qemu/bswap.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/qemu/bswap.h b/include/qemu/bswap.h
index a684c1a7a298..5a70f78c0ba4 100644
--- a/include/qemu/bswap.h
+++ b/include/qemu/bswap.h
@@ -255,9 +255,9 @@ typedef union {
 /*
  * the generic syntax is:
  *
- * load: ld{type}{sign}{size}{endian}_p(ptr)
+ * load: ld{type}{sign}{size}_{endian}_p(ptr)
  *
- * store: st{type}{size}{endian}_p(ptr, val)
+ * store: st{type}{size}_{endian}_p(ptr, val)
  *
  * Note there are small differences with the softmmu access API!
  *
@@ -293,10 +293,10 @@ typedef union {
  *
  * For cases where the size to be used is not fixed at compile time,
  * there are
- *  stn{endian}_p(ptr, sz, val)
+ *  stn_{endian}_p(ptr, sz, val)
  * which stores @val to @ptr as an @endian-order number @sz bytes in size
  * and
- *  ldn{endian}_p(ptr, sz)
+ *  ldn_{endian}_p(ptr, sz)
  * which loads @sz bytes from @ptr as an unsigned @endian-order number
  * and returns it in a uint64_t.
  */
-- 
2.20.1


