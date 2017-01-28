Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cXOU9-0004wC-Fp
	for mharc-qemu-trivial@gnu.org; Sat, 28 Jan 2017 03:35:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56368)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1cXOU4-0004ut-UR
	for qemu-trivial@nongnu.org; Sat, 28 Jan 2017 03:35:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1cXOTo-0004ZZ-Dh
	for qemu-trivial@nongnu.org; Sat, 28 Jan 2017 03:35:44 -0500
Received: from mail.weilnetz.de ([37.221.199.173]:59402)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1cXOTM-0004RU-NZ; Sat, 28 Jan 2017 03:35:00 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by mail.weilnetz.de (Postfix) with ESMTP id B331B11810AB;
	Sat, 28 Jan 2017 09:34:57 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from mail.weilnetz.de ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id gDpd8Z4dncOW; Sat, 28 Jan 2017 09:34:55 +0100 (CET)
Received: from edv32.bib.uni-mannheim.de (p54AC8942.dip0.t-ipconnect.de
	[84.172.137.66])
	by mail.weilnetz.de (Postfix) with ESMTPSA id 9727311810A6;
	Sat, 28 Jan 2017 09:34:55 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: Richard Henderson <rth@twiddle.net>, Alexander Graf <agraf@suse.de>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <af0a08ab-0d3d-3bc3-2f2f-6f5a25fa07df@weilnetz.de>
Date: Sat, 28 Jan 2017 09:34:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 37.221.199.173
Subject: [Qemu-trivial] [PATCH] target/s390x: Fix typo
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
X-List-Received-Date: Sat, 28 Jan 2017 08:35:48 -0000

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
  target/s390x/cpu_models.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
index 5b66d33..2a894ee 100644
--- a/target/s390x/cpu_models.c
+++ b/target/s390x/cpu_models.c
@@ -671,7 +671,7 @@ static S390CPUModel *get_max_cpu_model(Error **errp)
      if (kvm_enabled()) {
          kvm_s390_get_host_cpu_model(&max_model, errp);
      } else {
-        /* TCG enulates a z900 */
+        /* TCG emulates a z900 */
          max_model.def = &s390_cpu_defs[0];
          bitmap_copy(max_model.features, max_model.def->default_feat,
                      S390_FEAT_MAX);
-- 
2.1.4


