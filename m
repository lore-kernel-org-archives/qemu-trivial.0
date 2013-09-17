Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VLwr8-0006BG-Sk
	for mharc-qemu-trivial@gnu.org; Tue, 17 Sep 2013 11:06:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47912)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1VLwr2-00065l-DQ
	for qemu-trivial@nongnu.org; Tue, 17 Sep 2013 11:06:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1VLwqw-0001iE-F6
	for qemu-trivial@nongnu.org; Tue, 17 Sep 2013 11:06:16 -0400
Received: from mail-ob0-f176.google.com ([209.85.214.176]:32771)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1VLwqw-0001hs-95
	for qemu-trivial@nongnu.org; Tue, 17 Sep 2013 11:06:10 -0400
Received: by mail-ob0-f176.google.com with SMTP id uy5so5384079obc.21
	for <qemu-trivial@nongnu.org>; Tue, 17 Sep 2013 08:06:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=ZFJ0G9KgSF3pwrhEUE54v+zWCZwOToESxXRvKa3wydc=;
	b=e74iO3715FMDZI73JiwNTs8tzVjV4ALFokSgmvcGxVgFkvLoZ2icP1+fKPEY4if61O
	N6vptFPg00a5FmEM1LoarHtllKQIInTx0RKUi9iUa+s6wFTlcg4tvEDXjC6osst5SnzG
	lACsZCNmWSKOyqpdJDODpyITnFBe7vz4dGOjPi2y6RPyK7+VAhhcZVFuBWAQ7XOVVVVn
	entdqA6gNtwhMv0be8n39n11ZFsi86mxObmezIMEsSo9g6cqBc6atl4iu3W1aZ8Y0Dts
	s/+j/LwT8obrGjuLQcqmA1pGRMPNtDdNbcJo4JCxuD5sXPcq1Y3RWnjsZSLcAByfXfBC
	LVBQ==
X-Gm-Message-State: ALoCoQl2EsQjp5qvkk311/A9HMWerBbtdJQ4oK2WkoSJZTsfJ/bz4biNbLNnF1VLmEUFvVbieVv4
MIME-Version: 1.0
X-Received: by 10.182.246.74 with SMTP id xu10mr5542733obc.23.1379430369232;
	Tue, 17 Sep 2013 08:06:09 -0700 (PDT)
Received: by 10.60.54.104 with HTTP; Tue, 17 Sep 2013 08:06:09 -0700 (PDT)
In-Reply-To: <1379188061-7634-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1379188061-7634-1-git-send-email-mjt@msgid.tls.msk.ru>
Date: Tue, 17 Sep 2013 10:06:09 -0500
Message-ID: <CA+aC4kv6ijDVhjLSK6LgqmdHbVVJgFEokD3TCYsx9-sT1hZ3+A@mail.gmail.com>
From: Anthony Liguori <anthony@codemonkey.ws>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.214.176
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	Anthony Liguori <aliguori@us.ibm.com>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 00/15] trivial patches for
	2013-09-14
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
X-List-Received-Date: Tue, 17 Sep 2013 15:06:21 -0000

On Sat, Sep 14, 2013 at 2:47 PM, Michael Tokarev <mjt@tls.msk.ru> wrote:
> Just a bit late but here's the next trivial-patches pull request.
>
> Thanks,

Breaks the build:

/home/anthony/git/qemu/cpu-exec.c: In function =E2=80=98cpu_alpha_exec=E2=
=80=99:
/home/anthony/git/qemu/cpu-exec.c:204:15: error: variable =E2=80=98cpu=E2=
=80=99 might
be clobbered by =E2=80=98longjmp=E2=80=99 or =E2=80=98vfork=E2=80=99 [-Werr=
or=3Dclobbered]
/home/anthony/git/qemu/cpu-exec.c:202:28: error: argument =E2=80=98env=E2=
=80=99 might
be clobbered by =E2=80=98longjmp=E2=80=99 or =E2=80=98vfork=E2=80=99 [-Werr=
or=3Dclobbered]
cc1: all warnings being treated as errors

I think it's one of the warning patches from Stefan.  I cannot bisect
here.  My gcc info is below:

[10:05 AM] anthony=F0=9F=90=B5 titi:~/build/qemu$ gcc -v
Using built-in specs.
COLLECT_GCC=3D/usr/bin/gcc-4.6.real
COLLECT_LTO_WRAPPER=3D/usr/lib/gcc/x86_64-linux-gnu/4.6.1/lto-wrapper
Target: x86_64-linux-gnu
Configured with: ../src/configure -v --with-pkgversion=3D'Ubuntu/Linaro
4.6.1-9ubuntu3'
--with-bugurl=3Dfile:///usr/share/doc/gcc-4.6/README.Bugs
--enable-languages=3Dc,c++,fortran,objc,obj-c++,go --prefix=3D/usr
--program-suffix=3D-4.6 --enable-shared --enable-linker-build-id
--with-system-zlib --libexecdir=3D/usr/lib --without-included-gettext
--enable-threads=3Dposix --with-gxx-include-dir=3D/usr/include/c++/4.6
--libdir=3D/usr/lib --enable-nls --with-sysroot=3D/ --enable-clocale=3Dgnu
--enable-libstdcxx-debug --enable-libstdcxx-time=3Dyes --enable-plugin
--enable-objc-gc --disable-werror --with-arch-32=3Di686
--with-tune=3Dgeneric --enable-checking=3Drelease --build=3Dx86_64-linux-gn=
u
--host=3Dx86_64-linux-gnu --target=3Dx86_64-linux-gnu
Thread model: posix
gcc version 4.6.1 (Ubuntu/Linaro 4.6.1-9ubuntu3)

Regards,

Anthony Liguori

>
> /mjt
>
> The following changes since commit 2d1fe1873a984d1c2c89ffa3d12949cafc7185=
51:
>
>   Merge remote-tracking branch 'pmaydell/tags/pull-target-arm-20130910' i=
nto staging (2013-09-11 14:46:52 -0500)
>
> are available in the git repository at:
>
>   git://git.corpit.ru/qemu.git trivial-patches
>
> for you to fetch changes up to f47873f7d5a67ec8c5411abec9786beb8f691a46:
>
>   configure: Enable extra compiler warnings (2013-09-14 23:42:44 +0400)
>
> ----------------------------------------------------------------
> Anthony PERARD (1):
>       docs: Fix IO port number for CPU present bitmap.
>
> Markus Armbruster (1):
>       trace-events: Clean up with scripts/cleanup-trace-events.pl again
>
> Michael Tokarev (2):
>       vscclient: remove unnecessary use of uninitialized variable
>       iov: avoid "orig_len may be used unitialized" warning
>
> Michal Privoznik (1):
>       configure: Undefine _FORTIFY_SOURCE prior using it
>
> Richard Henderson (1):
>       tcg-sparc: Fix parenthesis warning
>
> Richard W.M. Jones (1):
>       q35: Fix typo in constant DEFUALT -> DEFAULT.
>
> Stefan Weil (7):
>       *-user: Fix typo in comment (ulocking -> unlocking)
>       translate-all: Fix formatting of dump output
>       MAINTAINERS: Add missing entry to filelist for TCI target
>       *-user: Improve documentation for lock_user function
>       tci: Fix qemu-alpha on 32 bit hosts (wrong assertions)
>       Makefile: Remove some more files when cleaning
>       configure: Enable extra compiler warnings
>
> Tobias Markus (1):
>       target-i386: Fix segment cache dump
>
>  MAINTAINERS                     |    1 +
>  Makefile                        |    4 +++-
>  bsd-user/qemu.h                 |    6 +++---
>  configure                       |   14 +++++++++-----
>  docs/specs/acpi_cpu_hotplug.txt |    2 +-
>  hw/pci-host/q35.c               |    2 +-
>  include/hw/pci-host/q35.h       |    2 +-
>  libcacard/vscclient.c           |    3 +--
>  linux-user/qemu.h               |    6 +++---
>  target-i386/helper.c            |    4 +++-
>  tcg/sparc/tcg-target.h          |    2 +-
>  tci.c                           |   12 ------------
>  trace-events                    |    3 +--
>  translate-all.c                 |    5 +++--
>  util/iov.c                      |   10 ++++------
>  15 files changed, 35 insertions(+), 41 deletions(-)
>

