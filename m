Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SMPQ7-00038t-QE
	for mharc-qemu-trivial@gnu.org; Mon, 23 Apr 2012 15:59:35 -0400
Received: from eggs.gnu.org ([208.118.235.92]:47580)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1SMPQ4-0002z6-IR
	for qemu-trivial@nongnu.org; Mon, 23 Apr 2012 15:59:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1SMPQ2-0008SB-H1
	for qemu-trivial@nongnu.org; Mon, 23 Apr 2012 15:59:32 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:47033)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1SMPPy-0008M1-HC; Mon, 23 Apr 2012 15:59:26 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	6765872800B8; Mon, 23 Apr 2012 21:59:24 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id 0phxDMMAHnzR; Mon, 23 Apr 2012 21:59:23 +0200 (CEST)
Received: from flocke.weilnetz.de (p5086FB0F.dip.t-dialin.net [80.134.251.15])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	A913A72800B4; Mon, 23 Apr 2012 21:59:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] ident=stefan)
	by flocke.weilnetz.de with esmtp (Exim 4.72)
	(envelope-from <sw@weilnetz.de>)
	id 1SMPPv-000132-Ff; Mon, 23 Apr 2012 21:59:23 +0200
Message-ID: <4F95B49B.8060300@weilnetz.de>
Date: Mon, 23 Apr 2012 21:59:23 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.16) Gecko/20120317 Iceowl/1.0b1 Icedove/3.0.11
MIME-Version: 1.0
To: =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
References: <1331985651-16227-1-git-send-email-sw@weilnetz.de>	<4F670B62.2040606@suse.de>	<CAJSP0QX6=x+AFxC6rK1hnBkoZHSgSporYVCXxGH5E293SVdpUA@mail.gmail.com>	<4F672711.7030501@weilnetz.de>
	<4F672A0E.2090301@suse.de> <4F672FBD.1080406@weilnetz.de>
In-Reply-To: <4F672FBD.1080406@weilnetz.de>
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
X-List-Received-Date: Mon, 23 Apr 2012 19:59:34 -0000

Am 19.03.2012 14:08, schrieb Stefan Weil:
> Am 19.03.2012 13:43, schrieb Andreas F=E4rber:
>> Am 19.03.2012 13:31, schrieb Stefan Weil:
>>> Am 19.03.2012 13:17, schrieb Stefan Hajnoczi:
>>>> On Mon, Mar 19, 2012 at 10:33 AM, Andreas F=E4rber <afaerber@suse.de=
>
>>>> wrote:
>>>>> Am 17.03.2012 13:00, schrieb Stefan Weil:
>>>>>> Function set_HILO is not needed anywhere.
>>>>>
>>>>> Does this cause any warnings? Given the state mips is currently in=20
>>>>> (TCG
>>>>> patches queuing), I'd suggest to hold this off for a bit, but I don=
't
>>>>> really mind either way.
>>>>>
>>>>> Commit message does not mention if this was never used in the first
>>>>> place or became unused during TCG conversion or some other=20
>>>>> refactoring?
>>>>
>>>> It doesn't cause any warning on my build here, so there's no strict
>>>> need for this patch.
>>>>
>>>> I have dropped the patch for now. Please resend if you want to get i=
t
>>>> in and address Andreas' questions.
>>>
>>> the function was never used. It should be removed just to keep
>>> the code clean and free of unneeded functions. I noticed this
>>> function when I looked after the functions which follow
>>> (set_HIT0_LO, ...). Those functions are very similar, so I
>>> think set_HILO was the copy master for those functions
>>> (maybe used in a local code version whic was never committed).
>>
>> Could you please check that it is not used by Richard Sandiford's,
>> Khansa Butt's and Jia Liu's patches? Then I'll happily ack.
>
>
> I looked for set_HI_LO in my local qemu-devel mailings from
> 2011 and 2012 and found only my own patches.
>
> You can also search the QEMU mailing list archive for set_HILO. Try=20
> this URL:
> http://lists.nongnu.org/archive/cgi-bin/namazu.cgi?query=3D*set_HI_LO*&=
submit=3DSearch!&idxname=3Dqemu-devel&max=3D20&result=3Dnormal&sort=3Dsco=
re=20
>
> It also shows no patches which include 'set_HILO' from the people you=20
> mentioned.
>
> This patch conflicts with the new one, but it was also sent by me
> and I knew that I'd have to rebase it:
> http://lists.nongnu.org/archive/html/qemu-devel/2012-03/msg00447.html.
> It's this patch which made me aware that set_HILO is unused.
> All that code was added for the V54xx core family and is only
> used for V54xx (or not used at all).
>
>
>>
>>>
>>> Static inline functions never create a gcc warning when they
>>> are unused, as far as I know. Maybe other tools like static code
>>> analysers raise a warning.
>>
>> Sure, I was thinking of the static analysis tools you occasionally
>> posted patches for.
>>
>> Andreas
>>
>
> Actually, they did complain, but I did not care then:
>
> cppcheck-20110721.log:qemu/target-mips/op_helper.c:1: style: The=20
> function 'set_HILO' is never used
>
> My cppcheck-20111029.log lists 1372 functions which are never used in=20
> QEMU.
> Many of those are false positives (for examples caused by the way how=20
> QEMU
> creates helper function names using macros), so I did not care.
>
> Cheers,
> Stefan
>


Are there any questions remaining?

I know that a lot of MIPS related patches are waiting for commit,
but maybe at least this really trivial one can finally find its way
through qemu-trivial.

Cheers,

Stefan


