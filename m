Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ctcgR-0000YN-LS
	for mharc-qemu-trivial@gnu.org; Thu, 30 Mar 2017 12:12:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34523)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tcminyard@gmail.com>) id 1ctcgP-0000Wh-CG
	for qemu-trivial@nongnu.org; Thu, 30 Mar 2017 12:12:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <tcminyard@gmail.com>) id 1ctcgK-0007N3-E3
	for qemu-trivial@nongnu.org; Thu, 30 Mar 2017 12:12:21 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:33859)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <tcminyard@gmail.com>)
	id 1ctcgK-0007MV-8T; Thu, 30 Mar 2017 12:12:16 -0400
Received: by mail-oi0-x241.google.com with SMTP id t11so5282890oib.1;
	Thu, 30 Mar 2017 09:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=reply-to:subject:references:to:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=L37/dMUfddBRVVgUVsB1auHPqbKSWYl908y1umAPyjY=;
	b=TLGuBcZuuW1BvN9fbmSe5WAR1aLTAbcIw/NHsilkjNi2YiBGp9f5pP5m4lqAPgk7bK
	eDTOAOg+hPBEdn7hfL7DJaouU2n7oTbCJSXMP/86/eFMxogpa1NPLyJUVIuhqv2XX1cJ
	2fNwcptVtXTCgTm4X9Q2wSTtUTkOjFOoAhWhFbCAIvDUctPbDPvvTm0fOMd47l1JH7Ah
	5zrgD7SkqHYZQ1Lrmh90S2HCszi8yy2vpB33TiuqH2LpWr8bWELISbqQdBPvPAHNv71F
	+8xwcNqtEpAhT02hp8l1vxKwdtHejCOjTiVzwvYtgJbGT1leZ01W24PFXhHJwZprMPUI
	foWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:reply-to:subject:references:to:cc:from
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding;
	bh=L37/dMUfddBRVVgUVsB1auHPqbKSWYl908y1umAPyjY=;
	b=TUvy5HqvEvxIvp/WemnprbPonLGfE8m4U7dHY8nqw4M271imaIE2cHqVBStBVFfnWW
	wadYaDNh4MDrzfGZoyvzuc+PbAtKd/xsIW5nR5pzvfqoj3XLPPzZ3FWVAwaxb0SwAlTS
	ixx+ZRJXJbLkYMUWi3c/ZUDiRqJkNFdrA+PLPRMjONRAABWixTS7agtl4+qKMlIvBzTp
	yFPJO6jiZGu/tKUY/SFxV6Q1m14ATLoF4GJ9cTU6zMp6KwO9fnxvmR5nK5KikdAqef1+
	syNt7908QlhvHmFDFL63AkqmO6/+zw5Gj+2pv9ZTGE85VFTnYvCEJGu7I/JzQg8U624d
	2VKA==
X-Gm-Message-State: AFeK/H0O8uUm3CDYPuchcBIspFMQE3qj8FyhvFjKAEJkUqwdi6mIwodMJzE5ZkrhUCL/Bg==
X-Received: by 10.157.61.33 with SMTP id a30mr253081otc.73.1490890335194;
	Thu, 30 Mar 2017 09:12:15 -0700 (PDT)
Received: from [192.168.27.3] ([47.184.141.54])
	by smtp.gmail.com with ESMTPSA id t93sm1188448ota.4.2017.03.30.09.12.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 Mar 2017 09:12:14 -0700 (PDT)
Reply-To: minyard@acm.org
References: <20170330232236.8272-1-emaste@freebsd.org>
To: Ed Maste <emaste@freebsd.org>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
From: Corey Minyard <tcminyard@gmail.com>
Message-ID: <3ba002c2-9a57-05fe-c93c-62f279a2381c@gmail.com>
Date: Thu, 30 Mar 2017 11:12:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170330232236.8272-1-emaste@freebsd.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] ipmi: use parens to avoid
 unexpected macro var evaluation
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Mar 2017 16:12:22 -0000

This isn't quite right, a lot of these need parenthesis around the whole
thing, and some of the macros are unused and need to be removed.
I had submitted something for this a while ago, but it hadn't been
taken.  I will re-submit.

-corey

On 03/30/2017 06:22 PM, Ed Maste wrote:
> Found via Clang warning: logical not is only applied to the left hand
> side of this bitwise operator [-Wlogical-not-parentheses]
>
>                                !IPMI_BT_GET_HBUSY(ib->control_reg));
>                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> expanded from macro 'IPMI_BT_SET_HBUSY'
>                                         (((v & 1) << IPMI_BT_HBUSY_BIT)))
>                                            ^ ~
>
> Signed-off-by: Ed Maste <emaste@freebsd.org>
> ---
>   hw/ipmi/isa_ipmi_bt.c | 18 +++++++++---------
>   1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/hw/ipmi/isa_ipmi_bt.c b/hw/ipmi/isa_ipmi_bt.c
> index 1c69cb33f8..c1dea503a2 100644
> --- a/hw/ipmi/isa_ipmi_bt.c
> +++ b/hw/ipmi/isa_ipmi_bt.c
> @@ -40,37 +40,37 @@
>   #define IPMI_BT_CLR_WR_MASK        (1 << IPMI_BT_CLR_WR_BIT)
>   #define IPMI_BT_GET_CLR_WR(d)      (((d) >> IPMI_BT_CLR_WR_BIT) & 0x1)
>   #define IPMI_BT_SET_CLR_WR(d, v)   (d) = (((d) & ~IPMI_BT_CLR_WR_MASK) | \
> -                                       (((v & 1) << IPMI_BT_CLR_WR_BIT)))
> +                                       ((((v) & 1) << IPMI_BT_CLR_WR_BIT)))
>   
>   #define IPMI_BT_CLR_RD_MASK        (1 << IPMI_BT_CLR_RD_BIT)
>   #define IPMI_BT_GET_CLR_RD(d)      (((d) >> IPMI_BT_CLR_RD_BIT) & 0x1)
>   #define IPMI_BT_SET_CLR_RD(d, v)   (d) = (((d) & ~IPMI_BT_CLR_RD_MASK) | \
> -                                       (((v & 1) << IPMI_BT_CLR_RD_BIT)))
> +                                       ((((v) & 1) << IPMI_BT_CLR_RD_BIT)))
>   
>   #define IPMI_BT_H2B_ATN_MASK       (1 << IPMI_BT_H2B_ATN_BIT)
>   #define IPMI_BT_GET_H2B_ATN(d)     (((d) >> IPMI_BT_H2B_ATN_BIT) & 0x1)
>   #define IPMI_BT_SET_H2B_ATN(d, v)  (d) = (((d) & ~IPMI_BT_H2B_ATN_MASK) | \
> -                                        (((v & 1) << IPMI_BT_H2B_ATN_BIT)))
> +                                        ((((v) & 1) << IPMI_BT_H2B_ATN_BIT)))
>   
>   #define IPMI_BT_B2H_ATN_MASK       (1 << IPMI_BT_B2H_ATN_BIT)
>   #define IPMI_BT_GET_B2H_ATN(d)     (((d) >> IPMI_BT_B2H_ATN_BIT) & 0x1)
>   #define IPMI_BT_SET_B2H_ATN(d, v)  (d) = (((d) & ~IPMI_BT_B2H_ATN_MASK) | \
> -                                        (((v & 1) << IPMI_BT_B2H_ATN_BIT)))
> +                                        ((((v) & 1) << IPMI_BT_B2H_ATN_BIT)))
>   
>   #define IPMI_BT_SMS_ATN_MASK       (1 << IPMI_BT_SMS_ATN_BIT)
>   #define IPMI_BT_GET_SMS_ATN(d)     (((d) >> IPMI_BT_SMS_ATN_BIT) & 0x1)
>   #define IPMI_BT_SET_SMS_ATN(d, v)  (d) = (((d) & ~IPMI_BT_SMS_ATN_MASK) | \
> -                                        (((v & 1) << IPMI_BT_SMS_ATN_BIT)))
> +                                        ((((v) & 1) << IPMI_BT_SMS_ATN_BIT)))
>   
>   #define IPMI_BT_HBUSY_MASK         (1 << IPMI_BT_HBUSY_BIT)
>   #define IPMI_BT_GET_HBUSY(d)       (((d) >> IPMI_BT_HBUSY_BIT) & 0x1)
>   #define IPMI_BT_SET_HBUSY(d, v)    (d) = (((d) & ~IPMI_BT_HBUSY_MASK) | \
> -                                       (((v & 1) << IPMI_BT_HBUSY_BIT)))
> +                                       ((((v) & 1) << IPMI_BT_HBUSY_BIT)))
>   
>   #define IPMI_BT_BBUSY_MASK         (1 << IPMI_BT_BBUSY_BIT)
>   #define IPMI_BT_GET_BBUSY(d)       (((d) >> IPMI_BT_BBUSY_BIT) & 0x1)
>   #define IPMI_BT_SET_BBUSY(d, v)    (d) = (((d) & ~IPMI_BT_BBUSY_MASK) | \
> -                                       (((v & 1) << IPMI_BT_BBUSY_BIT)))
> +                                       ((((v) & 1) << IPMI_BT_BBUSY_BIT)))
>   
>   
>   /* Mask register */
> @@ -80,12 +80,12 @@
>   #define IPMI_BT_B2H_IRQ_EN_MASK      (1 << IPMI_BT_B2H_IRQ_EN_BIT)
>   #define IPMI_BT_GET_B2H_IRQ_EN(d)    (((d) >> IPMI_BT_B2H_IRQ_EN_BIT) & 0x1)
>   #define IPMI_BT_SET_B2H_IRQ_EN(d, v) (d) = (((d) & ~IPMI_BT_B2H_IRQ_EN_MASK) | \
> -                                        (((v & 1) << IPMI_BT_B2H_IRQ_EN_BIT)))
> +                                        ((((v) & 1) << IPMI_BT_B2H_IRQ_EN_BIT)))
>   
>   #define IPMI_BT_B2H_IRQ_MASK         (1 << IPMI_BT_B2H_IRQ_BIT)
>   #define IPMI_BT_GET_B2H_IRQ(d)       (((d) >> IPMI_BT_B2H_IRQ_BIT) & 0x1)
>   #define IPMI_BT_SET_B2H_IRQ(d, v)    (d) = (((d) & ~IPMI_BT_B2H_IRQ_MASK) | \
> -                                        (((v & 1) << IPMI_BT_B2H_IRQ_BIT)))
> +                                        ((((v) & 1) << IPMI_BT_B2H_IRQ_BIT)))
>   
>   typedef struct IPMIBT {
>       IPMIBmc *bmc;



