Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZwAYN-0004ge-9Z
	for mharc-qemu-trivial@gnu.org; Tue, 10 Nov 2015 10:09:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47028)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1ZwAYK-0004c5-8E
	for qemu-trivial@nongnu.org; Tue, 10 Nov 2015 10:09:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1ZwAYH-0003uW-22
	for qemu-trivial@nongnu.org; Tue, 10 Nov 2015 10:09:44 -0500
Received: from mail-wm0-x22a.google.com ([2a00:1450:400c:c09::22a]:38648)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1ZwAYG-0003uK-S4; Tue, 10 Nov 2015 10:09:40 -0500
Received: by wmec201 with SMTP id c201so5525651wme.1;
	Tue, 10 Nov 2015 07:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=RlFymWhYrJjeL/PZZ8GjFeIUGglDQpDgu9CBCNNQ/Bk=;
	b=B3MiSz1POrDAFZSO+uUu01beMFnBiiHYOGUv8cHhSjEfb3sqEI5ZQGX35yBZd3BtS7
	wb9liA0scgIpjOXDykfLPcstKEFcyZPwZleOlZ9/jjD53/mwt7WxPuPsnD+feP2bUOcs
	wZaFDpS0R1hmx87Fnvsp1z9Z+v4nsA/sJiozLrL2Tf8OW9zWIZtfCx2J1KNzhL+OZsmN
	eWY52kgf6nWnmuT7M9tU8bu8sLBWi6eXtSjvIgDepOWwTC0Vkdruqrn05B676hQz7A0n
	KFJb8ny1FBShZ5mKsYBckpQYQ6KhFp/y/i763dxA0dolN+gP43Px1bUjtYXx7kXb5vOB
	VI+w==
X-Received: by 10.28.24.144 with SMTP id 138mr5062415wmy.43.1447168180227;
	Tue, 10 Nov 2015 07:09:40 -0800 (PST)
Received: from [192.168.10.165] (94-39-161-165.adsl-ull.clienti.tiscali.it.
	[94.39.161.165]) by smtp.googlemail.com with ESMTPSA id
	bh5sm3965992wjb.42.2015.11.10.07.09.37
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Nov 2015 07:09:39 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
To: Rabin Vincent <rabin.vincent@axis.com>, kwolf@redhat.com
References: <1447161947-22542-1-git-send-email-rabin.vincent@axis.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <564208B1.7050200@redhat.com>
Date: Tue, 10 Nov 2015 16:09:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1447161947-22542-1-git-send-email-rabin.vincent@axis.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c09::22a
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org,
	qemu-block@nongnu.org, Rabin Vincent <rabinv@axis.com>
Subject: Re: [Qemu-trivial] [PATCH] nand: fix address overflow
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
X-List-Received-Date: Tue, 10 Nov 2015 15:09:45 -0000



On 10/11/2015 14:25, Rabin Vincent wrote:
> The shifts of the address mask and value shift beyond 32 bits when there
> are 5 address cycles.
> 
> Signed-off-by: Rabin Vincent <rabin.vincent@axis.com>
> ---
>  hw/block/nand.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/block/nand.c b/hw/block/nand.c
> index 61d2cec..a68266f 100644
> --- a/hw/block/nand.c
> +++ b/hw/block/nand.c
> @@ -522,8 +522,8 @@ void nand_setio(DeviceState *dev, uint32_t value)
>  
>      if (s->ale) {
>          unsigned int shift = s->addrlen * 8;
> -        unsigned int mask = ~(0xff << shift);
> -        unsigned int v = value << shift;
> +        uint64_t mask = ~(0xffull << shift);
> +        uint64_t v = (uint64_t)value << shift;
>  
>          s->addr = (s->addr & mask) | v;
>          s->addrlen ++;
> 

Cc: qemu-trivial@nongnu.org
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

