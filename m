Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZKXHB-0005rN-7X
	for mharc-qemu-trivial@gnu.org; Wed, 29 Jul 2015 15:44:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36106)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <leonid@daynix.com>) id 1ZKUsr-0007JS-EE
	for qemu-trivial@nongnu.org; Wed, 29 Jul 2015 13:11:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <leonid@daynix.com>) id 1ZKUsl-0006yb-S3
	for qemu-trivial@nongnu.org; Wed, 29 Jul 2015 13:11:13 -0400
Received: from mail-wi0-f177.google.com ([209.85.212.177]:37518)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <leonid@daynix.com>) id 1ZKUsl-0006yD-Mz
	for qemu-trivial@nongnu.org; Wed, 29 Jul 2015 13:11:07 -0400
Received: by wibud3 with SMTP id ud3so35376772wib.0
	for <qemu-trivial@nongnu.org>; Wed, 29 Jul 2015 10:11:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=L1poGYTvrgzX1N421yFhQWIui1bVNgsKm+gVxga5hQg=;
	b=iyLBTZbpp7hsFp3i6GYAnFwft5d0WwDKUjlEZoBWu9plb8tKCuAAvx/AJkSgWyipdQ
	njXJsj8kfIlgmiyF2TCSsxAf9Zmd83gwen2b0spiqFd7TFlskZQeQKm29meDdLDUfygj
	mrkETZ+2bGfSK2yn1Zz4sA9LJzbZ9P9c31wP1da+QfOs8h8KOb78ZVsD2QHwS2KxxyYi
	Xju22ytPGIr7LT4c4YBnxWdX2J4LRK50Rm1VftM3HZPaXqh7xZDTe2TfQt3wwgf2osrc
	Q3rD8kvEHJpUo3FSP7Jt4go54ouQZ8oKY24xy1VoyyPj1TESqbJ+jNf7ZJpYaQJ0aYSp
	9e5g==
X-Gm-Message-State: ALoCoQmQCjdYQRKChT6qpGEXDbf5uODex+IiI/WeG0MTAcQnbUKJj1z5wcIUxL3Evh12E5mhy3LW
X-Received: by 10.180.100.74 with SMTP id ew10mr8175309wib.12.1438189867229;
	Wed, 29 Jul 2015 10:11:07 -0700 (PDT)
Received: from bark.daynix ([5.102.236.99]) by smtp.gmail.com with ESMTPSA id
	fb3sm25316946wib.21.2015.07.29.10.11.05 for <qemu-trivial@nongnu.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 Jul 2015 10:11:06 -0700 (PDT)
From: Leonid Bloch <leonid@daynix.com>
To: qemu-trivial@nongnu.org
Date: Wed, 29 Jul 2015 20:10:50 +0300
Message-Id: <1438189851-688-1-git-send-email-leonid@daynix.com>
X-Mailer: git-send-email 2.4.3
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.212.177
X-Mailman-Approved-At: Wed, 29 Jul 2015 15:44:27 -0400
Subject: [Qemu-trivial] [PATCH 1/2] qemu-ga: Add .msi files to .gitignore
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
X-List-Received-Date: Wed, 29 Jul 2015 17:11:19 -0000

Signed-off-by: Leonid Bloch <leonid@daynix.com>
---
 .gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitignore b/.gitignore
index aed0e1f..1a5cbda 100644
--- a/.gitignore
+++ b/.gitignore
@@ -56,6 +56,7 @@
 *.cp
 *.dvi
 *.exe
+*.msi
 *.dll
 *.so
 *.mo
-- 
2.4.3


