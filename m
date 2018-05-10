Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fGjFr-0001Ha-Fx
	for mharc-qemu-trivial@gnu.org; Thu, 10 May 2018 06:56:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60881)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1fGjFo-0001Fq-QA
	for qemu-trivial@nongnu.org; Thu, 10 May 2018 06:56:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1fGjFo-0003h2-1u
	for qemu-trivial@nongnu.org; Thu, 10 May 2018 06:56:56 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:35700 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1fGjFj-0003fl-M2; Thu, 10 May 2018 06:56:51 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 63F314022407;
	Thu, 10 May 2018 10:56:50 +0000 (UTC)
Received: from localhost (ovpn-116-76.ams2.redhat.com [10.36.116.76])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EA64963F4E;
	Thu, 10 May 2018 10:56:49 +0000 (UTC)
Date: Thu, 10 May 2018 11:56:48 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <20180510105648.GU1296@stefanha-x1.localdomain>
References: <1525840700-30635-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yRXsXhSYq7voLSEz"
Content-Disposition: inline
In-Reply-To: <1525840700-30635-1-git-send-email-thuth@redhat.com>
User-Agent: Mutt/1.9.3 (2018-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Thu, 10 May 2018 10:56:50 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Thu, 10 May 2018 10:56:50 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'stefanha@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [PATCH] MAINTAINERS: Add trace-events and
 qemu-option-trace.texi to tracing section
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
X-List-Received-Date: Thu, 10 May 2018 10:56:58 -0000


--yRXsXhSYq7voLSEz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 09, 2018 at 06:38:20AM +0200, Thomas Huth wrote:
> The "trace-events" and "qemu-option-trace.texi" files in the top directory
> are currently "unmaintained" according to scripts/get_maintainer.pl. They
> obviously belong to the Tracing section, so add an entry for them there.
>=20
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)

Thanks for the discussion!

I'm happy to serve as a catch-all for trace-events patches (especially
trace events in unmaintained code).  It is preferrable for trace-events
changes to go via the subsystem, if there is a maintainer.

Thanks, applied to my tracing tree:
https://github.com/stefanha/qemu/commits/tracing

Stefan

--yRXsXhSYq7voLSEz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJa9CVwAAoJEJykq7OBq3PI4AUH/RQ2R9adL5riSVdMy90WtevA
sAylfye4u2ayp3EuftOsvtP5iDbjT/Wmdnw56WffMd7K7+coIXY6lmNBxPQbux/i
CS+nfKHDjSYWWgSXTru/sYmcAImSxxL9r49WIqQoMhEu9nLv+WhD6sLMIhIdQjQ9
aBd81W7ICjYtfAlCxbrT1yOqH9Oatayayp/C4uq+lr7om+SqmRZz1mKB3Zr9JDKe
7whaljD+nBgAIxUQAfiyhpQMGUpBb5jKquev7YV/jSPUkaiwTmeuAjomt3R+HltG
gf1PJ/GDyGPQBGYKEBuXgORGRwedhti1LRmO0GIVGoFoERNbEL6Me/HFMZ5gWd4=
=3+fr
-----END PGP SIGNATURE-----

--yRXsXhSYq7voLSEz--

