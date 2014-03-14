Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WOUw0-0004Ol-2u
	for mharc-qemu-trivial@gnu.org; Fri, 14 Mar 2014 12:26:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45266)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WOUvs-0004Dp-5h
	for qemu-trivial@nongnu.org; Fri, 14 Mar 2014 12:26:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WOUvm-0003PS-73
	for qemu-trivial@nongnu.org; Fri, 14 Mar 2014 12:26:04 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:38605)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WOUvZ-0003NR-Rf; Fri, 14 Mar 2014 12:25:46 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 70E5C41CAE;
	Fri, 14 Mar 2014 20:25:44 +0400 (MSK)
Message-ID: <53232D88.1000302@msgid.tls.msk.ru>
Date: Fri, 14 Mar 2014 20:25:44 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
References: <1394218139-24915-1-git-send-email-sw@weilnetz.de>
	<531A18AC.20808@suse.de>
In-Reply-To: <531A18AC.20808@suse.de>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Alexander Graf <agraf@suse.de>, qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] misc: Fix typos in comments
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
X-List-Received-Date: Fri, 14 Mar 2014 16:26:10 -0000

07.03.2014 23:06, Andreas F=E4rber wrote:
> Am 07.03.2014 19:48, schrieb Stefan Weil:
[]
>>      if (flags & FCB_TX_IP && flags & FCB_TX_CIP) {
>> -        /* do IP4 checksum (TODO This funtion does TCP/UDP checksum b=
ut not sure
>> -         * if it also does IP4 checksum. */
>> +        /* do IP4 checksum (TODO This function does TCP/UDP checksum
>> +         * but not sure if it also does IP4 checksum. */
>=20
> While rebreaking it, you could've also added the missing parenthesis,
> after the dot I guess. Apart from that,

Actually, that's a fun comment.  "do IP4 checksum, but unsure if it also =
does IP4 checksum".
Ie, do something but I'm not sure if it actually does that... ;)

Applied to -trivial, fixing both the commit comment and this parenthesis.

Thanks,

/mjt

