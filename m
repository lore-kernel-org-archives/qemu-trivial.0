Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SS86c-0004uN-3W
	for mharc-qemu-trivial@gnu.org; Wed, 09 May 2012 10:43:06 -0400
Received: from eggs.gnu.org ([208.118.235.92]:33625)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jim@meyering.net>) id 1SS86U-0004Uo-7d
	for qemu-trivial@nongnu.org; Wed, 09 May 2012 10:43:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jim@meyering.net>) id 1SS86N-0007pK-Ce
	for qemu-trivial@nongnu.org; Wed, 09 May 2012 10:42:57 -0400
Received: from mx.meyering.net ([88.168.87.75]:37899)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jim@meyering.net>)
	id 1SS86B-0007mf-D8; Wed, 09 May 2012 10:42:39 -0400
Received: from rho.meyering.net (localhost.localdomain [127.0.0.1])
	by rho.meyering.net (Acme Bit-Twister) with ESMTP id C3A1560090;
	Wed,  9 May 2012 16:42:37 +0200 (CEST)
From: Jim Meyering <jim@meyering.net>
To: qemu-devel@nongnu.org
Date: Wed, 09 May 2012 16:42:37 +0200
Message-ID: <87y5p1wh42.fsf@rho.meyering.net>
MIME-Version: 1.0
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 88.168.87.75
Cc: qemu-trivial@nongnu.org, patches@linaro.org
Subject: [Qemu-trivial] [PATCH] fix some common typos
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
X-List-Received-Date: Wed, 09 May 2012 14:43:04 -0000


These were identified using: http://github.com/lyda/misspell-check
which I ran like this to create a bourne shell script using GNU sed's
-i option:

git ls-files|grep -vF .bin | misspellings -f - |grep -v '^ERROR:' |perl \
-pe 's/^(.*?)\[(\d+)\]: (\w+) -> "(.*?)"$/sed -i '\''${2}s!$3!$4!'\'' $1/'

Manually eliding the FP, "rela->real" and resolving "addres" to
address (not "adders") we get this:

  sed -i '450s!thru!through!' Changelog
  sed -i '260s!neccessary!necessary!' coroutine-sigaltstack.c
  sed -i '54s!miniscule!minuscule!' disas.c
  sed -i '1094s!thru!through!' hw/usb/hcd-ehci.c
  sed -i '1095s!thru!through!' hw/usb/hcd-ehci.c
  sed -i '21s!unecessary!unnecessary!' qapi-schema-guest.json
  sed -i '307s!explictly!explicitly!' qemu-ga.c
  sed -i '490s!preceeding!preceding!' qga/commands-posix.c
  sed -i '792s!addres!address!' qga/commands-posix.c
  sed -i '6s!beeing!being!' tests/tcg/test-mmap.c

Signed-off-by: Jim Meyering <meyering@redhat.com>
---
 Changelog               | 2 +-
 coroutine-sigaltstack.c | 2 +-
 disas.c                 | 2 +-
 hw/usb/hcd-ehci.c       | 4 ++--
 qapi-schema-guest.json  | 2 +-
 qemu-ga.c               | 2 +-
 qga/commands-posix.c    | 4 ++--
 tests/tcg/test-mmap.c   | 2 +-
 8 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/Changelog b/Changelog
index 8b63258..13eebef 100644
--- a/Changelog
+++ b/Changelog
@@ -447,7 +447,7 @@ version 0.5.0:
   - multi-target build
   - fixed: no error code in hardware interrupts
   - fixed: pop ss, mov ss, x and sti disable hardware irqs for the next insn
-  - correct single stepping thru string operations
+  - correct single stepping through string operations
   - preliminary SPARC target support (Thomas M. Ogrisegg)
   - tun-fd option (Rusty Russell)
   - automatic IDE geometry detection
diff --git a/coroutine-sigaltstack.c b/coroutine-sigaltstack.c
index 7ff2d33..ddcb603 100644
--- a/coroutine-sigaltstack.c
+++ b/coroutine-sigaltstack.c
@@ -257,7 +257,7 @@ static Coroutine *coroutine_new(void)
     /*
      * Now enter the trampoline again, but this time not as a signal
      * handler. Instead we jump into it directly. The functionally
-     * redundant ping-pong pointer arithmentic is neccessary to avoid
+     * redundant ping-pong pointer arithmentic is necessary to avoid
      * type-conversion warnings related to the `volatile' qualifier and
      * the fact that `jmp_buf' usually is an array type.
      */
diff --git a/disas.c b/disas.c
index 27071c3..93d8d30 100644
--- a/disas.c
+++ b/disas.c
@@ -51,7 +51,7 @@ perror_memory (int status, bfd_vma memaddr, struct disassemble_info *info)
 			   "Address 0x%" PRIx64 " is out of bounds.\n", memaddr);
 }

-/* This could be in a separate file, to save miniscule amounts of space
+/* This could be in a separate file, to save minuscule amounts of space
    in statically linked executables.  */

 /* Just print the address is hex.  This is included for completeness even
diff --git a/hw/usb/hcd-ehci.c b/hw/usb/hcd-ehci.c
index 4ff4d40..e759c99 100644
--- a/hw/usb/hcd-ehci.c
+++ b/hw/usb/hcd-ehci.c
@@ -1091,8 +1091,8 @@ static void ehci_mem_writel(void *ptr, target_phys_addr_t addr, uint32_t val)
         break;

     case USBSTS:
-        val &= USBSTS_RO_MASK;              // bits 6 thru 31 are RO
-        ehci_clear_usbsts(s, val);          // bits 0 thru 5 are R/WC
+        val &= USBSTS_RO_MASK;              // bits 6 through 31 are RO
+        ehci_clear_usbsts(s, val);          // bits 0 through 5 are R/WC
         val = s->usbsts;
         ehci_set_interrupt(s, 0);
         break;
diff --git a/qapi-schema-guest.json b/qapi-schema-guest.json
index d7a073e..692b570 100644
--- a/qapi-schema-guest.json
+++ b/qapi-schema-guest.json
@@ -18,7 +18,7 @@
 # lexer/tokenizer/parser state should be flushed/reset in
 # preparation for reliably receiving the subsequent response. As
 # an optimization, clients may opt to ignore all data until a
-# sentinel value is receiving to avoid unecessary processing of
+# sentinel value is receiving to avoid unnecessary processing of
 # stale data.
 #
 # Similarly, clients should also precede this *request*
diff --git a/qemu-ga.c b/qemu-ga.c
index 216be39..680997e 100644
--- a/qemu-ga.c
+++ b/qemu-ga.c
@@ -304,7 +304,7 @@ static void ga_disable_non_whitelisted(void)
     g_free(list_head);
 }

-/* [re-]enable all commands, except those explictly blacklisted by user */
+/* [re-]enable all commands, except those explicitly blacklisted by user */
 static void ga_enable_non_blacklisted(GList *blacklist)
 {
     char **list_head, **list;
diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index d58730a..e448431 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -487,7 +487,7 @@ int64_t qmp_guest_fsfreeze_thaw(Error **err)
          * was returned the filesystem was *not* unfrozen by that particular
          * call.
          *
-         * since multiple preceeding FIFREEZEs require multiple calls to FITHAW
+         * since multiple preceding FIFREEZEs require multiple calls to FITHAW
          * to unfreeze, continuing issuing FITHAW until an error is returned,
          * in which case either the filesystem is in an unfreezable state, or,
          * more likely, it was thawed previously (and remains so afterward).
@@ -789,7 +789,7 @@ GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp)
             strncpy(ifr.ifr_name,  info->value->name, IF_NAMESIZE);
             if (ioctl(sock, SIOCGIFHWADDR, &ifr) == -1) {
                 snprintf(err_msg, sizeof(err_msg),
-                         "failed to get MAC addres of %s: %s",
+                         "failed to get MAC address of %s: %s",
                          ifa->ifa_name,
                          strerror(errno));
                 error_set(errp, QERR_QGA_COMMAND_FAILED, err_msg);
diff --git a/tests/tcg/test-mmap.c b/tests/tcg/test-mmap.c
index c67174a..c418b67 100644
--- a/tests/tcg/test-mmap.c
+++ b/tests/tcg/test-mmap.c
@@ -3,7 +3,7 @@
  *
  * When running qemu-linux-user with the -p flag, you may need to tell
  * this test program about the pagesize because getpagesize() will not reflect
- * the -p choice. Simply pass one argument beeing the pagesize.
+ * the -p choice. Simply pass one argument being the pagesize.
  *
  * Copyright (c) 2007 AXIS Communications AB
  * Written by Edgar E. Iglesias.
--
1.7.10.1.487.ga3935e6

