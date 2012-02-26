Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S1kIJ-0004IG-Qp
	for mharc-qemu-trivial@gnu.org; Sun, 26 Feb 2012 15:02:07 -0500
Received: from eggs.gnu.org ([208.118.235.92]:49990)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1S1kIG-0004Gj-B3
	for qemu-trivial@nongnu.org; Sun, 26 Feb 2012 15:02:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1S1kIE-0000kn-6j
	for qemu-trivial@nongnu.org; Sun, 26 Feb 2012 15:02:04 -0500
Received: from mail-pz0-f45.google.com ([209.85.210.45]:37329)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1S1kIE-0000kD-0r
	for qemu-trivial@nongnu.org; Sun, 26 Feb 2012 15:02:02 -0500
Received: by dadp14 with SMTP id p14so5368323dad.4
	for <qemu-trivial@nongnu.org>; Sun, 26 Feb 2012 12:02:00 -0800 (PST)
Received-SPF: pass (google.com: domain of anthony@codemonkey.ws designates
	10.68.189.100 as permitted sender) client-ip=10.68.189.100; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of anthony@codemonkey.ws
	designates 10.68.189.100 as permitted sender)
	smtp.mail=anthony@codemonkey.ws
Received: from mr.google.com ([10.68.189.100])
	by 10.68.189.100 with SMTP id gh4mr7168834pbc.106.1330286520151
	(num_hops = 1); Sun, 26 Feb 2012 12:02:00 -0800 (PST)
Received: by 10.68.189.100 with SMTP id gh4mr6340412pbc.106.1330286519956;
	Sun, 26 Feb 2012 12:01:59 -0800 (PST)
Received: from [192.168.0.104] (cpe-70-123-132-139.austin.res.rr.com.
	[70.123.132.139])
	by mx.google.com with ESMTPS id e3sm10430360pbr.15.2012.02.26.12.01.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 26 Feb 2012 12:01:58 -0800 (PST)
Message-ID: <4F4A8FB4.1060207@codemonkey.ws>
Date: Sun, 26 Feb 2012 14:01:56 -0600
From: Anthony Liguori <anthony@codemonkey.ws>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.23) Gecko/20110922 Lightning/1.0b2 Thunderbird/3.1.15
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1330263596-4988-1-git-send-email-sw@weilnetz.de>	<4F4A6041.5060102@codemonkey.ws>
	<4F4A80DC.6000106@weilnetz.de>
In-Reply-To: <4F4A80DC.6000106@weilnetz.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-Gm-Message-State: ALoCoQnXY0ss5cdSCv52DqDzeW1I2M520Qd/zPptyrXhjoaUN8bWBrQItoc9mY1WJGWiLY/FrLsT
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.210.45
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Fix spelling in comments
	(iff -> if)
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
X-List-Received-Date: Sun, 26 Feb 2012 20:02:05 -0000

On 02/26/2012 12:58 PM, Stefan Weil wrote:
> Am 26.02.2012 17:39, schrieb Anthony Liguori:
>> On 02/26/2012 07:39 AM, Stefan Weil wrote:
>>> Signed-off-by: Stefan Weil<sw@weilnetz.de>
>>> ---
>>> a.out.h | 2 +-
>>> arm-dis.c | 22 +++++++++++-----------
>>> block.c | 2 +-
>>> block/qcow2-refcount.c | 4 ++--
>>> hw/alpha_typhoon.c | 2 +-
>>> hw/hid.h | 2 +-
>>> hw/pcnet.c | 2 +-
>>> m68k-dis.c | 4 ++--
>>> memory.h | 4 ++--
>>> monitor.c | 2 +-
>>> net/socket.c | 2 +-
>>> qemu-img.c | 2 +-
>>> tcg/hppa/tcg-target.c | 6 +++---
>>> 13 files changed, 28 insertions(+), 28 deletions(-)
>>>
>>> diff --git a/a.out.h b/a.out.h
>>> index 33ca7f7..7ea8d5a 100644
>>> --- a/a.out.h
>>> +++ b/a.out.h
>>> @@ -136,7 +136,7 @@ struct external_scnhdr {
>>> */
>>> struct external_lineno {
>>> union {
>>> - host_ulong l_symndx; /* function name symbol index, iff l_lnno 0 */
>>
>> I don't know if this is the intention but this may be short hand for 'if and
>> only if'. I do use this short hand quite a bit myself.
>>
>> http://en.wikipedia.org/wiki/If_and_only_if
>>
>> Regards,
>>
>> Anthony Liguori
>
> Thank you for this information which was new for me.
>
> I reviewed my own patch, and there are indeed some 'iff' which might
> be used for 'if and only if'. Others cannot have this meaning because
> there are several alternatives with the same result. For the
> description of function return values 'if and only if' also looks strange.
> Some comments just translate an if statement in text.
> Here 'if and only if' would not match the C code which only says 'if'.
>
> I'll send new patches for these different categories, then it will
> be easier to accept or reject them.
>
> Many authors regard "iff" as unsuitable in formal writing
> (citation from Wikipedia).Personally, I'd also prefer to see
> 'if and only if' in full length or in symbolic notation (<==>)
> when this is the intention, not an abbreviation like 'iff'.

Yup, just pointing out that in some cases it may be intentional.

Regards,

Anthony Liguori

>
> Regards,
>
> Stefan Weil
>
>


