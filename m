Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S9bkr-0008QK-Hv
	for mharc-qemu-trivial@gnu.org; Mon, 19 Mar 2012 08:32:05 -0400
Received: from eggs.gnu.org ([208.118.235.92]:50008)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1S9bkf-0007st-Ar
	for qemu-trivial@nongnu.org; Mon, 19 Mar 2012 08:32:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1S9bkZ-0001en-Qd
	for qemu-trivial@nongnu.org; Mon, 19 Mar 2012 08:31:52 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:37113)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1S9bk5-0001bG-M0; Mon, 19 Mar 2012 08:31:17 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	B6A50728009F; Mon, 19 Mar 2012 13:31:15 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id 7+mKTcfCoYQ1; Mon, 19 Mar 2012 13:31:15 +0100 (CET)
Received: from flocke.weilnetz.de (p54ADAF42.dip.t-dialin.net [84.173.175.66])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	ED7AA728009E; Mon, 19 Mar 2012 13:31:14 +0100 (CET)
Received: from localhost ([127.0.0.1] ident=stefan)
	by flocke.weilnetz.de with esmtp (Exim 4.72)
	(envelope-from <sw@weilnetz.de>)
	id 1S9bk1-0004W8-QW; Mon, 19 Mar 2012 13:31:13 +0100
Message-ID: <4F672711.7030501@weilnetz.de>
Date: Mon, 19 Mar 2012 13:31:13 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.16) Gecko/20120207 Iceowl/1.0b1 Icedove/3.0.11
MIME-Version: 1.0
To: Stefan Hajnoczi <stefanha@gmail.com>, =?ISO-8859-1?Q?Andreas_F=E4rb?=
	=?ISO-8859-1?Q?er?= <afaerber@suse.de>
References: <1331985651-16227-1-git-send-email-sw@weilnetz.de>	<4F670B62.2040606@suse.de>
	<CAJSP0QX6=x+AFxC6rK1hnBkoZHSgSporYVCXxGH5E293SVdpUA@mail.gmail.com>
In-Reply-To: <CAJSP0QX6=x+AFxC6rK1hnBkoZHSgSporYVCXxGH5E293SVdpUA@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.47.199.172
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
X-List-Received-Date: Mon, 19 Mar 2012 12:32:04 -0000

Am 19.03.2012 13:17, schrieb Stefan Hajnoczi:
> On Mon, Mar 19, 2012 at 10:33 AM, Andreas F=E4rber <afaerber@suse.de> w=
rote:
>> Hello Stefan,
>>
>> Am 17.03.2012 13:00, schrieb Stefan Weil:
>>> Function set_HILO is not needed anywhere.
>>
>> Does this cause any warnings? Given the state mips is currently in (TC=
G
>> patches queuing), I'd suggest to hold this off for a bit, but I don't
>> really mind either way.
>>
>> Commit message does not mention if this was never used in the first
>> place or became unused during TCG conversion or some other refactoring=
?
>
> It doesn't cause any warning on my build here, so there's no strict
> need for this patch.
>
> I have dropped the patch for now. Please resend if you want to get it
> in and address Andreas' questions.
>
> Thanks,
> Stefan

Hi Andreas, hi Stefan

the function was never used. It should be removed just to keep
the code clean and free of unneeded functions. I noticed this
function when I looked after the functions which follow
(set_HIT0_LO, ...). Those functions are very similar, so I
think set_HILO was the copy master for those functions
(maybe used in a local code version whic was never committed).

Static inline functions never create a gcc warning when they
are unused, as far as I know. Maybe other tools like static code
analysers raise a warning.

Cheers,
Stefan


