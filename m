Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RobDw-0003Iw-5a
	for mharc-qemu-trivial@gnu.org; Sat, 21 Jan 2012 08:43:16 -0500
Received: from eggs.gnu.org ([140.186.70.92]:33081)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>) id 1RobDt-0003Dj-Vx
	for qemu-trivial@nongnu.org; Sat, 21 Jan 2012 08:43:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>) id 1RobDt-0004Y9-8x
	for qemu-trivial@nongnu.org; Sat, 21 Jan 2012 08:43:13 -0500
Received: from fmmailgate01.web.de ([217.72.192.221]:51443)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>)
	id 1RobDq-0004XH-Qk; Sat, 21 Jan 2012 08:43:10 -0500
Received: from moweb002.kundenserver.de (moweb002.kundenserver.de
	[172.19.20.108])
	by fmmailgate01.web.de (Postfix) with ESMTP id F32DC1A976F11;
	Sat, 21 Jan 2012 14:43:08 +0100 (CET)
Received: from mchn199C.mchp.siemens.de ([92.74.55.47]) by smtp.web.de
	(mrweb001) with ESMTPA (Nemesis) id 0MDPYb-1RsEuk3lhl-00HOWV;
	Sat, 21 Jan 2012 14:43:08 +0100
Message-ID: <4F1AC0EB.3050304@web.de>
Date: Sat, 21 Jan 2012 14:43:07 +0100
From: Jan Kiszka <jan.kiszka@web.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de;
	rv:1.8.1.12) Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12
	Mnenhy/0.7.5.666
MIME-Version: 1.0
To: qemu-devel <qemu-devel@nongnu.org>, qemu-trivial <qemu-trivial@nongnu.org>
X-Enigmail-Version: 1.3.4
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-Provags-ID: V02:K0:YD4/kgp9a615zfI2lSUwroHtNHyv44jvyD98UHAzDPK
	1XrQ6qEu4P7tTxLZ1R2nqD+Aaohe232Ng1cV7/YLULZSh448AC
	S/RLD0Yx0IzpvcecIgmDlQeMLYMsFL7e9qSXO6soDLeXLRjQSc
	hLw/HNmer/tA4kDI2fGSztfqujkbNPC8hzy5lEKVtEDEpq/2c7
	ZcKqg0v8Q76SzO2WZPYHQ==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 217.72.192.221
Cc: Markus Armbruster <armbru@redhat.com>
Subject: [Qemu-trivial] [PATCH] qdev-property: Make bit property parsing
	stricter
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 21 Jan 2012 13:43:14 -0000

By using strncasecmp, we allow for arbitrary characters after the
"on"/"off" string. Fix this by switching to strcasecmp.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hw/qdev-properties.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/qdev-properties.c b/hw/qdev-properties.c
index 02f0dae..ea3b2df 100644
--- a/hw/qdev-properties.c
+++ b/hw/qdev-properties.c
@@ -40,9 +40,9 @@ static void qdev_prop_cpy(DeviceState *dev, Property *props, void *src)
 /* Bit */
 static int parse_bit(DeviceState *dev, Property *prop, const char *str)
 {
-    if (!strncasecmp(str, "on", 2))
+    if (!strcasecmp(str, "on"))
         bit_prop_set(dev, prop, true);
-    else if (!strncasecmp(str, "off", 3))
+    else if (!strcasecmp(str, "off"))
         bit_prop_set(dev, prop, false);
     else
         return -EINVAL;
-- 
1.7.3.4

