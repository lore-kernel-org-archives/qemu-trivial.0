Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o6UNm-0005I7-5B
	for mharc-qemu-trivial@gnu.org; Wed, 29 Jun 2022 05:53:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1o6UNk-0005H8-QN
 for qemu-trivial@nongnu.org; Wed, 29 Jun 2022 05:53:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36191)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1o6UNZ-0000EZ-B0
 for qemu-trivial@nongnu.org; Wed, 29 Jun 2022 05:53:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656496380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uffUdDtxjLcnCaRKeKE6Qmjoo1QA8B9fVXjZ/rsbcec=;
 b=aIjEzy51qbnnIxK+q+W+O9nIujYIdPhctWbj1Z6fbOjA4EqAKXHncIN4afyidetBtxbEe3
 KEdLBPQkqygllnqiaRp+KotWCKqrsluH44hC7Jpo77jCbbXvfP9uTnSfRkmcYiarjkyb0I
 dhL8qD9o0ftCvhpuOlEyh5sYIn1V1ws=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-611-UFbRjJcWNfiLAZqgvHHR2g-1; Wed, 29 Jun 2022 05:52:59 -0400
X-MC-Unique: UFbRjJcWNfiLAZqgvHHR2g-1
Received: by mail-wm1-f70.google.com with SMTP id
 h125-20020a1c2183000000b003a03a8475c6so5889159wmh.8
 for <qemu-trivial@nongnu.org>; Wed, 29 Jun 2022 02:52:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=uffUdDtxjLcnCaRKeKE6Qmjoo1QA8B9fVXjZ/rsbcec=;
 b=ByPbeI0fGaJIkg8UEzj37OtMvW/qOub+f2/NQZzyrNgL7dKQsCXjiNAr9Elny9q98t
 gxwru2LmN1ngoTD1Foaw38a1VPTaBUEMwpPEiJhDuOH4QBkTqOl8sxxm9X/lxm98fMt9
 mUxUb/OuAPHgZrw3vhwnGwW5eLxqO03G6YQ9Io6RPMrjDxKUUu7f+LgZbKLr0MbxRKRh
 jd8b4/4bfExCSAfEnkjd9cERxSHA7X7ZMKhMdXNwzqguSq4a7X6+qqYIJ6m/DkD2Wovn
 kG6U3iC+RVRwwxtH/EOzUgjjSbyolQzAqyFEQCop7m7V8tyNTvAf/VYYI/G6HsYqIlsq
 srng==
X-Gm-Message-State: AJIora/S7nuu57TXRFISRk0lrHuC+eIg8gLUZtub735g5rYIxjimQCcP
 tmahIBfEuCBT2lPcR/+ZkjFM4RL6Hnhdsd4DWQPLS5fgaVAhbUF1Lm3v+WwvF3vjB7fN062hmJB
 B5kOjR9tsrYxX7fFi4g==
X-Received: by 2002:a5d:4892:0:b0:20c:d4eb:1886 with SMTP id
 g18-20020a5d4892000000b0020cd4eb1886mr2281599wrq.96.1656496377847; 
 Wed, 29 Jun 2022 02:52:57 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v09QE82AjggsBPO0J8mzQyfWHuLyd+lxv8mgNnKCeVwNSzbUc5L9pqYIIACiF1JH4NQ6U/Xg==
X-Received: by 2002:a5d:4892:0:b0:20c:d4eb:1886 with SMTP id
 g18-20020a5d4892000000b0020cd4eb1886mr2281563wrq.96.1656496377486; 
 Wed, 29 Jun 2022 02:52:57 -0700 (PDT)
Received: from ?IPV6:2003:cb:c708:e600:d4fa:af4b:d7b6:20df?
 (p200300cbc708e600d4faaf4bd7b620df.dip0.t-ipconnect.de.
 [2003:cb:c708:e600:d4fa:af4b:d7b6:20df])
 by smtp.gmail.com with ESMTPSA id
 d2-20020a05600c34c200b0039c4e2ff7cfsm2540532wmq.43.2022.06.29.02.52.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jun 2022 02:52:56 -0700 (PDT)
Message-ID: <6725eac6-0ea1-b9e9-8fac-acf8a3c7a21b@redhat.com>
Date: Wed, 29 Jun 2022 11:52:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [RESEND PATCH] hw/dma: fix crash caused by race condition
To: Tong Zhang <ztong0001@gmail.com>
Cc: Francisco Londono <f.londono@samsung.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Stefan Hajnoczi <stefanha@gmail.com>, Tong Zhang <t.zhang2@samsung.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
References: <CGME20220506163106uscas1p20aa8ba0a290a9b50be54df6ec4f9cee0@uscas1p2.samsung.com>
 <20220506163059.2517-1-t.zhang2@samsung.com>
 <b3fd052f-658f-2e39-816b-9e5b9e521ec7@redhat.com>
 <CAA5qM4C15k3k6TSngp0tbTN50kCFLfmBvrwf_pbHheVmoXpO4g@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <CAA5qM4C15k3k6TSngp0tbTN50kCFLfmBvrwf_pbHheVmoXpO4g@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 29 Jun 2022 09:53:13 -0000

On 29.06.22 10:31, Tong Zhang wrote:
> 
> 
> On Wed, Jun 29, 2022 at 12:29 AM David Hildenbrand <david@redhat.com
> <mailto:david@redhat.com>> wrote:
> 
>     On 06.05.22 18:31, Tong Zhang wrote:
>     > assert(dbs->acb) is meant to check the return value of io_func per
>     > documented in commit 6bee44ea34 ("dma: the passed io_func does not
>     > return NULL"). However, there is a chance that after calling
>     > aio_context_release(dbs->ctx); the dma_blk_cb function is called
>     before
>     > the assertion and dbs->acb is set to NULL again at line 121. Thus when
>     > we run assert at line 181 it will fail.
>     >
>     >   softmmu/dma-helpers.c:181: dma_blk_cb: Assertion `dbs->acb' failed.
>     >
>     > Reported-by: Francisco Londono <f.londono@samsung.com
>     <mailto:f.londono@samsung.com>>
>     > Signed-off-by: Tong Zhang <t.zhang2@samsung.com
>     <mailto:t.zhang2@samsung.com>>
>     > ---
>     >  softmmu/dma-helpers.c | 2 +-
>     >  1 file changed, 1 insertion(+), 1 deletion(-)
>     >
>     > diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
>     > index 7820fec54c..cb81017928 100644
>     > --- a/softmmu/dma-helpers.c
>     > +++ b/softmmu/dma-helpers.c
>     > @@ -177,8 +177,8 @@ static void dma_blk_cb(void *opaque, int ret)
>     >      aio_context_acquire(dbs->ctx);
>     >      dbs->acb = dbs->io_func(dbs->offset, &dbs->iov,
>     >                              dma_blk_cb, dbs, dbs->io_func_opaque);
>     > -    aio_context_release(dbs->ctx);
>     >      assert(dbs->acb);
>     > +    aio_context_release(dbs->ctx);
>     >  }
>     > 
>     >  static void dma_aio_cancel(BlockAIOCB *acb)
> 
>     Please don't resend patches if the previous submission came to the
>     conclusion that it's unclear how this should help.
> 
>     https://lkml.kernel.org/r/CAJSP0QW396RY_g8LS1mncDZcOv5GamURy+xv+s8zMcdq03OOMA@mail.gmail.com
>     <https://lkml.kernel.org/r/CAJSP0QW396RY_g8LS1mncDZcOv5GamURy+xv+s8zMcdq03OOMA@mail.gmail.com>
> 
> 
>     I *still* don't understand the interaction between the lock and the
>     assertion and so far nobody was able to clarify.
> 
>     -- 
>     Thanks,
> 
>     David / dhildenb
> 
> hello
> 
> This message is sent way before the discussion 

Oh, I'm sorry. I was mislead by the reply from Laurent :)

BTW, do we now have an understanding why that patch helps and if it
applies to upstream?

-- 
Thanks,

David / dhildenb


