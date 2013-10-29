Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vb0wt-00058X-RQ
	for mharc-qemu-trivial@gnu.org; Tue, 29 Oct 2013 00:30:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52326)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <antonynpavlov@gmail.com>) id 1Vb0wj-00052d-BX
	for qemu-trivial@nongnu.org; Tue, 29 Oct 2013 00:30:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <antonynpavlov@gmail.com>) id 1Vb0wa-0004EL-Rf
	for qemu-trivial@nongnu.org; Tue, 29 Oct 2013 00:30:25 -0400
Received: from mail-lb0-x234.google.com ([2a00:1450:4010:c04::234]:54116)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <antonynpavlov@gmail.com>)
	id 1Vb0wJ-0003a4-Ne; Tue, 29 Oct 2013 00:29:59 -0400
Received: by mail-lb0-f180.google.com with SMTP id y6so3509677lbh.25
	for <multiple recipients>; Mon, 28 Oct 2013 21:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=MF05tcrlHcljvERy1pQrCKb7fR+0zlkoN92fnCNOZlk=;
	b=E300WC88s2cw3BAC5OJR07PiILWCZ4AC/mdZIX9mQGUg4vYkMiC00egBL6SBUyAPnZ
	3/sYI+M0XqJ/RWH4CDV4/3DKoyfwOol/d6LtszHt0NawgqeX4DSG2WKFZS33Nz1TTCbU
	m57zL/L8Htw+voUGMRwjg1UWGvu9NDzeKjdRNgcBlfrHhYkmtNvKwF1uRK2QiAiIVBSn
	bdK+0UXncgOf8EYOTIrbIcEfaLv2BKimddZVPzTiHs800lPgbJ4Sw1jZC2ABRAwwQvQh
	f4Jtw70nxovgQ5lsZwCmpRigr3qKWlQu9DqI6pVcS788sWWERMLyHdjPKcMIbWMetCRu
	0xPw==
X-Received: by 10.152.45.42 with SMTP id j10mr16369975lam.15.1383020998043;
	Mon, 28 Oct 2013 21:29:58 -0700 (PDT)
Received: from localhost.localdomain
	(broadband-95-84-154-9.nationalcablenetworks.ru. [95.84.154.9])
	by mx.google.com with ESMTPSA id oc1sm15162637lbb.3.2013.10.28.21.29.56
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Oct 2013 21:29:56 -0700 (PDT)
From: Antony Pavlov <antonynpavlov@gmail.com>
To: Anthony Liguori <aliguori@amazon.com>
Date: Tue, 29 Oct 2013 08:36:31 +0400
Message-Id: <1383021391-3152-1-git-send-email-antonynpavlov@gmail.com>
X-Mailer: git-send-email 1.8.4.rc3
MIME-Version: 1.0
Content-Type: text/plain; charset=utf8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4010:c04::234
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Antony Pavlov <antonynpavlov@gmail.com>
Subject: [Qemu-trivial] [PATCH] vl: fix build when configured with no
	graphic support
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
X-List-Received-Date: Tue, 29 Oct 2013 04:30:34 -0000

The following error occurs when building no graphic output support:

  vl.c: In function ‘main’:
  vl.c:2829:19: error: variable ‘ds’ set but not used [-Werror=unused-but-set-variable]
       DisplayState *ds;
                     ^
  cc1: all warnings being treated as errors

To reproduce this issue, just run:

  $ ./configure \
      --disable-curses \
      --disable-sdl \
      --disable-cocoa \
      --disable-gtk \
      --disable-vnc \
      --enable-werror
  $ make vl.o

Signed-off-by: Antony Pavlov <antonynpavlov@gmail.com>
---
 vl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/vl.c b/vl.c
index b42ac67..8fbf25e 100644
--- a/vl.c
+++ b/vl.c
@@ -4269,6 +4269,7 @@ int main(int argc, char **argv, char **envp)
     /* init local displays */
     switch (display_type) {
     case DT_NOGRAPHIC:
+        (void)ds;
         break;
 #if defined(CONFIG_CURSES)
     case DT_CURSES:
-- 
1.8.4.rc3


