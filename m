Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UOi2C-0006GV-Nj
	for mharc-qemu-trivial@gnu.org; Sun, 07 Apr 2013 01:20:56 -0400
Received: from eggs.gnu.org ([208.118.235.92]:36066)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ben.leslie@gmail.com>) id 1UOi26-0006GK-Qb
	for qemu-trivial@nongnu.org; Sun, 07 Apr 2013 01:20:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ben.leslie@gmail.com>) id 1UOi22-0007wz-4t
	for qemu-trivial@nongnu.org; Sun, 07 Apr 2013 01:20:50 -0400
Received: from mail-ia0-x235.google.com ([2607:f8b0:4001:c02::235]:34172)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ben.leslie@gmail.com>) id 1UOi21-0007ws-UC
	for qemu-trivial@nongnu.org; Sun, 07 Apr 2013 01:20:46 -0400
Received: by mail-ia0-f181.google.com with SMTP id o25so4200179iad.40
	for <qemu-trivial@nongnu.org>; Sat, 06 Apr 2013 22:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:date:x-google-sender-auth:message-id
	:subject:from:to:content-type;
	bh=Md0u3Hxq3coeEeEh+1upY47evl6VYT6u29yxAC3Z2kk=;
	b=avf3OPAlDRB1H9V/aNziXRNGkk/Hr4r60uIxpUZidLFBG0M+3pMcDs44Y7pAfsfbHz
	DY9GeFXjAZZZT4nj/0w5E7xsmNwSXzTq0i931eSEMPJf35tbKdTll+wtvuEl56IB8Zxz
	CFSiH9MlEX8pvGiHhVUxiRi/zyev3VJKUhJJWIo8hzXinKurCU0RJPiMu1kanHjEiuZX
	E465SP+drlCAsXSNaYvvfht0aU59BotrlgWWRj81d9zHwQPTTBKRBid57j+y7IsNiz4t
	XuWolAR9LeEgrxGW/YcRCK0j/iOE36K27c3Mp9pGS48p8UwXQ73yLrDD3L27nm0a2zhl
	4cuA==
MIME-Version: 1.0
X-Received: by 10.50.115.42 with SMTP id jl10mr3485214igb.71.1365312045060;
	Sat, 06 Apr 2013 22:20:45 -0700 (PDT)
Sender: ben.leslie@gmail.com
Received: by 10.64.24.98 with HTTP; Sat, 6 Apr 2013 22:20:44 -0700 (PDT)
Date: Sun, 7 Apr 2013 15:20:44 +1000
X-Google-Sender-Auth: 9FdAStLFRq62f_oYEAqYYW9zQWs
Message-ID: <CABZ0LtBxD4CvG4wFAE_S+Zr8OeWuq1PGGt+d7MZJ61DNKYTNdg@mail.gmail.com>
From: Ben Leslie <benno@benno.id.au>
To: qemu-trivial@nongnu.org
Content-Type: text/plain; charset=ISO-8859-1
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4001:c02::235
Subject: [Qemu-trivial] [PATCH] configure: Detect --disable-system and
	--target-list conflicts.
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
X-List-Received-Date: Sun, 07 Apr 2013 05:20:55 -0000

The user should not be allowed to configure a softmmu target
when --disable-system is selected.

Signed-off-by: Ben Leslie <benno@benno.id.au>
---
 configure | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index d685275..e4288ed 100755
--- a/configure
+++ b/configure
@@ -1353,7 +1353,13 @@ else
 fi
 # see if system emulation was really requested
 case " $target_list " in
-  *"-softmmu "*) softmmu=yes
+  *"-softmmu "*)
+    if test "$softmmu" = "no"; then
+      echo "ERROR: System emulation disabled (via --disable-system),
however a "
+      echo "       system emulation target specified in --target-list."
+      exit 1
+    fi
+    softmmu=yes
   ;;
   *) softmmu=no
   ;;
--

