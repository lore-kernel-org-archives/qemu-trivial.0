Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VcE8Y-0002aV-VW
	for mharc-qemu-trivial@gnu.org; Fri, 01 Nov 2013 08:47:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45796)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <antonynpavlov@gmail.com>) id 1VcE8S-0002aH-QW
	for qemu-trivial@nongnu.org; Fri, 01 Nov 2013 08:47:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <antonynpavlov@gmail.com>) id 1VcE8N-0000Ci-98
	for qemu-trivial@nongnu.org; Fri, 01 Nov 2013 08:47:32 -0400
Received: from mail-lb0-x22b.google.com ([2a00:1450:4010:c04::22b]:43189)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <antonynpavlov@gmail.com>)
	id 1VcE8N-0000Cc-16; Fri, 01 Nov 2013 08:47:27 -0400
Received: by mail-lb0-f171.google.com with SMTP id x18so3394735lbi.2
	for <multiple recipients>; Fri, 01 Nov 2013 05:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=KH4djn21cr4SstctctevpYicOIV/8CApwAyruTDtDRU=;
	b=sAz79nzGg33IZtVRD2jRhhYfB4YQjSPUM7LmZaKHn4V1Cl1d7yFcWwizGpqejUhh1E
	xMPKwZ0Rf0TuLwGI8lg3ij5Jv7B0YMZ9j3MZ96DxNNRZ3ARdaDwxCIMPFzlLBCEBGfvb
	QWTRO/AuSLXhaM3GrYrdp/vZcQJgel/Eh1u2Tz/bxsSQUW+KY9jaym/+3gKE3PB9uNbf
	63EwVz9Hqh22PozxAz7q2hb3Q7cGCdHIvDWlj58x4TimyMntl15H6rVxKvedTkIhLF8x
	CD4ntb8r6QCCFOo0fdiViNJC//cSNQM0xYRGZpj7buhEKMxUynE5mCOU1Ta0Eno3Za/M
	8k/w==
X-Received: by 10.112.141.165 with SMTP id rp5mr1751797lbb.3.1383310045651;
	Fri, 01 Nov 2013 05:47:25 -0700 (PDT)
Received: from flare (t35.niisi.ras.ru. [193.232.173.35])
	by mx.google.com with ESMTPSA id o1sm8203493lah.8.2013.11.01.05.47.23
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Nov 2013 05:47:24 -0700 (PDT)
Date: Fri, 1 Nov 2013 16:54:04 +0400
From: Antony Pavlov <antonynpavlov@gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Message-Id: <20131101165404.dadb14b5ef97e301c69d483c@gmail.com>
In-Reply-To: <52738E04.4060706@msgid.tls.msk.ru>
References: <1383021391-3152-1-git-send-email-antonynpavlov@gmail.com>
	<52738284.5090708@msgid.tls.msk.ru>
	<20131101151402.2275a138bbcb849db3206db4@gmail.com>
	<52738E04.4060706@msgid.tls.msk.ru>
X-Mailer: Sylpheed 3.4.0beta4 (GTK+ 2.24.21; i486-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4010:c04::22b
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Anthony Liguori <aliguori@amazon.com>
Subject: Re: [Qemu-trivial] [PATCH] vl: fix build when configured with no
 graphic support
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
X-List-Received-Date: Fri, 01 Nov 2013 12:47:38 -0000

On Fri, 01 Nov 2013 15:18:28 +0400
Michael Tokarev <mjt@tls.msk.ru> wrote:

> 01.11.2013 15:14, Antony Pavlov wrote:
> > On Fri, 01 Nov 2013 14:29:24 +0400
> > Michael Tokarev <mjt@tls.msk.ru> wrote:
> >
> >> 29.10.2013 08:36, Antony Pavlov wrote
> >>> The following error occurs when building no graphic output support:
> >                                             ^^^^^
> > Can you plese fix misprint in my git commit message too.
>=20
> Fixed.  Thank you for pointing this out.
>=20
> >> +        (void)ds;      /* avoid warning if no display is configured */
>=20
> Are you okay with me adding the comment? :)

IMHO your comment is useful, thanks!

--=A0
Best regards,
=A0 Antony Pavlov

