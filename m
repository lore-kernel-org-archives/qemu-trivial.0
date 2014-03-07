Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WLuLM-00031l-Bt
	for mharc-qemu-trivial@gnu.org; Fri, 07 Mar 2014 07:57:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42810)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1WLuLE-0002rC-Tk
	for qemu-trivial@nongnu.org; Fri, 07 Mar 2014 07:57:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1WLuL8-0005jQ-U6
	for qemu-trivial@nongnu.org; Fri, 07 Mar 2014 07:57:32 -0500
Received: from cantor2.suse.de ([195.135.220.15]:38431 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1WLuKk-0005gk-6U; Fri, 07 Mar 2014 07:57:02 -0500
Received: from relay1.suse.de (charybdis-ext.suse.de [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 081EFAB9F;
	Fri,  7 Mar 2014 12:57:01 +0000 (UTC)
Message-ID: <5319C21A.6010705@suse.de>
Date: Fri, 07 Mar 2014 13:56:58 +0100
From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1394187082-31986-1-git-send-email-sw@weilnetz.de>	<871tyecixy.fsf@linaro.org>
	<5319BE2C.7040801@weilnetz.de>
In-Reply-To: <5319BE2C.7040801@weilnetz.de>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.135.220.15
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, qemu-stable@nongnu.org,
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tests: Fix 'make test' for
	i686 hosts (buildregression))
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
X-List-Received-Date: Fri, 07 Mar 2014 12:57:39 -0000

Am 07.03.2014 13:40, schrieb Stefan Weil:
> Am 07.03.2014 13:06, schrieb Alex Benn=C3=A9e:
>>
>> Stefan Weil <sw@weilnetz.de> writes:
>>
>>> 'make test' is broken at least since commit
>>> baacf04799ace72a9c735dd9306a1ceaf305e7cf. Several source files were m=
oved
>>> to util/, and some of them there split, so add the missing prefix and=
 new
>>> files to fix the compiler and linker errors.
[...]
> In the meantime I tried older versions. Even version 1.1 already shows
> unwanted differences between native and QEMU emulated FPU operations.
>=20
> The test binary is now available from this URL:
> http://qemu.weilnetz.de/test/user/i386/test-i386
>=20
> Run it native and with qemu-i386 and compare the output of both runs
> to see the problems.

So... is QEMU or the test mistaken? :)

Regards,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=BC=
rnberg

