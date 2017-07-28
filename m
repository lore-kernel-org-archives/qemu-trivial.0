Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1db4C4-0003Gd-M7
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 08:16:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57982)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1db4C2-0003EY-Bj
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 08:16:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1db4C1-0000Z9-FN
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 08:16:34 -0400
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244]:35313)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1db4Bv-0000Q0-IA; Fri, 28 Jul 2017 08:16:27 -0400
Received: by mail-wm0-x244.google.com with SMTP id r77so14099797wmd.2;
	Fri, 28 Jul 2017 05:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=zvR1FOFHHst5O+FHPIrCLhWqwKulzVeFpZuA4rcpprk=;
	b=oNvLOvLzgjkDIn8vS/V2If0FI2RG0skqCr5s+yCNN6BrBfzycWK39PQfTIOjS4UZyt
	B9hEOEFuqU+qqZJTo7qIfh1KD4IAzSoGvQYSUACX95exTftLqyLOvk2LpvgGlWQnUQau
	sHjecyMrzJW0idcLSmp0mxX+IwbVLfr/ri9f6Wr5T2Qdb7izUmqwV4TLxj39ZepbiK56
	2KqmZf+1myrcJ+efbZBDZW44q1qfRzSm7cTzwrclGtCSssZzvtnbiph4BgPJVSpl4mod
	ynzY6MeuHJq7B8zWd0Jtm8d9D/VBMTBlQHTpE0PqElC79fNu7MhDZWoQSRGaTV0cVrKx
	wFIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=zvR1FOFHHst5O+FHPIrCLhWqwKulzVeFpZuA4rcpprk=;
	b=KZYHabLoOuveoz4f0lCpJwZvkUoHz/T1UXr1LKieLDfp61sIiSDodbrfvrE26VoFoG
	BzQeFDv+s18feaHj/DqWpkM9AV2AbAGjdFse/gRtBg4dRbY0sgSNVB353RFv+YJnqjAk
	bpjKJN2Piv6tZRZp1LHZzoFWMEo5QRLLgRxaueEREgoIpaCd5CkTSTDQF2XvHODz0QKt
	e+sVbk6ByfKbaAXzGAzMbqY4vJLKp1Whr6T5dyITZLV5O6XB0StZpooZ/i29xZuH7hY7
	eYK8BKLq160ccqkPINbNzGXt+B7pdXjVaojAqK4ORwQNMMZGk5yfI54nDWulR5IpTLje
	Am+Q==
X-Gm-Message-State: AIVw110e/s1+yj++Z3w4HfIsK8g/qAQff7/ksTflTS1TcIQZ7tc9fnrJ
	XvS2t/EwzDHMRPbrPDM=
X-Received: by 10.80.217.4 with SMTP id t4mr6141488edj.225.1501244186558;
	Fri, 28 Jul 2017 05:16:26 -0700 (PDT)
Received: from localhost ([51.15.41.238]) by smtp.gmail.com with ESMTPSA id
	o15sm13023926edo.68.2017.07.28.05.16.25
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 28 Jul 2017 05:16:25 -0700 (PDT)
Date: Fri, 28 Jul 2017 13:16:24 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Cleber Rosa <crosa@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <20170728121624.GI12364@stefanha-x1.localdomain>
References: <20170727120210.6943-1-crosa@redhat.com>
	<20170727120210.6943-5-crosa@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/8E7gjuj425jZz9t"
Content-Disposition: inline
In-Reply-To: <20170727120210.6943-5-crosa@redhat.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::244
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 4/5] qemu-iotests: remove
 comment about root privileges requirement
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
X-List-Received-Date: Fri, 28 Jul 2017 12:16:35 -0000


--/8E7gjuj425jZz9t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 27, 2017 at 08:02:09AM -0400, Cleber Rosa wrote:
> The check script contains a commented out root user requirement,
> probably because of its xfstests heritage.  This requirement doesn't
> apply to qemu-iotests, so it better be gone.
>=20
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/qemu-iotests/check | 6 ------
>  1 file changed, 6 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--/8E7gjuj425jZz9t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJZeysYAAoJEJykq7OBq3PItJMIAMmAZx6hIExO8Sgow/fE0AjS
W7GOqGH/0Jxgiyf1npo2sQKXEl1BcBu9vpprGgjaeqYi13antu5qVRAkhhQJzUDD
M7R6+74Yv3b3kWQovK8Of+6oH6TFxNZwoFLP8hEMQfPviupyJ4163qrxBUfHXUrh
NuYE5EnMSDdJVyZZtyaqifhlPOqxgrllKl5FmbAKpMPVsIbWqFuhhpAuGqzVUvXW
hVcUerUARY7Tx1MWPbB1l1p76a60qZAWpza0RUlhIj3EOMzM1+1KSPzMkbGl79Dz
MrX0UjOAx7zuPQLPO/3DfFZp3UDWT0Fz0KJiK97Sd7O3ZUvOcdFn1Sq7GN73Oso=
=hpNq
-----END PGP SIGNATURE-----

--/8E7gjuj425jZz9t--

