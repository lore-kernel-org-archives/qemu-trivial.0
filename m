Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fTsYO-0004ya-FV
	for mharc-qemu-trivial@gnu.org; Fri, 15 Jun 2018 13:30:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56683)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1fTsYL-0004wT-PC
	for qemu-trivial@nongnu.org; Fri, 15 Jun 2018 13:30:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1fTsYK-0001SJ-4U
	for qemu-trivial@nongnu.org; Fri, 15 Jun 2018 13:30:25 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:46570 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1fTsYF-0001Ke-7W; Fri, 15 Jun 2018 13:30:19 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 357C840704B5;
	Fri, 15 Jun 2018 17:30:16 +0000 (UTC)
Received: from localhost (ovpn-117-51.ams2.redhat.com [10.36.117.51])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 533BE20284D6;
	Fri, 15 Jun 2018 17:30:13 +0000 (UTC)
Date: Fri, 15 Jun 2018 18:30:13 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Yaowei Bai <baiyaowei@cmss.chinamobile.com>
Cc: Eric Blake <eblake@redhat.com>, "Emilio G. Cota" <cota@braap.org>,
	qemu-trivial@nongnu.org, mjt@tls.msk.ru, laurent@vivier.eu,
	qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Message-ID: <20180615173013.GH12972@stefanha-x1.localdomain>
References: <1528859749-25286-1-git-send-email-baiyaowei@cmss.chinamobile.com>
	<20180613035030.GB25430@flamenco>
	<23a38716-196f-53a0-0a3d-61f269b1dab4@redhat.com>
	<20180613141510.GA672@byw>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cW+P/jduATWpL925"
Content-Disposition: inline
In-Reply-To: <20180613141510.GA672@byw>
User-Agent: Mutt/1.10.0 (2018-05-17)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Fri, 15 Jun 2018 17:30:16 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Fri, 15 Jun 2018 17:30:16 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'stefanha@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tracing.txt: add missing
 '-' for trace option
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
X-List-Received-Date: Fri, 15 Jun 2018 17:30:27 -0000


--cW+P/jduATWpL925
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 13, 2018 at 10:15:10AM -0400, Yaowei Bai wrote:
> On Wed, Jun 13, 2018 at 06:27:49AM -0500, Eric Blake wrote:
> > On 06/12/2018 10:50 PM, Emilio G. Cota wrote:
> > >On Tue, Jun 12, 2018 at 23:15:49 -0400, Yaowei Bai wrote:
> > >>Signed-off-by: Yaowei Bai <baiyaowei@cmss.chinamobile.com>
> > >>---
> > >>  docs/devel/tracing.txt | 2 +-
> > >>  1 file changed, 1 insertion(+), 1 deletion(-)
> > >>
> > >>diff --git a/docs/devel/tracing.txt b/docs/devel/tracing.txt
> > >>index 07abbb3..6ab32cc 100644
> > >>--- a/docs/devel/tracing.txt
> > >>+++ b/docs/devel/tracing.txt
> > >>@@ -18,7 +18,7 @@ for debugging, profiling, and observing execution.
> > >>  3. Run the virtual machine to produce a trace file:
> > >>-    qemu -trace events=3D/tmp/events ... # your normal QEMU invocati=
on
> > >>+    qemu --trace events=3D/tmp/events ... # your normal QEMU invocat=
ion
> > >
> > >The second dash is not missing; both '-args' and '--args' work.
> > >
> > >'-args' seems to be favoured though; see `qemu -h' or `qemu --h' :-)
> >=20
> > Actually, we're trying to fix that:
> > https://wiki.qemu.org/BiteSizedTasks#Consistent_option_usage_in_documen=
tation
> >=20
> > The one-vs-two dash usage is only supported in qemu, not in qemu-nbd
> > or qemu-img (that is, qemu acts as if it uses getopt_long_only(),
> > while the others use getopt_long() - except that we hand-rolled the
> > parser in qemu, meaning you might find quirks where it sometimes
> > doesn't even match getopt_long_only()).
> >=20
> > At any rate, since --trace is an option that is supported across
> > multiple binaries, we SHOULD favor the double-dash spelling in our
> > documentation, so that you can consistently reuse the same --trace
> > invocation without worrying whether the binary parses its arguments
>=20
> Yes, this patch is inspired by this situation when translating DPRINT into
> trace for a new qemu utility (much like qemu-nbd) following docs/devel/tr=
acing.txt.
> The utility complains it don't support -trace option. So i sent this
> patch after confirming this with qemu-nbd,qemu-io utilities.
>=20
> > with getopt_long() (where double is required) or like
> > getopt_long_only() (where the double is optional but supported).
> >=20
> > So I'm in favor of this patch, although it may need more of a commit
> > message summarizing the justification I've just pointed you to.
>=20
> Thanks for your nice explaination. If this patch could be merged i will
> send V2 with a commit message.

Please update the remaining occurrences of the -trace option syntax in
v2:

  $ git grep -- -trace docs/devel/tracing.txt

Stefan

--cW+P/jduATWpL925
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJbI/elAAoJEJykq7OBq3PIDEcH/3tjlc9aVPiS7+IQoouv1ytk
bEDQFIeW6fp2RJy4l+e4k9M95cjeVu0t3tl3j1mxy7hYny75sZFoXGUcIkwGx2Dp
jz+VZDc3iAFSOtITib9gTzPquyh8m8jCKXo8k0ZUsuW5jQmqB+heY4+C7eFdNqOp
CqlmH2JF20bH0fymLSg+1Vr0z4FS6SBVmbDQCd2mP5tXAfJph7dAJaiGtTDUT08s
l5z0uM5MVmk3anBWs0e7BK5yxNXUBTP3sLWadVbcNfmK9uRZxU8DXzVELqHWiY5J
Ra1y1MLLurX9fzNe4AICwn/5uyR6FuahznxtUpziSfl0VMoFOwXvqpxIT223i78=
=ygn1
-----END PGP SIGNATURE-----

--cW+P/jduATWpL925--

