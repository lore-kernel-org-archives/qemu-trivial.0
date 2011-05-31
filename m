Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QRPae-0002Zv-RM
	for mharc-qemu-trivial@gnu.org; Tue, 31 May 2011 10:06:36 -0400
Received: from eggs.gnu.org ([140.186.70.92]:40535)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1QRPad-0002Xq-35
	for qemu-trivial@nongnu.org; Tue, 31 May 2011 10:06:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1QRPac-0007GV-4K
	for qemu-trivial@nongnu.org; Tue, 31 May 2011 10:06:35 -0400
Received: from goliath.siemens.de ([192.35.17.28]:17913)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>)
	id 1QRPaZ-0007Fi-Os; Tue, 31 May 2011 10:06:32 -0400
Received: from mail1.siemens.de (localhost [127.0.0.1])
	by goliath.siemens.de (8.13.6/8.13.6) with ESMTP id p4VE6R9O030826;
	Tue, 31 May 2011 16:06:27 +0200
Received: from mchn199C.mchp.siemens.de ([139.25.109.49])
	by mail1.siemens.de (8.13.6/8.13.6) with ESMTP id p4VE6Q9x020979;
	Tue, 31 May 2011 16:06:27 +0200
Message-ID: <4DE4F5E2.5020906@siemens.com>
Date: Tue, 31 May 2011 16:06:26 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de;
	rv:1.8.1.12) Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12
	Mnenhy/0.7.5.666
MIME-Version: 1.0
To: Anthony Liguori <anthony@codemonkey.ws>
References: <1306705831-59385-1-git-send-email-andreas.faerber@web.de>
	<4DE4F16D.6030009@codemonkey.ws>
In-Reply-To: <4DE4F16D.6030009@codemonkey.ws>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by goliath.siemens.de id
	p4VE6R9O030826
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6, seldom 2.4 (older,
	4)
X-Received-From: 192.35.17.28
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	=?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <andreas.faerber@web.de>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Avi Kivity <avi@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Use SIGIO with caution
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
X-List-Received-Date: Tue, 31 May 2011 14:06:35 -0000

On 2011-05-31 15:47, Anthony Liguori wrote:
> On 05/29/2011 04:50 PM, Andreas F=C3=A4rber wrote:
>> BeOS and Haiku don't define SIGIO. When undefined, it won't arrive
>> and doesn't need to be blocked.
>>
>> Signed-off-by: Andreas F=C3=A4rber<andreas.faerber@web.de>
>=20
> Anything to do with signal masks is never a trivial patch BTW...
>=20
> But I actually think explicit handling of SIGIO is unneeded.  I think=20
> this is a hold over from the pre-I/O thread days where we selectively=20
> set SIGIO on certain file descriptors to make sure that when an IO fd=20
> became readable, we received a signal to break out of the KVM emulation=
=20
> loop.
>=20
> Can the folks on CC confirm/deny?
>=20
> I can't see any use of SIGIO in the current source tree.

At least qemu-timer.c uses SIGIO in HPET mode. That only applies to
Linux hosts, though.

Jan

--=20
Siemens AG, Corporate Technology, CT T DE IT 1
Corporate Competence Center Embedded Linux

