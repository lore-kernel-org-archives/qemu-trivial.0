Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bpsTS-0004MQ-Af
	for mharc-qemu-trivial@gnu.org; Fri, 30 Sep 2016 03:43:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38897)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <j.neuschaefer@gmx.net>) id 1bplKF-0001v8-NW
	for qemu-trivial@nongnu.org; Thu, 29 Sep 2016 20:05:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <j.neuschaefer@gmx.net>) id 1bplKA-00071U-J7
	for qemu-trivial@nongnu.org; Thu, 29 Sep 2016 20:05:15 -0400
Received: from mout.gmx.net ([212.227.17.21]:52064)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <j.neuschaefer@gmx.net>)
	id 1bplKA-00070h-6z; Thu, 29 Sep 2016 20:05:10 -0400
Received: from localhost.localdomain ([88.153.7.52]) by mail.gmx.com
	(mrgmx102) with ESMTPSA (Nemesis) id 0MIPhr-1bmjBl2Whr-0049vF;
	Fri, 30 Sep 2016 02:05:07 +0200
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Date: Fri, 30 Sep 2016 02:04:28 +0200
Message-Id: <20160930000428.22382-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20160929233847.n5xe7gmdb5ys5ujv@latitude>
References: <20160929233847.n5xe7gmdb5ys5ujv@latitude>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K0:2tWbQPBDDHwTWgq+0mcNyN3OGW2bWEsabClttYdbO+7yN4GQG6K
	4opWPJfIIaPZrV7Ies+qHAhfcYh17r/Hb+haqfvZrwPesrWXsOJK9FtSzll9W9iBpcvCVAv
	1iHscRlyA08B6UgckXd/0ZD1ZL08O+j4eTUD8RAH5rqpKd3PdCQSffRs0gAgFQMXl1EaNCl
	HLAiSf/7Qatm3fdXJtqsg==
X-UI-Out-Filterresults: notjunk:1;V01:K0:lIsZ8QfnuC0=:1hdeZLFcSUbrM7uR9QwTTm
	iNE/z/iUW1kqwWi3jGHc6wtK8j+kQs39nNUe6BfVESQfYbMArOT29HcX/Fk9PVRBuqYKTvN2R
	CkrCqljqQsh4XaYf09hhLdATEha7pyRelmWVlZGipfS9kSE4mlGN/W5+wSfMValrIJrqlW/Y3
	EeYzYk8lWi632x1byfPEjC++pQVo5lwY8xkr15HB1pxrxEGaLEcl5ritClTGwbAT58+zZYmi4
	kR/LXy5Zn/STM6snexMms4oBQHNlCdesHptGF8mxcArNG1U7BcWUVWVA4oEoTiXrMb6rlYGXq
	cfw9hjsIVR1Pc08WNmxj6hAuJV/SN3G1lbXnF75C6TgoPgCKTGr71iN3Ry5pJyRl7L44zLxBP
	FqbSO4xwEude/rsSo9CbeZ/m4KQ3AeH6YbU8B7yblGlut5MTWiEuQ7TeDr8lN12NiisUqdV/U
	wNOjRhB+HJLgZs62Fp4PEKjqRD4SE5ucXy6xQIki7EtXQwCHdfc91ZAbWRIL2E85dh1eWxCwR
	2X63rJF4nffUSsYOoqAQyDNO/Hkfq+O5fvawnsKggSZAGMqoKxxtR47jlFB0b/9+sALyzmU3w
	f5uAGw5irGGLpNsKZ7ekbIvZlpIQHCEr8Fz0ifjLJ0sk3mX45Gf3Mi3wNKMOn5ALz8kxy474X
	+2QCHmGD5F+BOsrbJzOCvDBRjrD9skj28+AU4svUPp3Vw8vG5XyUr5NoTRxYXAMSkJ76UX8sO
	sMrbY7jCshQD0shVbsIpegIfP8iGcz4S7mfVxX7FTJisl4p/8kl2lWWzS2DDUPPHHtIjSXrHr
	uvxHWoW
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.21
X-Mailman-Approved-At: Fri, 30 Sep 2016 03:43:13 -0400
Subject: [Qemu-trivial] [PATCH v2] CODING_STYLE: Fix a typo ("have" vs.
 "has")
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
X-List-Received-Date: Fri, 30 Sep 2016 00:05:16 -0000

Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>

---
v2:
- Preserve the poetic sound of "Many a flamewar", which Peter Maydell
  pointed out.
---
 CODING_STYLE | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/CODING_STYLE b/CODING_STYLE
index e7fde15..f53180b 100644
--- a/CODING_STYLE
+++ b/CODING_STYLE
@@ -9,7 +9,7 @@ patches before submitting.
 Of course, the most important aspect in any coding style is whitespace.
 Crusty old coders who have trouble spotting the glasses on their noses
 can tell the difference between a tab and eight spaces from a distance
-of approximately fifteen parsecs.  Many a flamewar have been fought and
+of approximately fifteen parsecs.  Many a flamewar has been fought and
 lost on this issue.
 
 QEMU indents are four spaces.  Tabs are never used, except in Makefiles
-- 
2.9.3


