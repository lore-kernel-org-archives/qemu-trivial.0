Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vp6MN-0005yB-2g
	for mharc-qemu-trivial@gnu.org; Fri, 06 Dec 2013 20:07:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57963)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <antonynpavlov@gmail.com>) id 1Vp6MG-0005oC-Uu
	for qemu-trivial@nongnu.org; Fri, 06 Dec 2013 20:07:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <antonynpavlov@gmail.com>) id 1Vp6MC-0004V9-L8
	for qemu-trivial@nongnu.org; Fri, 06 Dec 2013 20:07:00 -0500
Received: from mail-la0-x22f.google.com ([2a00:1450:4010:c03::22f]:36512)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <antonynpavlov@gmail.com>)
	id 1Vp6M2-0004KW-LP; Fri, 06 Dec 2013 20:06:46 -0500
Received: by mail-la0-f47.google.com with SMTP id ep20so561533lab.34
	for <multiple recipients>; Fri, 06 Dec 2013 17:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=lbUg7NITsd7qgej+Et5r4tj7CpdPUmVSlo7zkmIZMlI=;
	b=sMjjbMt3/hbiZY4OjnHFxiVQ/Bf8q+CXEtlHPes5i5pbO8OKWvL2TIyqJJIIFui+A+
	3PI3uJxY9BDZVxwVis+2UJUnvCl43GG45DUAfO08B2gkBU0BV4toff5s61JQYbgRfBVV
	UAVK5KBdXcQN23ACZezDHoeMYFn3Exoxv8jEMTcuqIDx8T7RFz1DOajoJ3WkJpI2hr5k
	+cJ5Buynoi9k+8vll/ifnSlg9NPtH9yR8qYXtBiwkiyhvSUhp8eQMfBPCux7YJGCUS3V
	5IQgFz9KL1FkRBJaPwRemuXbdj3rIVoi07zOqLjAV9FPhvNFyVcGsK0kHvmi4Y21nGuy
	T2Kg==
X-Received: by 10.152.116.65 with SMTP id ju1mr94946lab.60.1386378405477;
	Fri, 06 Dec 2013 17:06:45 -0800 (PST)
Received: from flare (ppp37-190-57-6.pppoe.spdop.ru. [37.190.57.6])
	by mx.google.com with ESMTPSA id iy7sm289420lbc.4.2013.12.06.17.06.43
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Dec 2013 17:06:44 -0800 (PST)
Date: Sat, 7 Dec 2013 05:14:09 +0400
From: Antony Pavlov <antonynpavlov@gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Message-Id: <20131207051409.778325ede8e97cf719214ac2@gmail.com>
In-Reply-To: <52A21E91.7070404@msgid.tls.msk.ru>
References: <1386138449-1235-1-git-send-email-antonynpavlov@gmail.com>
	<52A21E91.7070404@msgid.tls.msk.ru>
X-Mailer: Sylpheed 3.4.0beta6 (GTK+ 2.24.22; i486-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4010:c03::22f
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	qemu-devel@nongnu.org, Dmitry Smagin <dmitry.s.smagin@gmail.com>
Subject: Re: [Qemu-trivial] [PATCH] eeprom93xx: fix coding style
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
X-List-Received-Date: Sat, 07 Dec 2013 01:07:05 -0000

On Fri, 06 Dec 2013 22:59:29 +0400
Michael Tokarev <mjt@tls.msk.ru> wrote:

> 04.12.2013 10:27, Antony Pavlov wrote:
> > scripts/checkpatch.pl reports about some style problems,
> > this commit fixes some of them:
>=20
> Thanks, applied to trivial-patches queue.
>=20
> I'm a bit afraid of this sort of patches - there are LOTS of
> coding style issues in current qemu code base, and applying
> a patch like this may open a really large can of worms...
>=20
> Generally it has been agreed to fix coding style only when
> doing some other code changes nearby, as far as I remember.

Some times ago there was a patch on adding DEC Tulip NIC support
(see http://lists.gnu.org/archive/html/qemu-devel/2013-11/msg02878.html).

In this patch the 93LC46B Serial EEPROM emulation was added.
But it's like reinventing the wheel because Stefan Weil already
have done this work in 2006! So I used eeprom93xx for the next
tulip patch version and occasionally I fixed some coding style issues.

--=A0
Best regards,
=A0 Antony Pavlov

