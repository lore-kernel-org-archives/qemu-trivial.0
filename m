Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VYB8U-0007tQ-BE
	for mharc-qemu-trivial@gnu.org; Mon, 21 Oct 2013 04:46:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54124)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VYB8P-0007mu-7h
	for qemu-trivial@nongnu.org; Mon, 21 Oct 2013 04:46:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VYB8K-00052l-7e
	for qemu-trivial@nongnu.org; Mon, 21 Oct 2013 04:46:45 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:41012)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VYB89-00050J-LE; Mon, 21 Oct 2013 04:46:29 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id DD9FD42E03;
	Mon, 21 Oct 2013 12:46:28 +0400 (MSK)
Message-ID: <5264E9E4.5070700@msgid.tls.msk.ru>
Date: Mon, 21 Oct 2013 12:46:28 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130922 Icedove/17.0.9
MIME-Version: 1.0
To: Don Koch <dkoch@cloudswitch.com>
References: <1381520073-32674-1-git-send-email-sw@weilnetz.de>
	<52585983.1000606@terremark.com>
	<CAFEAcA8QMiNuBMN0=DmXA8RqV9iVdoD-weGF04njKCGw1nbbyg@mail.gmail.com>
	<52585F8B.6080604@cloudswitch.com>
In-Reply-To: <52585F8B.6080604@cloudswitch.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
	qemu-trivial <qemu-trivial@nongnu.org>,
	Stefan Weil <sw@weilnetz.de>, qemu-devel <qemu-devel@nongnu.org>,
	Don Koch <dkoch@verizon.com>, Alexander Graf <agraf@suse.de>,
	Stefan Hajnoczi <stefanha@redhat.com>, Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3] misc: Spelling and
 grammar fixes in comments
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
X-List-Received-Date: Mon, 21 Oct 2013 08:46:49 -0000

So guys, do we agree to apply this or not, after all? :)

Thanks,

/mjt

12.10.2013 00:28, Don Koch wrote:
> On 10/11/2013 04:10 PM, Peter Maydell wrote:
>> On 12 October 2013 05:03, Don Koch <dkoch@verizon.com> wrote:
>>> On 10/11/2013 03:34 PM, Stefan Weil wrote:
>>>> * it's -> its
>>>> * grammar fix in ui/vnc-enc-zywrle.h
>>>>
>>>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>>>> ---
>>>>
>>>> This is v3 of http://patchwork.ozlabs.org/patch/257416/.
>>>>
>>>> v3:
>>>> Don't try to improve a strange sentence in the same context ("Of cause [...]").
>>
>>>>    In this method, H/L and X0/X1 is always same position.
>>>> - This lead us to more speed and less memory.
>>>> + This leads us to more speed and less memory.
>>>>    Of cause, the result of both method is quite same
>>>>    because it's only difference that coefficient position.
>>>>   */
>>>>
>>>
>>> Since you're in the neighborhood, this paragraph needs more fixes:
>>
>> No, see the note above and the previous discussion.
>
> In that case, there in no point in fixing just the lead/leads typo.
>
>>>   In this method, H/L and X0/X1 is always in the same position.
>>>   This leads us to more speed and less memory.
>>>   Of course, the result of both methods is the same
>>>   because the only difference is the coefficient position.
>>
>> Unless you want to say you've reviewed the code and
>> are completely confident that the original author meant
>> "the same" or "exactly the same" and not "quite similar"
>> then we need to leave the original wording alone.
>>
>> -- PMM
>>
>
> -d
>
>
>


