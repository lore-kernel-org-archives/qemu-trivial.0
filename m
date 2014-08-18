Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XJM2B-0001uk-Mm
	for mharc-qemu-trivial@gnu.org; Mon, 18 Aug 2014 08:27:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39343)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcel.a@redhat.com>) id 1XJM25-0001tb-8S
	for qemu-trivial@nongnu.org; Mon, 18 Aug 2014 08:27:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcel.a@redhat.com>) id 1XJM1y-0005YX-S6
	for qemu-trivial@nongnu.org; Mon, 18 Aug 2014 08:27:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33770)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcel.a@redhat.com>)
	id 1XJM1y-0005YE-Kk; Mon, 18 Aug 2014 08:27:22 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s7ICQv5G014357
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Mon, 18 Aug 2014 08:26:57 -0400
Received: from [10.36.7.68] (vpn1-7-68.ams2.redhat.com [10.36.7.68])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s7ICQrAu023631; Mon, 18 Aug 2014 08:26:54 -0400
Message-ID: <1408364795.4964.12.camel@localhost.localdomain>
From: Marcel Apfelbaum <marcel.a@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Date: Mon, 18 Aug 2014 15:26:35 +0300
In-Reply-To: <53F1E56C.9000709@msgid.tls.msk.ru>
References: <1408348473-10104-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<1408353202.4964.2.camel@localhost.localdomain>
	<53F1E56C.9000709@msgid.tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx1.redhat.com id
	s7ICQv5G014357
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: zhanghailiang <zhang.zhanghailiang@huawei.com>, mst@redhat.com,
	qemu-trivial@nongnu.org, Li Liu <john.liuli@huawei.com>,
	luonengjun@huawei.com, peter.huangpeng@huawei.com, qemu-devel@nongnu.org
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
X-List-Received-Date: Mon, 18 Aug 2014 12:27:33 -0000

On Mon, 2014-08-18 at 15:37 +0400, Michael Tokarev wrote:
> 18.08.2014 13:13, Marcel Apfelbaum wrote:
> > On Mon, 2014-08-18 at 15:54 +0800, zhanghailiang wrote:
> >> The function fopen() may fail, so check its return value.
> >>
> >> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
> >> Signed-off-by: Li Liu <john.liuli@huawei.com>
> >> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
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
>=20
> So, no assert() in cases like this here and elsewhere (not only in qemu=
). It
> is not what assert() is provided for.

Hi Michael,
Thanks for the reminder, it really helps.

While I agree 100% with your explanation, I was thinking to use
assert only because there would be no reason for the fopen to fail
while creating a file in current directory.
But fopen *may* fail(no writing rights for current directory) and this is=
 an error check.

Thanks again,
Marcel

>=20
> Thanks,
>=20
> /mjt




