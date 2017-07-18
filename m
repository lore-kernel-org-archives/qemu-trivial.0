Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dXLsL-0001Wo-S3
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jul 2017 02:20:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60009)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXLsI-0001TZ-3i
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 02:20:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXLsH-0000Yc-A4
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 02:20:50 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:34588)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXLsH-0000YS-5E; Tue, 18 Jul 2017 02:20:49 -0400
Received: by mail-qk0-x244.google.com with SMTP id q66so1365206qki.1;
	Mon, 17 Jul 2017 23:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=7B39WQ+TvM/ry1EkUBHK/h3PrxOc9JvrbjPbC3bqJi8=;
	b=B/j7eh2c40HhiviEiHH+Ol0NLaCUVhZwv6OfV5GKBvU7PdLpI5j0unwZWKKqduNSP2
	TyOBT7B9I68520GzPwaRJ9DOQyA3f0QG5sRaozGgtX700L0tMVXYNrAQ/dsjewRp9Bm5
	O0WtCL9n69JNwjOL3HTUfpAZ0esERrmc0mYzj7QLGk+vcqxS46HzPRdHOFrHx+yPn3nY
	xMBCbaYoJAIfwwS5uXxLuYL2FGoANpATSsvEoMJp+JTrG6FwoBxapk1yzahgsLzsY6wX
	dzVRoh5Lr7iBaZjYwa5vtxRXt3Ts2X206QVT39pa8ABV2mM4e2kozGsN1JCazsZ0FJNN
	N8pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=7B39WQ+TvM/ry1EkUBHK/h3PrxOc9JvrbjPbC3bqJi8=;
	b=MVqzX9XCQivCkxT4HT+hNWbky4FSM0FlagALdFRIslmlgCAcO4ddAdlTa5u6vxt02R
	kcE5NGo832RLc3oeTEw5bYu1oySTKFxlADEvCTGj5jbfrdoNckjy3h4gRmiLe8KMQ0uz
	3bY1OOc0bnixJkRIV0v4eJ9zUqgOm2pRrhio4JV0dlHRcLWo27fRUHDCNe+Lki7ZqfW7
	Mw3nADJXzifjlAGCQp8RwjbbFbrn/tqevDUa5v9r7Ma6TkJOQv4dn12EzIhh/7pYVz76
	UiBPEQHKRj3HoPn9Sacrj3oz9WpkxkkeG1Vjcm3swDCafsMRkvPw56wMDyt7rQbIxBLx
	2aKw==
X-Gm-Message-State: AIVw1119VjRyjm+LhJdVXSCU0Py2MD7XQD0bTFtoJd5prTVaomp+5Bij
	zO+k/d9CYLpxkO+JJqqhXw==
X-Received: by 10.55.33.195 with SMTP id f64mr82663qki.208.1500358848306;
	Mon, 17 Jul 2017 23:20:48 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	l31sm1099862qtc.64.2017.07.17.23.20.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Jul 2017 23:20:47 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	"Alastair D'Silva" <alastair@d-silva.org>,
	Corey Minyard <cminyard@mvista.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>
Date: Tue, 18 Jul 2017 03:09:43 -0300
Message-Id: <20170718061005.29518-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170718061005.29518-1-f4bug@amsat.org>
References: <20170718061005.29518-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-trivial] [PATCH 07/29] ds1338: use QEMU_IS_ALIGNED macro
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
X-List-Received-Date: Tue, 18 Jul 2017 06:20:51 -0000

Applied using the Coccinelle semantic patch scripts/coccinelle/use_osdep.cocci

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/timer/ds1338.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/timer/ds1338.c b/hw/timer/ds1338.c
index 3849b74a68..a77fe14514 100644
--- a/hw/timer/ds1338.c
+++ b/hw/timer/ds1338.c
@@ -65,7 +65,7 @@ static void capture_current_time(DS1338State *s)
     s->nvram[1] = to_bcd(now.tm_min);
     if (s->nvram[2] & HOURS_12) {
         int tmp = now.tm_hour;
-        if (tmp % 12 == 0) {
+        if (QEMU_IS_ALIGNED(tmp, 12)) {
             tmp += 12;
         }
         if (tmp <= 12) {
@@ -154,7 +154,7 @@ static int ds1338_send(I2CSlave *i2c, uint8_t data)
                 if (data & HOURS_PM) {
                     tmp += 12;
                 }
-                if (tmp % 12 == 0) {
+                if (QEMU_IS_ALIGNED(tmp, 12)) {
                     tmp -= 12;
                 }
                 now.tm_hour = tmp;
-- 
2.13.2


