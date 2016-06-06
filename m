Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b9sJH-0003Em-NA
	for mharc-qemu-trivial@gnu.org; Mon, 06 Jun 2016 07:03:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59651)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jrtc27@jrtc27.com>) id 1b9sJD-0003Bt-Uq
	for qemu-trivial@nongnu.org; Mon, 06 Jun 2016 07:03:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jrtc27@jrtc27.com>) id 1b9sJ5-0006jD-4h
	for qemu-trivial@nongnu.org; Mon, 06 Jun 2016 07:03:02 -0400
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244]:35634)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jrtc27@jrtc27.com>) id 1b9sJ3-0006iq-QV
	for qemu-trivial@nongnu.org; Mon, 06 Jun 2016 07:02:55 -0400
Received: by mail-wm0-x244.google.com with SMTP id k184so9123562wme.2
	for <qemu-trivial@nongnu.org>; Mon, 06 Jun 2016 04:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jrtc27.com; s=google;
	h=date:from:to:cc:subject:message-id:mime-version:content-disposition
	:user-agent; bh=A2LcBt18c8RBaB+yl7JPYw9O4IQX72L6Vkdu8Bd0B2s=;
	b=YnQ7oF3VDTNakAls7mnXs7MyXTXqMvSfP+LAjKg7qEw7kUfy0tWSiT/SSwiQf4V0pr
	bzzUwIuAT3t1LRVX14oifJdxZh9zlk5L7bmOmU4YNG8O7zg8vsZsLuEnZD+T8CYiALkp
	lTWNz4C62ZWa2thg+Wwbsl9Vp6TToc76W3kWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=A2LcBt18c8RBaB+yl7JPYw9O4IQX72L6Vkdu8Bd0B2s=;
	b=ekqJxCkQfDdCJyLEbuzuPLyoJPid/s+UIkrsW9od1EFQxj/WtTD8EWs9sccK92z24U
	3Mb8J886C9R8R4ZxxUbAmCErFOEuvGRHlstgynGksYm4DKXVYW4sqRkW1fT4+PgCOEVI
	MbHMoAsD4aoDdj6GhpEbTk5t3ziF40YDUqHeKtgA5XEimaNRQaIVQb4alQX/ZcQPUPg+
	V/jsQ8kQTe2YhuEl5purdjrCdWgqJ9oZSYBhMSsFywiW3ztJ2ou5Un7PaRnghVju9l1p
	iCvDxNckE26di7mdWb1acNIYwOzgBXtvxg9mbcWFLca1tWPLE6rl5vJWZSg8azIRJdyC
	0jBg==
X-Gm-Message-State: ALyK8tIKy3GL93vy88AcOL1YIqZNMiLX69JylWNpA4LwCe5UVhWLrFzVGQLQGdKmwJwl9g==
X-Received: by 10.194.139.104 with SMTP id qx8mr14588830wjb.14.1465210971950; 
	Mon, 06 Jun 2016 04:02:51 -0700 (PDT)
Received: from Jamess-MacBook.local (global-184-8.nat-1.net.cam.ac.uk.
	[131.111.184.8]) by smtp.gmail.com with ESMTPSA id
	kq9sm19670427wjc.26.2016.06.06.04.02.50
	(version=TLS1 cipher=AES128-SHA bits=128/128);
	Mon, 06 Jun 2016 04:02:51 -0700 (PDT)
Received: by Jamess-MacBook.local (Postfix, from userid 501)
	id 5716639080A2; Mon,  6 Jun 2016 12:02:50 +0100 (BST)
Date: Mon, 6 Jun 2016 12:02:50 +0100
From: James Clarke <jrtc27@jrtc27.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Message-ID: <20160606110250.GA43977@Jamess-MacBook.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.6.1 (2016-04-27)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::244
Subject: [Qemu-trivial] [PATCH v2] Fix linking relocatable objects on Sparc
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
X-List-Received-Date: Mon, 06 Jun 2016 11:03:07 -0000

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

Regards,
James

 configure | 23 ++++++++++++++++++++++-
 rules.mak |  2 +-
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index b5aab72..4ce7061 100755
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
@@ -4948,7 +4968,7 @@ if test "$mingw32" = "yes" ; then
     echo "CONFIG_QGA_NTDDDISK=y" >> $config_host_mak
   fi
   if test "$guest_agent_msi" = "yes"; then
-    echo "QEMU_GA_MSI_ENABLED=yes" >> $config_host_mak  
+    echo "QEMU_GA_MSI_ENABLED=yes" >> $config_host_mak
     echo "QEMU_GA_MSI_MINGW_DLL_PATH=${QEMU_GA_MSI_MINGW_DLL_PATH}" >> $config_host_mak
     echo "QEMU_GA_MSI_WITH_VSS=${QEMU_GA_MSI_WITH_VSS}" >> $config_host_mak
     echo "QEMU_GA_MSI_ARCH=${QEMU_GA_MSI_ARCH}" >> $config_host_mak
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


