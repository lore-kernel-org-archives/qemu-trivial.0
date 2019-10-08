Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iHkrF-0006Ff-15
	for mharc-qemu-trivial@gnu.org; Tue, 08 Oct 2019 04:28:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55450)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iHkr9-0006Eu-TH
 for qemu-trivial@nongnu.org; Tue, 08 Oct 2019 04:28:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iHkr8-0005gk-PE
 for qemu-trivial@nongnu.org; Tue, 08 Oct 2019 04:28:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36326)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>)
 id 1iHkr2-0005Vz-H9; Tue, 08 Oct 2019 04:28:24 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E6A2F18C4288;
 Tue,  8 Oct 2019 08:28:21 +0000 (UTC)
Received: from thuth.com (dhcp-200-228.str.redhat.com [10.33.200.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2E0765D9C9;
 Tue,  8 Oct 2019 08:28:20 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-trivial@nongnu.org
Subject: [PATCH v2] Makefile: Remove generated files when doing 'distclean'
 (and 'clean')
Date: Tue,  8 Oct 2019 10:28:15 +0200
Message-Id: <20191008082815.8267-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.62]); Tue, 08 Oct 2019 08:28:21 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
X-List-Received-Date: Tue, 08 Oct 2019 08:28:33 -0000

When running "make distclean" we currently leave a lot of generated
files in the build directory. These should be completely removed.
Some of the generated files are removed in the "clean" target (which
is a prerequisite for the "distclean" target), since binary files
should be removed in this step already.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 v2:
 - Remove tests/qemu-iotests/common.env in "distclean", not in "clean"
 - Improved patch description

 Makefile               |  6 +++---
 tests/Makefile.include | 12 +++++++++++-
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index 30f0abfb42..767b1ffb25 100644
--- a/Makefile
+++ b/Makefile
@@ -696,14 +696,14 @@ clean: recurse-clean
 		-exec rm {} +
 	rm -f $(edk2-decompressed)
 	rm -f $(filter-out %.tlb,$(TOOLS)) $(HELPERS-y) TAGS cscope.* *.pod *~ */*~
-	rm -f fsdev/*.pod scsi/*.pod
+	rm -f fsdev/*.pod scsi/*.pod docs/*.pod docs/*/*.pod docs/*/.buildinfo
 	rm -f qemu-img-cmds.h
 	rm -f ui/shader/*-vert.h ui/shader/*-frag.h
 	@# May not be present in generated-files-y
 	rm -f trace/generated-tracers-dtrace.dtrace*
 	rm -f trace/generated-tracers-dtrace.h*
 	rm -f $(foreach f,$(generated-files-y),$(f) $(f)-timestamp)
-	rm -f qapi-gen-timestamp
+	rm -f qapi-gen-timestamp vhost-user-input
 	rm -rf qga/qapi-generated
 	rm -f config-all-devices.mak
 
@@ -724,7 +724,7 @@ distclean: clean
 	rm -f tests/tcg/config-*.mak
 	rm -f config-all-devices.mak config-all-disas.mak config.status
 	rm -f $(SUBDIR_DEVICES_MAK)
-	rm -f po/*.mo tests/qemu-iotests/common.env
+	rm -f po/*.mo
 	rm -f roms/seabios/config.mak roms/vgabios/config.mak
 	rm -f qemu-doc.info qemu-doc.aux qemu-doc.cp qemu-doc.cps
 	rm -f qemu-doc.fn qemu-doc.fns qemu-doc.info qemu-doc.ky qemu-doc.kys
diff --git a/tests/Makefile.include b/tests/Makefile.include
index 3543451ed3..694f193fb6 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -1176,11 +1176,21 @@ check: check-block check-qapi-schema check-unit check-softfloat check-qtest chec
 check-clean:
 	rm -rf $(check-unit-y) tests/*.o $(QEMU_IOTESTS_HELPERS-y)
 	rm -rf $(sort $(foreach target,$(SYSEMU_TARGET_LIST), $(check-qtest-$(target)-y)) $(check-qtest-generic-y))
-	rm -f tests/test-qapi-gen-timestamp
 	rm -rf $(TESTS_VENV_DIR) $(TESTS_RESULTS_DIR)
+	rm -f tests/test-qapi-gen-timestamp tests/qht-bench$(EXESUF) \
+		tests/fp/fp-test tests/fp/*.out tests/qapi-schema/*.test.*
 
 clean: check-clean
 
+check-distclean:
+	rm -f tests/qemu-iotests/common.env tests/qemu-iotests/check.*
+	rm -f tests/test-qapi-types*.c tests/test-qapi-visit*.c \
+		tests/test-qapi-commands*.c tests/test-qapi-events*.c \
+		tests/test-qapi-emit-events.[ch] tests/test-qapi-introspect.c \
+		tests/include/test-qapi-*.c
+
+distclean: check-distclean
+
 # Build the help program automatically
 
 all: $(QEMU_IOTESTS_HELPERS-y)
-- 
2.18.1


