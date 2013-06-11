Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UmUfM-0000Fo-8L
	for mharc-qemu-trivial@gnu.org; Tue, 11 Jun 2013 15:55:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33743)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UmUfK-0000Df-9K
	for qemu-trivial@nongnu.org; Tue, 11 Jun 2013 15:55:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UmUfJ-0003DV-88
	for qemu-trivial@nongnu.org; Tue, 11 Jun 2013 15:55:38 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:46569)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UmUfG-0003D3-Li; Tue, 11 Jun 2013 15:55:34 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 12A10412FA;
	Tue, 11 Jun 2013 23:55:32 +0400 (MSK)
Message-ID: <51B780B2.9040604@msgid.tls.msk.ru>
Date: Tue, 11 Jun 2013 23:55:30 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/17.0 Icedove/17.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1370897240-23490-1-git-send-email-mjt@msgid.tls.msk.ru>
	<CAFEAcA88zpSQTLWSwu6ci7rytTMxkWWqjE4jfb=0Svj+9P8NsQ@mail.gmail.com>
	<51B7183E.6070203@msgid.tls.msk.ru>
	<CAFEAcA8g7Ck_vdAraiEsKdYBi=VM8PRTCrA9UnA6GAa+JgXUoQ@mail.gmail.com>
	<87ehc8tvd5.fsf@gmail.com> <51B76A28.5030008@msgid.tls.msk.ru>
	<CAFEAcA8qdw+_6VkC1SNj5J9w-XHaeM+gPymFOoO1PGQfhXTMHw@mail.gmail.com>
In-Reply-To: <CAFEAcA8qdw+_6VkC1SNj5J9w-XHaeM+gPymFOoO1PGQfhXTMHw@mail.gmail.com>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, "M. Mohan Kumar" <mohan@in.ibm.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH trivial] configure:
 explicitly disable virtfs if softmmu=no
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
X-List-Received-Date: Tue, 11 Jun 2013 19:55:39 -0000

11.06.2013 23:21, Peter Maydell =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> On 11 June 2013 19:19, Michael Tokarev <mjt@tls.msk.ru> wrote:
>> FWIW, I still don't understand what Peter Maydell dislikes
>> in a simplest case I posted initially, where we merely ignore
>> (disable) virtfs in case !softmmu.
>=20
> It just seems to me that rather than fixing a bug in the
> makefile (it still tries to build docs for the tools even
> when the tools aren't being built) you're trying to tweak
> the configure script to avoid generating the combinations
> of config values that trigger the makefile bug.

Heh. It is just easier to not generate the config variable
than to use more complex conditions.  How about this:

--- a/Makefile
+++ b/Makefile
@@ -66,7 +66,7 @@ HELPERS-$(CONFIG_LINUX) =3D qemu-bridge-helper$(EXESUF)

 ifdef BUILD_DOCS
 DOCS=3Dqemu-doc.html qemu-tech.html qemu.1 qemu-img.1 qemu-nbd.8 QMP/qmp=
-commands.txt
-ifdef CONFIG_VIRTFS
+ifeq ($(CONFIG_VIRTFS)$(CONFIG_SOFTMMU),yy)
 DOCS+=3Dfsdev/virtfs-proxy-helper.1
 endif
 else
@@ -313,7 +313,7 @@ ifneq ($(TOOLS),)
 	$(INSTALL_DATA) qemu-nbd.8 "$(DESTDIR)$(mandir)/man8"
 endif
 endif
-ifdef CONFIG_VIRTFS
+ifeq ($(CONFIG_VIRTFS)$(CONFIG_SOFTMMU),yy)
 	$(INSTALL_DIR) "$(DESTDIR)$(mandir)/man1"
 	$(INSTALL_DATA) fsdev/virtfs-proxy-helper.1 "$(DESTDIR)$(mandir)/man1"
 endif




Or this:

--- a/Makefile
+++ b/Makefile
@@ -64,6 +64,10 @@ LIBS+=3D-lz $(LIBS_TOOLS)

 HELPERS-$(CONFIG_LINUX) =3D qemu-bridge-helper$(EXESUF)

+ifneq ($(CONFIG_SOFTMMU),y)
+CONFIG_VIRTFS :=3D
+endif
+
 ifdef BUILD_DOCS
 DOCS=3Dqemu-doc.html qemu-tech.html qemu.1 qemu-img.1 qemu-nbd.8 QMP/qmp=
-commands.txt
 ifdef CONFIG_VIRTFS



Or this:

--- a/Makefile
+++ b/Makefile
@@ -64,9 +64,13 @@ LIBS+=3D-lz $(LIBS_TOOLS)

 HELPERS-$(CONFIG_LINUX) =3D qemu-bridge-helper$(EXESUF)

+ifeq ($(CONFIG_VIRTFS)$(CONFIG_SOFTMMU),yy)
+VIRTFS_DOCS =3D y
+endif
+
 ifdef BUILD_DOCS
 DOCS=3Dqemu-doc.html qemu-tech.html qemu.1 qemu-img.1 qemu-nbd.8 QMP/qmp=
-commands.txt
-ifdef CONFIG_VIRTFS
+ifdef VIRTFS_DOCS
 DOCS+=3Dfsdev/virtfs-proxy-helper.1
 endif
 else
@@ -313,7 +317,7 @@ ifneq ($(TOOLS),)
 	$(INSTALL_DATA) qemu-nbd.8 "$(DESTDIR)$(mandir)/man8"
 endif
 endif
-ifdef CONFIG_VIRTFS
+ifdef VIRTFS_DOCS
 	$(INSTALL_DIR) "$(DESTDIR)$(mandir)/man1"
 	$(INSTALL_DATA) fsdev/virtfs-proxy-helper.1 "$(DESTDIR)$(mandir)/man1"
 endif


I don't care any way ;)

But all that is more "verbose" than just turning the feature
off in ./configure.

Thanks,

/mjt

