Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aTAn7-0003bk-48
	for mharc-qemu-trivial@gnu.org; Tue, 09 Feb 2016 11:05:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47846)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1aTAn4-0003Yf-W5
	for qemu-trivial@nongnu.org; Tue, 09 Feb 2016 11:05:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1aTAn0-0003VS-UA
	for qemu-trivial@nongnu.org; Tue, 09 Feb 2016 11:05:22 -0500
Received: from mail-wm0-x236.google.com ([2a00:1450:400c:c09::236]:38023)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1aTAn0-0003VK-Mo; Tue, 09 Feb 2016 11:05:18 -0500
Received: by mail-wm0-x236.google.com with SMTP id p63so29525658wmp.1;
	Tue, 09 Feb 2016 08:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=QlKkHXaVeTMoZI3digCRcWCjD4XuIIGegTwEn5zEvA0=;
	b=Y4b8Q2PKZSjjM1VL4rX92Oieii+8vaW5ZtsMyTL692PbnxYht0oadcW+fkrffST7bu
	ogq2L/qEmAx1yh/9JBDkJgkJKyuv8uupWNNhGs0oNVCShZ17tkoRSk8jAXBNr0mr0ZM0
	yo9BjHZiioqAmeNaGnibDIjlllwp/BabWGomysIkXjTOFRObC+ITPdquL0Tt19QSv7pX
	fZ29/Ipx1E2exs/imVDxD0FI0+j91E32gNP5NHJqoMLj7K7g9CNnTqRH97nHPxpD3mEN
	2Qe9tBPRQOlGWtydLzMPVQZNYoH69Tz8mc7TyevkgZ7hPGA8pKMSGlto2LG2SQLHmAXC
	7cLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=QlKkHXaVeTMoZI3digCRcWCjD4XuIIGegTwEn5zEvA0=;
	b=dIQW9DAUpBZSDe3Hgam0f4sJ61cP+00kcIE4RRPiYb6XOAEaVGGyGY1N/bMhWfBx/I
	EQhO3vBuKPsZCqImz8PckQfQuFU3YZ0z0h0CR1S+1l+K9wkBWAe45nJ/xO/tbV806EnY
	tZ6zDIX1cpstg1PrYYsrosydaxEhfs98BolVS81RS/YIrtAU1D1VlXumbgA2VdaB0Wh7
	MOE10b4d0STZ4401d4Zmcoijx+9bl9uHIG1mb4Xeo62JbArS+vvuskoMmqTrL4uRCn8l
	GBqwjdIgxXQQA5N2FM0sB8wMCPqeBuPitpi0AFvWi+2yKKBbwAZbo5H4ZdiWuKUwk1hQ
	8vAA==
X-Gm-Message-State: AG10YORP/3Qii0fABHfHBEbiNVwW5zW9edFrzE5aTjulYrvssbNtWsylSs+0FaQA1TBuaw==
X-Received: by 10.28.125.77 with SMTP id y74mr5534673wmc.21.1455033918091;
	Tue, 09 Feb 2016 08:05:18 -0800 (PST)
Received: from localhost (host86-186-101-16.range86-186.btcentralplus.com.
	[86.186.101.16]) by smtp.gmail.com with ESMTPSA id
	kb5sm35506290wjc.22.2016.02.09.08.05.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 Feb 2016 08:05:16 -0800 (PST)
Date: Tue, 9 Feb 2016 16:05:15 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20160209160515.GA25913@stefanha-x1.localdomain>
References: <20160111173036.24764.59878.stgit@bahia.huguette.org>
	<569D22F6.5070104@msgid.tls.msk.ru>
	<20160118192843.55ef9d93@bahia.huguette.org>
	<20160208151147.GC31586@stefanha-x1.localdomain>
	<87d1s7w6so.fsf@blackfin.pond.sub.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="r5Pyd7+fXNt84Ff3"
Content-Disposition: inline
In-Reply-To: <87d1s7w6so.fsf@blackfin.pond.sub.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::236
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org, Greg Kurz <gkurz@linux.vnet.ibm.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] trace: drop trailing empty
	strings
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
X-List-Received-Date: Tue, 09 Feb 2016 16:05:24 -0000


--r5Pyd7+fXNt84Ff3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 08, 2016 at 04:39:03PM +0100, Markus Armbruster wrote:
> Stefan Hajnoczi <stefanha@gmail.com> writes:
>=20
> > On Mon, Jan 18, 2016 at 07:28:43PM +0100, Greg Kurz wrote:
> >> On Mon, 18 Jan 2016 20:37:58 +0300
> >> Michael Tokarev <mjt@tls.msk.ru> wrote:
> >>=20
> >> > 11.01.2016 20:30, Greg Kurz wrote:
> >> >=20
> >> > > -virtio_balloon_handle_output(const char *name, uint64_t gpa) "sec=
tion name: %s gpa: %"PRIx64""
> >> > > +virtio_balloon_handle_output(const char *name, uint64_t gpa) "sec=
tion name: %s gpa: %"PRIx64 =20
> >> > ...
> >> >=20
> >> > I'm not sure what's the value of this.  It's fine either way, no?
> >>=20
> >> The only value is to drop unneeded stuff... and maybe some consistency
> >> with the traces that don't have these trailing empty strings.
> >>=20
> >> > Do we have a rule for trailing empty strings in coding style? :)
> >> >=20
> >>=20
> >> Nor we have against parenthesitis, which brings a lot more unneeded
> >> characters into the code :P
> >
> > Regarding the history of the quoting limitation, see commit
> > cf85cf8e972f3ad79f203be4edb7968d6e052293 ("trace: Format strings must
> > begin/end with double quotes").  It was a limitation of the old
> > tracetool.sh script.
> >
> > The modern tracetool.py script handles format strings fine when they do
> > not end with double-quotes.
>=20
> Suggest to work that into the commit message.

Thanks, I have added a note to the commit description.

Stefan

--r5Pyd7+fXNt84Ff3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJWug47AAoJEJykq7OBq3PIdjAH/0l7srcQQC1lz6PdGjs1VmjM
40bB0i+tsLtd1kv2thqRH5FFBK9dsbbKKM+fYDntd5bOOy9bKey2rZLNObyP8nlo
qpBaX1OPypSW+IpHh8hCjRTmgcDGl4Hac2LRnUbFvk42xasO05LwCpn7PngJZzG0
as0coRTXvIgJfDzLw+GaucoGTa8daPz5OAj8F1zjWkXM8BotZsuRs4g1otMHQzrJ
M8R2zdGc8n+Qia0uW7ggwhQGnHRSzg6IDnOQ9fsz8njFPE3wu70CLWebU5r797+p
X7J+joj+9sFB0K09og/4OpsL+5PxHFovE7DXD0UVqvrkIZ+kzeSJv4wRdzBz2yo=
=Qn7N
-----END PGP SIGNATURE-----

--r5Pyd7+fXNt84Ff3--

