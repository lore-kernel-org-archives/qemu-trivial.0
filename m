Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bS25k-0005HW-HH
	for mharc-qemu-trivial@gnu.org; Tue, 26 Jul 2016 09:08:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43357)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1bS25e-00054V-1e
	for qemu-trivial@nongnu.org; Tue, 26 Jul 2016 09:08:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1bS25X-0006Ci-6D
	for qemu-trivial@nongnu.org; Tue, 26 Jul 2016 09:08:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59555)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>)
	id 1bS25D-0006Ar-0B; Tue, 26 Jul 2016 09:07:39 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4F7A07F3EE;
	Tue, 26 Jul 2016 13:07:38 +0000 (UTC)
Received: from localhost (ovpn-112-61.ams2.redhat.com [10.36.112.61])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u6QD7aSh029741; Tue, 26 Jul 2016 09:07:37 -0400
Date: Tue, 26 Jul 2016 14:07:35 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Reda Sallahi <fullmanet@gmail.com>, Kevin Wolf <kwolf@redhat.com>,
	Fam Zheng <famz@redhat.com>, qemu-block@nongnu.org,
	qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Max Reitz <mreitz@redhat.com>
Message-ID: <20160726130735.GD16811@stefanha-x1.localdomain>
References: <20160721084153.16103-1-fullmanet@gmail.com>
	<20160721090721.GA27488@stefanha-x1.localdomain>
	<87twfdg14x.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="u65IjBhB3TIa72Vp"
Content-Disposition: inline
In-Reply-To: <87twfdg14x.fsf@dusky.pond.sub.org>
User-Agent: Mutt/1.6.2 (2016-07-01)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 26 Jul 2016 13:07:38 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-img: fix error
 messages emitted by img_open()
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
X-List-Received-Date: Tue, 26 Jul 2016 13:08:11 -0000


--u65IjBhB3TIa72Vp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 25, 2016 at 05:58:54PM +0200, Markus Armbruster wrote:
> Stefan Hajnoczi <stefanha@redhat.com> writes:
>=20
> > On Thu, Jul 21, 2016 at 10:41:53AM +0200, Reda Sallahi wrote:
> >> img_open_file() and img_open_opts() were printing error messages with a
> >> duplicate part because of a wrong use of error_reportf_err() (e.g.
> >> qemu-img: Could not open 'foo': Could not open 'foo': No such file or =
directory)
> >>=20
> >> This change uses error_report_err() instead to eliminate the duplicate=
 part.
> >>=20
> >> Signed-off-by: Reda Sallahi <fullmanet@gmail.com>
> >> ---
> >>  qemu-img.c | 4 ++--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>=20
> >> diff --git a/qemu-img.c b/qemu-img.c
> >> index 2e40e1f..dc6652d 100644
> >> --- a/qemu-img.c
> >> +++ b/qemu-img.c
> >> @@ -268,7 +268,7 @@ static BlockBackend *img_open_opts(const char *opt=
str,
> >>      options =3D qemu_opts_to_qdict(opts, NULL);
> >>      blk =3D blk_new_open(NULL, NULL, options, flags, &local_err);
> >>      if (!blk) {
> >> -        error_reportf_err(local_err, "Could not open '%s': ", optstr);
> >> +        error_report_err(local_err);
> >>          return NULL;
> >>      }
> >>      blk_set_enable_write_cache(blk, !writethrough);
> >> @@ -295,7 +295,7 @@ static BlockBackend *img_open_file(const char *fil=
ename,
> >> =20
> >>      blk =3D blk_new_open(filename, NULL, options, flags, &local_err);
> >>      if (!blk) {
> >> -        error_reportf_err(local_err, "Could not open '%s': ", filenam=
e);
> >> +        error_report(local_err);
> >>          return NULL;
> >>      }
> >>      blk_set_enable_write_cache(blk, !writethrough);
> >
> > The duplication happens in the "Could not open 'foo'" case, but other
> > error cases do not include the filename in the error message.
> >
> > We would lose information in those error cases since the filename is no
> > longer included by qemu-img.c in the error message.
>=20
> Could you give an example of such an information loss?

The issue is that while this patch eliminates duplication in:

  qemu-img: Could not open 'foo': Could not open 'foo': No such file or dir=
ectory

It loses the name from:

  qemu-img: Driver 'bar' is not whitelisted

or any other error message in block.c that doesn't include the filename.

This is probably the reason why qemu-img.c prepends "Could not open
'%s'".

> > I'm not aware of a clean way to distinguish Error objects.  Maybe
> > someone else can suggest one.  Otherwise it may be best to leave the
> > code as it is.
>=20
> If you need to distinguish different kinds of errors to conditionally
> rewrite the error message so it makes actual sense, chances are the
> error messages that need the rewriting should be improved instead.
>=20
> A more legitimate case is when a caller needs to handle different errors
> differently.  Doesn't occur all that often.
>=20
> There are two techniques for callers to distinguish different kinds of
> Errors:
>=20
> * ErrorClass, use error_get_class() to retrieve it.  This is actually a
>   remnant of the failed "rich" error object idea.  Almost always
>   ERROR_CLASS_GENERIC_ERROR, so this is unlikely to help.
>=20
> * Error code separate from the Error object, e.g. the function returns
>   -errno in addition to an Error object.

--u65IjBhB3TIa72Vp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJXl2CXAAoJEJykq7OBq3PII+QH/3G9uTKhTXIWOGVGDTQwO43T
nUu/f5YY3biMRzfOzBVPeDbf9WypbsrXc4AWyFuQu+eBDe7LXmdnPR1ffclHRjTL
vUxWlT9rLI6ZBlE9cZDXBop0+oySsnPQwoqC0jAkYIxTlIXhZjDwUU2m8veH52DH
q6N4+XxIMyWEfJaLJhY7RK8y7N7bmdmCd3h89VhFzZcX6Kgif2yBml1cyzkv4OaL
7MMDPWcQ7MmJxUUM+o4/whmQ37X8FG8fr5299mppljqmg3n7HDPcZWQeL6lLqW1U
sUAaydzb95fP+hjbCB2EffKE+XJo/Q3+1HgdX9kZm63jxZx7DG2t9XOm1k+MD8w=
=JhuN
-----END PGP SIGNATURE-----

--u65IjBhB3TIa72Vp--

