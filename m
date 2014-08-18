Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XJSjC-0001mM-DQ
	for mharc-qemu-trivial@gnu.org; Mon, 18 Aug 2014 15:36:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39583)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1XJSj6-0001lu-Pj
	for qemu-trivial@nongnu.org; Mon, 18 Aug 2014 15:36:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1XJSj2-0005VN-En
	for qemu-trivial@nongnu.org; Mon, 18 Aug 2014 15:36:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:63661)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1XJSj2-0005VG-5X; Mon, 18 Aug 2014 15:36:16 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s7IJa9M9017179
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Mon, 18 Aug 2014 15:36:09 -0400
Received: from redhat.com (ovpn-116-37.ams2.redhat.com [10.36.116.37])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s7IJa5r5032212; Mon, 18 Aug 2014 15:36:06 -0400
Date: Mon, 18 Aug 2014 21:36:41 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <20140818193641.GB29446@redhat.com>
References: <1408348473-10104-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<53F1E5A4.9060000@msgid.tls.msk.ru>
	<20140818134421.GA28795@redhat.com>
	<53F20C82.7050506@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <53F20C82.7050506@msgid.tls.msk.ru>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx1.redhat.com id
	s7IJa9M9017179
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: zhanghailiang <zhang.zhanghailiang@huawei.com>, marcel.a@redhat.com,
	qemu-trivial@nongnu.org, Li Liu <john.liuli@huawei.com>,
	luonengjun@huawei.com, qemu-devel@nongnu.org, peter.huangpeng@huawei.com
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
X-List-Received-Date: Mon, 18 Aug 2014 19:36:25 -0000

On Mon, Aug 18, 2014 at 06:24:02PM +0400, Michael Tokarev wrote:
> 18.08.2014 17:44, Michael S. Tsirkin wrote:
> > On Mon, Aug 18, 2014 at 03:38:12PM +0400, Michael Tokarev wrote:
> >> 18.08.2014 11:54, zhanghailiang wrote:
> >>> The function fopen() may fail, so check its return value.
> >>>
> >>> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
> >>> Signed-off-by: Li Liu <john.liuli@huawei.com>
> >>> Reviewed-by: Alex Benn=E9e <alex.bennee@linaro.org>
> >>> ---
> >>>  tests/bios-tables-test.c | 5 +++++
> >>>  1 file changed, 5 insertions(+)
> >>>
> >>> diff --git a/tests/bios-tables-test.c b/tests/bios-tables-test.c
> >>> index 045eb27..feb3b58 100644
> >>> --- a/tests/bios-tables-test.c
> >>> +++ b/tests/bios-tables-test.c
> >>> @@ -790,6 +790,11 @@ int main(int argc, char *argv[])
> >>>      const char *arch =3D qtest_get_arch();
> >>>      FILE *f =3D fopen(disk, "w");
> >>>      int ret;
> >>> +
> >>> +    if (!f) {
> >>> +        fprintf(stderr, "Couldn't open \"%s\": %s", disk, strerror=
(errno));
> >>> +        return -1;
> >>> +    }
> >>
> >> Applied to -trivial, with s/-1/1/.  No need to resend it again.
> >>
> >> Thanks,
> >>
> >> /mjt
> >>
> >>>      fwrite(boot_sector, 1, sizeof boot_sector, f);
> >>>      fclose(f);
> >=20
> > This doesn't seem appropriate to trivial tree:
> > there were some objections from Marcel, I'd like to
> > see them addressed.
>=20
> I see the objections as addressed, don't you?
>=20
> /mjt

Does test fail if this path is triggered?


