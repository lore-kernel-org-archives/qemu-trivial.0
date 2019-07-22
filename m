Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hpWj7-00054P-Eb
	for mharc-qemu-trivial@gnu.org; Mon, 22 Jul 2019 07:43:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53066)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hpWj5-00053t-P1
 for qemu-trivial@nongnu.org; Mon, 22 Jul 2019 07:43:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hpWj4-00063U-Fd
 for qemu-trivial@nongnu.org; Mon, 22 Jul 2019 07:43:31 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:35267)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hpWj4-00060O-9j
 for qemu-trivial@nongnu.org; Mon, 22 Jul 2019 07:43:30 -0400
Received: by mail-wr1-f66.google.com with SMTP id y4so39095453wrm.2
 for <qemu-trivial@nongnu.org>; Mon, 22 Jul 2019 04:43:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sz0dAVli6verdsWL1saWlZq8xZldmuRQESDr7ZOBKDU=;
 b=n2UYfLTNMo9d8jJEi9FSrPSd3nVAv/oc3GSSwzgqLhZwGOQc6YFWS87CFcTY+s4FfO
 YeeKjVMidWO7Zq5MM//X3qnQkSFXb6uGzMDnywc2KT5X6WTlgoRHOgy6KJibXCfBqLBX
 S0VFG5kHSQS5esZCHAXZM9jXUtviBp2DpCR/Q/CeigQhCw2HWCTwlWUh2qlghEPOAQ/+
 S063nJ/XhRqmg4hpU5lnQ6KNM1jnfNRWmRnJPgSBwY08xm3g4wNQNlqH49XheXF6IE5G
 LLeX6D0uBazCU8tHZIoDyjXXMLCT8yHMk1qbQqaZU+ZRswMzAM4AwIkyctcO0kEGS9Ik
 h8CA==
X-Gm-Message-State: APjAAAVq/mq1EhG2RYw7rFZsnbWAudMSN9E9fT+fkfoRQqMXUucEhgVD
 y/IRbO9VCCypXt4yB/B6bgVECw==
X-Google-Smtp-Source: APXvYqwQhQxFsFWtNPS97Yxs21wUDBL4H877bFYerPHUsuBuaMioq+IGS7Xa8Y6Uy1GJYDG0Irl0xA==
X-Received: by 2002:adf:e50c:: with SMTP id j12mr4010037wrm.117.1563795807088; 
 Mon, 22 Jul 2019 04:43:27 -0700 (PDT)
Received: from [192.168.1.38] (62.red-83-42-61.dynamicip.rima-tde.net.
 [83.42.61.62])
 by smtp.gmail.com with ESMTPSA id o126sm35233401wmo.1.2019.07.22.04.43.25
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 22 Jul 2019 04:43:26 -0700 (PDT)
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-block@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org,
 Corey Minyard <minyard@acm.org>, Max Reitz <mreitz@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Peter Maydell
 <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Weil <sw@weilnetz.de>
References: <20190719131425.10835-1-philmd@redhat.com>
 <20190719131425.10835-4-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <6ff431d9-36bd-27a1-077b-b2cb1331750d@redhat.com>
Date: Mon, 22 Jul 2019 13:43:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190719131425.10835-4-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-trivial] [PATCH-for-4.1 3/7] hw/block/pflash_cfi02:
 Rewrite a fall through comment
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Jul 2019 11:43:32 -0000

On 7/19/19 3:14 PM, Philippe Mathieu-Daudé wrote:
> GCC9 is confused by this comment when building with CFLAG
> -Wimplicit-fallthrough=2:
> 
>   hw/block/pflash_cfi02.c: In function ‘pflash_write’:
>   hw/block/pflash_cfi02.c:574:16: error: this statement may fall through [-Werror=implicit-fallthrough=]
>     574 |             if (boff == 0x55 && cmd == 0x98) {
>         |                ^
>   hw/block/pflash_cfi02.c:581:9: note: here
>     581 |         default:
>         |         ^~~~~~~
>   cc1: all warnings being treated as errors
> 
> Rewrite the comment using 'fall through' which is recognized by
> GCC and static analyzers.
> 
> Reported-by: Stefan Weil <sw@weilnetz.de>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/block/pflash_cfi02.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
> index f68837a449..42886f6af5 100644
> --- a/hw/block/pflash_cfi02.c
> +++ b/hw/block/pflash_cfi02.c
> @@ -577,7 +577,7 @@ static void pflash_write(void *opaque, hwaddr offset, uint64_t value,
>                  pfl->cmd = 0x98;
>                  return;
>              }
> -            /* No break here */
> +            /* fall through */
>          default:
>              DPRINTF("%s: invalid write for command %02x\n",
>                      __func__, pfl->cmd);
> 

Queued to pflash/next, thanks.

