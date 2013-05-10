Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UatSu-0001lJ-26
	for mharc-qemu-trivial@gnu.org; Fri, 10 May 2013 15:58:52 -0400
Received: from eggs.gnu.org ([208.118.235.92]:56893)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <i.mitsyanko@gmail.com>) id 1UatSp-0001g4-Q8
	for qemu-trivial@nongnu.org; Fri, 10 May 2013 15:58:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <i.mitsyanko@gmail.com>) id 1UatSn-00082w-9j
	for qemu-trivial@nongnu.org; Fri, 10 May 2013 15:58:47 -0400
Received: from mail-la0-x22d.google.com ([2a00:1450:4010:c03::22d]:44615)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <i.mitsyanko@gmail.com>)
	id 1UatSf-0007gF-En; Fri, 10 May 2013 15:58:37 -0400
Received: by mail-la0-f45.google.com with SMTP id fp12so4381799lab.18
	for <multiple recipients>; Fri, 10 May 2013 12:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=viBrV1inLFihRrg5rKIP4IoraDx+EFCi+9Nd1DbTfRk=;
	b=tJbeOSFyPNuSVqpDnHFOmp5EsXimVZqR3D0AAPJ9ufJor1nsWOiRIFNotzHK9INzi8
	nUnN/cV4OeDgRz9l9bZrqpeLN7xxLLKwRCdKF2WPCqh/j1Gc7S5WgjJ2+MhmttALclG8
	uDBoAWloDs6E+M2TiZ1kBHsCiSjy4MoG3NZ+Tl+/8uGwl6cvLXRtKHCEQKTVXdr44paA
	JyovJ30zCa7uXn9YQ5HX4bGHEpsm1fTi3aabbQWLU9nL4FE3L9dDuakugjsQbu0ACTIk
	wWsod7vFQVTUjvg3nK8F/6j1zsm7zD02UU5hnTvtBsM9UKejqDXbxC15ecH6NWUll1Yb
	XNgw==
X-Received: by 10.112.147.38 with SMTP id th6mr8235360lbb.119.1368215916210;
	Fri, 10 May 2013 12:58:36 -0700 (PDT)
Received: from localhost.localdomain ([79.164.42.118])
	by mx.google.com with ESMTPSA id pm9sm1367435lbb.8.2013.05.10.12.58.33
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 10 May 2013 12:58:34 -0700 (PDT)
From: Igor Mitsyanko <i.mitsyanko@gmail.com>
To: qemu-devel@nongnu.org
Date: Fri, 10 May 2013 23:58:21 +0400
Message-Id: <1368215901-55444-1-git-send-email-i.mitsyanko@gmail.com>
X-Mailer: git-send-email 1.8.1.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4010:c03::22d
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, aliguori@us.ibm.com,
	Igor Mitsyanko <i.mitsyanko@gmail.com>, peter.maydell@linaro.org
Subject: [Qemu-trivial] [PATCH V2] osdep.h: include sys/types.h for ssize_t
	definition
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
X-List-Received-Date: Fri, 10 May 2013 19:58:50 -0000

sys/types.h is taken out from "ifdef __OpenBSD__" guard. It should be
safe for other systems, according to following survey:
http://hacks.owlfolio.org/header-survey/

This fixes build for CONFIG_IOVEC-less systems (mingw).

Signed-off-by: Igor Mitsyanko <i.mitsyanko@gmail.com>
---
 include/qemu/osdep.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 42545bc..3bcd4ab 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -5,8 +5,8 @@
 #include <stdarg.h>
 #include <stddef.h>
 #include <stdbool.h>
-#ifdef __OpenBSD__
 #include <sys/types.h>
+#ifdef __OpenBSD__
 #include <sys/signal.h>
 #endif
 
-- 
1.8.1.4


