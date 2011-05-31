Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QRWin-0005ir-Uv
	for mharc-qemu-trivial@gnu.org; Tue, 31 May 2011 17:43:30 -0400
Received: from eggs.gnu.org ([140.186.70.92]:53932)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>) id 1QRWik-0005i0-JT
	for qemu-trivial@nongnu.org; Tue, 31 May 2011 17:43:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>) id 1QRWij-0002wG-13
	for qemu-trivial@nongnu.org; Tue, 31 May 2011 17:43:26 -0400
Received: from fmmailgate01.web.de ([217.72.192.221]:59817)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>)
	id 1QRWie-0002ul-Ld; Tue, 31 May 2011 17:43:21 -0400
Received: from smtp07.web.de  ( [172.20.5.215])
	by fmmailgate01.web.de (Postfix) with ESMTP id B7F4318FEBFF6;
	Tue, 31 May 2011 23:43:18 +0200 (CEST)
Received: from [92.75.140.119] (helo=mchn199C.mchp.siemens.de)
	by smtp07.web.de with asmtp (TLSv1:AES256-SHA:256) (WEB.DE 4.110 #2)
	id 1QRWic-0007KO-00; Tue, 31 May 2011 23:43:18 +0200
Message-ID: <4DE560F1.70407@web.de>
Date: Tue, 31 May 2011 23:43:13 +0200
From: Jan Kiszka <jan.kiszka@web.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de;
	rv:1.8.1.12) Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12
	Mnenhy/0.7.5.666
MIME-Version: 1.0
To: =?ISO-8859-1?Q?Andreas_F=E4rber?= <andreas.faerber@web.de>
References: <1306705831-59385-1-git-send-email-andreas.faerber@web.de>	<4DE4F16D.6030009@codemonkey.ws>	<4DE4F5E2.5020906@siemens.com>	<4DE4FAA1.7080109@codemonkey.ws>	<4DE5011C.80000@siemens.com>	<98DD53CD-B6E2-4739-A952-0F21019485A4@suse.de>	<4DE50DC5.2060806@codemonkey.ws>	<35D43777-76C2-415D-83FF-143C4D2EF774@suse.de>	<4DE5462E.80908@codemonkey.ws>
	<DBD1BECA-1726-455B-8A11-E9E8D6C79389@web.de>
In-Reply-To: <DBD1BECA-1726-455B-8A11-E9E8D6C79389@web.de>
X-Enigmail-Version: 1.1.2
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig4CF32F69E6FD1EFA1E9B8859"
Sender: jan.kiszka@web.de
X-Sender: jan.kiszka@web.de
X-Provags-ID: V01U2FsdGVkX182lNVUuGCItWv4baf4OndF8zwuajL022+XHNv6
	4cJKveZ+FIYp8kjR3PZiMc64mP4HGu2lT5Rrf4VXFMjtkyJ117 QJfjuVUvs=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 217.72.192.221
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	Marcelo Tosatti <mtosatti@redhat.com>, Alexander Graf <agraf@suse.de>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Avi Kivity <avi@redhat.com>, Anthony Liguori <anthony@codemonkey.ws>
Subject: Re: [Qemu-trivial] [PATCH] Use SIGIO with caution
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
X-List-Received-Date: Tue, 31 May 2011 21:43:29 -0000

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig4CF32F69E6FD1EFA1E9B8859
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 2011-05-31 23:11, Andreas F=E4rber wrote:
> Am 31.05.2011 um 21:49 schrieb Anthony Liguori:
>=20
>> On 05/31/2011 11:16 AM, Alexander Graf wrote:
>>>
>>> On 31.05.2011, at 17:48, Anthony Liguori wrote:
>>>
>>>> On 05/31/2011 10:44 AM, Alexander Graf wrote:
>>>>>
>>>>> On 31.05.2011, at 16:54, Jan Kiszka wrote:
>>>>>
>>>>>> On 2011-05-31 16:26, Anthony Liguori wrote:
>>>>>>> Is there any reason we still carry multiple timer implementations=

>>>>>>> these
>>>>>>> days?
>>>>>>>
>>>>>>> HPET shouldn't be any better than dynticks.
>>>>>>
>>>>>> On any recent kernel, for sure. BTW, the same applies to the RTC
>>>>>> timer.
>>>>>
>>>>> So the obvious change would be to introduce CONFIG_HPET, ifdef the
>>>>> SIGIO handling on that and also ifdef the host hpet handling code
>>>>> on it? That way it's documented well and can preferably even be
>>>>> turned off with --disable-host-hpet during configure time, which we=

>>>>> can then slowly turn to the default.
>>>>
>>>> Or just remove hpet and rtc.
>>>>
>>>> Does anyone really object to that?
>=20
> --verbose please: We're not talking about "removal" of emulation of suc=
h
> acronyms for i386 guests, but about ceasing to use some Linux-only host=

> facilities, right?

Right.

>=20
>>> Do RHEL5 and SLES10 support dynticks? If yes, no objections. They're
>>> the oldest really supported distros we should possibly remotely even
>>> care about.
>>
>> Yes, they do.  But it's not as accurate as RTC/HPET because there is
>> no CONFIG_HRTIMERS.
>>
>> But the problem with RTC/HPET is that there is only one /dev/rtc and
>> one /dev/hpet so only one guest can use it at any given time.  It's
>> really not a generally useful solution.
>>
>> At one point in time, it was the only way to get a high res clock.=20
>> Now, it Just Works provided you don't have an ancient kernel.
>=20
> I'm curious, what's ancient these days? 2.6.29 or more like 2.4.x?

IIRC, highres timers started to work around 2.6.24 on x86. Anyone on
such an old kernel is likely also not interested in updating QEMU.

Jan


--------------enig4CF32F69E6FD1EFA1E9B8859
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.15 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org/

iEYEARECAAYFAk3lYPUACgkQitSsb3rl5xQQ3ACfWLGY6mJbx7RZDn5QsW0qC9kh
KusAnit11O67VVNj80WUC+Ywm6S2q8Ct
=bc+T
-----END PGP SIGNATURE-----

--------------enig4CF32F69E6FD1EFA1E9B8859--

