Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UXmYO-0001mU-77
	for mharc-qemu-trivial@gnu.org; Thu, 02 May 2013 01:59:40 -0400
Received: from eggs.gnu.org ([208.118.235.92]:60711)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UXmYL-0001hl-AK
	for qemu-trivial@nongnu.org; Thu, 02 May 2013 01:59:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UXmYJ-0005YX-Gx
	for qemu-trivial@nongnu.org; Thu, 02 May 2013 01:59:37 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:34365)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UXmYF-0005Tz-E6; Thu, 02 May 2013 01:59:31 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id C4D42400B7;
	Thu,  2 May 2013 09:59:21 +0400 (MSK)
Message-ID: <518200B7.5020703@msgid.tls.msk.ru>
Date: Thu, 02 May 2013 09:59:19 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/17.0 Icedove/17.0
MIME-Version: 1.0
To: Anthony Liguori <aliguori@us.ibm.com>
X-Enigmail-Version: 1.6a1pre
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PULL] Trivial patches for 2013-05-02
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
X-List-Received-Date: Thu, 02 May 2013 05:59:39 -0000

Hello.

As Stefan Hajnoczi mentioned yesterday, I'll try to maintain qemu-trivial
patch queue.  So here goes the first pull request, with just 3 really
trivial patches.  For now I push the changes into my repository, availabl=
e
also as http://git.corpit.ru/?p=3Dqemu.git;a=3Dshortlog;h=3Drefs/heads/tr=
ivial-patches .

The patches included this week are really trivial.  There are a few other
patches pending on the qemu-trivial mailing list, but due to several reas=
ons
I weren't able to do any good testing/review of thes - will do that for t=
he
next pull request.  There are a series of holidays here in Russia, first =
is
1st-2nd May "International workers day", plus a weekend, and second is th=
e
Victory day (9th may, end of World War II), also with a weekend, and ever=
yone
here goes out of city.  That's why I'm sending pull request at Thursday
instead of usual Friday.

For the other patches already submitted to -trivial, I've the following p=
lans:
 "translate: remove redundantly included qemu/timer.h" by liguang --
   pending Signed-off-by.
 "m25p80.c: Sync Flash chip list with Linux" by Ed Maste --
   I want to actually take a look and compare the resulting thing with th=
e
   list in linux kernel.  Will hopefully do for the next pull request.
 "bsd-user: OS-agnostic 64-bit SYSCTL types" by Ed Maste --
   also I want to verify that it works, for that I'll have to install som=
e
   FreeBSD guest or maybe find the changes in their #include's to see wha=
t's
   it all about.
 "SMBUS module update" by Maksim_Ratnikov --
   I don't think this qualifies for -trivial, and the submission is done =
in
   html form.  Pending resubmission in correct form to qemu-devel and the
   appropriate maintainer.

So even if I included all changes so far, the pull requests weren't much
larger anyway :)

Also, I'm still trying to figure out how qemu-trivial is, and should be,
maintained, and doing stuff without any automation, so things may be a
bit rough for the first time.  This is, ofcourse, fixable later ;)

As mentioned above, due to holiday I won't be available until Monday.

Below is the actual pull request, with whole diff appended (since it is
rather small), for easier review.  Please pull :)

/mjt

The following changes since commit e9016ee2bda1b7757072b856b2196f691aee33=
88:

  virtio-net: count VIRTIO_NET_F_MAC when calculating config_len (2013-04=
-30 16:04:24 -0500)

are available in the git repository at:

  git://git.corpit.ru/qemu.git trivial-patches

for you to fetch changes up to 6e860b5db4c76c66d7e02f93c9e22e0384bd3c6c:

  pvscsi: fix compilation on 32 bit hosts (2013-05-01 21:00:20 +0400)

----------------------------------------------------------------
Andreas F=C3=A4rber (1):
      configure: Pick up libseccomp include path

Herv=C3=A9 Poussineau (1):
      pvscsi: fix compilation on 32 bit hosts

Stefan Weil (1):
      Trivial grammar and spelling fixes

 configure                |    1 +
 hw/moxie/moxiesim.c      |    2 +-
 include/hw/stream.h      |    6 +++---
 include/sysemu/rng.h     |    2 +-
 qmp-commands.hx          |    2 +-
 target-s390x/translate.c |    2 +-
 trace-events             |    2 +-
 7 files changed, 9 insertions(+), 8 deletions(-)
mjt@gandalf:/build/kvm/git$ git request-pull --help
mjt@gandalf:/build/kvm/git$ git request-pull -p qemu/master git://git.cor=
pit.ru/qemu.git
The following changes since commit e9016ee2bda1b7757072b856b2196f691aee33=
88:

  virtio-net: count VIRTIO_NET_F_MAC when calculating config_len (2013-04=
-30 16:04:24 -0500)

are available in the git repository at:

  git://git.corpit.ru/qemu.git trivial-patches

for you to fetch changes up to 6e860b5db4c76c66d7e02f93c9e22e0384bd3c6c:

  pvscsi: fix compilation on 32 bit hosts (2013-05-01 21:00:20 +0400)

----------------------------------------------------------------
Andreas F=C3=A4rber (1):
      configure: Pick up libseccomp include path

Herv=C3=A9 Poussineau (1):
      pvscsi: fix compilation on 32 bit hosts

Stefan Weil (1):
      Trivial grammar and spelling fixes

 configure                |    1 +
 hw/moxie/moxiesim.c      |    2 +-
 include/hw/stream.h      |    6 +++---
 include/sysemu/rng.h     |    2 +-
 qmp-commands.hx          |    2 +-
 target-s390x/translate.c |    2 +-
 trace-events             |    2 +-
 7 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/configure b/configure
index d91b141..c4d85ba 100755
--- a/configure
+++ b/configure
@@ -1499,6 +1499,7 @@ libs_softmmu=3D"$libs_softmmu -lz"
 if test "$seccomp" !=3D "no" ; then
     if $pkg_config --atleast-version=3D1.0.0 libseccomp --modversion >/d=
ev/null 2>&1; then
         libs_softmmu=3D"$libs_softmmu `$pkg_config --libs libseccomp`"
+        QEMU_CFLAGS=3D"$QEMU_CFLAGS `$pkg_config --cflags libseccomp`"
 	seccomp=3D"yes"
     else
 	if test "$seccomp" =3D "yes"; then
diff --git a/hw/moxie/moxiesim.c b/hw/moxie/moxiesim.c
index 70bf28f..649f9a7 100644
--- a/hw/moxie/moxiesim.c
+++ b/hw/moxie/moxiesim.c
@@ -1,7 +1,7 @@
 /*
  * QEMU/moxiesim emulation
  *
- * Emulates a very simple machine model similiar to the one use by the
+ * Emulates a very simple machine model similar to the one used by the
  * GDB moxie simulator.
  *
  * Copyright (c) 2008, 2009, 2010, 2013 Anthony Green
diff --git a/include/hw/stream.h b/include/hw/stream.h
index 35eb083..30ccc56 100644
--- a/include/hw/stream.h
+++ b/include/hw/stream.h
@@ -25,9 +25,9 @@ typedef struct StreamSlaveClass {
     /**
      * can push - determine if a stream slave is capable of accepting at=
 least
      * one byte of data. Returns false if cannot accept. If not implemen=
ted, the
-     * slave is assumed to always be capable of recieveing.
+     * slave is assumed to always be capable of receiving.
      * @notify: Optional callback that the slave will call when the slav=
e is
-     * capable of recieving again. Only called if false is returned.
+     * capable of receiving again. Only called if false is returned.
      * @notify_opaque: opaque data to pass to notify call.
      */
     bool (*can_push)(StreamSlave *obj, StreamCanPushNotifyFn notify,
@@ -37,7 +37,7 @@ typedef struct StreamSlaveClass {
      * returned. If the slave short returns, the master must wait before=
 trying
      * again, the slave may continue to just return 0 waiting for the vm=
 time to
      * advance. The can_push() function can be used to trap the point in=
 time
-     * where the slave is ready to recieve again, otherwise polling on a=
 QEMU
+     * where the slave is ready to receive again, otherwise polling on a=
 QEMU
      * timer will work.
      * @obj: Stream slave to push to
      * @buf: Data to write
diff --git a/include/sysemu/rng.h b/include/sysemu/rng.h
index 509abd0..7637fac 100644
--- a/include/sysemu/rng.h
+++ b/include/sysemu/rng.h
@@ -37,7 +37,7 @@ struct RngBackendClass
     ObjectClass parent_class;

     void (*request_entropy)(RngBackend *s, size_t size,
-                            EntropyReceiveFunc *recieve_entropy, void *o=
paque);
+                            EntropyReceiveFunc *receive_entropy, void *o=
paque);
     void (*cancel_requests)(RngBackend *s);

     void (*opened)(RngBackend *s, Error **errp);
diff --git a/qmp-commands.hx b/qmp-commands.hx
index 0e89132..d15bec1 100644
--- a/qmp-commands.hx
+++ b/qmp-commands.hx
@@ -2493,7 +2493,7 @@ The main json-object contains the following:
             byte (json-int)
             These are sent over the wire much more efficiently.
          - "skipped": number of skipped zero pages (json-int)
-         - "normal" : number of whole pages transfered.  I.e. they
+         - "normal" : number of whole pages transferred.  I.e. they
             were not sent as duplicate or xbzrle pages (json-int)
          - "normal-bytes" : number of bytes transferred in whole
             pages. This is just normal pages times size of one page,
diff --git a/target-s390x/translate.c b/target-s390x/translate.c
index 0c3cf68..f97e431 100644
--- a/target-s390x/translate.c
+++ b/target-s390x/translate.c
@@ -3806,7 +3806,7 @@ static void cout_tm64(DisasContext *s, DisasOps *o)
 }

 /* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D */
-/* The "PREPeration" generators.  These initialize the DisasOps.OUT fiel=
ds
+/* The "PREParation" generators.  These initialize the DisasOps.OUT fiel=
ds
    with the TCG register to which we will write.  Used in combination wi=
th
    the "wout" generators, in some cases we need a new temporary, and in
    some cases we can write to a TCG global.  */
diff --git a/trace-events b/trace-events
index ffaa3f4..55e80be 100644
--- a/trace-events
+++ b/trace-events
@@ -776,7 +776,7 @@ pvscsi_update_irq_msi(void) "sending MSI notification=
"
 pvscsi_cmp_ring_put(unsigned long addr) "got completion descriptor 0x%lx=
"
 pvscsi_msg_ring_put(unsigned long addr) "got message descriptor 0x%lx"
 pvscsi_complete_request(uint64_t context, uint64_t len, uint8_t sense_ke=
y) "completion: ctx: 0x%"PRIx64", len: 0x%"PRIx64", sense key: %u"
-pvscsi_get_sg_list(int nsg, size_t size) "get SG list: depth: %u, size: =
%lu"
+pvscsi_get_sg_list(int nsg, size_t size) "get SG list: depth: %u, size: =
%zu"
 pvscsi_get_next_sg_elem(uint32_t flags) "unknown flags in SG element (va=
l: 0x%x)"
 pvscsi_command_complete_not_found(uint32_t tag) "can't find request for =
tag 0x%x"
 pvscsi_command_complete_data_run(void) "not all data required for comman=
d transferred"

