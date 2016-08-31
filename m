Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bf8QG-0003cF-FS
	for mharc-qemu-trivial@gnu.org; Wed, 31 Aug 2016 12:31:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51813)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <fullmanet@gmail.com>) id 1bf8QE-0003Xq-0n
	for qemu-trivial@nongnu.org; Wed, 31 Aug 2016 12:31:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <fullmanet@gmail.com>) id 1bf8QC-0001xK-1V
	for qemu-trivial@nongnu.org; Wed, 31 Aug 2016 12:31:28 -0400
Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243]:35525)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <fullmanet@gmail.com>)
	id 1bf8Q6-0001vn-Ae; Wed, 31 Aug 2016 12:31:22 -0400
Received: by mail-wm0-x243.google.com with SMTP id i5so8364281wmg.2;
	Wed, 31 Aug 2016 09:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=b+MrA6CqeXE+ATbvRUxC0r3pgj05bLUiEzSCsEb6gIc=;
	b=eZqF+81NZ7MyuYF81jh1LmaosvbCLNaqLsDo1Dwv54FJLgv5BEBgh6pTH/4UZYHbhu
	odj0egem3y5ihF01EfBjlfsIEWOYnyjMFIjKUcCqYYf81+a1rFPcOQ5jlvjIt7fDbRS3
	YTztsK43Ol3UfMDQ1KN7Jdu2SJutjCKKLoX7qlA/+lIuZk22uvLljAdVzzhsCKkKg/Hu
	JOhPhMZ/N8nWO4v4aZC3jsfPwFrSog7UknwmYXILCA2qDtHFjrlU16G+YAkfTKJO19OW
	FQWrfLfUaJasdl0ezVI2njje/6qrkMcrYUSWKtKqucUQHhmfM4GSG9LStkH5l/JHsP4W
	khBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=b+MrA6CqeXE+ATbvRUxC0r3pgj05bLUiEzSCsEb6gIc=;
	b=JHCDyWRdE4RR8oPYETxSXVm1bk7TfH9F1EP5LlP5MP4XXfNQfPrdGbkuB0TgOXw7CP
	nnZl+GRUqgHPn7kK47Tp0EITeLne1gXYA23lx6SO+yZ3ZQvglkQRVk2zHT5zcgVVn2o/
	qwweh91XqMTR6X7gKtBGQPP1FMjRB4JAHQOyVH2fQurj8YKCnCVErQjx76zl+Vfj4Q70
	POX5POsdvfHNq6C8CSdm1cYLRahhzHEv5z/rDKAZVMFDN2igXzMskKrVhXORUBHuGqkf
	FYEKKnA6BZpeTQGSLTaseEOb7F2yi8Cser8idsdXgCwkPD2t0ug74SqKgt1G62d0ihGY
	LYfg==
X-Gm-Message-State: AE9vXwOpVpGgq8E6kq2378Q89hafwB9wSYYDcauxEtiMn+EjhXT2mHRa6jRwHoAMUh+Jwg==
X-Received: by 10.28.191.14 with SMTP id p14mr23486599wmf.39.1472661081600;
	Wed, 31 Aug 2016 09:31:21 -0700 (PDT)
Received: from cinque_stelle.sm14.sm.cri.epita.net ([163.5.208.108])
	by smtp.gmail.com with ESMTPSA id c16sm9780245wme.4.2016.08.31.09.31.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 31 Aug 2016 09:31:20 -0700 (PDT)
From: Reda Sallahi <fullmanet@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Magnus Damm <magnus.damm@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>, Reda Sallahi <fullmanet@gmail.com>
Date: Wed, 31 Aug 2016 18:31:04 +0200
Message-Id: <20160831163104.6268-1-fullmanet@gmail.com>
X-Mailer: git-send-email 2.9.3
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::243
Subject: [Qemu-trivial] [PATCH v2] sh4: fix broken link to documentation
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
X-List-Received-Date: Wed, 31 Aug 2016 16:31:31 -0000

The page that was previously linked in the source code and the README file is
no longer available so it now returns a 404 error message.

This puts a previous snapshot from archive.org instead.

Signed-off-by: Reda Sallahi <fullmanet@gmail.com>
---
Changes from v1:
* Add the 'https://' part to the link in hw/sh4/shix.c.

 hw/sh4/shix.c         | 2 +-
 target-sh4/README.sh4 | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/sh4/shix.c b/hw/sh4/shix.c
index ccc9e75..14d4007 100644
--- a/hw/sh4/shix.c
+++ b/hw/sh4/shix.c
@@ -23,7 +23,7 @@
  */
 /*
    Shix 2.0 board by Alexis Polti, described at
-   http://perso.enst.fr/~polti/realisations/shix20/
+   https://web.archive.org/web/20070917001736/perso.enst.fr/~polti/realisations/shix20
 
    More information in target-sh4/README.sh4
 */
diff --git a/target-sh4/README.sh4 b/target-sh4/README.sh4
index e578830..ece0464 100644
--- a/target-sh4/README.sh4
+++ b/target-sh4/README.sh4
@@ -25,7 +25,7 @@ Goals
 
 The primary model being worked on is the soft MMU target to be able to
 emulate the Shix 2.0 board by Alexis Polti, described at
-http://perso.enst.fr/~polti/realisations/shix20/
+https://web.archive.org/web/20070917001736/http://perso.enst.fr/~polti/realisations/shix20/
 
 Ultimately, qemu will be coupled with a system C or a verilog
 simulator to simulate the whole board functionalities.
-- 
2.9.3


