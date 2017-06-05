Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dHt0c-0005iu-Nk
	for mharc-qemu-trivial@gnu.org; Mon, 05 Jun 2017 10:29:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42957)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dHt0a-0005e8-BY
	for qemu-trivial@nongnu.org; Mon, 05 Jun 2017 10:29:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dHt0Z-0007mB-Jh
	for qemu-trivial@nongnu.org; Mon, 05 Jun 2017 10:29:28 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:56577)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dHt0U-0007kT-7r; Mon, 05 Jun 2017 10:29:22 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 671DF40599;
	Mon,  5 Jun 2017 17:29:21 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 4D5A3606;
	Mon,  5 Jun 2017 17:29:21 +0300 (MSK)
To: Kamil Rytarowski <n54@gmx.com>, qemu-trivial@nongnu.org
References: <20170531120049.14111-1-n54@gmx.com>
Cc: qemu-devel@nongnu.org, armbru@redhat.com, marcandre.lureau@gmail.com,
	peter.maydell@redhat.com, eblake@redhat.com, f4bug@amsat.org
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <26b48c35-b6cc-708d-c4d2-b26a9382e10a@msgid.tls.msk.ru>
Date: Mon, 5 Jun 2017 17:29:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170531120049.14111-1-n54@gmx.com>
Content-Type: text/plain; charset=windows-1251
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH v3] ivshmem-server: ivshmem-client: Build
 when eventfd() is available
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
X-List-Received-Date: Mon, 05 Jun 2017 14:29:29 -0000

31.05.2017 15:00, Kamil Rytarowski wrote:
> Currently ivshmem requires eventfd() which is Linux specific.
> Do not and build it unconditionally on every Linux/BSD/Solaris.
>=20
> This patch indirectly fixes build failure on NetBSD, where these tools
> additionally require -lrt for shm_open(3). In future there should be
> added support for NetBSD and the linking addressed appropriately.

Unfortunately this breaks static build.

$ ../configure --disable-system --disable-linux-user --static
$ make V=3D1
...
c++ -I/usr/include/pixman-1  -Werror -pthread -I/usr/include/glib-2.0 -I/=
usr/lib/x86_64-linux-gnu/glib-2.0/include -m64 -mcx16 -D_GNU_SOURCE
-D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredund=
ant-decls -Wall -Wundef -Wwrite-strings -Wmissing-prototypes
-fno-strict-aliasing -fno-common -fwrapv  -Wendif-labels -Wno-shift-negat=
ive-value -Wno-missing-include-dirs -Wempty-body -Wnested-externs
-Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers -Wold-sty=
le-declaration -Wold-style-definition -Wtype-limits -fstack-protector-str=
ong
-I/usr/include/libpng16 -I/build/qemu/git/tests -O2 -U_FORTIFY_SOURCE -D_=
FORTIFY_SOURCE=3D2 -g  -Wl,--warn-common -m64 -static -g  -o ivshmem-serv=
er
libqemuutil.a libqemustub.a   -lm -lgthread-2.0 -pthread -lglib-2.0 -pthr=
ead -lpcre -pthread  -lz -lrt -lz -lnettle  -lutil
/usr/lib/gcc/x86_64-linux-gnu/6/../../../x86_64-linux-gnu/crt1.o: In func=
tion `_start':
(.text+0x20): undefined reference to `main'
collect2: error: ld returned 1 exit status
Makefile:475: error building =ABivshmem-server=BB
$ _

I'll take a look at this later. reverting it for now.

Thanks,

/mjt

