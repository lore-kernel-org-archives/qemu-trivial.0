Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hMGvy-0003xh-5h
	for mharc-qemu-trivial@gnu.org; Thu, 02 May 2019 14:59:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36424)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hMGvt-0003sN-Td
	for qemu-trivial@nongnu.org; Thu, 02 May 2019 14:59:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hMGvs-000399-0P
	for qemu-trivial@nongnu.org; Thu, 02 May 2019 14:59:49 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:43817)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1hMGvp-00037H-V9; Thu, 02 May 2019 14:59:47 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA
	(Nemesis)
	id 1MpDa5-1gyQDg3Xkl-00qlx4; Thu, 02 May 2019 20:58:48 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Fabien Chouteau <chouteau@adacore.com>,
	Viktor Prutyanov <viktor.prutyanov@phystech.edu>,
	Richard Henderson <rth@twiddle.net>, Thomas Huth <thuth@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Laurent Vivier <laurent@vivier.eu>, Eduardo Habkost <ehabkost@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>, Jason Wang <jasowang@redhat.com>,
	qemu-trivial@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>,
	Wei Yang <richardw.yang@linux.intel.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Stefano Garzarella <sgarzare@redhat.com>
Date: Thu,  2 May 2019 20:58:24 +0200
Message-Id: <20190502185835.15185-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190502185835.15185-1-laurent@vivier.eu>
References: <20190502185835.15185-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:6WagXE00vi4QQwZmMsAKXeAEG8kmGBrv5XeQQE+7L0RCxCtE7Js
	jq6jbWP61ZHHNq+v7NLOMfdcrnu28ZBfEYOWFS5ovRmHItkypDs/yRNfjbxEFe6/hZTCs01
	fVuG1JxM86snyRsthdUTLnSKry+a6IttZgcISmGu4hkyFaLckwTWhxkpSGWbdACHR34MT8s
	GYoZu6M4d3REkxe8o2p6g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:4gERy3jqQls=:n7b7aYxZ6tzSKomNnFGpSP
	H7CApcDXg6j5EC7aTR8gunAfjZXEQFVpei4LS0pSyZf2DGadLpWE8LDfBHW7/zpofrergnfTx
	PpRtm3BL0Q5kRNLVCiY2gpRhOnj1IE2N+4bmro4ZBcJNeSRDbaL7w87VkQC+u9Z6dpxzAfMHS
	ib7c5IdfIhOXxQ/xNWIlCVNMvXFBkjL6p/5xym3kpl9t0YVFrgEi/yFIx6qcM/mGysbMY7pcK
	cRs46XQqLV01c9HbHVRHo0L26v16YQD5zUfYq04zsrVqhmamfE3C1QiZ4VJAUoIBuvZo2keJ7
	G7DVz48DOzk05M5D/FsZSLPGomBQ7nkVP2+n0x8Wqq7TFA8a4E7D1Z6Bz3Z17XMN67FWQmPc9
	xieFXWlzXDwvfcnNVzf+7tSL4a6SD6VddfMRzrb66kP0DYq8BuduJTHwIs9iCowlVxWQuFsPg
	40XD0oh+AIMcwQJH+DLhL/DwTYXTb2TAEWpzKPe91+vVdrGh91309V+c3SexmkARzoiLEFnoJ
	INTRcBeWLdEFgJkxoy23wILmuQU5DzgmTUcNSgNQmvejHOk+gVtYkav0lniIhRpbZgVgPlJPe
	byNLtKf8CjqFnr56sM+tVEGWzw3bSB0fUBsZy6Yr79GliJMzBGnE6Pu2A8/ubdk2JF/Lf9/zB
	LrXYUtCrXwlNOOICAGa+hMyQuiFTe5oW8B4AE1qqT/pT95LeKZyK3tHl5r/cJTq1r875r5q7l
	CPMCB4RGcPt409+weCzOlFWNX5UdetFESeWEEw==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.13
Subject: [Qemu-trivial] [PULL 02/13] CODING_STYLE: specify the indent rule
 for multiline code
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
X-List-Received-Date: Thu, 02 May 2019 18:59:51 -0000

From: Wei Yang <richardw.yang@linux.intel.com>

We didn't specify the indent rule for multiline code here, which may
mislead users. And in current code, the code use various styles.

Add this rule in CODING_STYLE to make sure this is clear to every one.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
Suggested-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Message-Id: <20190304071631.27567-2-richardw.yang@linux.intel.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 CODING_STYLE | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/CODING_STYLE b/CODING_STYLE
index ec075dedc4a8..90321e9c2821 100644
--- a/CODING_STYLE
+++ b/CODING_STYLE
@@ -29,6 +29,45 @@ Spaces of course are superior to tabs because:
 
 Do not leave whitespace dangling off the ends of lines.
 
+1.1 Multiline Indent
+
+There are several places where indent is necessary:
+
+ - if/else
+ - while/for
+ - function definition & call
+
+When breaking up a long line to fit within line width, we need a proper indent
+for the following lines.
+
+In case of if/else, while/for, align the secondary lines just after the
+opening parenthesis of the first.
+
+For example:
+
+    if (a == 1 &&
+        b == 2) {
+
+    while (a == 1 &&
+           b == 2) {
+
+In case of function, there are several variants:
+
+    * 4 spaces indent from the beginning
+    * align the secondary lines just after the opening parenthesis of the
+      first
+
+For example:
+
+    do_something(x, y,
+        z);
+
+    do_something(x, y,
+                 z);
+
+    do_something(x, do_another(y,
+                               z));
+
 2. Line width
 
 Lines should be 80 characters; try not to make them longer.
-- 
2.20.1


