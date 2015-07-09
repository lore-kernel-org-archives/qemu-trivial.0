Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZD92J-0003Qa-Lr
	for mharc-qemu-trivial@gnu.org; Thu, 09 Jul 2015 06:26:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43888)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1ZD92G-0003NE-Kn
	for qemu-trivial@nongnu.org; Thu, 09 Jul 2015 06:26:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1ZD92F-0006cF-O1
	for qemu-trivial@nongnu.org; Thu, 09 Jul 2015 06:26:32 -0400
Received: from mail-wg0-x231.google.com ([2a00:1450:400c:c00::231]:36364)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1ZD92B-0006Zs-5F; Thu, 09 Jul 2015 06:26:27 -0400
Received: by wgxm20 with SMTP id m20so36075691wgx.3;
	Thu, 09 Jul 2015 03:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=UKHzYwt82sasj+U5PJxisO1LtmKDWl4+0gaQiUCNpLg=;
	b=byUE3epMLuBNUPrug5rt4nwbkMx4w4ajdbGe5AWXeXiaUei8lbcUHx1V0NXfCK/yFw
	hyiaRfuvPB1K5xMHja0gL2pyYAVKqM1zLX7pc/pSYSriRAmlgAGRwPorwLgNenkoteFZ
	tik/5AJVqku/TR6swKlEpM4VYJoRNRPY8mu8BhYrg/gX5mrv8/DcLegwA3az9SZIOkU6
	JJ3EfJazin88K/QHIWwaO+Cq1U3nbSJUSJ856Ss3DfDjMcvMQ4raykqaXuKyAQFD2gmv
	hh/oh4o1b0NZugKte3wRP9mOq2JIOmvi+HcCcIPeClO5XrVgFUPOavDojJKnIeJnZqJR
	AKvQ==
X-Received: by 10.180.86.73 with SMTP id n9mr118843785wiz.78.1436437586347;
	Thu, 09 Jul 2015 03:26:26 -0700 (PDT)
Received: from localhost (host86-153-218-221.range86-153.btcentralplus.com.
	[86.153.218.221])
	by smtp.gmail.com with ESMTPSA id q3sm8033823wjr.38.2015.07.09.03.26.24
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Jul 2015 03:26:25 -0700 (PDT)
Date: Thu, 9 Jul 2015 11:26:23 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: John Snow <jsnow@redhat.com>
Message-ID: <20150709102623.GC28530@stefanha-thinkpad.redhat.com>
References: <1435611386-29316-1-git-send-email-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0lnxQi9hkpPO77W3"
Content-Disposition: inline
In-Reply-To: <1435611386-29316-1-git-send-email-jsnow@redhat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c00::231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] trivial: remove trailing
 newline from error_report
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
X-List-Received-Date: Thu, 09 Jul 2015 10:26:33 -0000


--0lnxQi9hkpPO77W3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 29, 2015 at 04:56:26PM -0400, John Snow wrote:
> Minor cleanup.
>=20
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  hw/ide/ahci.c      | 2 +-
>  hw/vfio/platform.c | 2 +-
>  net/tap-linux.c    | 4 ++--
>  3 files changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

Laszlo Ersek suggested a compile-time check (e.g. BUILD_BUG_ON()).  Have
you looked into this?

Perhaps something along the lines of:

BUILD_BUG_ON(__builtin_constant_p(fmt) &&
             __builtin_strlen(fmt) > 0 &&
	     fmt[__builtin_strlen(fmt) - 1] =3D=3D '\n')

--0lnxQi9hkpPO77W3
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJVnkxPAAoJEJykq7OBq3PI/E4H/RlyTdn/95j4RxZy8ZdcTTsb
1Uq/BGUs5dTmxX97KuEcPLskqGRkKL7dx9Jmxi7TEM/8xQcP/19+mI9liElJjbST
P/B7vUmbDZJjmxd87ZZXckfPcfqdvTH0NKs8t+1CwB9UtH+vVPPmi+5Vs3MSlvUC
OdB0Hz56uhgJ0TtZOH8/2PtSglvUZzdz16FaXGWutqoZtY5dI7qnJT/JpzAGr7su
k0DEnOobJp7D8vAjzld3QboTJoHMwrHrmYsOCvzZIL0+R36gUxEayIJgZH3sD686
8OhT01K6PyzaskhIesS9Hp4Vfu8n9Lfc3bZSnTgI9o4XY5s3Ah7g0uxa+Vw+YNM=
=6BT2
-----END PGP SIGNATURE-----

--0lnxQi9hkpPO77W3--

