Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QRTou-0003Bn-NE
	for mharc-qemu-trivial@gnu.org; Tue, 31 May 2011 14:37:36 -0400
Received: from eggs.gnu.org ([140.186.70.92]:59038)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1QRTor-0003Af-3p
	for qemu-trivial@nongnu.org; Tue, 31 May 2011 14:37:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1QRTop-0002kz-NV
	for qemu-trivial@nongnu.org; Tue, 31 May 2011 14:37:32 -0400
Received: from cantor.suse.de ([195.135.220.2]:51961 helo=mx1.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>)
	id 1QRToj-0002hs-Ov; Tue, 31 May 2011 14:37:26 -0400
Received: from relay1.suse.de (charybdis-ext.suse.de [195.135.221.2])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.suse.de (Postfix) with ESMTP id A3D4893F19;
	Tue, 31 May 2011 18:16:16 +0200 (CEST)
Mime-Version: 1.0 (Apple Message framework v1084)
Content-Type: text/plain; charset=iso-8859-1
From: Alexander Graf <agraf@suse.de>
In-Reply-To: <4DE50DC5.2060806@codemonkey.ws>
Date: Tue, 31 May 2011 18:16:15 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <35D43777-76C2-415D-83FF-143C4D2EF774@suse.de>
References: <1306705831-59385-1-git-send-email-andreas.faerber@web.de>	<4DE4F16D.6030009@codemonkey.ws>	<4DE4F5E2.5020906@siemens.com>
	<4DE4FAA1.7080109@codemonkey.ws>	<4DE5011C.80000@siemens.com>
	<98DD53CD-B6E2-4739-A952-0F21019485A4@suse.de>
	<4DE50DC5.2060806@codemonkey.ws>
To: Anthony Liguori <anthony@codemonkey.ws>
X-Mailer: Apple Mail (2.1084)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.2
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	Jan Kiszka <jan.kiszka@siemens.com>, Marcelo Tosatti <mtosatti@redhat.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	=?iso-8859-1?Q?Andreas_F=E4rber?= <andreas.faerber@web.de>,
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
X-List-Received-Date: Tue, 31 May 2011 18:37:34 -0000


On 31.05.2011, at 17:48, Anthony Liguori wrote:

> On 05/31/2011 10:44 AM, Alexander Graf wrote:
>>=20
>> On 31.05.2011, at 16:54, Jan Kiszka wrote:
>>=20
>>> On 2011-05-31 16:26, Anthony Liguori wrote:
>>>> On 05/31/2011 09:06 AM, Jan Kiszka wrote:
>>>>> On 2011-05-31 15:47, Anthony Liguori wrote:
>>>>>> On 05/29/2011 04:50 PM, Andreas F=E4rber wrote:
>>>>>>> BeOS and Haiku don't define SIGIO. When undefined, it won't =
arrive
>>>>>>> and doesn't need to be blocked.
>>>>>>>=20
>>>>>>> Signed-off-by: Andreas F=E4rber<andreas.faerber@web.de>
>>>>>>=20
>>>>>> Anything to do with signal masks is never a trivial patch BTW...
>>>>>>=20
>>>>>> But I actually think explicit handling of SIGIO is unneeded.  I =
think
>>>>>> this is a hold over from the pre-I/O thread days where we =
selectively
>>>>>> set SIGIO on certain file descriptors to make sure that when an =
IO fd
>>>>>> became readable, we received a signal to break out of the KVM =
emulation
>>>>>> loop.
>>>>>>=20
>>>>>> Can the folks on CC confirm/deny?
>>>>>>=20
>>>>>> I can't see any use of SIGIO in the current source tree.
>>>>>=20
>>>>> At least qemu-timer.c uses SIGIO in HPET mode. That only applies =
to
>>>>> Linux hosts, though.
>>>>=20
>>>> Is there any reason we still carry multiple timer implementations =
these
>>>> days?
>>>>=20
>>>> HPET shouldn't be any better than dynticks.
>>>=20
>>> On any recent kernel, for sure. BTW, the same applies to the RTC =
timer.
>>=20
>> So the obvious change would be to introduce CONFIG_HPET, ifdef the =
SIGIO handling on that and also ifdef the host hpet handling code on it? =
That way it's documented well and can preferably even be turned off with =
--disable-host-hpet during configure time, which we can then slowly turn =
to the default.
>=20
> Or just remove hpet and rtc.
>=20
> Does anyone really object to that?

Do RHEL5 and SLES10 support dynticks? If yes, no objections. They're the =
oldest really supported distros we should possibly remotely even care =
about.


Alex


