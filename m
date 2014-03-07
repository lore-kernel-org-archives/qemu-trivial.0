Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WM0xe-00081n-Bc
	for mharc-qemu-trivial@gnu.org; Fri, 07 Mar 2014 15:01:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52916)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1WM0xX-0007s0-MT
	for qemu-trivial@nongnu.org; Fri, 07 Mar 2014 15:01:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1WM0xS-0004XR-L7
	for qemu-trivial@nongnu.org; Fri, 07 Mar 2014 15:01:31 -0500
Received: from [2a03:4000:1::4e2f:c7ac:d] (port=48656
	helo=v220110690675601.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1WM0xI-0004WS-8j; Fri, 07 Mar 2014 15:01:16 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	BAD2372800C8; Fri,  7 Mar 2014 21:01:14 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id q4vaU-toftqn; Fri,  7 Mar 2014 21:01:13 +0100 (CET)
Received: from [192.168.178.35] (p54AD87DD.dip0.t-ipconnect.de
	[84.173.135.221])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	812D072800C7; Fri,  7 Mar 2014 21:01:12 +0100 (CET)
Message-ID: <531A2587.8030104@weilnetz.de>
Date: Fri, 07 Mar 2014 21:01:11 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>, 
	qemu-trivial@nongnu.org
References: <1394219753-26106-1-git-send-email-sw@weilnetz.de>
	<531A211D.8030209@suse.de>
In-Reply-To: <531A211D.8030209@suse.de>
X-Enigmail-Version: 1.5.2
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:1::4e2f:c7ac:d
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
X-List-Received-Date: Fri, 07 Mar 2014 20:01:37 -0000

Am 07.03.2014 20:42, schrieb Andreas F=E4rber:
> Am 07.03.2014 20:15, schrieb Stefan Weil:
>> "%d" or "%x" won't work on hosts where int values are smaller than 64 =
bit.
>>
>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>> ---
>>  disas/libvixl/a64/disasm-a64.cc |   20 ++++++++++----------
>>  1 file changed, 10 insertions(+), 10 deletions(-)
>=20
> Patch looks correct, but I see no indication that this is a backport
> from upstream libvixl. Have you submitted it there too?
>=20
> Regards,
> Andreas


If I knew how to submit it to libvixl, I'd have done that already. I did
not find any hint (e-mail address, keyword contrib) in the sources from
github. Can you help me? It would also be fine if someone just takes my
patch and applies it there.

Thanks,
Stefan


