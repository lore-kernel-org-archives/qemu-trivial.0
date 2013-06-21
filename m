Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Uq0xM-0004WU-9L
	for mharc-qemu-trivial@gnu.org; Fri, 21 Jun 2013 09:00:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53457)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1Uq0xD-0004OI-A1
	for qemu-trivial@nongnu.org; Fri, 21 Jun 2013 09:00:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1Uq0xA-0005vf-JE
	for qemu-trivial@nongnu.org; Fri, 21 Jun 2013 09:00:39 -0400
Received: from
	1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.d.1.0.0.b.8.0.1.0.0.2.ip6.arpa
	([2001:8b0:1d0::1]:58030 helo=mnementh.archaic.org.uk)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1Uq0wx-0005tw-LA; Fri, 21 Jun 2013 09:00:23 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1Uq0wr-00075h-2J; Fri, 21 Jun 2013 14:00:17 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 21 Jun 2013 14:00:17 +0100
Message-Id: <1371819617-27232-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-trivial@nongnu.org, Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	David Gibson <david@gibson.dropbear.id.au>, patches@linaro.org
Subject: [Qemu-trivial] [PATCH] Makefile: pass include directives to dtc via
	CPPFLAGS, not CFLAGS
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
X-List-Received-Date: Fri, 21 Jun 2013 13:00:46 -0000

The dtc submodule's makefile expects -I include directives to be
in CPPFLAGS, not CFLAGS. Getting this wrong meant that the include
directive would not be applied when generating the dependency .d
files. This in turn meant that we couldn't build libfdt when
doing an out of tree build with clang. (gcc's dependency output
is slightly different from clang in this situation so it happened
to work.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Tracking this down was not made any easier by make bug
http://savannah.gnu.org/bugs/index.php?15110 which meant that
make silently exited without saying anything about what was wrong...

 Makefile |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 3cfa7d0..c06bfab 100644
--- a/Makefile
+++ b/Makefile
@@ -146,10 +146,11 @@ $(SRC_PATH)/pixman/configure:
 	(cd $(SRC_PATH)/pixman; autoreconf -v --install)
 
 DTC_MAKE_ARGS=-I$(SRC_PATH)/dtc VPATH=$(SRC_PATH)/dtc -C dtc V="$(V)" LIBFDT_srcdir=$(SRC_PATH)/dtc/libfdt
-DTC_CFLAGS=$(CFLAGS) $(QEMU_CFLAGS) -I$(BUILD_DIR)/dtc -I$(SRC_PATH)/dtc -I$(SRC_PATH)/dtc/libfdt
+DTC_CFLAGS=$(CFLAGS) $(QEMU_CFLAGS)
+DTC_CPPFLAGS=-I$(BUILD_DIR)/dtc -I$(SRC_PATH)/dtc -I$(SRC_PATH)/dtc/libfdt
 
 subdir-dtc:dtc/libfdt dtc/tests
-	$(call quiet-command,$(MAKE) $(DTC_MAKE_ARGS) CFLAGS="$(DTC_CFLAGS)" LDFLAGS="$(LDFLAGS)" ARFLAGS="$(ARFLAGS)" CC="$(CC)" AR="$(AR)" LD="$(LD)" $(SUBDIR_MAKEFLAGS) libfdt/libfdt.a,)
+	$(call quiet-command,$(MAKE) $(DTC_MAKE_ARGS) CPPFLAGS="$(DTC_CPPFLAGS)" CFLAGS="$(DTC_CFLAGS)" LDFLAGS="$(LDFLAGS)" ARFLAGS="$(ARFLAGS)" CC="$(CC)" AR="$(AR)" LD="$(LD)" $(SUBDIR_MAKEFLAGS) libfdt/libfdt.a,)
 
 dtc/%:
 	mkdir -p $@
-- 
1.7.9.5


