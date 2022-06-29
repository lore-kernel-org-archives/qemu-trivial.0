Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o6S8U-00005z-1N
	for mharc-qemu-trivial@gnu.org; Wed, 29 Jun 2022 03:29:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1o6S8P-0008SD-7s
 for qemu-trivial@nongnu.org; Wed, 29 Jun 2022 03:29:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1o6S8J-0001s7-My
 for qemu-trivial@nongnu.org; Wed, 29 Jun 2022 03:29:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656487746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I92IFH8NA7TRgQHNE0b1uQixcLsKziwt6y1BFqfn2g8=;
 b=QNdsxAb24JGy7sNfIPBy49tZUC/8MoaFLXNbMbQtwYldHyBM/9cMAePojquIeM0nEER2Z/
 RpIdDl4xR/iiYr7PtVhBlvLBl2DHK4Y6u8TbQ0eUG9mSxQ4iemtvLzuKj+f66rMR/XfhYj
 zPKzkVRayaO2tLMDON2Y14UXUneYlp4=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516-RB6wJIL2OZW4HtDyJkEjAg-1; Wed, 29 Jun 2022 03:28:55 -0400
X-MC-Unique: RB6wJIL2OZW4HtDyJkEjAg-1
Received: by mail-lj1-f198.google.com with SMTP id
 c13-20020a05651c014d00b0025bb794a55eso1555260ljd.10
 for <qemu-trivial@nongnu.org>; Wed, 29 Jun 2022 00:28:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=I92IFH8NA7TRgQHNE0b1uQixcLsKziwt6y1BFqfn2g8=;
 b=rAQRWCxhb2Y4cV6fEJzboIVer4Q2mxlmz3KHQrOXSuZC98afRM3bUqDmNIDxQpYPmL
 9qgEg3B/vp7qPk0hdO8G9XloSsvf3FyPvjKr0Vz1G/9RG/m7lplTaNUSGfUwO1f+VPdc
 irtllx2E+5G+A1dyaTt/81nLrg2g/qXMzszgU01iu8u6DcxfAOEpw0Uqro6gD3LyH5+n
 2brcCC+LpmOze5UF8i+MpB5IKfhA0Kbf+Xi/C2S7pSS9qzvS72fFSuot7VkEOPqcgYZr
 hrxGSrg0UW1alkrZqoM/CIZF4XRwu3xzC/zGm91py7QIavCATLcR/q7nfodO9flxWmoW
 mp0Q==
X-Gm-Message-State: AJIora+WEgDV0ehLCaEUFdtkkrTzhLgU/KC1wsNE6KOgL7NLpoW3PQnc
 czUEmzwwWve1dj0OUmYvvx/l5nAKlpd1rLzoAE3aLjaTGRhtduMQzLYN8Ezt28uNLhMtvmVaEig
 sLhlMrbOs3wjeHn/Yew==
X-Received: by 2002:a05:6512:3a88:b0:481:4bb:3246 with SMTP id
 q8-20020a0565123a8800b0048104bb3246mr1198025lfu.292.1656487733508; 
 Wed, 29 Jun 2022 00:28:53 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vGcVV+Iq7rgyPYu0O7OqDHMtQyQMPehXU5LO45CrIH1oKhirT0QnXX56j3nP1817wHifbosw==
X-Received: by 2002:a05:6512:3a88:b0:481:4bb:3246 with SMTP id
 q8-20020a0565123a8800b0048104bb3246mr1198009lfu.292.1656487733235; 
 Wed, 29 Jun 2022 00:28:53 -0700 (PDT)
Received: from ?IPV6:2003:cb:c708:e600:d4fa:af4b:d7b6:20df?
 (p200300cbc708e600d4faaf4bd7b620df.dip0.t-ipconnect.de.
 [2003:cb:c708:e600:d4fa:af4b:d7b6:20df])
 by smtp.gmail.com with ESMTPSA id
 cf3-20020a056512280300b0047fa8ffe92csm2494544lfb.233.2022.06.29.00.28.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jun 2022 00:28:52 -0700 (PDT)
Message-ID: <b3fd052f-658f-2e39-816b-9e5b9e521ec7@redhat.com>
Date: Wed, 29 Jun 2022 09:28:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [RESEND PATCH] hw/dma: fix crash caused by race condition
To: Tong Zhang <t.zhang2@samsung.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Xu <peterx@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@gmail.com>
Cc: "ztong0001@gmail.com" <ztong0001@gmail.com>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 Francisco Londono <f.londono@samsung.com>
References: <CGME20220506163106uscas1p20aa8ba0a290a9b50be54df6ec4f9cee0@uscas1p2.samsung.com>
 <20220506163059.2517-1-t.zhang2@samsung.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220506163059.2517-1-t.zhang2@samsung.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Jun 2022 07:29:16 -0000

On 06.05.22 18:31, Tong Zhang wrote:
> assert(dbs->acb) is meant to check the return value of io_func per
> documented in commit 6bee44ea34 ("dma: the passed io_func does not
> return NULL"). However, there is a chance that after calling
> aio_context_release(dbs->ctx); the dma_blk_cb function is called before
> the assertion and dbs->acb is set to NULL again at line 121. Thus when
> we run assert at line 181 it will fail.
> 
>   softmmu/dma-helpers.c:181: dma_blk_cb: Assertion `dbs->acb' failed.
> 
> Reported-by: Francisco Londono <f.londono@samsung.com>
> Signed-off-by: Tong Zhang <t.zhang2@samsung.com>
> ---
>  softmmu/dma-helpers.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
> index 7820fec54c..cb81017928 100644
> --- a/softmmu/dma-helpers.c
> +++ b/softmmu/dma-helpers.c
> @@ -177,8 +177,8 @@ static void dma_blk_cb(void *opaque, int ret)
>      aio_context_acquire(dbs->ctx);
>      dbs->acb = dbs->io_func(dbs->offset, &dbs->iov,
>                              dma_blk_cb, dbs, dbs->io_func_opaque);
> -    aio_context_release(dbs->ctx);
>      assert(dbs->acb);
> +    aio_context_release(dbs->ctx);
>  }
>  
>  static void dma_aio_cancel(BlockAIOCB *acb)

Please don't resend patches if the previous submission came to the
conclusion that it's unclear how this should help.

https://lkml.kernel.org/r/CAJSP0QW396RY_g8LS1mncDZcOv5GamURy+xv+s8zMcdq03OOMA@mail.gmail.com


I *still* don't understand the interaction between the lock and the
assertion and so far nobody was able to clarify.

-- 
Thanks,

David / dhildenb


