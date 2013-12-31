Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vxwgk-0006Bw-6h
	for mharc-qemu-trivial@gnu.org; Tue, 31 Dec 2013 05:36:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43779)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <keweihk@gmail.com>) id 1VxwgZ-0006An-Ln
	for qemu-trivial@nongnu.org; Tue, 31 Dec 2013 05:36:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <keweihk@gmail.com>) id 1VxwgR-0003BP-8e
	for qemu-trivial@nongnu.org; Tue, 31 Dec 2013 05:36:31 -0500
Received: from mail-pa0-x22f.google.com ([2607:f8b0:400e:c03::22f]:36971)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <keweihk@gmail.com>)
	id 1VxwgR-0003BK-1D; Tue, 31 Dec 2013 05:36:23 -0500
Received: by mail-pa0-f47.google.com with SMTP id kq14so12571801pab.34
	for <multiple recipients>; Tue, 31 Dec 2013 02:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=lSgxbF6m58/PCCyWNPm9GcTDdO3hWcnSAGaSQz3W6cE=;
	b=0gpJDMKlM3ZvkFcAETuDRIjNHtCeRJQkXirVmlMNeXb/uDAV+gVPxXjXqpTpPpB4DY
	Nzp4ilhemgLCoIrgNUdclKCCWNBy+wODAYglqEqzeQFjlTsJh+QO++dVxUAfYL8WIyGe
	faB7tk6nS6TOZY5abWY3lrqSLFD4jzc5pQ80aWrSP8RzQMAKiuvRgoXdD1U11FgqUagV
	eihS79z7McVmoslEzlAJ7oPEtFrRjJ3EzAKuiEwEZUOccDFPSXHmxjgs4MKr4X0pP5Dg
	EA22bEqkKjN5D3uj3GsPYAZlhFLH7w0hAJti/NtlC1YolmgUoRUevEkUYd/Cb47bF+7r
	NfPw==
X-Received: by 10.66.192.38 with SMTP id hd6mr1593431pac.146.1388486181417;
	Tue, 31 Dec 2013 02:36:21 -0800 (PST)
Received: from localhost.localdomain ([221.122.32.18])
	by mx.google.com with ESMTPSA id sj1sm2985390pbc.28.2013.12.31.02.36.17
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 31 Dec 2013 02:36:20 -0800 (PST)
From: Kewei Yu <keweihk@gmail.com>
To: aliguori@amazon.com,
	qemu-trivial@nongnu.org
Date: Tue, 31 Dec 2013 18:36:08 +0800
Message-Id: <1388486168-2532-1-git-send-email-keweihk@gmail.com>
X-Mailer: git-send-email 1.7.1
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c03::22f
Cc: qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH 1/1] Add a blank space between the variable
	and '='
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
X-List-Received-Date: Tue, 31 Dec 2013 10:36:40 -0000

Signed-off-by: Kewei Yu <keweihk@gmail.com>
---
 vl.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/vl.c b/vl.c
index 7511e70..92dafa5 100644
--- a/vl.c
+++ b/vl.c
@@ -2922,7 +2922,7 @@ int main(int argc, char **argv, char **envp)
 
     bdrv_init_with_whitelist();
 
-    autostart= 1;
+    autostart = 1;
 
     /* first pass of option parsing */
     optind = 1;
-- 
1.7.1


