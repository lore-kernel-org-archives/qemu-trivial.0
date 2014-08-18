Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XJNMT-0007F1-Tl
	for mharc-qemu-trivial@gnu.org; Mon, 18 Aug 2014 09:52:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57576)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1XJNMJ-0007BF-Nr
	for qemu-trivial@nongnu.org; Mon, 18 Aug 2014 09:52:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1XJNM9-00022f-Gy
	for qemu-trivial@nongnu.org; Mon, 18 Aug 2014 09:52:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:20897)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1XJNM9-00021f-AB; Mon, 18 Aug 2014 09:52:17 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s7IDpMJv030902
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Mon, 18 Aug 2014 09:51:22 -0400
Received: from redhat.com (ovpn-116-37.ams2.redhat.com [10.36.116.37])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s7IDpIgP012902; Mon, 18 Aug 2014 09:51:20 -0400
Date: Mon, 18 Aug 2014 15:51:55 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <20140818135155.GB28795@redhat.com>
References: <1408348473-10104-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<1408353202.4964.2.camel@localhost.localdomain>
	<53F1E56C.9000709@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <53F1E56C.9000709@msgid.tls.msk.ru>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx1.redhat.com id
	s7IDpMJv030902
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: zhanghailiang <zhang.zhanghailiang@huawei.com>,
	Marcel Apfelbaum <marcel.a@redhat.com>, qemu-trivial@nongnu.org,
	Li Liu <john.liuli@huawei.com>, luonengjun@huawei.com,
	peter.huangpeng@huawei.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v7] tests/bios-tables-test: check the
 value returned by fopen()
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
X-List-Received-Date: Mon, 18 Aug 2014 13:52:36 -0000

On Mon, Aug 18, 2014 at 03:37:16PM +0400, Michael Tokarev wrote:
> 18.08.2014 13:13, Marcel Apfelbaum wrote:
> > On Mon, 2014-08-18 at 15:54 +0800, zhanghailiang wrote:
> >> The function fopen() may fail, so check its return value.
> >>
> >> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
> >> Signed-off-by: Li Liu <john.liuli@huawei.com>
> >> Reviewed-by: Alex Benn=E9e <alex.bennee@linaro.org>
> >> ---
> >>  tests/bios-tables-test.c | 5 +++++
> >>  1 file changed, 5 insertions(+)
> >>
> >> diff --git a/tests/bios-tables-test.c b/tests/bios-tables-test.c
> >> index 045eb27..feb3b58 100644
> >> --- a/tests/bios-tables-test.c
> >> +++ b/tests/bios-tables-test.c
> >> @@ -790,6 +790,11 @@ int main(int argc, char *argv[])
> >>      const char *arch =3D qtest_get_arch();
> >>      FILE *f =3D fopen(disk, "w");
> >>      int ret;
> >> +
> >> +    if (!f) {
> >> +        fprintf(stderr, "Couldn't open \"%s\": %s", disk, strerror(=
errno));
> >> +        return -1;
> >> +    }
> > Hi,
> > I think we should use an assert here, we need an indication
> > that the test failed and a print to stderr is not enough.
>=20
> Guys, please stop misusing (or trying to misuse) assert().  assert() is=
 for
> code path which are impossible by program logic.  Here, it is a error c=
heck,
> not a code logic check -- the fopen() _may_ fail, and this is not somet=
hing
> the code around makes impossible.  So in cases like this (and in other =
similar
> case like vvfat.log open check), we should either print to stderr and e=
xit,
> or print elsewhere, but we should NOT use assert().  Think what will be=
 if
> the program will be compiled with -D_NDEBUG and all assert()s are turne=
d into
> a no-op.

We don't support that configuration, a bunch of stuff will be
broken if you try.


> So, no assert() in cases like this here and elsewhere (not only in qemu=
). It
> is not what assert() is provided for.
>=20
> Thanks,
>=20
> /mjt

I partially agree in that asserts produce errors which aren't
easy for users to understand, and gives a coredump which
takes up disk space. So if we expect some error to trigger,
we should print a proper error, and avoid producing a coredump.

On the other hand, there are situations where we
take a shortcut and decide that error is highly unlikely
(even if not 100% impossible), so not worth handling.
In these cases assert will make debugging easier
in case it does trigger after all.

This case here is about a test, so it's used
by developers, not users. Thus assert might be appropriate.

--=20
MST

