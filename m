Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S9bwz-0004VN-TB
	for mharc-qemu-trivial@gnu.org; Mon, 19 Mar 2012 08:44:37 -0400
Received: from eggs.gnu.org ([208.118.235.92]:34042)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1S9bwu-0004UQ-52
	for qemu-trivial@nongnu.org; Mon, 19 Mar 2012 08:44:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1S9bwa-0003m3-1B
	for qemu-trivial@nongnu.org; Mon, 19 Mar 2012 08:44:31 -0400
Received: from cantor2.suse.de ([195.135.220.15]:48339 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1S9bwO-0003ki-PR; Mon, 19 Mar 2012 08:44:00 -0400
Received: from relay2.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id DF2688738D;
	Mon, 19 Mar 2012 13:43:58 +0100 (CET)
Message-ID: <4F672A0E.2090301@suse.de>
Date: Mon, 19 Mar 2012 13:43:58 +0100
From: =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120215 Thunderbird/10.0.2
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1331985651-16227-1-git-send-email-sw@weilnetz.de>	<4F670B62.2040606@suse.de>
	<CAJSP0QX6=x+AFxC6rK1hnBkoZHSgSporYVCXxGH5E293SVdpUA@mail.gmail.com>
	<4F672711.7030501@weilnetz.de>
In-Reply-To: <4F672711.7030501@weilnetz.de>
X-Enigmail-Version: 1.3.5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] target-mips: Remove unused
	inline function
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
X-List-Received-Date: Mon, 19 Mar 2012 12:44:36 -0000

Am 19.03.2012 13:31, schrieb Stefan Weil:
> Am 19.03.2012 13:17, schrieb Stefan Hajnoczi:
>> On Mon, Mar 19, 2012 at 10:33 AM, Andreas F=E4rber <afaerber@suse.de>
>> wrote:
>>> Am 17.03.2012 13:00, schrieb Stefan Weil:
>>>> Function set_HILO is not needed anywhere.
>>>
>>> Does this cause any warnings? Given the state mips is currently in (T=
CG
>>> patches queuing), I'd suggest to hold this off for a bit, but I don't
>>> really mind either way.
>>>
>>> Commit message does not mention if this was never used in the first
>>> place or became unused during TCG conversion or some other refactorin=
g?
>>
>> It doesn't cause any warning on my build here, so there's no strict
>> need for this patch.
>>
>> I have dropped the patch for now. Please resend if you want to get it
>> in and address Andreas' questions.
>=20
> the function was never used. It should be removed just to keep
> the code clean and free of unneeded functions. I noticed this
> function when I looked after the functions which follow
> (set_HIT0_LO, ...). Those functions are very similar, so I
> think set_HILO was the copy master for those functions
> (maybe used in a local code version whic was never committed).

Could you please check that it is not used by Richard Sandiford's,
Khansa Butt's and Jia Liu's patches? Then I'll happily ack.

>=20
> Static inline functions never create a gcc warning when they
> are unused, as far as I know. Maybe other tools like static code
> analysers raise a warning.

Sure, I was thinking of the static analysis tools you occasionally
posted patches for.

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

