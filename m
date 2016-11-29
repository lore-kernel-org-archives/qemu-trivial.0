Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cBf9V-0006TL-34
	for mharc-qemu-trivial@gnu.org; Tue, 29 Nov 2016 04:56:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54452)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1cBf9T-0006ST-EF
	for qemu-trivial@nongnu.org; Tue, 29 Nov 2016 04:56:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1cBf9S-0007xM-KJ
	for qemu-trivial@nongnu.org; Tue, 29 Nov 2016 04:56:39 -0500
Received: from mail-wj0-f195.google.com ([209.85.210.195]:35977)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1cBf9N-0007wQ-TB; Tue, 29 Nov 2016 04:56:34 -0500
Received: by mail-wj0-f195.google.com with SMTP id jb2so17388173wjb.3;
	Tue, 29 Nov 2016 01:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=ScSmQE2Xm/U1InawmybJBedfeJVl3ILfQCO29ComEVY=;
	b=oOUN3sKjXK55P2MIK6C8femm9O4QFSgvmtB4XKzhP9d89QHRv4+ex/wnywzrpNg+oe
	Vc9K061zzXXYXWqpuP6l6aewxMRzfw6Hnp+kP7uOdps0jUgdL0zl6iorsHu2N0fLnpQ5
	P01dn6C8IKs1dBmZqJfTOtta+9JZHwKIRvXQA4N7fehpuGYs+rWIWnDaR+2Tfudmb7TZ
	eU3qMDgCfXherMkSR8ssp/Vi/nU4unqdKOYyMkUv9fUSL0y2iCFEZdC4wSKnRdVTIDXI
	V++gcL7rhkWjNv7SqctU3asNj8FmBhiXvj+/NikXls7XQ1vehs3yxxUcSJLUpKxmxOSl
	G3xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=ScSmQE2Xm/U1InawmybJBedfeJVl3ILfQCO29ComEVY=;
	b=KNIoXEw3eZPEuBIUZNxKFOvsNngLqVWctTvEmT73/Z0VO1z8ume1RGK0J9Ha7iILio
	4OjdTuxOrv+pEg/VU+nn3ih1U9S03b05oyEWHuB9eKk5mYIN3SOpe4ZZlkfBpu9D8zPA
	N7AEJaqRL7QGVDp16WX7KOwTjvP75Oe35HqUcgazFS0KbI+zVGIWFxxBrViV01wYT8DE
	R7ns+o1tnI/GYSxyoavXL6X6SHyOvA61g3rAJlLpFBizPHlRIC9/7NrACbCF4968XNqW
	2Ns80vQzVZYtJUzpGl5idrdz6XNVxC7SfaLoDPykUEOW0gBXDFM8bocfvNLNuUlF3WR+
	Ms7w==
X-Gm-Message-State: AKaTC01BzFYsjKfy0UD9d235QuFMvKz1Bu/woK2x5nOX5Bxz6kD6gWBSKUAWGmQ5ikkfEw==
X-Received: by 10.194.223.70 with SMTP id qs6mr6205161wjc.124.1480413332632;
	Tue, 29 Nov 2016 01:55:32 -0800 (PST)
Received: from localhost (host109-156-64-108.range109-156.btcentralplus.com.
	[109.156.64.108]) by smtp.gmail.com with ESMTPSA id
	p144sm1882237wme.23.2016.11.29.01.55.31
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 29 Nov 2016 01:55:31 -0800 (PST)
Date: Tue, 29 Nov 2016 09:55:31 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Francis Deslauriers <francis.deslauriers@efficios.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <20161129095531.GG5152@stefanha-x1.localdomain>
References: <1480348337-24271-1-git-send-email-francis.deslauriers@efficios.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xjyYRNSh/RebjC6o"
Content-Disposition: inline
In-Reply-To: <1480348337-24271-1-git-send-email-francis.deslauriers@efficios.com>
User-Agent: Mutt/1.7.1 (2016-10-04)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.210.195
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: fix LTTng UST
 tracing backend detection
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
X-List-Received-Date: Tue, 29 Nov 2016 09:56:40 -0000


--xjyYRNSh/RebjC6o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 28, 2016 at 10:52:17AM -0500, Francis Deslauriers wrote:
> The detection program needs to be linked with -ldl to build succesfully
> with recent versions of LTTng-UST.
>=20
> We also need to add -ldl to the libs required to build the LTTng-UST
> backend (lttng_ust_libs).
>=20
> Signed-off-by: Francis Deslauriers <francis.deslauriers@efficios.com>
> ---
>  configure | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Thanks, applied to my tracing tree:
https://github.com/stefanha/qemu/commits/tracing

Stefan

--xjyYRNSh/RebjC6o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJYPVCTAAoJEJykq7OBq3PITdsIALIQCYAqsARJcKVHLLU++JsH
8hJKCLeEM71F+kzX35hSUApKObskKanGI9H3bZ9fDQBAGa/7boqDvrydMrCbf3oW
qI7XKgM+J/lsE9+Q0BryVdFy21uv+z5TPT5QyR7avTJdQjUYoGzikZfStT4Fc7BO
e0+4txLMNlCqOhDgbML6qefp5o0YLQSnR5CpVti5/Sg1n8aswDzkcfJswiOeFQvz
5LfB2ASn0mX0OZF7J3IMRHLbcsxkXtetza6xZTr8fvt3AU020P9TviXo/ApyKkAP
B8x5lNxXxwp8NepUlm/Ts4+trsm7Oka7HLnotInDmGC7JsI4NZlL9whvupjCqT0=
=3uHp
-----END PGP SIGNATURE-----

--xjyYRNSh/RebjC6o--

