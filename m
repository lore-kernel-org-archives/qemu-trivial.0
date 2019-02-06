Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1grP8B-0000Iz-3E
	for mharc-qemu-trivial@gnu.org; Wed, 06 Feb 2019 10:28:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55977)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1grP87-0000Dv-Ld
	for qemu-trivial@nongnu.org; Wed, 06 Feb 2019 10:28:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1grP84-0004Sb-1k
	for qemu-trivial@nongnu.org; Wed, 06 Feb 2019 10:28:49 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:52543)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1grP7k-0004L1-T9; Wed, 06 Feb 2019 10:28:30 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1N49Yn-1hHpwG3hQ1-0101Hh; Wed, 06 Feb 2019 16:28:18 +0100
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
	Richard Henderson <richard.henderson@linaro.org>
Date: Wed,  6 Feb 2019 16:28:02 +0100
Message-Id: <20190206152807.31896-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190206152807.31896-1-laurent@vivier.eu>
References: <20190206152807.31896-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:50GsQBkRs00UIdjKznqXiDUEnSYc3iLcB1QYRVJJtiPsDy0LKGi
	W6NqyJRP/m7xfmm3M/+Meig9bn/JJqJyJ0Yn8kloK4ahy1hUJgtWq3/KGX04DO/LZcoJkGa
	06uVe1j7USFPDszs79WjohXWU5daUAkK0tNKTL1pAqYDg/AbCpHuwNjKVu5eKMVXdb99Tkh
	u1lurMbwWV+Shs05xQ21g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:2oBQh1yUJ3I=:0Tk4D5/7ClhGCJ1fQX8Ebk
	+3Bd0rgm7iHGI6ANmF0X1kkIurdI1wkN6QFQoGepjwFztcdba1Yy5S4E2eEVXaQbZ7EXe1LTj
	cv0bmdan0R5nR/rSc9GzCAnll4KbHVkTGn5WgPNrXS+SwhjLrD2US6547IEsLi6nCVuiMbp4x
	F4tuwR2i1ZpFV+qZ65RGZlYJh9hhlGskIN1OEABdIL7edu7eMmGW2lU1hJcNLv+QGC86VIEQF
	+hH/AWYF2WXSxwBNxJR1a4//vS4UJDverlJti6p7yvZw6eJeZmvQ8HhF5DQRW7J1425yPOWpH
	a0rTFJO2Q+hHyOXQvPXrZlXsIJZEq7et6ASBs3CLhWiFVYmhPkpPEu/ZB++h9qvY/DZlxsM4H
	4dfrjJ4N5BM7qVIHehxffzxYvqqJ4151mwwsHWVg0QYfu2HpWhJDss7gzOti712zixUyZTveP
	8e/g76YQg5taWIh0MTeclOcGfWG1WGJ8/PPw9Y6+/pEt4gOtoAq5ScyK62m3KMamyBP5hPURF
	lmzJ8g2RHd2757lDDzQ8jH5AwjI1EJ1yxtaYyonJwOhgap1Uy3U15chK/7aA5qbwA5iC+wrGR
	g27N4fNydiiU77PbJioFmRMrkCOdrjV/2ZByZ5VzZctlCKBG37RA9SGYSZqSZgPd3Yn7/uiPs
	dF/GAaTz6+Qr1auiLyCDjNcX9R8jCZhmgAEzsYsXgT3I9TPCeCqTSffl1TheL89rCUqkAtfAw
	p8vJdxxRkDw0pj0GxH0Hb8ulUPq/D7Ie4HYafA==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.133
Subject: [Qemu-trivial] [PULL 2/7] target/moxie: Fix LGPL information in the
 file headers
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
X-List-Received-Date: Wed, 06 Feb 2019 15:28:53 -0000

From: Thomas Huth <thuth@redhat.com>

It's either "GNU *Library* General Public License version 2" or "GNU
Lesser General Public License version *2.1*", but there was no "version
2.0" of the "Lesser" license. So assume that version 2.1 is meant here.
Also the files mentioned the GPL instead of the LGPL after declaring
that the files are licensed under the LGPL, so change these spots to
use LGPL, too.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <1549266858-5043-1-git-send-email-thuth@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/moxie/cpu.c       | 2 +-
 target/moxie/cpu.h       | 4 ++--
 target/moxie/helper.c    | 4 ++--
 target/moxie/mmu.c       | 4 ++--
 target/moxie/translate.c | 4 ++--
 5 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/target/moxie/cpu.c b/target/moxie/cpu.c
index 8d67eb6727..46434e65ba 100644
--- a/target/moxie/cpu.c
+++ b/target/moxie/cpu.c
@@ -13,7 +13,7 @@
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
  * Lesser General Public License for more details.
  *
- * You should have received a copy of the GNU General Public License
+ * You should have received a copy of the GNU Lesser General Public License
  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
diff --git a/target/moxie/cpu.h b/target/moxie/cpu.h
index d40f1e6c45..080df4ee6f 100644
--- a/target/moxie/cpu.h
+++ b/target/moxie/cpu.h
@@ -6,14 +6,14 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
  * Lesser General Public License for more details.
  *
- * You should have received a copy of the GNU General Public License
+ * You should have received a copy of the GNU Lesser General Public License
  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
diff --git a/target/moxie/helper.c b/target/moxie/helper.c
index 5b1532b837..f3d8ee7d6b 100644
--- a/target/moxie/helper.c
+++ b/target/moxie/helper.c
@@ -6,14 +6,14 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
  * Lesser General Public License for more details.
  *
- * You should have received a copy of the GNU General Public License
+ * You should have received a copy of the GNU Lesser General Public License
  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
diff --git a/target/moxie/mmu.c b/target/moxie/mmu.c
index bd90b1eebc..87783a36f8 100644
--- a/target/moxie/mmu.c
+++ b/target/moxie/mmu.c
@@ -6,14 +6,14 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
  * Lesser General Public License for more details.
  *
- * You should have received a copy of the GNU General Public License
+ * You should have received a copy of the GNU Lesser General Public License
  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
diff --git a/target/moxie/translate.c b/target/moxie/translate.c
index 29da02bc05..68ca223e22 100644
--- a/target/moxie/translate.c
+++ b/target/moxie/translate.c
@@ -5,7 +5,7 @@
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public License
- * as published by the Free Software Foundation; either version 2 of
+ * as published by the Free Software Foundation; either version 2.1 of
  * the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful, but
@@ -13,7 +13,7 @@
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
  * Lesser General Public License for more details.
  *
- * You should have received a copy of the GNU General Public License
+ * You should have received a copy of the GNU Lesser General Public License
  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
-- 
2.20.1


