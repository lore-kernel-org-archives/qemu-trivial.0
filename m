Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b9sSR-0007vT-Ig
	for mharc-qemu-trivial@gnu.org; Mon, 06 Jun 2016 07:12:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33731)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jrtc27@jrtc27.com>) id 1b9sSP-0007uQ-UL
	for qemu-trivial@nongnu.org; Mon, 06 Jun 2016 07:12:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jrtc27@jrtc27.com>) id 1b9sSJ-0008VK-4u
	for qemu-trivial@nongnu.org; Mon, 06 Jun 2016 07:12:32 -0400
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241]:34656)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jrtc27@jrtc27.com>) id 1b9sSI-0008VB-UT
	for qemu-trivial@nongnu.org; Mon, 06 Jun 2016 07:12:27 -0400
Received: by mail-wm0-x241.google.com with SMTP id n184so15581862wmn.1
	for <qemu-trivial@nongnu.org>; Mon, 06 Jun 2016 04:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jrtc27.com; s=google;
	h=date:from:to:cc:subject:message-id:mime-version:content-disposition
	:in-reply-to:user-agent;
	bh=9DKiVB/xCt1xWB/NR8YblGqYOvaU+I6cRoKld48V9sY=;
	b=X/Ay4tT8ppREDwRhapLu4ktmVo2roR+G+bHf6QbouTwVsZilSnBZFdmH77Oc2wEy0y
	U7Aht1w5SsYuTiRjLzDUIh61ZkvQQl12VlZwCf8bvSsME8k/aEpfy3VwN8C0PPIgczFn
	Z5m+4IqaDsG0bhfRCY3vHmYuEv5x6yqSXoHeI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=9DKiVB/xCt1xWB/NR8YblGqYOvaU+I6cRoKld48V9sY=;
	b=TTuFkjn76Ch1LjCGrK7SJXCZwdL631ZUCHvY7vRXaDiZoVAN8rSIZzDZI9o0ceO7vs
	BcwVjy26rV9NcG14mRH29+qOC0D55iFT1p+rgVi0tz9F49L3/CG4yUCNoLR9k9bl78ct
	3ZATQiYQ29ElJCOylgorvzeqoQrBi33+ao0huFF8FJUiownqluLCbJoAQR6LxL9v5ZL7
	miLc3nI1XYsL3CHVUOQiCiS2AtxpIVkZ0odPWZ2RP4ocoLis2Hr44HybAHI8e/0b8Pmw
	/GNgS9v4QCZ7Cts4jSYu3+sd5Kk1+479WbQQO5hb7nlm5BlNsEW6LaJklYES7NbPq7d3
	6epQ==
X-Gm-Message-State: ALyK8tKnePMhit6l3PNLOw/Y0njcSTjsAsBLSbW7W9sxhGkvlvUmJGAtZrtzbibvOqHZBA==
X-Received: by 10.28.129.20 with SMTP id c20mr12157755wmd.46.1465211546157;
	Mon, 06 Jun 2016 04:12:26 -0700 (PDT)
Received: from Jamess-MacBook.local (global-184-8.nat-1.net.cam.ac.uk.
	[131.111.184.8]) by smtp.gmail.com with ESMTPSA id
	dl5sm4966605wjd.32.2016.06.06.04.12.24
	(version=TLS1 cipher=AES128-SHA bits=128/128);
	Mon, 06 Jun 2016 04:12:25 -0700 (PDT)
Received: by Jamess-MacBook.local (Postfix, from userid 501)
	id 85C7139083D4; Mon,  6 Jun 2016 12:12:24 +0100 (BST)
Date: Mon, 6 Jun 2016 12:12:24 +0100
From: James Clarke <jrtc27@jrtc27.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Message-ID: <20160606111224.GA45022@Jamess-MacBook.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8kPTVPjVYHyismDb4vvZVBmK8kGdCEVrvoVontSW91+A@mail.gmail.com>
User-Agent: Mutt/1.6.1 (2016-04-27)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::241
Subject: [Qemu-trivial] [PATCH v3] Fix linking relocatable objects on Sparc
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
X-List-Received-Date: Mon, 06 Jun 2016 11:12:35 -0000

On Sparc, gcc implicitly passes --relax to the linker, but -r is
incompatible with this. Therefore, if --no-relax is supported, it should
be passed to the linker.

Signed-off-by: James Clarke <jrtc27@jrtc27.com>
---
Hi Peter,
Sorry about that, I wasn't building in a git repository, so werror was
set to no (I was unaware of the configure script doing so). I have now
tested it with werror enabled, and it works (and could reproduce the
error with the previous version).

I reworked the test slightly to mirror what the Makefile rules actually
do, as trying to combine the compilation and ld -r steps doesn't work
when CLFAGS contains -pie, which was leading to x86_64 believing that
--no-relax was not a valid option.

I also accidentally included a whitespace change in v2; sorry for the
noise.

Regards,
James

 configure | 21 +++++++++++++++++++++
 rules.mak |  2 +-
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index b5aab72..70237b0 100755
--- a/configure
+++ b/configure
@@ -31,6 +31,7 @@ TMPCXX="${TMPDIR1}/${TMPB}.cxx"
 TMPL="${TMPDIR1}/${TMPB}.lo"
 TMPA="${TMPDIR1}/lib${TMPB}.la"
 TMPE="${TMPDIR1}/${TMPB}.exe"
+TMPMO="${TMPDIR1}/${TMPB}.mo"
 
 rm -f config.log
 
@@ -4526,6 +4527,25 @@ if compile_prog "" "" ; then
     have_fsxattr=yes
 fi
 
+#################################################
+# Sparc implicitly links with --relax, which is
+# incompatible with -r, so --no-relax should be
+# given. It does no harm to give it on other
+# platforms too.
+
+# Note: the prototype is needed since QEMU_CFLAGS
+#       contains -Wmissing-prototypes
+cat > $TMPC << EOF
+extern int foo(void);
+int foo(void) { return 0; }
+EOF
+if ! compile_object ""; then
+  error_exit "Failed to compile object file for LD_REL_FLAGS test"
+fi
+if do_cc -nostdlib -Wl,-r -Wl,--no-relax -o $TMPMO $TMPO; then
+  LD_REL_FLAGS="-Wl,--no-relax"
+fi
+
 ##########################################
 # End of CC checks
 # After here, no more $cc or $ld runs
@@ -5529,6 +5549,7 @@ else
 fi
 echo "LDFLAGS=$LDFLAGS" >> $config_host_mak
 echo "LDFLAGS_NOPIE=$LDFLAGS_NOPIE" >> $config_host_mak
+echo "LD_REL_FLAGS=$LD_REL_FLAGS" >> $config_host_mak
 echo "LIBS+=$LIBS" >> $config_host_mak
 echo "LIBS_TOOLS+=$libs_tools" >> $config_host_mak
 echo "EXESUF=$EXESUF" >> $config_host_mak
diff --git a/rules.mak b/rules.mak
index 4a8f464..dca5718 100644
--- a/rules.mak
+++ b/rules.mak
@@ -95,7 +95,7 @@ module-common.o: CFLAGS += $(DSO_OBJ_CFLAGS)
 	$(if $(findstring /,$@),$(call quiet-command,cp $@ $(subst /,-,$@), "  CP    $(subst /,-,$@)"))
 
 
-LD_REL := $(CC) -nostdlib -Wl,-r
+LD_REL := $(CC) -nostdlib -Wl,-r $(LD_REL_FLAGS)
 
 %.mo:
 	$(call quiet-command,$(LD_REL) -o $@ $^,"  LD -r $(TARGET_DIR)$@")
-- 
2.8.3


