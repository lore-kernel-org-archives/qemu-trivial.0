Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TpiGs-00065b-Pe
	for mharc-qemu-trivial@gnu.org; Mon, 31 Dec 2012 11:31:26 -0500
Received: from eggs.gnu.org ([208.118.235.92]:59829)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <v.e.evard@gmail.com>) id 1TpiGo-0005u8-Q5
	for qemu-trivial@nongnu.org; Mon, 31 Dec 2012 11:31:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <v.e.evard@gmail.com>) id 1TpiGg-0004Oh-Rh
	for qemu-trivial@nongnu.org; Mon, 31 Dec 2012 11:31:22 -0500
Received: from mail-la0-f53.google.com ([209.85.215.53]:65452)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <v.e.evard@gmail.com>)
	id 1TpiGX-0004Nc-7o; Mon, 31 Dec 2012 11:31:05 -0500
Received: by mail-la0-f53.google.com with SMTP id fn20so4117313lab.12
	for <multiple recipients>; Mon, 31 Dec 2012 08:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:message-id:date:from:user-agent:mime-version:to:cc
	:subject:content-type:content-transfer-encoding;
	bh=KYhYvX0QgbkGqVO4iESmE6FCBq5IV0sxwEMEUZ+h02k=;
	b=t8ZVFvMnUMXaWqP2EWcmT8RNBWTJx7565LrW/9EVWxXCFqCCco6K6Wgyv0OPU4gvN3
	UREFxDcdMV7Qhd6QOVYw+LlrMZyRNVwjKSYXjxsmNwubu53QkDl5sfXdtslgXre0qqc7
	TzwE5ZukL6ZUDdd8ZF28BrLkddkyUbo+gpnV1RtGeMCUGv6lTeZnDOZh7OuZCHwYTGbF
	TOWwcgCKtn0PHw7IyyvychpFxtXnK7noQNyMN9DyGYmtKtXX1fDgezIG/Yl8VT331dhV
	FumzOhYSy+cFlP/8LZ13r8/8RjawRsZWdQFAFfeb0fU+rcY/ikGKSTFc9JqRaYd/X0yc
	ttmQ==
X-Received: by 10.152.105.203 with SMTP id go11mr38992996lab.53.1356971463611; 
	Mon, 31 Dec 2012 08:31:03 -0800 (PST)
Received: from [192.168.1.231] (host-165-152-66-217.spbmts.ru.
	[217.66.152.165]) by mx.google.com with ESMTPS id
	ew10sm14440401lbb.10.2012.12.31.08.31.01
	(version=SSLv3 cipher=OTHER); Mon, 31 Dec 2012 08:31:02 -0800 (PST)
Message-ID: <50E1BDC3.5040604@gmail.com>
Date: Mon, 31 Dec 2012 20:30:59 +0400
From: Vadim Evard <v.e.evard@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.11) Gecko/20121122 Icedove/10.0.11
MIME-Version: 1.0
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.215.53
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [Qemu-devel] [PATCH] configure: try pkg-config for
 curses
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
X-List-Received-Date: Mon, 31 Dec 2012 16:31:25 -0000

configure: try pkg-config for curses

Static linkikng against ncurses may require explicit -ltinfo.
In case -lcurses and -lncurses both didn't work give pkg-config a
chance.

Signed-off-by: Vadim Evard <v.e.evard@gmail.com>
---
  configure |    4 +++-
  1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index b0c7e54..16280e2 100755
--- a/configure
+++ b/configure
@@ -2030,7 +2030,7 @@ fi
  if test "$mingw32" = "yes" ; then
      curses_list="-lpdcurses"
  else
-    curses_list="-lncurses -lcurses"
+    curses_list="-lncurses:-lcurses:$($pkg_config --libs ncurses)"
  fi

  if test "$curses" != "no" ; then
@@ -2043,7 +2043,9 @@ int main(void) {
    return s != 0;
  }
  EOF
+  IFS=:
    for curses_lib in $curses_list; do
+    unset IFS
      if compile_prog "" "$curses_lib" ; then
        curses_found=yes
        libs_softmmu="$curses_lib $libs_softmmu"
-- 
1.7.10.4

