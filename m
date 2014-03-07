Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WM2pj-0002RL-Qf
	for mharc-qemu-trivial@gnu.org; Fri, 07 Mar 2014 17:01:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46715)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1WM2pc-0002IZ-Qq
	for qemu-trivial@nongnu.org; Fri, 07 Mar 2014 17:01:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1WM2pY-0000dn-42
	for qemu-trivial@nongnu.org; Fri, 07 Mar 2014 17:01:28 -0500
Received: from cantor2.suse.de ([195.135.220.15]:46275 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1WM2pO-0000cn-Dj; Fri, 07 Mar 2014 17:01:14 -0500
Received: from relay2.suse.de (charybdis-ext.suse.de [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id AD103AB9F;
	Fri,  7 Mar 2014 22:01:12 +0000 (UTC)
Message-ID: <531A41A7.80302@suse.de>
Date: Fri, 07 Mar 2014 23:01:11 +0100
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>, qemu-trivial@nongnu.org
References: <1394219753-26106-1-git-send-email-sw@weilnetz.de>
	<531A211D.8030209@suse.de> <531A2587.8030104@weilnetz.de>
In-Reply-To: <531A2587.8030104@weilnetz.de>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.135.220.15
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] libvixl: Fix format strings
 for several int64_t values
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
X-List-Received-Date: Fri, 07 Mar 2014 22:01:33 -0000

Am 07.03.2014 21:01, schrieb Stefan Weil:
> Am 07.03.2014 20:42, schrieb Andreas F=E4rber:
>> Am 07.03.2014 20:15, schrieb Stefan Weil:
>>> "%d" or "%x" won't work on hosts where int values are smaller than 64=
 bit.
>>>
>>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>>> ---
>>>  disas/libvixl/a64/disasm-a64.cc |   20 ++++++++++----------
>>>  1 file changed, 10 insertions(+), 10 deletions(-)
>>
>> Patch looks correct, but I see no indication that this is a backport
>> from upstream libvixl. Have you submitted it there too?
>=20
> If I knew how to submit it to libvixl, I'd have done that already. I di=
d
> not find any hint (e-mail address, keyword contrib) in the sources from
> github. Can you help me?

Google led me to the following:
https://github.com/armvixl/vixl

vixl@arm.com

> It would also be fine if someone just takes my
> patch and applies it there.

Hopefully Peter can help; I just remembered someone asking not to apply
spelling fixes to not complicate functional backports.

Cheers,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

