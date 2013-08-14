Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V9fPX-0006eg-QL
	for mharc-qemu-trivial@gnu.org; Wed, 14 Aug 2013 14:03:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59526)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1V9fPO-0006Rn-Q9
	for qemu-trivial@nongnu.org; Wed, 14 Aug 2013 14:03:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1V9fPH-0000HR-Gx
	for qemu-trivial@nongnu.org; Wed, 14 Aug 2013 14:02:58 -0400
Received: from cantor2.suse.de ([195.135.220.15]:54244 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>)
	id 1V9fOn-00007B-9r; Wed, 14 Aug 2013 14:02:21 -0400
Received: from relay1.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 4199AA5359;
	Wed, 14 Aug 2013 20:02:20 +0200 (CEST)
Mime-Version: 1.0 (Apple Message framework v1278)
Content-Type: text/plain; charset=us-ascii
From: Alexander Graf <agraf@suse.de>
In-Reply-To: <2A318D54-11AD-4C05-B5A3-54F35E906571@gmail.com>
Date: Wed, 14 Aug 2013 20:02:16 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <BC63267D-24B2-4823-9AAB-71722C1DB9D8@suse.de>
References: <CAKyx-3MMkqKw3GXxSR=NizeBHhE+pYyONUX+0mtOgu5h3kix9g@mail.gmail.com>
	<CAFEAcA8VPg-WDf+Xf3j=7Q--NJgc1+2n6zg6M=pX+idkA-zyEw@mail.gmail.com>
	<358B0F62-7043-432E-8B49-F95CD1B82443@gmail.com>
	<CAFEAcA8Gh+jys24Ejjp+6ccTxQFhmvdhmfvzEO_B04yzredL=A@mail.gmail.com>
	<9A748A2F-42CF-4600-AE57-5B013DBC02F2@gmail.com>
	<CAFEAcA81WMKSYnPWFrAF79qOxumtLRHEQjif1RSMO4yxvVc1-A@mail.gmail.com>
	<2A318D54-11AD-4C05-B5A3-54F35E906571@gmail.com>
To: Programmingkid <programmingkidx@gmail.com>
X-Mailer: Apple Mail (2.1278)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	"qemu-ppc@nongnu.org list:PowerPC" <qemu-ppc@nongnu.org>,
	=?iso-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>,
	qemu-devel qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-ppc] [Qemu-devel] [PATCH v2] Adds the
	ability to use the command key in the guest operating system.
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
X-List-Received-Date: Wed, 14 Aug 2013 18:03:06 -0000


On 04.08.2013, at 20:52, Programmingkid wrote:

>=20
> On Aug 4, 2013, at 2:07 PM, Peter Maydell wrote:
>=20
>> On 4 August 2013 18:53, Programmingkid <programmingkidx@gmail.com> =
wrote:
>>> On Aug 4, 2013, at 5:39 AM, Peter Maydell wrote
>>>> Right, but I don't have to specify anything about any other
>>>> key on the keyboard, why should command be special?
>>>=20
>>> The command key is used to send commands to an application. When
>>> the user runs Mac OS X in QEMU, and the host operating system is
>>> Mac OS X, this can cause problems.
>>=20
>> Yes, I understand the problem. Why is this any different to
>> the similar issue with the menu-key or the Windows key in Windows
>> (where you also might want to pass it through to the guest,
>> or have it handled outside the guest).
>=20
> I don't use QEMU on a PC, so I don't have experience with this issue. =
But it does sound like the problem I had on Mac OS X. For anyone who =
uses QEMU on Windows, is the control key used to send commands to QEMU, =
and sent to the guest operating system? I'm wondering if someone out =
there uses a Windows guest on a Windows host can help us with this =
issue.=20
>=20
>>=20
>>>>> Do you have your own idea as to how to handle the command key?
>>>>=20
>>>> "Should the QEMU UI use the menu-accelerator key for menus or
>>>> should it pass it through to the guest" is a generic UI front-end
>>>> problem; any solution should not be specific to a single UI,
>>>> we should handle it the same way for all front-ends.
>=20
> The problem with this idea is each UI has its own implementation =
library: SDL, GTK, Cocoa. Each UI would have to have its solution coded =
differently. There is no one size fits all solution. I honestly don't =
know if this is an issue with the SDL and GTK UI's.=20

The argument is that the user experience and configuration methods =
should be as close as possible / reasonable across the different UI =
backends.


Alex


