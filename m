Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f8mMt-0006de-Em
	for mharc-qemu-trivial@gnu.org; Wed, 18 Apr 2018 08:39:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48793)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <olaf@aepfle.de>) id 1f8mMq-0006az-Dv
	for qemu-trivial@nongnu.org; Wed, 18 Apr 2018 08:39:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <olaf@aepfle.de>) id 1f8mMp-0007vl-IF
	for qemu-trivial@nongnu.org; Wed, 18 Apr 2018 08:39:20 -0400
Received: from mo6-p01-ob.smtp.rzone.de ([2a01:238:20a:202:5301::7]:14948)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <olaf@aepfle.de>)
	id 1f8mMp-0007ta-2J; Wed, 18 Apr 2018 08:39:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1524055157;
	s=strato-dkim-0002; d=aepfle.de;
	h=Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:
	X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
	bh=ujYcjzUL74zJj9E1ODKBZNMY2zzQXvn9y0bSu255yY4=;
	b=dHvfN3oB0UYB/MrbS0HIoUpGP1N3JDFmblq7OSsxkEoHLVDRET6MI1tXMvsdzRuirK
	SFiZCf6BDCYGTetKVbvaOTpI7K4WPW8Bta9vWZOshRl2k3EzPo7QAzzTET6vbyGKjtZ2
	BqGvyk20lP7W5/zeznBQXEKg7BVVaG20/PPcHbtypYimcK9dhAqB2xkMJwqcqgUr+s6N
	Qq2fia/HiIc4nPw7y5zD0ClxZCxfSdyHv4mvceWiNRuIfcuY22ECWFH1HU3ZAP2L7+oh
	K22Ff9FAIBe5HZD1kXUuoX6LlhgjPWDG1KjB08n2EUMcl00v7pIhOBamm/kMlcC19qom
	Yp3A==
X-RZG-AUTH: :P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAgc1+lb4Esstf6UEufFpy8L/NK2kKUAyDFSMDbcP
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 43.4 AUTH)
	with ESMTPSA id Q05f37u3ICcw63K
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1
	with 521 ECDH bits, eq. 15360 bits RSA))
	(Client did not present a certificate);
	Wed, 18 Apr 2018 14:38:58 +0200 (CEST)
From: Olaf Hering <olaf@aepfle.de>
To: qemu-trivial@nongnu.org
Cc: Olaf Hering <olaf@aepfle.de>, Paolo Bonzini <pbonzini@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, Fam Zheng <famz@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org (open list:All patches CC here)
Date: Wed, 18 Apr 2018 14:38:37 +0200
Message-Id: <20180418123838.3511-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.16.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 2a01:238:20a:202:5301::7
Subject: [Qemu-trivial] [PATCH v1] configure: require glib-2.24
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
X-List-Received-Date: Wed, 18 Apr 2018 12:39:21 -0000

Since usage of g_realloc_n was introduced, glib-2.22 can not be used anymore.
Fixes commit 418026ca43 ("util: Introduce vfio helpers")

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 6e9b994f21..81760ef45a 100755
--- a/configure
+++ b/configure
@@ -3369,7 +3369,7 @@ fi
 if test "$mingw32" = yes; then
     glib_req_ver=2.30
 else
-    glib_req_ver=2.22
+    glib_req_ver=2.24
 fi
 glib_modules=gthread-2.0
 if test "$modules" = yes; then

