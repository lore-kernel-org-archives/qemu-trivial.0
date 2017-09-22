Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dvWrb-00056v-Ev
	for mharc-qemu-trivial@gnu.org; Fri, 22 Sep 2017 18:56:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41323)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lyan@suse.com>) id 1dvWrZ-000504-1T
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 18:56:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lyan@suse.com>) id 1dvWrY-0006nS-7q
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 18:56:01 -0400
Received: from smtp.nue.novell.com ([195.135.221.5]:46555)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lyan@suse.com>)
	id 1dvWrT-0006hC-Bl; Fri, 22 Sep 2017 18:55:55 -0400
Received: from emea4-mta.ukb.novell.com ([10.120.13.87])
	by smtp.nue.novell.com with ESMTP (TLS encrypted);
	Sat, 23 Sep 2017 00:55:52 +0200
Received: from linux-vqw3.gns.novell.com (nwb-a10-snat.microfocus.com
	[10.120.13.201])
	by emea4-mta.ukb.novell.com with ESMTP (TLS encrypted);
	Fri, 22 Sep 2017 23:55:39 +0100
From: Liang Yan <lyan@suse.com>
To: samuel.thibault@ens-lyon.org, pbonzini@redhat.com,
	marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Date: Fri, 22 Sep 2017 18:55:33 -0400
Message-Id: <20170922225533.1928-1-lyan@suse.com>
X-Mailer: git-send-email 2.14.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 195.135.221.5
Subject: [Qemu-trivial] [PATCH] chardev/baum: fix baum that releases brlapi
 twice
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
X-List-Received-Date: Fri, 22 Sep 2017 22:56:02 -0000

Error process of baum_chr_open needs to set brlapi null, so it won't
get released twice in char_braille_finalize, which will cause
"/usr/bin/qemu-system-x86_64: double free or corruption (!prev)"

Signed-off-by: Liang Yan <lyan@suse.com>
---
 chardev/baum.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/chardev/baum.c b/chardev/baum.c
index 302dd9666c..67fd783a59 100644
--- a/chardev/baum.c
+++ b/chardev/baum.c
@@ -643,6 +643,7 @@ static void baum_chr_open(Chardev *chr,
         error_setg(errp, "brlapi__openConnection: %s",
                    brlapi_strerror(brlapi_error_location()));
         g_free(handle);
+        baum->brlapi = NULL;
         return;
     }
     baum->deferred_init = 0;
-- 
2.14.1


