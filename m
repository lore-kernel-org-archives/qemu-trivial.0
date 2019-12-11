Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1if2u1-0005T2-16
	for mharc-qemu-trivial@gnu.org; Wed, 11 Dec 2019 09:23:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33801)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1if2tw-0005QH-8j
 for qemu-trivial@nongnu.org; Wed, 11 Dec 2019 09:23:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1if2tv-0003Eb-BS
 for qemu-trivial@nongnu.org; Wed, 11 Dec 2019 09:23:40 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:33214)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1if2tq-00037k-HE; Wed, 11 Dec 2019 09:23:34 -0500
Received: by mail-wr1-x444.google.com with SMTP id b6so24267647wrq.0;
 Wed, 11 Dec 2019 06:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KTbcScOLjXllpK9umoeqVc/PDjmIqMW5fTameWTBrIo=;
 b=oN8qPj0jT+uo3AMAXS8VqupwT9RelTzEQBqYUNqK0iIKnznELXzRwmquB1uunWzg5g
 IsMBvDiPFXpLxyaqhRE/aMbHjLrIvb+14saNSGOeuuga3uNtM0tfYjPm452SA0+JASfS
 mP5ExkHo2pPLqmS2V156WMbX9Zf+VjTY/j+trOBrx17JkthX5sz8b5LpzoOpDSuT7U4k
 UP5QtJ1Z6XRLvJrAFJdO0HzMQ+dKAMB6Z9/qobqOsgK5XkBGx8h1niM31c99ZT8RrtNS
 nrtUQ9a3FN8JkUiGFI/6j3bUqk0fqcAly8Nk6i41oNO0/P0BSrvCdcS/N5XmKjl/OnIi
 D+vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=KTbcScOLjXllpK9umoeqVc/PDjmIqMW5fTameWTBrIo=;
 b=Ucu+ICvnl9pZnhOQ6H808sCBnoLjS+vGfZ8uvUW72KqSbfdOEFi4Sk+r6bja4l3SvI
 apy+e7W0W5X5g73R7t1DTgDn5pDA2I3N5HwXm7qIYWyjzfaz3U9khop2CqxXmVeqnnlr
 0oIFf+NdemB3wbnPGGGrFv6FJbTcbEBQl7fWUn56nkg1Y0SEXwAfi/etRwyPZNQ3ceZA
 vsp9M9onLY7Z69wRKQ5OGsikT/Y4CP3MEKdTSru4t2X45xh3q2xp4qVXJHQ+chOvElA9
 XitHlCc3vKnoxjY5RUR/ZfCuflc9h09IXFeFTrSFGyK1P2/WDm3W2/QMvPa6Wu4msl1B
 2Exg==
X-Gm-Message-State: APjAAAXSNtnAy6qbddzJdsAeZU9O93khNy2ko+HliNGjp+SDUdDh/50z
 q7GPXTFeCqPZ7Ng8Roq89T46mY5c
X-Google-Smtp-Source: APXvYqyJReA0qZLK4zO4VcBN0cU/v+F2bAwpe1awnganCfX8fr2Zi2UeuPOcHS90qWNi7if78+sPxg==
X-Received: by 2002:adf:fd87:: with SMTP id d7mr70174wrr.226.1576074213202;
 Wed, 11 Dec 2019 06:23:33 -0800 (PST)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id g23sm2503783wmk.14.2019.12.11.06.23.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 11 Dec 2019 06:23:32 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Subject: [PATCH] build-sys: do not include Windows SLIRP dependencies in $LIBS
Date: Wed, 11 Dec 2019 15:23:23 +0100
Message-Id: <1576074210-52834-2-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Dec 2019 14:23:42 -0000

When including the internal SLIRP library, we should add all the libraries that
it needs for the build.  Right now they are all included by QEMU, but -liphlpapi
is not needed without slirp.  Move it from LIBS to slirp_libs.

Based on a patch by Marc-André Lureau.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index 6099be1..d16dad2 100755
--- a/configure
+++ b/configure
@@ -926,7 +926,7 @@ if test "$mingw32" = "yes" ; then
   DSOSUF=".dll"
   # MinGW needs -mthreads for TLS and macro _MT.
   QEMU_CFLAGS="-mthreads $QEMU_CFLAGS"
-  LIBS="-lwinmm -lws2_32 -liphlpapi $LIBS"
+  LIBS="-lwinmm -lws2_32 $LIBS"
   write_c_skeleton;
   if compile_prog "" "-liberty" ; then
     LIBS="-liberty $LIBS"
@@ -6069,6 +6069,9 @@ case "$slirp" in
     mkdir -p slirp
     slirp_cflags="-I\$(SRC_PATH)/slirp/src -I\$(BUILD_DIR)/slirp/src"
     slirp_libs="-L\$(BUILD_DIR)/slirp -lslirp"
+    if test "$mingw32" = "yes" ; then
+      slirp_libs="$slirp_libs -lws2_32 -liphlpapi"
+    fi
     ;;
 
   system)
-- 
1.8.3.1


