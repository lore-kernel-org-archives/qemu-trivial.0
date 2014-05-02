Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WgEiJ-0008TV-9E
	for mharc-qemu-trivial@gnu.org; Fri, 02 May 2014 10:45:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35941)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WgEiC-0008LJ-LU
	for qemu-trivial@nongnu.org; Fri, 02 May 2014 10:45:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WgEi8-00032o-5p
	for qemu-trivial@nongnu.org; Fri, 02 May 2014 10:45:16 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:56576)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WgEhy-0002sH-Pn; Fri, 02 May 2014 10:45:02 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 29976401F9;
	Fri,  2 May 2014 18:45:01 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 55374651;
	Fri,  2 May 2014 18:36:03 +0400 (MSK)
Received: (nullmailer pid 30562 invoked by uid 1000);
	Fri, 02 May 2014 14:36:02 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri,  2 May 2014 18:35:59 +0400
Message-Id: <1399041361-30496-6-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1399041361-30496-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1399041361-30496-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PATCH v2 5/7] libcacard: replace pstrcpy() with
	memcpy()
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
X-List-Received-Date: Fri, 02 May 2014 14:45:21 -0000

Commit 2e679780ae86c6ca8 replaced strncpy() with pstrcpy()
in one place in libcacard.  This is a qemu-specific function,
while libcacard is a stand-alone library (or tries to be).
But since we know the exact length of the string to copy,
and know that it definitely will fit in the destination
buffer, use memcpy() instead, and null-terminate the string
after that.

An alternative is to use g_strlcpy() or strncpy(), but memcpy()
is more than adequate in this place.

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-trivial@nongnu.org
---
 libcacard/vcard_emul_nss.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/libcacard/vcard_emul_nss.c b/libcacard/vcard_emul_nss.c
index ee2dfae..e2b196d 100644
--- a/libcacard/vcard_emul_nss.c
+++ b/libcacard/vcard_emul_nss.c
@@ -1162,7 +1162,8 @@ vcard_emul_options(const char *args)
             NEXT_TOKEN(vname)
             NEXT_TOKEN(type_params)
             type_params_length = MIN(type_params_length, sizeof(type_str)-1);
-            pstrcpy(type_str, type_params_length, type_params);
+            memcpy(type_str, type_params, type_params_length);
+            type_str[type_params_length] = '\0';
             type = vcard_emul_type_from_string(type_str);
 
             NEXT_TOKEN(type_params)
-- 
1.7.10.4


