Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dFdja-0003ZX-Kc
	for mharc-qemu-trivial@gnu.org; Tue, 30 May 2017 05:46:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47678)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1dFdjY-0003XN-3Q
	for qemu-trivial@nongnu.org; Tue, 30 May 2017 05:46:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1dFdjX-0003HW-2A
	for qemu-trivial@nongnu.org; Tue, 30 May 2017 05:46:36 -0400
Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243]:36829)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1dFdjR-0003GJ-4y; Tue, 30 May 2017 05:46:29 -0400
Received: by mail-wm0-x243.google.com with SMTP id k15so23902505wmh.3;
	Tue, 30 May 2017 02:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=ZxcU1iBCCyUlZkzwbpXpWW2eJPuUzHj3AqKLbL49TbI=;
	b=bphDsj56nrG5J0XB11cCGy5dH14sRxlmBegbSwY4HnhHKmBhWLG4IxZeVpt1g8EF21
	u0tKH1pqSdQ/STVYQ+akmqrxpNLcsk4a7qhMJUezExguDUmtir0mpRC4GZT6ja+btP/m
	LUX7OLbAiwiVnNEQy4edYtiItwAy+XsuqyZ4f2oPbTLL7iE3LyEkKsojHbiwOzDfHUON
	k2iFUE2z2BKD6PPayNr8asutFNjtkKrL32YxslzpmiEztpX7+MuXPI5NfE8TDDheBx2V
	39vHycrtEC2LgidJRwr4+6XcGnmkWXoY87LEZDjFA3b6cs/vR6+9Edtl2FpABkDmqAnK
	RYZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=ZxcU1iBCCyUlZkzwbpXpWW2eJPuUzHj3AqKLbL49TbI=;
	b=H/AbbB2HPjkxqhlgRzzSM0MSUDWgFV143JwRQHbnCIeLG4fXFh5DeqAqL7M6w2T1bs
	TmdaBzE0+XhAtzLck7rxrp54jBt+sEydhXT3QheVyKQWTV75l0vIbscJZ3Y6vif17M0p
	GGuGRdWLiORmtZQb/Ojly2S1Dt8QTW0ikqMyyBJFr4t6fpzh0LR1Z215qnqWxGWkADRX
	DhIxGsJKJP9JBYm9qEYvBGprXK/05Ha98e9BXrWEhbsXLmdHFvD3YvRUHVu5lvRMxy47
	b5cjFY88pIQDmEnqw5edKJ9cC91zSO9LFzi0L5tkm0EmPojoHexlPIsisHh5xdwydJvq
	M9kQ==
X-Gm-Message-State: AODbwcDTLzDmnuGUSjHatiECHvpTIo9GEMXGL4YPxFjNMlsvkgMFZ9G3
	D2kDAqY1FhehnA==
X-Received: by 10.223.130.37 with SMTP id 34mr6052140wrb.44.1496137588042;
	Tue, 30 May 2017 02:46:28 -0700 (PDT)
Received: from localhost ([51.15.41.238]) by smtp.gmail.com with ESMTPSA id
	x37sm21814143wrb.42.2017.05.30.02.46.26
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 30 May 2017 02:46:26 -0700 (PDT)
Date: Tue, 30 May 2017 10:46:26 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Jose Ricardo Ziviani <joserz@linux.vnet.ibm.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <20170530094626.GO11362@stefanha-x1.localdomain>
References: <1496075404-8845-1-git-send-email-joserz@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8N0TQpGUCeEQshoq"
Content-Disposition: inline
In-Reply-To: <1496075404-8845-1-git-send-email-joserz@linux.vnet.ibm.com>
User-Agent: Mutt/1.8.0 (2017-02-23)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] simpletrace: Improve the
 error message if event is not declared
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
X-List-Received-Date: Tue, 30 May 2017 09:46:37 -0000


--8N0TQpGUCeEQshoq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 29, 2017 at 01:30:04PM -0300, Jose Ricardo Ziviani wrote:
> Today, if we use a trace-event file which does not declare an event
> existing in the log file we'll get the following error:
>=20
> $ scripts/simpletrace.py trace-events trace-68508
> Traceback (most recent call last):
>   File "scripts/simpletrace.py", line 242, in <module>
>     run(Formatter())
>   File "scripts/simpletrace.py", line 217, in run
>     process(events, sys.argv[2], analyzer, read_header=3Dread_header)
>   File "scripts/simpletrace.py", line 192, in process
>     for rec in read_trace_records(edict, log):
>   File "scripts/simpletrace.py", line 107, in read_trace_records
>     rec =3D read_record(edict, idtoname, fobj)
>   File "scripts/simpletrace.py", line 71, in read_record
>     return get_record(edict, idtoname, rechdr, fobj)
>   File "scripts/simpletrace.py", line 45, in get_record
>     event =3D edict[name]
> KeyError: 'qemu_mutex_locked'
>=20
> This patch improves this error by adding a hint instead of just that
> KeyError log:
>=20
> $ scripts/simpletrace.py trace-events trace-68508
> 'qemu_mutex_locked' event is logged but is not declared in the trace
> events file, try using trace-events-all instead.
>=20
> Signed-off-by: Jose Ricardo Ziviani <joserz@linux.vnet.ibm.com>
> ---
>  scripts/simpletrace.py | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)

Thanks, applied to my tracing tree:
https://github.com/stefanha/qemu/commits/tracing

Stefan

--8N0TQpGUCeEQshoq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJZLT9yAAoJEJykq7OBq3PIgjkIAMjM0vtxyMQDhhIJXFiN7C16
zBssTs4vvWqXPOSqmedlc53sR9xycUDXA2s2pohjaGDLfWWPDRJ4Atf/qacg0xqq
nRHxDxQ5Vtlpf6ypmUEXaD/LmUa7AqMY4OwhMCF0e9QEEMCITNu7yqZPvejkZSXs
VXTgMsWMA5JzDBKY+d/vB21YTobR7r0vVZRpnLjvUwNegiwvPq5ij41jMCvVxJXP
pHCE2Gm84eCqanGh35h6jOikHar85y0OaPaeRPR24dndOatcn2snG0AaN0RdlNhl
ZpO6Ke3DGz6Qvqn8is1L2fzZ/+Yj4AxD3E40AW1dci8w2OeJK5ZXqKgJ1RhuOJk=
=r1bS
-----END PGP SIGNATURE-----

--8N0TQpGUCeEQshoq--

