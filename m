Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d32Q3-00049C-VT
	for mharc-qemu-trivial@gnu.org; Tue, 25 Apr 2017 11:30:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41553)
	by lists.gnu.org with esmtp (Exim 4.71) (envelope-from <n54@gmx.com>)
	id 1d30Tl-00009a-B8
	for qemu-trivial@nongnu.org; Tue, 25 Apr 2017 09:26:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <n54@gmx.com>) id 1d30Tg-0004Vf-Dz
	for qemu-trivial@nongnu.org; Tue, 25 Apr 2017 09:26:05 -0400
Received: from mout.gmx.net ([212.227.15.19]:57283)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <n54@gmx.com>) id 1d30Tf-0004TO-MA
	for qemu-trivial@nongnu.org; Tue, 25 Apr 2017 09:26:00 -0400
Received: from localhost.localdomain ([185.58.161.191]) by mail.gmx.com
	(mrgmx002 [212.227.17.184]) with ESMTPSA (Nemesis) id
	0MTjua-1ccZcq04x6-00QTMz; Tue, 25 Apr 2017 15:25:56 +0200
From: Kamil Rytarowski <n54@gmx.com>
To: qemu-trivial@nongnu.org
Cc: peter.maydell@linaro.org,
	Kamil Rytarowski <n54@gmx.com>
Date: Tue, 25 Apr 2017 15:18:28 +0200
Message-Id: <20170425131828.22480-1-n54@gmx.com>
X-Mailer: git-send-email 2.12.2
X-Provags-ID: V03:K0:MQXTfm7qcFC8wDXFwMysQRdR7S7AOc8hHp+7LiAKRCBD+/ZYAb6
	TFBkb5iQxAUZ8xmMB9xMSFYjB/mnt0LmYBnZvqdoudgiVERjcy3mCMavgkod6yoG1eflgxI
	RyUHOu66y2+RhcJ6i597rCAFcGfGt/u8ExWIyOM2MSSDn7JrI67S1FZnvkypYIZ7SHC+xT4
	9TRHo5LecYwekZNKqkGrA==
X-UI-Out-Filterresults: notjunk:1;V01:K0:fE5eB8OSMG8=:prXlEgig31tyGBQdPfyHM5
	V4G+ec6s+6zzt5vK9VAkpQzXI6LKABj9EOqCWz+87NNqBs3nhbPvbH9aQrLhnfxei7jb7Va6Y
	gZOngZNNx+lXJdv4GRXkyRQuCzXwf8lA4g9P1d5CXCiJLwvHU2El/6mjGEbJjVc8Indbdad7S
	IrjhpGZNUL622shvLXRoYBNr8GPy/FJLsk/jlpnzi991PXTn+LplkOhmXCXHaa1jdvSG9kpjt
	ikTTeD5qHo5eQ5EBdzrR/Bi6ryyNfrge8RhwWkKDUGbyfQlO+5PS00OqqJiYiuaOupP0LEwKs
	w44qb44mKA6GTObdEV/6vC3G/LZrR7MwjGvYSOeDNDsC8OqB677kW52KRTrK2SeRGjCUUNHyJ
	q8i37/x7gy1L7V3/qY872bMp/qsRM1dJuN8xloyfetUQnlLZWBy9ZX3tRglCtIwd4k1bQ3YZl
	uU8jw6/d3hxu2NnuWArYfMg5JSTwQ+rKC9UXSRoINarltcsiaV9u+0sEBTfFgw4TxIRVS1+Y5
	kcE5jABDoF2KZjO2YbTyu/uAaXq5LMj0dHYhEd/M5IIs5+41+RFuBRXTM9cYLk5b7o6dvjveL
	0OOkFE8ZFtn9GjRIcVspptCM7EgirdV7IN8/dWjT0OlsmBd7UPPv+veqZjZlY6TBxbYtkWf+K
	6rsSz7lAWXuAkIlsNcByIvvZN7cDTlxHhGIxQO6EfycYv7S5ViflnQv86F+HydYPpzH+4rVZJ
	lIRXwB0Y5jyMu2WQ3a+aC1hx+T39oylW3mtUUqlb0EQgVVrg2wVggvWWTgw=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 212.227.15.19
X-Mailman-Approved-At: Tue, 25 Apr 2017 11:30:23 -0400
Subject: [Qemu-trivial] [PATCH] scripts/qemu-binfmt-conf.sh: Fix shell
 portability issue
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
X-List-Received-Date: Tue, 25 Apr 2017 13:26:06 -0000

Appease pkgsrc and use portable shell variable comparison.
This switches "==" to "=". It should not be a functional change.

Signed-off-by: Kamil Rytarowski <n54@gmx.com>
---
 scripts/qemu-binfmt-conf.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/qemu-binfmt-conf.sh b/scripts/qemu-binfmt-conf.sh
index 0f1aa63872..8afc3eb5bb 100755
--- a/scripts/qemu-binfmt-conf.sh
+++ b/scripts/qemu-binfmt-conf.sh
@@ -284,12 +284,12 @@ while true ; do
         shift
         # check given cpu is in the supported CPU list
         for cpu in ${qemu_target_list} ; do
-            if [ "$cpu" == "$1" ] ; then
+            if [ "$cpu" = "$1" ] ; then
                 break
             fi
         done
 
-        if [ "$cpu" == "$1" ] ; then
+        if [ "$cpu" = "$1" ] ; then
             qemu_target_list="$1"
         else
             echo "ERROR: unknown CPU \"$1\"" 1>&2
-- 
2.12.2


