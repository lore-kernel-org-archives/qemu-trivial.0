Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YmYZJ-0001ES-Qz
	for mharc-qemu-trivial@gnu.org; Sun, 26 Apr 2015 22:14:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36591)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1YmYZH-0001AC-AW
	for qemu-trivial@nongnu.org; Sun, 26 Apr 2015 22:14:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1YmYZG-00064r-GK
	for qemu-trivial@nongnu.org; Sun, 26 Apr 2015 22:14:43 -0400
Received: from mail-pd0-x22f.google.com ([2607:f8b0:400e:c02::22f]:35292)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1YmYZA-00060X-6g; Sun, 26 Apr 2015 22:14:36 -0400
Received: by pdbqd1 with SMTP id qd1so112317967pdb.2;
	Sun, 26 Apr 2015 19:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=TPL2EgnyKM+uJUs0NCwEa6zUvB83omnS+gJOcBM3QIA=;
	b=PyLQy/NBRewLXQQZGdwZBWpU9lrxAKjCQgUoj7ZUAUwSujlYAjurt9kwujJd4NTrVf
	VgSUiJrsACjAZp5LMDoZ7+dtPLmw0UIsUU2bVOnOzEvRwZg/mlvgYG/CHv6F2SzBli2r
	xGNTQXa/O4Vw4zTC3fhcBGjGnd8LTNZnvirOXURJWfyPgXBpMJciwHVlmEz6Gp3BOtcZ
	m4k9KLKUnqocTGvEBrDrvoOPNygO5FvMxk2qYIDn0Ytn9ttgkJpqNzSmZKxctqQI9bVh
	oVyFQgIsMpv4pZ3wVeIpmTCmXEgQr3ZqoKMnqmFYYqpQo9G6NcvU/xxJ8lvzZ0UqyLst
	kreA==
X-Received: by 10.67.7.199 with SMTP id de7mr17466767pad.107.1430100875195;
	Sun, 26 Apr 2015 19:14:35 -0700 (PDT)
Received: from pcrost-laptop.hsd1.ca.comcast.net
	(c-24-5-157-48.hsd1.ca.comcast.net. [24.5.157.48])
	by mx.google.com with ESMTPSA id
	by13sm17594090pdb.37.2015.04.26.19.14.33
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 26 Apr 2015 19:14:34 -0700 (PDT)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun, 26 Apr 2015 19:14:26 -0700
Message-Id: <1430100866-9831-1-git-send-email-crosthwaite.peter@gmail.com>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c02::22f
Cc: qemu-trivial@nongnu.org, kbastian@mail.uni-paderborn.de,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Subject: [Qemu-trivial] [PATCH] configure: alphabetize tricore in target list
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
X-List-Received-Date: Mon, 27 Apr 2015 02:14:44 -0000

tricore was out of alphabetical order in the target list. Fix.

Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
---
 configure | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 6969f6f..9f0d9bb 100755
--- a/configure
+++ b/configure
@@ -5169,8 +5169,6 @@ case "$target_name" in
     TARGET_BASE_ARCH=mips
     echo "TARGET_ABI_MIPSN64=y" >> $config_target_mak
   ;;
-  tricore)
-  ;;
   moxie)
   ;;
   or32)
@@ -5221,6 +5219,8 @@ case "$target_name" in
   s390x)
     gdb_xml_files="s390x-core64.xml s390-acr.xml s390-fpr.xml"
   ;;
+  tricore)
+  ;;
   unicore32)
   ;;
   xtensa|xtensaeb)
-- 
1.9.1


