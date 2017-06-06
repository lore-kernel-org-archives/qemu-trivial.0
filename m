Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dI8Nm-0001pE-Ij
	for mharc-qemu-trivial@gnu.org; Tue, 06 Jun 2017 02:54:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34141)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1dI8Nk-0001nm-6z
	for qemu-trivial@nongnu.org; Tue, 06 Jun 2017 02:54:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1dI8Nj-0001hQ-8V
	for qemu-trivial@nongnu.org; Tue, 06 Jun 2017 02:54:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:32992)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1dI8Nd-0001cC-5d; Tue, 06 Jun 2017 02:54:17 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D420961B8F;
	Tue,  6 Jun 2017 06:54:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com D420961B8F
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=armbru@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com D420961B8F
Received: from blackfin.pond.sub.org (ovpn-116-98.ams2.redhat.com
	[10.36.116.98])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E473678DF1;
	Tue,  6 Jun 2017 06:54:09 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 406951138645; Tue,  6 Jun 2017 08:54:08 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Kamil Rytarowski <n54@gmx.com>
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, marcandre.lureau@gmail.com,
	peter.maydell@redhat.com, f4bug@amsat.org
References: <20170531120049.14111-1-n54@gmx.com>
	<26b48c35-b6cc-708d-c4d2-b26a9382e10a@msgid.tls.msk.ru>
	<df623a80-4017-2e79-6bf3-7c402f24b275@gmx.com>
Date: Tue, 06 Jun 2017 08:54:08 +0200
In-Reply-To: <df623a80-4017-2e79-6bf3-7c402f24b275@gmx.com> (Kamil
	Rytarowski's message of "Mon, 5 Jun 2017 16:52:16 +0200")
Message-ID: <877f0p38tr.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 06 Jun 2017 06:54:15 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3] ivshmem-server:
 ivshmem-client: Build when eventfd() is available
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
X-List-Received-Date: Tue, 06 Jun 2017 06:54:25 -0000

Kamil Rytarowski <n54@gmx.com> writes:

> On 05.06.2017 16:29, Michael Tokarev wrote:
>> 31.05.2017 15:00, Kamil Rytarowski wrote:
>>> Currently ivshmem requires eventfd() which is Linux specific.
>>> Do not and build it unconditionally on every Linux/BSD/Solaris.
>>>
>>> This patch indirectly fixes build failure on NetBSD, where these tools
>>> additionally require -lrt for shm_open(3). In future there should be
>>> added support for NetBSD and the linking addressed appropriately.
>>=20
>> Unfortunately this breaks static build.
>>=20
>> $ ../configure --disable-system --disable-linux-user --static
>> $ make V=3D1
>> ...
>> c++ -I/usr/include/pixman-1  -Werror -pthread -I/usr/include/glib-2.0 -I=
/usr/lib/x86_64-linux-gnu/glib-2.0/include -m64 -mcx16 -D_GNU_SOURCE
>> -D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredun=
dant-decls -Wall -Wundef -Wwrite-strings -Wmissing-prototypes
>> -fno-strict-aliasing -fno-common -fwrapv  -Wendif-labels -Wno-shift-nega=
tive-value -Wno-missing-include-dirs -Wempty-body -Wnested-externs
>> -Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers -Wold-st=
yle-declaration -Wold-style-definition -Wtype-limits -fstack-protector-stro=
ng
>> -I/usr/include/libpng16 -I/build/qemu/git/tests -O2 -U_FORTIFY_SOURCE -D=
_FORTIFY_SOURCE=3D2 -g  -Wl,--warn-common -m64 -static -g  -o ivshmem-server
>> libqemuutil.a libqemustub.a   -lm -lgthread-2.0 -pthread -lglib-2.0 -pth=
read -lpcre -pthread  -lz -lrt -lz -lnettle  -lutil
>> /usr/lib/gcc/x86_64-linux-gnu/6/../../../x86_64-linux-gnu/crt1.o: In fun=
ction `_start':
>> (.text+0x20): undefined reference to `main'
>> collect2: error: ld returned 1 exit status
>> Makefile:475: error building =C2=ABivshmem-server=C2=BB
>> $ _
>>=20
>> I'll take a look at this later. reverting it for now.
>>=20
>> Thanks,
>>=20
>> /mjt
>>=20
>
> I will try to reproduce it locally.

I haven't, but here's a quick guess on what we need to squash into the
patch:

diff --git a/Makefile b/Makefile
index c830d7a..2ef5a78 100644
--- a/Makefile
+++ b/Makefile
@@ -469,10 +469,12 @@ ifneq ($(EXESUF),)
 qemu-ga: qemu-ga$(EXESUF) $(QGA_VSS_PROVIDER) $(QEMU_GA_MSI)
 endif
=20
+ifdef CONFIG_IVSHMEM
 ivshmem-client$(EXESUF): $(ivshmem-client-obj-y) $(COMMON_LDADDS)
 	$(call LINK, $^)
 ivshmem-server$(EXESUF): $(ivshmem-server-obj-y) $(COMMON_LDADDS)
 	$(call LINK, $^)
+endif
=20
 module_block.h: $(SRC_PATH)/scripts/modules/module_block.py config-host.mak
 	$(call quiet-command,$(PYTHON) $< $@ \
diff --git a/tests/Makefile.include b/tests/Makefile.include
index f42f3df..ab70d01 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -203,7 +203,7 @@ gcov-files-pci-y +=3D hw/display/virtio-gpu-pci.c
 gcov-files-pci-$(CONFIG_VIRTIO_VGA) +=3D hw/display/virtio-vga.c
 check-qtest-pci-y +=3D tests/intel-hda-test$(EXESUF)
 gcov-files-pci-y +=3D hw/audio/intel-hda.c hw/audio/hda-codec.c
-check-qtest-pci-$(CONFIG_EVENTFD) +=3D tests/ivshmem-test$(EXESUF)
+check-qtest-pci-$(CONFIG_IVSHMEM) +=3D tests/ivshmem-test$(EXESUF)
 gcov-files-pci-y +=3D hw/misc/ivshmem.c
=20
 check-qtest-i386-y =3D tests/endianness-test$(EXESUF)

