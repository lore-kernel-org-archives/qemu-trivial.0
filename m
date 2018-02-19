Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1enjEB-00086S-3Q
	for mharc-qemu-trivial@gnu.org; Mon, 19 Feb 2018 06:03:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48075)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1enjE8-00084N-0I
	for qemu-trivial@nongnu.org; Mon, 19 Feb 2018 06:03:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1enjE4-0004ay-Tk
	for qemu-trivial@nongnu.org; Mon, 19 Feb 2018 06:03:20 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:59140 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1enjE4-0004a7-Pg
	for qemu-trivial@nongnu.org; Mon, 19 Feb 2018 06:03:16 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 34AA14023113;
	Mon, 19 Feb 2018 11:03:10 +0000 (UTC)
Received: from localhost (ovpn-116-157.ams2.redhat.com [10.36.116.157])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 963D221411B6;
	Mon, 19 Feb 2018 11:03:03 +0000 (UTC)
Date: Mon, 19 Feb 2018 11:03:02 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Su Hang <suhang16@mails.ucas.ac.cn>
Cc: thuth@redhat.com, qemu-trivial@nongnu.org
Message-ID: <20180219110302.GA23848@stefanha-x1.localdomain>
References: <1519025011-26416-1-git-send-email-suhang16@mails.ucas.ac.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AhhlLboLdkugWU4S"
Content-Disposition: inline
In-Reply-To: <1519025011-26416-1-git-send-email-suhang16@mails.ucas.ac.cn>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Mon, 19 Feb 2018 11:03:10 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Mon, 19 Feb 2018 11:03:10 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'stefanha@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH RFC] util: Fix wrong
 indentation TAB with space
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
X-List-Received-Date: Mon, 19 Feb 2018 11:03:22 -0000


--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 19, 2018 at 03:23:31PM +0800, Su Hang wrote:

Please send all patches to qemu-devel@nongnu.org.  This way everyone in
the community is aware of the proposed code change.  Not everyone
follows qemu-trivial.

> BiteSizedTasks: Developer conveniences
>=20
> I use checkpatch.pl to find these files
> (bitops.c envlist.c osdep.c qemu-sockets.c readline.c uri.c)
> use TAB instead of space for indentation.
>=20
> Repalcing all TABs in the beginning of lines with space, and left
> the rest of file untouched.

Try using grep(1) or your editor's search function to verify that there
are no tabs left.  Thomas pointed out places where there are still tabs,
maybe checkpatch.pl missed them.

--AhhlLboLdkugWU4S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJaiq7mAAoJEJykq7OBq3PI86gIAJ/UHeb57IY9/8INlbwFpQEN
UtLY89qu1peo0W/vN3KaChoZfTtZebGtgpCzjhHRSGSqbI69bxXCGBjoydmBvx63
MVdLewNo/T3IBuPAWfo++QQckA7WsTVOXdf3Szzm2ZQ7TIQygoXvhmUOIXylyfzX
E/WDN0Hxdmb3enaJCH3XkuhUIpJTc3byGCI9ZQ9U87sBFdricQlJh9JGyyS5Kt59
xTPEkT9jq+EAi0jaEpw285ib4hmLeaymCt8FFPSar/qc3ArxHMmWtw62lcyiOL8T
G2JwW/zLcm46WRF7VnE9scp6Hjli7P1fw4aOBmXp1+UMI383pHepVoigD7hSTcc=
=qc9e
-----END PGP SIGNATURE-----

--AhhlLboLdkugWU4S--

