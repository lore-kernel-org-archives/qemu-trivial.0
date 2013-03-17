Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UHKQl-0008MH-A2
	for mharc-qemu-trivial@gnu.org; Sun, 17 Mar 2013 16:43:47 -0400
Received: from eggs.gnu.org ([208.118.235.92]:48360)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cardoe@cardoe.com>) id 1UHKQh-0008JI-Vi
	for qemu-trivial@nongnu.org; Sun, 17 Mar 2013 16:43:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cardoe@cardoe.com>) id 1UHKQd-0004mt-LC
	for qemu-trivial@nongnu.org; Sun, 17 Mar 2013 16:43:43 -0400
Received: from mail-qc0-x231.google.com ([2607:f8b0:400d:c01::231]:63247)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cardoe@cardoe.com>) id 1UHKQd-0004mY-H9
	for qemu-trivial@nongnu.org; Sun, 17 Mar 2013 16:43:39 -0400
Received: by mail-qc0-f177.google.com with SMTP id u28so2407799qcs.8
	for <qemu-trivial@nongnu.org>; Sun, 17 Mar 2013 13:43:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=vtJL6TamHyNXrF6SY4V0fuDsMJyLaWb/7WRR5peahbM=;
	b=GOs9BZDGEjNoxMLSMoqwpEGVHXBdCwajb8eAi0NrFCjowM5O0RxjKtwUMzanRUC0us
	TENxVI9nwGzPUIowg+SPibNGS8UeZKIuGrDKq8RrgyJuJPEOssuPfWRSoDDoosqy0Vo+
	mwnYtYZMcBkrgg/1I5Z9I+FBHLm5//X9b/5Hin4MUEQnm1TtmaWPR4f67x9nZM4XF4eU
	1OmA9lKT2vNbbDYiwJvXCgmO9mcMFnMAzSlDTuRsAXYWkiPHeuXf0RHDB+U31Wmzi6WT
	BmIegIosnLL6L4dc1heYNHSWBMneQd8iJQfYRpP6tO5SwQJOABvgIMyU6xjM4pyxaSgg
	qfSw==
X-Received: by 10.229.93.105 with SMTP id u41mr3776050qcm.150.1363553018574;
	Sun, 17 Mar 2013 13:43:38 -0700 (PDT)
Received: from localhost.localdomain (c-68-62-173-137.hsd1.al.comcast.net.
	[68.62.173.137])
	by mx.google.com with ESMTPS id hn9sm27712329qab.8.2013.03.17.13.43.37
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 17 Mar 2013 13:43:38 -0700 (PDT)
From: Doug Goldstein <cardoe@cardoe.com>
To: qemu-devel@nongnu.org
Date: Sun, 17 Mar 2013 15:43:26 -0500
Message-Id: <1363553006-27008-1-git-send-email-cardoe@cardoe.com>
X-Mailer: git-send-email 1.8.1.5
X-Gm-Message-State: ALoCoQnotyp2CodB1Kh5msrR8UxCLfeRbx83y4BxHolRGLymKcwvNHBGt0IQarX79M5FFt/3nFmf
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c01::231
Cc: qemu-trivial@nongnu.org, Doug Goldstein <cardoe@cardoe.com>
Subject: [Qemu-trivial] [PATCH] Advertise --libdir in configure --help output
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
X-List-Received-Date: Sun, 17 Mar 2013 20:43:46 -0000

The configure script allows you to supply a libdir via --libdir but was
not advertising this in --help.

Signed-off-by: Doug Goldstein <cardoe@cardoe.com>
CC: qemu-trivial@nongnu.org
---
 configure | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configure b/configure
index 46a7594..497ce29 100755
--- a/configure
+++ b/configure
@@ -1050,6 +1050,7 @@ echo "  --mandir=PATH            install man pages in PATH"
 echo "  --datadir=PATH           install firmware in PATH$confsuffix"
 echo "  --docdir=PATH            install documentation in PATH$confsuffix"
 echo "  --bindir=PATH            install binaries in PATH"
+echo "  --libdir=PATH            install libraries in PATH"
 echo "  --sysconfdir=PATH        install config in PATH$confsuffix"
 echo "  --localstatedir=PATH     install local state in PATH"
 echo "  --with-confsuffix=SUFFIX suffix for QEMU data inside datadir and sysconfdir [$confsuffix]"
-- 
1.8.1.5


