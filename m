Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1db43m-000261-2A
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 08:08:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52301)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1db43j-00024M-TM
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 08:08:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1db43h-0001U5-51
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 08:07:59 -0400
Received: from mail-wm0-x235.google.com ([2a00:1450:400c:c09::235]:37743)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1db43g-0001Tj-U2; Fri, 28 Jul 2017 08:07:57 -0400
Received: by mail-wm0-x235.google.com with SMTP id e199so18285754wmd.0;
	Fri, 28 Jul 2017 05:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=fV/Vek0d0ZLyNlTExxD86+fSOuhI9z6f1fZc9h2h4d8=;
	b=th8U+EGxOWpiKpV7qY3QNjqr9Z3AcVxCqmvh4bfC5WrPphqW/YwTQ1RHl9oYt1S6xr
	dOOXq1+2wRBLWTu7QMgPPEf8DT0Z44KIVoh5vlYrAmC6L/nhF0/ggKzHnCA8kMPPAHuP
	LY6t+waZkYcyoApm97SG5EEm5OypoOo4IkMbD6mTm17KkyBKU+v+4sbYSg3DIJApPsJt
	sl2/LLZvsn8LxCletF22iB4taAJhMZhklfFL3MiYIHpDjc92rKN33tEQS3bSSajfdHwe
	g0sk6tlYuSBsjkDUUmaN1OoMNA4SGP64CsSDowN2O+BXo7sWQ5jovW2E/FRQYmdLID29
	13uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=fV/Vek0d0ZLyNlTExxD86+fSOuhI9z6f1fZc9h2h4d8=;
	b=HHNfKIVV0PJx4p5kM0Gd+uW2Y30xmoGDTRFSGWXkYzycoAzhHrq1BCAoc5lX2n8qrN
	pZkUFJfMuRyfVgmgcwm1qsJjji0tONOmUz5TUcQwYtarqJN5GK8ofclnJvB+fcucHS3D
	z/HuuMsMqtDdpWrRzZU3FUrFuQkkdaiOYxPMpWw+0VMc/FSfKwZDODxqrlspmppFHMI8
	5vRKthTum4YBvhvehBowS6vz+axBDMZQwAPyGg8ZGY5iQtAPscYKRtCkAHTtCVk33xvs
	7XshOR/ZOZQvstoEzT65iQt2oV/TH74qxrTmC4GBNVfRf2+b1or3msfn88F1UnBjPVyk
	r6cg==
X-Gm-Message-State: AIVw112g9Qy07st/H9nkUdhSJTWh7C1EjPd6VpGYZ+ah6O6oaXCRyX9D
	OCzEleNkQUE48n7JrFw=
X-Received: by 10.80.129.135 with SMTP id 7mr6462301ede.237.1501243675948;
	Fri, 28 Jul 2017 05:07:55 -0700 (PDT)
Received: from localhost ([51.15.41.238]) by smtp.gmail.com with ESMTPSA id
	s4sm11526268edd.28.2017.07.28.05.07.54
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 28 Jul 2017 05:07:55 -0700 (PDT)
Date: Fri, 28 Jul 2017 13:07:54 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc: Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
	qemu-trivial@nongnu.org, qemu-block@nongnu.org, qemu-devel@nongnu.org
Message-ID: <20170728120754.GD12364@stefanha-x1.localdomain>
References: <20170728053610.15770-1-f4bug@amsat.org>
	<20170728053610.15770-20-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AbQceqfdZEv+FvjW"
Content-Disposition: inline
In-Reply-To: <20170728053610.15770-20-f4bug@amsat.org>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::235
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 19/47] MAINTAINERS: add
 missing qcow2 entry
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
X-List-Received-Date: Fri, 28 Jul 2017 12:08:00 -0000


--AbQceqfdZEv+FvjW
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 28, 2017 at 02:35:42AM -0300, Philippe Mathieu-Daud=E9 wrote:
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--AbQceqfdZEv+FvjW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJZeykaAAoJEJykq7OBq3PIKtoH/is9pvppHdMdvuNJZZfd79Xy
xy4Q7/ufmI195KbEpDeOBoyaN0c4D62RTvBIPCBYKINkzJuVfmZeraDDIeXND0Zn
0QKt5w/k2zWce9YIMJKCU0RwHfSjx9m/YhbMBaOESzP35I8877+bnhE03kf1r/A5
wVoND7lSQTeUeLo383iSQcJWc7NMYMn/oe2+A39xYJjUSCdJBGeQA+etBGPMebJ5
sVC3/OCiaiwueVJpKyAaQ8mJrmHRwimcxLA2T2QlLLw3gqG2Gg4D3TbbR4TI6wNJ
NKCw/gl5oBdMI3XAACxTmPNjv2SzQAf5bFGhdWfMMHtJQrnPhI5HUm12ldPN51A=
=9aWR
-----END PGP SIGNATURE-----

--AbQceqfdZEv+FvjW--

