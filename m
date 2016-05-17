Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b2dA7-00072S-A6
	for mharc-qemu-trivial@gnu.org; Tue, 17 May 2016 07:27:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34344)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1b2dA5-0006zT-Bp
	for qemu-trivial@nongnu.org; Tue, 17 May 2016 07:27:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1b2dA0-0006vD-Eb
	for qemu-trivial@nongnu.org; Tue, 17 May 2016 07:27:41 -0400
Received: from orth.archaic.org.uk ([81.2.115.148]:49362)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1b2dA0-0006sr-8B
	for qemu-trivial@nongnu.org; Tue, 17 May 2016 07:27:36 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1b2d9w-0007Rx-8s; Tue, 17 May 2016 12:27:32 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-trivial@nongnu.org
Date: Tue, 17 May 2016 12:27:31 +0100
Message-Id: <1463484451-22979-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 81.2.115.148
Subject: [Qemu-trivial] [PATCH] Remove config-devices.mak on 'make clean'
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
X-List-Received-Date: Tue, 17 May 2016 11:27:42 -0000

Our dependency mechanism works like this:
 * on first build there is neither a .o nor a .d
 * we create the .d as a side effect of creating the .o
 * for rebuilds we know when we need to update the .o,
   which also updates the .d

This system requires that you're never in a situation where there is
a .o file but no .d (because then we will never realise we need to
build the .d, and we will not have the dependency information about
when to rebuild the .o).

This is working fine for our object files, but we also try to use it
for $TARGET/config-devices.mak (where the dependency file is
in $TARGET-config-devices.mak.d). Unfortunately "make clean" doesn't
remove config-devices.mak, which means that it puts us in the
forbidden situation of "object file exists but not its .d file".
This in turn means that we will fail to notice when we need to rebuild:
  mkdir build/depbug
  (cd build/depbug && '../../configure')
  make -C build/depbug -j8
  make -C build/depbug clean
  echo "CONFIG_CANARY = y" >> default-configs/arm-softmmu.mak
  make -C build/depbug
  grep CANARY build/depbug/aarch64-softmmu/config-devices.mak

The CANARY token should show up in config-devices.mak but does not.

Fix this bug by making "make clean" delete the config-devices.mak files.
config-all-devices.mak doesn't have the same problem since it has
no .d file, but delete it too, since it is created by "make" and
logically should be removed by "make clean".

(Note that it is important not to remove config-devices.mak until
after we have recursively run 'make clean' in the subdirectories.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index 1d076a9..a5d7e62 100644
--- a/Makefile
+++ b/Makefile
@@ -356,6 +356,7 @@ clean:
 	if test -d $$d; then $(MAKE) -C $$d $@ || exit 1; fi; \
 	rm -f $$d/qemu-options.def; \
         done
+	rm -f $(SUBDIR_DEVICES_MAK) config-all-devices.mak
 
 VERSION ?= $(shell cat VERSION)
 
-- 
1.9.1


