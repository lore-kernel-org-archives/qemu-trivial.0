Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cBeoa-0006S8-8T
	for mharc-qemu-trivial@gnu.org; Tue, 29 Nov 2016 04:35:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45048)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1cBeoX-0006PJ-0p
	for qemu-trivial@nongnu.org; Tue, 29 Nov 2016 04:35:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1cBeoU-0005Co-9z
	for qemu-trivial@nongnu.org; Tue, 29 Nov 2016 04:35:01 -0500
Received: from mail-wm0-f65.google.com ([74.125.82.65]:34447)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1cBeoU-0005Cd-3G; Tue, 29 Nov 2016 04:34:58 -0500
Received: by mail-wm0-f65.google.com with SMTP id g23so23313149wme.1;
	Tue, 29 Nov 2016 01:34:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=/WrN9aCiHpgcTjXzRfCq/2520lbBh2jg+ogOqYwL8qs=;
	b=VBX5rIeCLSQVioHQ8dNW98teGeH8guNUpP4zV/az6gAemkMizjK+DljWIeSTd8atR7
	b0xP1VhxeOcUDV3hu0mq2YdimUH6ZAoaGXiXqQc5m2uqtyvSdC2l2xq3Ynhz24KxVR6B
	NrbLuT9q+WiwWRK6mt0TcJeWoOOf8k1kDZR8UBf2QnthuCMaMQE0U1QODFwsIJ6VNggJ
	BOBa5wL1PLPqy4R7QGZgDWQ6ttejfjzZ7xZVsro/i5U+H27MV3dgrGFajXjmsxZmD6GD
	rPECEmTr4eCrYY5B2dy/0+hQ/GVbDJbkJsR8udzkY79CkHJcOEZunH3+M+uL/LoBgN7a
	ix5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=/WrN9aCiHpgcTjXzRfCq/2520lbBh2jg+ogOqYwL8qs=;
	b=CqrEPrBsHBXY7WI1LNElMZBTdfUnclvMmOIomdWXr1PUtyOZwe8av8aFGu6B82UWAg
	nZdOKpdhAap9+d6CMOsf7D/PXTRqOWNy5mvcI3Xnv1fS/XNK68o9fSTo1QVI5x5KXEAz
	ARaktJOa0rPVn3TwxYqu8ElIry8sIwMGbL2W5Gm1QrCfccKrQasDoEtrrb+S11p0vPlN
	/lgnpE8Pd3iUrc2Bs3rT+duFuxsSX2vOhNuUP8wvRaT4+xBBwTcmi77Yu587Pq6JjWB+
	nBzh1bpEC5cGpkMR771oZK/9NTJNHYK4lj9iZFyEVTJv6kbXHHZGD4Y3dJ3uRK6brERW
	6NCg==
X-Gm-Message-State: AKaTC00thGDWRxueUG1OLlEF+GlCkT4snLEw6XZ5o/eD0iv8XvPPWekOYy0AxMs0XwFeKQ==
X-Received: by 10.28.95.197 with SMTP id t188mr22107570wmb.99.1480412036989;
	Tue, 29 Nov 2016 01:33:56 -0800 (PST)
Received: from localhost (host109-156-64-108.range109-156.btcentralplus.com.
	[109.156.64.108])
	by smtp.gmail.com with ESMTPSA id 204sm1813232wmj.7.2016.11.29.01.33.55
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 29 Nov 2016 01:33:56 -0800 (PST)
Date: Tue, 29 Nov 2016 09:33:54 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Adrian Bunk <bunk@stusta.de>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Message-ID: <20161129093354.GF5152@stefanha-x1.localdomain>
References: <20161127162817.15144-1-bunk@stusta.de>
	<a6630537-d71e-1b1a-4388-c91ba8cacbb7@redhat.com>
	<20161128152404.sywmey4pdcv7btup@bunk.spdns.de>
	<36ee35dd-49ea-f2e3-fa1e-600483b9d4e7@redhat.com>
	<460f994a-fe47-1d1e-0d26-1220d8a05256@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xaMk4Io5JJdpkLEb"
Content-Disposition: inline
In-Reply-To: <460f994a-fe47-1d1e-0d26-1220d8a05256@redhat.com>
User-Agent: Mutt/1.7.1 (2016-10-04)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.65
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] rules.mak: Use -r instead
 of -Wl, -r to fix building when PIE is default
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
X-List-Received-Date: Tue, 29 Nov 2016 09:35:02 -0000


--xaMk4Io5JJdpkLEb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 28, 2016 at 04:42:54PM +0100, Paolo Bonzini wrote:
>=20
>=20
> On 28/11/2016 16:38, Paolo Bonzini wrote:
> >=20
> >=20
> > On 28/11/2016 16:24, Adrian Bunk wrote:
> >> On Mon, Nov 28, 2016 at 04:05:33PM +0100, Paolo Bonzini wrote:
> >>>
> >>>
> >>> On 27/11/2016 17:28, Adrian Bunk wrote:
> >>>> Building qemu fails in distributions where gcc enables PIE
> >>>> by default (e.g. Debian unstable) with:
> >>>> /usr/bin/ld: -r and -pie may not be used together
> >>>>
> >>>> -r and -pie cannot be used together in the linker,
> >>>> and position independent is already relocatable.
> >>>>
> >>>> Use -r instead of -Wl,-r to avoid gcc passing -r to the
> >>>> linker when PIE is enabled.
> >>>>
> >>>> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> >>>
> >>> I think this is a bug in the linker.  If the linker is producing
> >>> relocatable objects by default, it has no reason to refuse -r.  Have =
you
> >>> tried asking the binutils folks about it too?
> >>
> >> The linker knows nothing about this default, gcc is passing -pie
> >> to the linker.
> >=20
> > The linker is receiving "-r -pie".  It can satisfy the requirement of
> > producing a relocatable object by discarding the "-r", but it doesn't.
> > That'd be a linker bug.
> >=20
> > But in fact ELF makes PIE ET_DYN and relocatable ET_REL.  That would
> > make the linker error the right thing, but then I don't understand what
> > you mean by "position independent is already relocatable".
>=20
> Aha, I looked at GCC source code and this is incorrect: "Use -r instead
> of -Wl,-r to avoid gcc passing -r to the linker when PIE is enabled".
> When GCC sees -r (as opposed to -Wl,-r) it does not pass -pie to the link=
er.

Should we merge this patch for 2.8 with the commit updated to reflect this?

Stefan

--xaMk4Io5JJdpkLEb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJYPUuCAAoJEJykq7OBq3PILTMH/RV7UttDgI+jI0OslIugEWzR
Sp0G3fD/N/p9b9G1gJGFkLQtNazZuipxOqY6p6WWTAr3cyzd77zkB9wdcSbGc1P6
evYSES6VJIswozIZdp782zqt+Cf4mV8BE7eckYeoqj6WV25YJcuoILxFnMGLoZrD
tzAL1NFQ6AJvA5HWcfnMfD7e5Ut1xVF/0dyNgtsZWuqWPtyhDu9W0WXv+VxRFb2s
+p1QGWP4fx+RMaJXfu9jk9+J/5WG9ls0GC75UUeHpEeo4OrPb9ViCOgG6ib9LLSN
FysMomAHEsbwrbSA+bO2Oz5jldZHU2sOx+iFl/7s7BrdyN6mJv/aJFck0x/zI+U=
=S/WV
-----END PGP SIGNATURE-----

--xaMk4Io5JJdpkLEb--

