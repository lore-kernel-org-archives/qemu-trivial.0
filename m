Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1du4IG-0007tZ-1A
	for mharc-qemu-trivial@gnu.org; Mon, 18 Sep 2017 18:13:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59105)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1du4IE-0007sf-Pe
	for qemu-trivial@nongnu.org; Mon, 18 Sep 2017 18:13:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1du4ID-0007bz-R5
	for qemu-trivial@nongnu.org; Mon, 18 Sep 2017 18:13:30 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:33779)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1du4I9-0007aN-9y; Mon, 18 Sep 2017 18:13:25 -0400
Received: by mail-qk0-x242.google.com with SMTP id g128so1215483qke.0;
	Mon, 18 Sep 2017 15:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=qBhfA5wOUVk+iUd9YsG1L+XHfB9WF1KpSSg/m6Yi3/g=;
	b=N+vHMAI20K24sivX+KcmZ+2uzGjzRsz4LtksFXQpIGST8ks1TV2IprhqGBtTtoUFTa
	jLKJgpmo/xMbIGf9Mqm1G0tjri41R0WvAfLQ88xbTXSlEPb/Q6rkXfos+bFnXbxFXg1C
	vNobIp6gZnOoYust5kZr3SINllyhQ27LHb+nlDl2mFyAi+0AHzYlMn/ErhZF6Dfjg0pm
	maI1XL2j8SwruQIwoypS7caEQ4jXuohdZoDLjusCbcV5AI8+B0Oeqzg0f5Hu2sMq7ja2
	df4QCHurdWaRV2PhOgFR7LbO3xXsslJrlNGu0q65oa7rGaatccDQAyDVjAFbTRGqb/3n
	svUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=qBhfA5wOUVk+iUd9YsG1L+XHfB9WF1KpSSg/m6Yi3/g=;
	b=aoDYud3DM/suK4Sl0BoOA8eroERHR8fFj+pXDQC+ypRxBRzumv45euutS5A/+e63a0
	CfVwdIKolRUlNgs+Js+IjiWBIlYTBzsD36WZVBtqAp6GpLEKoLhnlDAS1ztiutQ3EG2/
	BmCE8p9ilemVvk5UCDwflJVukwOh5jFPeMM54Eu4jfiM++gPH9ncUySxEcG5ORlNa4Nc
	Wk06mOBvFBBuLD8jOV/m5W2DJEpqqt1F80BtfwXsqxd575GdUKR2VVRBtt6T+bV1A3PU
	op3Vm59jOnb9hnNwyNTd+9WQrteBc87O0ehV2/9giOAdrTk385tOT4xjw0VRgKdt3qNr
	9OkQ==
X-Gm-Message-State: AHPjjUh0zjI3O4r3z6qzZuElgOOJG7sTHILnVEyh9JL11Bcdg18jrxsg
	VAXLdJFWG7aHhw==
X-Google-Smtp-Source: AOwi7QDp0nEhQCrGiJ408WGxdWYGphFaWSYqrihTEH0JnfXlVtGQtHPhb/2GMNZKERcqZ4VGS2NM1w==
X-Received: by 10.233.232.8 with SMTP id a8mr20801578qkg.265.1505772804829;
	Mon, 18 Sep 2017 15:13:24 -0700 (PDT)
Received: from [192.168.1.10] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	z192sm5759103qka.91.2017.09.18.15.13.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Sep 2017 15:13:24 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	"open list:Network Block Dev..." <qemu-block@nongnu.org>,
	Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>
References: <20170918214649.17550-1-eblake@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <dfe4dc28-4011-e7a7-aa1f-54e340f091d2@amsat.org>
Date: Mon, 18 Sep 2017 19:13:21 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170918214649.17550-1-eblake@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: Re: [Qemu-trivial] [PATCH] nbd-client: Use correct macro
 parenthesization
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
X-List-Received-Date: Mon, 18 Sep 2017 22:13:31 -0000

Hi Eric,

On 09/18/2017 06:46 PM, Eric Blake wrote:
> If 'bs' is a complex expression, we were only casting the front half
> rather than the full expression.  Luckily, none of the callers were
> passing bad arguments, but it's better to be robust up front.
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Any magic cocci script to verify there aren't no more?

> ---
> 
> I plan to take this through my NBD queue, unless it is picked up
> by qemu-trivial first...
> 
>   block/nbd-client.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/block/nbd-client.c b/block/nbd-client.c
> index 5f241ecc22..2a528dd217 100644
> --- a/block/nbd-client.c
> +++ b/block/nbd-client.c
> @@ -31,8 +31,8 @@
>   #include "qapi/error.h"
>   #include "nbd-client.h"
> 
> -#define HANDLE_TO_INDEX(bs, handle) ((handle) ^ ((uint64_t)(intptr_t)bs))
> -#define INDEX_TO_HANDLE(bs, index)  ((index)  ^ ((uint64_t)(intptr_t)bs))
> +#define HANDLE_TO_INDEX(bs, handle) ((handle) ^ (uint64_t)(intptr_t)(bs))
> +#define INDEX_TO_HANDLE(bs, index)  ((index)  ^ (uint64_t)(intptr_t)(bs))
> 
>   static void nbd_recv_coroutines_wake_all(NBDClientSession *s)
>   {
> 

