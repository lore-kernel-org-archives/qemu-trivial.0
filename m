Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b0Ger-00015P-Vk
	for mharc-qemu-trivial@gnu.org; Tue, 10 May 2016 19:01:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57655)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jrtc27@jrtc27.com>) id 1b0F1J-0001Nb-Gj
	for qemu-trivial@nongnu.org; Tue, 10 May 2016 17:16:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jrtc27@jrtc27.com>) id 1b0F1F-0001TN-60
	for qemu-trivial@nongnu.org; Tue, 10 May 2016 17:16:44 -0400
Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242]:33843)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jrtc27@jrtc27.com>) id 1b0F1E-0001TF-SH
	for qemu-trivial@nongnu.org; Tue, 10 May 2016 17:16:41 -0400
Received: by mail-wm0-x242.google.com with SMTP id n129so5327427wmn.1
	for <qemu-trivial@nongnu.org>; Tue, 10 May 2016 14:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jrtc27.com; s=google;
	h=date:from:to:cc:subject:message-id:mime-version:content-disposition
	:user-agent; bh=dJOimZeHyZvqBiD5rsE3tAR/UIHhDWuWnGdhU/E179U=;
	b=oQskLcegWR10fo95BHiJGaxOs0eThmOaNuAJytWu9UFpNKix8k1J5A9ClayxYJtWSz
	1kFA5ICC+PbWn7uGIQB0NhaHNt5O8513Uwxn3Qx+0mqmzV9YSzdWf9ZvQnMIq0rbcjK6
	4yyfyi7ejDuBObyY/h3dd3+i+7Ao3+s0gnXak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=dJOimZeHyZvqBiD5rsE3tAR/UIHhDWuWnGdhU/E179U=;
	b=QQmdo9WRAes5MMhvR/D69A0rg7ON01HlTh7yPM6lohMEn/uC8lUJUIPjp5xsd3ssr5
	OedGTng5pMH5EspMUqLC4sybcQSFn7vtsVxrVPLg7/6GY4ZQCdStIk0jbDlFmd5jVWLw
	xLM9hkFddZcaaoJlxf+dXLPlijjoP0QlfMlBV3bTiocqo/lUcZ7jQXGU3oz7x5bTkKUX
	hmU6nm7x4sLkCSBpfDQnJTZfwuKyVY3UzRROI5bFHWlSQHrDeBkxl7h+E7HzIaMPiJdS
	z8TauslF8Wsx1S0tHgnQEOUHhnl0pHhxwDsV7Kbm8iOvc70J3gnGPL7BzP+fStPuiQJy
	jjjQ==
X-Gm-Message-State: AOPr4FW5RccCfl6fAgtRkY47o7vDvDsPhH8SP5vLwtkHaB9o6S0WBK9dFzbx7euIMhhI7A==
X-Received: by 10.194.76.137 with SMTP id k9mr41357651wjw.3.1462914998845;
	Tue, 10 May 2016 14:16:38 -0700 (PDT)
Received: from Jamess-MacBook.local (global-184-8.nat-1.net.cam.ac.uk.
	[131.111.184.8])
	by smtp.gmail.com with ESMTPSA id e8sm5013547wma.2.2016.05.10.14.16.37
	(version=TLS1 cipher=AES128-SHA bits=128/128);
	Tue, 10 May 2016 14:16:37 -0700 (PDT)
Received: by Jamess-MacBook.local (Postfix, from userid 501)
	id 585D0366CCD8; Tue, 10 May 2016 22:16:35 +0100 (BST)
Date: Tue, 10 May 2016 22:16:35 +0100
From: James Clarke <jrtc27@jrtc27.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, James Clarke <jrtc27@jrtc27.com>
Message-ID: <20160510211635.GA48818@Jamess-MacBook.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.6.1 (2016-04-27)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::242
X-Mailman-Approved-At: Tue, 10 May 2016 19:01:41 -0400
Subject: [Qemu-trivial] [PATCH] Fix linking relocatable objects on Sparc
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
X-List-Received-Date: Tue, 10 May 2016 21:16:47 -0000

On Sparc, gcc implicitly passes --relax to the linker, but -r is
incompatible with this. Therefore, if --no-relax is supported, it should
be passed to the linker.

Signed-off-by: James Clarke <jrtc27@jrtc27.com>
---
 configure | 13 +++++++++++++
 rules.mak |  2 +-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index c37fc5f..c3583b2 100755
--- a/configure
+++ b/configure
@@ -4508,6 +4508,18 @@ if compile_prog "" "" ; then
     have_fsxattr=yes
 fi
 
+#################################################
+# Sparc implicitly links with --relax, which is
+# incompatible with -r. It does no harm to give
+# it on other platforms too.
+
+cat > $TMPC << EOF
+int foo(void) { return 0; }
+EOF
+if compile_prog "" "-nostdlib -Wl,-r -Wl,--no-relax"; then
+  LD_REL_FLAGS="-Wl,--no-relax"
+fi
+
 ##########################################
 # End of CC checks
 # After here, no more $cc or $ld runs
@@ -5513,6 +5525,7 @@ else
 fi
 echo "LDFLAGS=$LDFLAGS" >> $config_host_mak
 echo "LDFLAGS_NOPIE=$LDFLAGS_NOPIE" >> $config_host_mak
+echo "LD_REL_FLAGS=$LD_REL_FLAGS" >> $config_host_mak
 echo "LIBS+=$LIBS" >> $config_host_mak
 echo "LIBS_TOOLS+=$libs_tools" >> $config_host_mak
 echo "EXESUF=$EXESUF" >> $config_host_mak
diff --git a/rules.mak b/rules.mak
index d1ff311..fc2c961 100644
--- a/rules.mak
+++ b/rules.mak
@@ -93,7 +93,7 @@ module-common.o: CFLAGS += $(DSO_OBJ_CFLAGS)
 	$(if $(findstring /,$@),$(call quiet-command,cp $@ $(subst /,-,$@), "  CP    $(subst /,-,$@)"))
 
 
-LD_REL := $(CC) -nostdlib -Wl,-r
+LD_REL := $(CC) -nostdlib -Wl,-r $(LD_REL_FLAGS)
 
 %.mo:
 	$(call quiet-command,$(LD_REL) -o $@ $^,"  LD -r $(TARGET_DIR)$@")
-- 
2.8.2


