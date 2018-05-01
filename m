Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fDVlP-0003Xm-Qj
	for mharc-qemu-trivial@gnu.org; Tue, 01 May 2018 09:56:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44004)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1fDVlI-0003Pk-1V
	for qemu-trivial@nongnu.org; Tue, 01 May 2018 09:56:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1fDVlH-000809-9l
	for qemu-trivial@nongnu.org; Tue, 01 May 2018 09:56:08 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:49753)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1fDVlB-0007rm-H6; Tue, 01 May 2018 09:56:01 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue007 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 0M4xAo-1eQd8K2XUc-00zClH; Tue, 01 May 2018 15:55:58 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
	Thomas Huth <huth@tuxfamily.org>, Michael Tokarev <mjt@tls.msk.ru>
Date: Tue,  1 May 2018 15:55:45 +0200
Message-Id: <20180501135547.12414-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180501135547.12414-1-laurent@vivier.eu>
References: <20180501135547.12414-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:j/Sd1/FD9uBCgXdXTyGq6NqMmPYgTbg/KDZ6ipzsMfX3UHt4tzu
	hIg5E+LcZyeH6PPnYmzuz3WKf394WEHjRbPSSBsgra+yvYSUMxiKrta46Tj31jN1EuVY+RH
	zsISDoVbMWM1AWXwISnrJOPrSsy8/st1ikr2doKa1J0KOa+Q9m62cA9y9MMd4IT1YD6ojab
	dN8YiQg5j4+U6xsPFdGmg==
X-UI-Out-Filterresults: notjunk:1;V01:K0:6bEtE0BG+7E=:1FX+9lSQPpDs1d+OgzNRsX
	SQRIO9ZgXLfkJ93BtA9xWWEBoyvtp6amKrJBELm1oP9sm1LdwWO2VaXlo/2zR3Dg9j6juckB6
	BHEQsOMKnT2LdsfcUYVVhqMCwod3KWq5t8mHTrIC+unlaixHH28/162e4V0dIPYuAA2TGm1Oe
	3rZe0Vl0KRU5sCntEPJMnAcKpVMY2fy1MuwTvZ/gqSuvSk1f0+oKsfUuo+yvTxEyr37r+YojH
	OgL9T8YPMORmAtBgPhjyRHAhlgbCEyuy1IUbET7S8w7z1W3gOMvQrf0yzKqH7EJKIpe5WaVeS
	yZ3qbAHFRCE7OH5IgR7KMOXES2ZQwZBmZ4X0SvstWbvrsQujjYq6nBG3pfajYiDrue9L61vmS
	Z+f+hC64eaK5PG+KnG77BvsMzlcdX6BzkAIaVc0E63Hlx23J+NtP9lxlKJ0CQtrFwR3ZtpWfJ
	/AeQ2YV4wLS7Lcz6Ke4Hx4+/nkInJtUQpbir7moEtsAjm1QZmf3tcMNiB0d6e0ksns49EpRgg
	BAXt10Xj4MnVYR1afT9gc6tcGzZVW7ElwK26jZ6bfyczLDuJLE/iUQaipdra+0/zt9eytq4JN
	AE0CBjCrOInKdejT4cWnYvMeYdETeZ+eb8K7BZinHP8KF1XgONmGFIOAHPECOChrKoiAE5/8l
	bL75rVlS4FZdz4G69YPDooL2yTWBQix7Zbm77BTyAyjHJd/SI5UhRMvCZ0hxAvDmTPnhUTFQp
	k5K88YhuYouUP0YL
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 212.227.126.130
Subject: [Qemu-trivial] [PULL 2/4] m68k: Fix floatx80_lognp1 (Coverity
 CID1390587)
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
X-List-Received-Date: Tue, 01 May 2018 13:56:09 -0000

return the result of packFloatx80() instead of
dropping it.

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20180430170156.1860-1-laurent@vivier.eu>
---
 target/m68k/softfloat.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/m68k/softfloat.c b/target/m68k/softfloat.c
index dffb371c71..2c069a5efb 100644
--- a/target/m68k/softfloat.c
+++ b/target/m68k/softfloat.c
@@ -334,7 +334,8 @@ floatx80 floatx80_lognp1(floatx80 a, float_status *status)
     if (aSign && aExp >= one_exp) {
         if (aExp == one_exp && aSig == one_sig) {
             float_raise(float_flag_divbyzero, status);
-            packFloatx80(aSign, floatx80_infinity.high, floatx80_infinity.low);
+            return packFloatx80(aSign, floatx80_infinity.high,
+                                floatx80_infinity.low);
         }
         float_raise(float_flag_invalid, status);
         return floatx80_default_nan(status);
-- 
2.14.3


