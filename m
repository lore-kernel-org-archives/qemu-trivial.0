Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VyZb4-0006DT-8I
	for mharc-qemu-trivial@gnu.org; Wed, 01 Jan 2014 23:09:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36434)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1VyZax-0005u6-Rr
	for qemu-trivial@nongnu.org; Wed, 01 Jan 2014 23:09:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1VyZat-00025c-1q
	for qemu-trivial@nongnu.org; Wed, 01 Jan 2014 23:09:19 -0500
Received: from mx1.redhat.com ([209.132.183.28]:10362)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>)
	id 1VyZaj-00024w-7c; Wed, 01 Jan 2014 23:09:05 -0500
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s02492lb009854
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 1 Jan 2014 23:09:02 -0500
Received: from localhost (ovpn-112-17.ams2.redhat.com [10.36.112.17])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s0248whs018584; Wed, 1 Jan 2014 23:09:00 -0500
Date: Thu, 2 Jan 2014 12:08:56 +0800
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Message-ID: <20140102040856.GB17904@stefanha-thinkpad.redhat.com>
References: <1388393215-27511-1-git-send-email-keweihk@gmail.com>
	<52C20D76.7060301@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <52C20D76.7060301@suse.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx1.redhat.com id
	s02492lb009854
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, mst@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/1] qtest:Fix the bug about
 disabling vnc causes "make check" hang
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
X-List-Received-Date: Thu, 02 Jan 2014 04:09:24 -0000

On Tue, Dec 31, 2013 at 01:19:02AM +0100, Andreas F=E4rber wrote:
> Am 30.12.2013 09:46, schrieb Kewei Yu:
> > When we disabling vnc from "./configure", the qemu can't use the vnc =
option.
> > So qtest can't use the "vnc -none ", otherwise "make check" will hang.
> >=20
> > Signed-off-by: Kewei Yu <keweihk@gmail.com>
> > ---
> >  tests/fdc-test.c |    4 ++++
> >  tests/ide-test.c |   11 ++++++++---
> >  2 files changed, 12 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/tests/fdc-test.c b/tests/fdc-test.c
> > index 38b5b17..80dbdfb 100644
> > --- a/tests/fdc-test.c
> > +++ b/tests/fdc-test.c
> > @@ -538,7 +538,11 @@ int main(int argc, char **argv)
> >      /* Run the tests */
> >      g_test_init(&argc, &argv, NULL);
> > =20
> > +#ifdef CONFIG_VNC
> >      cmdline =3D g_strdup_printf("-vnc none ");
> > +#else
> > +    cmdline =3D NULL;
> > +#endif
> > =20
> >      qtest_start(cmdline);
> >      qtest_irq_intercept_in(global_qtest, "ioapic");
>=20
> I have already made -display none a default used by all qtests.
> http://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D2ad645d2854746b55ddfd1=
d8e951f689cca5d78f
>=20
> Is there a reason not to do the same for -vnc none?
> That would consolidate the #ifdef'ery to one central point.

Agreed, let's set -vnc none by default in one place (if enabled by
./configure).

I wonder if we should use -nodefaults too?  That may require adding some
new options to explicitly set up devices used by existing tests.

Stefan

