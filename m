Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e55bK-0002wx-S8
	for mharc-qemu-trivial@gnu.org; Thu, 19 Oct 2017 03:50:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41330)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rjones@redhat.com>) id 1e55bF-0002sf-K2
	for qemu-trivial@nongnu.org; Thu, 19 Oct 2017 03:50:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rjones@redhat.com>) id 1e55bE-0000mO-SC
	for qemu-trivial@nongnu.org; Thu, 19 Oct 2017 03:50:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39616)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <rjones@redhat.com>)
	id 1e55bA-0000ji-Go; Thu, 19 Oct 2017 03:50:36 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5F8D23E2CE;
	Thu, 19 Oct 2017 07:50:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 5F8D23E2CE
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=rjones@redhat.com
Received: from trick.home.annexia.org (ovpn-117-40.ams2.redhat.com
	[10.36.117.40])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 164119D97D;
	Thu, 19 Oct 2017 07:50:33 +0000 (UTC)
From: "Richard W.M. Jones" <rjones@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, amarnath.valluri@intel.com, pbonzini@redhat.com,
	marcandre.lureau@gmail.com, stefanb@linux.vnet.ibm.com
Date: Thu, 19 Oct 2017 08:50:31 +0100
Message-Id: <20171019075031.25507-1-rjones@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Thu, 19 Oct 2017 07:50:35 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] tpm: Don't call tpm_cleanup unless
 CONFIG_TPM.
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
X-List-Received-Date: Thu, 19 Oct 2017 07:50:45 -0000

When compiling with --disable-tpm:

  ../vl.o: In function `main':
  /home/rjones/d/qemu/vl.c:4908: undefined reference to `tpm_cleanup'

This appears to have been introduced in commit c37cacabf228
("tpm: Move tpm_cleanup() to right place").

Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
---
 vl.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/vl.c b/vl.c
index 0723835bbf..dbfd06d4bc 100644
--- a/vl.c
+++ b/vl.c
@@ -4905,7 +4905,9 @@ int main(int argc, char **argv, char **envp)
     res_free();
 
     /* vhost-user must be cleaned up before chardevs.  */
+#ifdef CONFIG_TPM
     tpm_cleanup();
+#endif
     net_cleanup();
     audio_cleanup();
     monitor_cleanup();
-- 
2.13.1


