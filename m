Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1buzBP-0008L8-JG
	for mharc-qemu-trivial@gnu.org; Fri, 14 Oct 2016 05:53:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59860)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1buzBN-0008IE-Fu
	for qemu-trivial@nongnu.org; Fri, 14 Oct 2016 05:53:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1buzBL-0006Ra-IL
	for qemu-trivial@nongnu.org; Fri, 14 Oct 2016 05:53:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50048)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>)
	id 1buzBE-0006OJ-Bt; Fri, 14 Oct 2016 05:53:32 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AC5EF635C6;
	Fri, 14 Oct 2016 09:53:31 +0000 (UTC)
Received: from localhost (ovpn-112-59.ams2.redhat.com [10.36.112.59])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9E9rUek005234; Fri, 14 Oct 2016 05:53:31 -0400
Date: Fri, 14 Oct 2016 10:53:30 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Stefan Weil <sw@weilnetz.de>, QEMU Developer <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Message-ID: <20161014095330.GA20003@stefanha-x1.localdomain>
References: <1476383370-30650-1-git-send-email-sw@weilnetz.de>
	<CAFEAcA8QADee1et4jSGP26i8atRy2KG29wMab_nieisNvCicEQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yrj/dFKFPuw6o+aM"
Content-Disposition: inline
In-Reply-To: <CAFEAcA8QADee1et4jSGP26i8atRy2KG29wMab_nieisNvCicEQ@mail.gmail.com>
User-Agent: Mutt/1.7.0 (2016-08-17)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 14 Oct 2016 09:53:31 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Fix build for less common
 build directories names
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
X-List-Received-Date: Fri, 14 Oct 2016 09:53:42 -0000


--yrj/dFKFPuw6o+aM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 13, 2016 at 07:36:07PM +0100, Peter Maydell wrote:
> On 13 October 2016 at 19:29, Stefan Weil <sw@weilnetz.de> wrote:
> > scripts/tracetool generates a C preprocessor macro from the name of the
> > build directory. Any characters which are possible in a directory name
> > but not allowed in a macro name must be substituted, otherwise builds
> > will fail.
> >
> > Signed-off-by: Stefan Weil <sw@weilnetz.de>
> > ---
> >
> > I had problems with a build directory of the form "host,variant".
> > Is this fix needed for stable, too?
>=20
> Why does it need to care about the build directory name at all?
> Ideally builds should be entirely deterministically reproducible
> whatever the path to the source or build directory names is...

It's trying to construct the relative path from the source directory to
a trace-events file (inside the source directory).  This is used so that
block/trace-event macros have BLOCK in their name while net/trace-events
have NET, etc.

It does not care about the build directory or source directory path per
se.  Therefore deterministic builds shouldn't be a problem if the code
is working correctly ;).

Stefan

--yrj/dFKFPuw6o+aM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJYAKsaAAoJEJykq7OBq3PINHEIALA0yZ141O/ZSdCkZfTKfKkp
yksh3q3LVsafDARUV3uHmA34IalpXiiHEh1i/UDae3d8NtvOJ0FjjgNSJz5uKUH1
YSTk7buDLBZny43YN+0HIp3RQwHF6N33mNUi5P0erwzQsrTJ3tiMypwFB5T8ratk
OrF4Fr5RCFxfbr8K9ekIR5cl+TnDeo6g2bOj32XyuDhiBx04B6slFtXW4G/ud0a6
ZxW0ti+CJwOYm0kXaGGTpCbEq3zY/9xRtOowNUv4m4yi148LpoU1lvE1Ra8AXNzB
9xMsvKZC2W7D7O1ZLJiIpjejq2BHProIvHxOVp5NO0EoUd/mcyUWDVv843LiwpI=
=w9cF
-----END PGP SIGNATURE-----

--yrj/dFKFPuw6o+aM--

