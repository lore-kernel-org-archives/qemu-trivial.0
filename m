Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f8oUE-0007NP-M4
	for mharc-qemu-trivial@gnu.org; Wed, 18 Apr 2018 10:55:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60926)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <olaf@aepfle.de>) id 1f8oUC-0007M8-J9
	for qemu-trivial@nongnu.org; Wed, 18 Apr 2018 10:55:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <olaf@aepfle.de>) id 1f8oUB-0003NP-QI
	for qemu-trivial@nongnu.org; Wed, 18 Apr 2018 10:55:04 -0400
Received: from mo6-p02-ob.smtp.rzone.de ([2a01:238:20a:202:5302::9]:28397)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <olaf@aepfle.de>)
	id 1f8oUB-0003N0-9K; Wed, 18 Apr 2018 10:55:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1524063301;
	s=strato-dkim-0002; d=aepfle.de;
	h=Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:
	X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
	bh=sRt5lC9E79gqs0PFYdqFa1AIJ9gp6+FUw2R+xZuCF7g=;
	b=CpaYfzobuCPwEpZtGHFOUmJHjdE5dmT8WFFxFtlsTFRQET02Zh0ssn8HYfXNpRohAT
	pJO4NAkrcEcT1I7uD1SPKKxV3/YKPcOh09uaGpkTQRsLMKLbCsRDko9s871BNcvHN4tC
	duC4rk0YvBZey1NlMyWfcO+kWAgmze3YhmH5pwobzvIbZpV98/cOPy26AfLhF/Sbwqnv
	oKPIg4C9nF/Gb38O02X91aHOfplNWiB9AtX7OaWrP/YvZZbyxlnDSSUcePx6e5oUXIx+
	xxc6CuO6kHo/+fYvwo1W3G7RQqrd6ixPRRI0yjKQguEckZnmCX/8sflts3CcK+OVUbJj
	WOew==
X-RZG-AUTH: :P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAgc1+lb4Esstf6UEufFpy8L/NK2kKUAyDFSMDbcP
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 43.4 AUTH)
	with ESMTPSA id Q05f37u3IEsj6t8
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1
	with 521 ECDH bits, eq. 15360 bits RSA))
	(Client did not present a certificate);
	Wed, 18 Apr 2018 16:54:45 +0200 (CEST)
From: Olaf Hering <olaf@aepfle.de>
To: qemu-trivial@nongnu.org
Cc: Olaf Hering <olaf@aepfle.de>, Gerd Hoffmann <kraxel@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, Fam Zheng <famz@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org (open list:All patches CC here)
Date: Wed, 18 Apr 2018 16:54:43 +0200
Message-Id: <20180418145443.6332-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.16.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 2a01:238:20a:202:5302::9
Subject: [Qemu-trivial] [PATCH v2] configure: require glib-2.24 on Linux
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
X-List-Received-Date: Wed, 18 Apr 2018 14:55:05 -0000

Since usage of g_realloc_n was introduced, glib-2.22 can not be used
anymore on Linux. Leave non-Linux unchanged because one developer system
still uses it.
Fixes commit 418026ca43 ("util: Introduce vfio helpers")

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 configure | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index 6e9b994f21..ca19a66726 100755
--- a/configure
+++ b/configure
@@ -3369,7 +3369,11 @@ fi
 if test "$mingw32" = yes; then
     glib_req_ver=2.30
 else
-    glib_req_ver=2.22
+    if test "$targetos" = Linux; then
+       glib_req_ver=2.24
+    else
+       glib_req_ver=2.22
+    fi
 fi
 glib_modules=gthread-2.0
 if test "$modules" = yes; then

