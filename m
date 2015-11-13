Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zx5tO-0006Pa-He
	for mharc-qemu-trivial@gnu.org; Thu, 12 Nov 2015 23:23:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48830)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1Zx5tM-0006LP-AI
	for qemu-trivial@nongnu.org; Thu, 12 Nov 2015 23:23:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1Zx5tL-0007wm-CW
	for qemu-trivial@nongnu.org; Thu, 12 Nov 2015 23:23:16 -0500
Received: from mail-wm0-x235.google.com ([2a00:1450:400c:c09::235]:36298)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1Zx5tF-0007uN-L1; Thu, 12 Nov 2015 23:23:09 -0500
Received: by wmww144 with SMTP id w144so13447015wmw.1;
	Thu, 12 Nov 2015 20:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=KHc5ZTmTpbE6Arv369khZXiXw8EZSWqvfZHNfq28eY8=;
	b=SpdpdunDbY3Z09dJ7KsGXGBFo6TYiPS7SASoj7Jnabl43HwEIQoHh3qcwvgk36M6J9
	jS/KIleX3/9gBPXQN24TZ1Rrx++JzB7yXVi5YXJZzr8lJBd3mX5u0RVpJbd+v7Z7KvA+
	KtEo1WwASWp46mJhi7Xamb3+ut09v1ipiuXJkjbi+sdz9mRKIClH9iU4lGeTpSOPLP+i
	XYtaKv8EemhBO+2PmlYEeWUz17aCTG6Hr0H5tpBh7NGG8Fo8yS4ZPvPaHySza3PoLQKz
	Shy92uNauD7ay1xoVXdRLp/4JKPxSiFxPQigCEYnAhutj60DMxe+PilTi+Ra+5N3GHcz
	3jZQ==
MIME-Version: 1.0
X-Received: by 10.194.52.68 with SMTP id r4mr15226360wjo.8.1447388589001; Thu,
	12 Nov 2015 20:23:09 -0800 (PST)
Received: by 10.28.88.11 with HTTP; Thu, 12 Nov 2015 20:23:08 -0800 (PST)
In-Reply-To: <564208B1.7050200@redhat.com>
References: <1447161947-22542-1-git-send-email-rabin.vincent@axis.com>
	<564208B1.7050200@redhat.com>
Date: Thu, 12 Nov 2015 20:23:08 -0800
Message-ID: <CAPokK=p_70OJag_kpx25kSC8iMuiC6fHGrjU6Zc4Dgzxi8T-AQ@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-stable@nongnu.org
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c09::235
Cc: Kevin Wolf <kwolf@redhat.com>, Rabin Vincent <rabinv@axis.com>,
	qemu-block@nongnu.org, "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Rabin Vincent <rabin.vincent@axis.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] nand: fix address overflow
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
X-List-Received-Date: Fri, 13 Nov 2015 04:23:17 -0000

On Tue, Nov 10, 2015 at 7:09 AM, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
>
> On 10/11/2015 14:25, Rabin Vincent wrote:
>> The shifts of the address mask and value shift beyond 32 bits when there
>> are 5 address cycles.
>>
>> Signed-off-by: Rabin Vincent <rabin.vincent@axis.com>
>> ---
>>  hw/block/nand.c |    4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/block/nand.c b/hw/block/nand.c
>> index 61d2cec..a68266f 100644
>> --- a/hw/block/nand.c
>> +++ b/hw/block/nand.c
>> @@ -522,8 +522,8 @@ void nand_setio(DeviceState *dev, uint32_t value)
>>
>>      if (s->ale) {
>>          unsigned int shift = s->addrlen * 8;
>> -        unsigned int mask = ~(0xff << shift);
>> -        unsigned int v = value << shift;
>> +        uint64_t mask = ~(0xffull << shift);
>> +        uint64_t v = (uint64_t)value << shift;
>>
>>          s->addr = (s->addr & mask) | v;
>>          s->addrlen ++;
>>
>
> Cc: qemu-trivial@nongnu.org
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>

This is a bugfix right? IIUC This would not have worked for accesses
to devices above column address 255 at all. Should this go to
stable/2.5?

Regards,
Peter

>

