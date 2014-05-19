Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WmION-0002kt-Pv
	for mharc-qemu-trivial@gnu.org; Mon, 19 May 2014 03:53:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52928)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WmIOH-0002eA-CG
	for qemu-trivial@nongnu.org; Mon, 19 May 2014 03:53:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WmIOC-0000Th-Tz
	for qemu-trivial@nongnu.org; Mon, 19 May 2014 03:53:45 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:38685)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WmIO3-0000SQ-PN; Mon, 19 May 2014 03:53:31 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id AD19241BD9;
	Mon, 19 May 2014 11:53:30 +0400 (MSK)
Message-ID: <5379B87A.6080509@msgid.tls.msk.ru>
Date: Mon, 19 May 2014 11:53:30 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.5.0
MIME-Version: 1.0
To: Richard Henderson <rth@twiddle.net>, 
	Peter Maydell <peter.maydell@linaro.org>
References: <1399051958-9459-1-git-send-email-peter.maydell@linaro.org>	<5363E860.6060307@twiddle.net>	<CAFEAcA8UPr1Y8W067Hn7aJB0E1qoWKV3-xDF=DHFVKH+8BHMbw@mail.gmail.com>
	<537505CD.1020105@twiddle.net>
In-Reply-To: <537505CD.1020105@twiddle.net>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] bswap.h: Rename ldl_p, stl_p,
 etc to ldl_he_p, stl_he_p, etc
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
X-List-Received-Date: Mon, 19 May 2014 07:53:50 -0000

15.05.2014 22:22, Richard Henderson wrote:
> On 05/15/2014 11:13 AM, Peter Maydell wrote:
>> On 2 May 2014 19:48, Richard Henderson <rth@twiddle.net> wrote:
>>> On 05/02/2014 10:32 AM, Peter Maydell wrote:
>>>> We have an unfortunate naming clash between the functions
>>>> ldl_p, stl_p, etc defined in bswap.h (which have semantics
>>>> "load/store in host endianness") and the #defines of the same
>>>> name in cpu-all.h (which have the semantics "load/store in
>>>> target endianness").
>>>>
>>>> Fortunately it turns out that the only users of the bswap.h
>>>> functions are all within bswap.h itself, so we can simply
>>>> rename them to include a _he_ infix for "host endianness".
>>>>
>>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>>> ---
>>>> Frankly I'm surprised that the only users of these functions
>>>> are the ones within bswap.h itself, but it's a lucky escape
>>>> from having to audit an enormous pile of code...
>>>>
>>>> We had talked about changing the "target-endian" accessors
>>>> to be ldl_te_p &c, but given the uses aren't tangled together
>>>> as I feared they would be, I'm not sure we can justify the
>>>> global function rename.
>>>
>>> I'm surprised too, but... good news, I guess.
>>>
>>> Reviewed-by: Richard Henderson <rth@twiddle.net>
>>
>> Anybody care to suggest a submaintainer tree this should
>> go in via?
> 
> Trivial?  Ha, ha, only serious.

Oh well.

Okay.  I checked every macro in there, and indeed, it does not look
like these macros are used outside of bswap.h itself.  I modified
the macros to expand to syntactically-incorrect code and modified
all usages of those inside bswap.h to make it correct again, just
to verify, and did a rebuild.  Unfortunately I don't have easy
access to non-x86 hardware to try other host byte order, but this
should already be a good test.

So that should be an okay change.

So.. Applying to -trivial, thank you! :)

/mjt


