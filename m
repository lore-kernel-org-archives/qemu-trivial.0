Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f8hs6-0005au-EQ
	for mharc-qemu-trivial@gnu.org; Wed, 18 Apr 2018 03:51:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51454)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <olaf@aepfle.de>) id 1f8hs4-0005aa-J1
	for qemu-trivial@nongnu.org; Wed, 18 Apr 2018 03:51:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <olaf@aepfle.de>) id 1f8hs3-00027v-Jv
	for qemu-trivial@nongnu.org; Wed, 18 Apr 2018 03:51:16 -0400
Received: from mo6-p01-ob.smtp.rzone.de ([2a01:238:20a:202:5301::7]:19099)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <olaf@aepfle.de>)
	id 1f8hs3-00023W-2C; Wed, 18 Apr 2018 03:51:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1524037872;
	s=strato-dkim-0002; d=aepfle.de;
	h=Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:
	X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
	bh=6JwbbHDQoSkaAKUaLa0jBOQMj2w/8eVR9aPjejlNZdo=;
	b=H1yXzdlQHbgFSA5jduRvBKVb9CQQ/xA1gb9t9tSfziDTlqVIIBgTGkYMZVafGBHuiy
	LkLBhmL0u9w+CmLGDJX2cFJBPzjp03xOVgG2USbRMR9P0HjQlex6ZjiMd4fbmuJD6JU8
	pB/rC/tWsk6iPUThu0Wi0iTWwxm9DInCD9u3pJ5FJt/UxgtpU3pf/gIhM7mSJN06ADGJ
	xdpxzLq72KCyBrNyvzvHacDyNDTfpue/eaZk/skxThdofz+j+s83+p7rNfhyNTjiLH+o
	pnR7w9NuW7viytNDmQZAgB/DFVDLRnpEcpuYg+I1wDGAckDOUHazBoFUlJN63dQjTmRo
	67xA==
X-RZG-AUTH: :P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAgc1+lb4Esstf6UEufFpy8L/NK2kKUAyDFSMDbcP
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 43.4 AUTH)
	with ESMTPSA id Q05f37u3I7os4Hy
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1
	with 521 ECDH bits, eq. 15360 bits RSA))
	(Client did not present a certificate);
	Wed, 18 Apr 2018 09:50:54 +0200 (CEST)
From: Olaf Hering <olaf@aepfle.de>
To: qemu-trivial@nongnu.org
Cc: Olaf Hering <olaf@aepfle.de>, Gerd Hoffmann <kraxel@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, Fam Zheng <famz@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org (open list:All patches CC here)
Date: Wed, 18 Apr 2018 09:50:44 +0200
Message-Id: <20180418075045.27393-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.16.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 2a01:238:20a:202:5301::7
Subject: [Qemu-trivial] [PATCH v1] configure: recognize more rpmbuild macros
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
X-List-Received-Date: Wed, 18 Apr 2018 07:51:17 -0000

Extend the list of recognized, but ignored options from rpms %configure
macro. This fixes build on hosts running SUSE Linux.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 configure | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configure b/configure
index 0a19b033bc..6e9b994f21 100755
--- a/configure
+++ b/configure
@@ -959,6 +959,9 @@ for opt do
   ;;
   --firmwarepath=*) firmwarepath="$optarg"
   ;;
+  --host=*|--build=*|\
+  --program-prefix=*|--exec-prefix=*|\
+  --disable-dependency-tracking|\
   --sbindir=*|--sharedstatedir=*|\
   --oldincludedir=*|--datarootdir=*|--infodir=*|--localedir=*|\
   --htmldir=*|--dvidir=*|--pdfdir=*|--psdir=*)

