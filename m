Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XTYdH-0004r6-9j
	for mharc-qemu-trivial@gnu.org; Mon, 15 Sep 2014 11:56:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37332)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1XTYd6-0004pO-6I
	for qemu-trivial@nongnu.org; Mon, 15 Sep 2014 11:56:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1XTYcx-0008Eq-3z
	for qemu-trivial@nongnu.org; Mon, 15 Sep 2014 11:55:52 -0400
Received: from mail-wg0-x229.google.com ([2a00:1450:400c:c00::229]:36284)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1XTYcw-0008Ee-PB; Mon, 15 Sep 2014 11:55:42 -0400
Received: by mail-wg0-f41.google.com with SMTP id k14so4082165wgh.0
	for <multiple recipients>; Mon, 15 Sep 2014 08:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=cC74U3oSPOup9hkL/niPuTIIf5y/1q6oG7rBemIlfbo=;
	b=UyRAvlPFiyw1m4WK75DWbYYkaViQv5HrFwNdmeE0ED2kHGa0GXFzBwKqYAW7d2WsYD
	zoh8JlsPIV07Jlhkpwp/li5PNCdIEC12ztzw1wPCHC5KN9kGRfaHWx8sH+xVbpa+y5ph
	PZwfrqeAtrafnV7AI/TFGbZx1q/yNlM97hAy4ejkbCsl1d7h8i0a4eTj20E3sNycayfm
	hwDK6fQ0AwiQGovpUgkPMX6aYUKtHn/xmLOFuMxotfJId7+87c9Tk8HlUi7ezSFhKi+n
	f3JsuI1kjCS0C2vYk6NhQB6dBHRy8nhb+/Z5fSrrQH8R878Jv6FDTe6UcamPE/JVfoSi
	qZ7g==
X-Received: by 10.194.2.12 with SMTP id 12mr33936779wjq.54.1410796539394;
	Mon, 15 Sep 2014 08:55:39 -0700 (PDT)
Received: from localhost (44.175.90.146.dyn.plus.net. [146.90.175.44])
	by mx.google.com with ESMTPSA id i5sm15266492wjz.0.2014.09.15.08.55.37
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Sep 2014 08:55:38 -0700 (PDT)
Date: Mon, 15 Sep 2014 16:55:36 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20140915155536.GD32379@stefanha-thinkpad.redhat.com>
References: <1410428416-5046-1-git-send-email-marc.mari.barcelo@gmail.com>
	<20140912082756.GB1614@stefanha-thinkpad.redhat.com>
	<CAFEAcA9haYpJ4Rsd8W=Cjq44kL079=L7ByRP=HcecS9jW87v6w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mSxgbZZZvrAyzONB"
Content-Disposition: inline
In-Reply-To: <CAFEAcA9haYpJ4Rsd8W=Cjq44kL079=L7ByRP=HcecS9jW87v6w@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c00::229
Cc: Marc =?iso-8859-1?Q?Mar=ED?= <marc.mari.barcelo@gmail.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [TRIVIAL][PATCH v2] libqos virtio:
 Increase ISR timeout
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
X-List-Received-Date: Mon, 15 Sep 2014 15:56:01 -0000


--mSxgbZZZvrAyzONB
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 12, 2014 at 09:30:55AM +0100, Peter Maydell wrote:
> On 12 September 2014 09:27, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> > On Thu, Sep 11, 2014 at 11:40:16AM +0200, Marc Mar=ED wrote:
> >> Increase the clock step to avoid Travis failure in some builds due to
> >> overagressive timeout.
> >>
> >> Signed-off-by: Marc Mar=ED <marc.mari.barcelo@gmail.com>
> >> ---
> >>  tests/libqos/virtio.c |    4 ++--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>=20
> Do you mind if I apply this directly to master to stop
> travis grumbling at us on irc?

No problem, especially when Kevin or I have already given a Reviewed-by:
or Acked-by:.

--mSxgbZZZvrAyzONB
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJUFwv4AAoJEJykq7OBq3PIiZIH/iDztlNAgWrBnhcM1/+eu5VQ
7d9laMVjLFpbcLHxVVmVMwQHvMlDEvA2kGiDdap5MmbyYg0G+Ac1P0IAEklcc9Jy
cMruPwnCt1tb6QHhZqdOm9H+Q17Pol5QHvSDPakem0Z6YCp69n9iwh/6KlOn6kb1
AvdWSH/jPea3l8Rh6Z0LztouxJwmXmKXIoTt6WnZ+6rcGTpKZ9OYXEQ3PcFkPLuQ
lwC53f/4izEBtsSmRwg7H6at0NGlbHkxIT45ebjTra+wCcSsTK34aBxXJscMhvB9
4rAVDlYyHzzgXmp3ldDa7BmMQsGALbrvoZCWXkkMXX62hxfQEKLrpzvQKWk3aEY=
=py8f
-----END PGP SIGNATURE-----

--mSxgbZZZvrAyzONB--

