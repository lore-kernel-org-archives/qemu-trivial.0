Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A1F4CD4F3C
	for <qemu-trivial@archiver.kernel.org>; Mon, 18 May 2026 13:51:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wOyMn-0000tP-VW; Mon, 18 May 2026 09:50:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1wOyMl-0000t9-3A
 for qemu-trivial@nongnu.org; Mon, 18 May 2026 09:50:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1wOyMi-000632-OJ
 for qemu-trivial@nongnu.org; Mon, 18 May 2026 09:50:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779112239;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=rWmWEhAQdjqAqGNl+PevpQ4eorPS6xtb2/KPc3H/uOw=;
 b=CdXRcTdFoHAsGoov4tlXlmCgpXJ1LyXHbTlEwLTE24AQ4NQ00dUgnDsbJxq6yo4IhVTWSS
 Fu/Sy0UAFm7tUBjQ4fwJYi5YD8hF+rsnm7IrteHe1WXm1F9jjhfC6OY9ct2RICHmcsZwar
 tigfBDcGG1TlKoASnZ637T/8cFY3jJs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-614-s43t5IZmO4OBl8-UKTG_DQ-1; Mon, 18 May 2026 09:49:29 -0400
X-MC-Unique: s43t5IZmO4OBl8-UKTG_DQ-1
X-Mimecast-MFC-AGG-ID: s43t5IZmO4OBl8-UKTG_DQ_1779112168
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-45e80183514so786004f8f.3
 for <qemu-trivial@nongnu.org>; Mon, 18 May 2026 06:49:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779112168; x=1779716968;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rWmWEhAQdjqAqGNl+PevpQ4eorPS6xtb2/KPc3H/uOw=;
 b=DqlIYxJnz+htxV2Hqu76ws3AXhHxIkwOQm8OxUwwsXGH4AWF4Z0piFUm3QKv0Wd1+S
 r0oKC92s/n/qZ82N+ivRpm9xjIyi+3pQnkudPKd0ghi1ctAxPHiv7P/NwNUhmb2Rqbhh
 PZfkNxFd86KO9gkk1Gv0ah73WD9KMGvLmS+IR+lv0v0TpcB6YV8NJktB07ThPwqp9SiI
 W+ZyiMQnNiIDk+wk/T9sQWBj3GsRqoOdFAZi1WJe8V9EtCc92mxBt6ePFj1Y4kValN2b
 wd09AbHrnWdqRxrxMcxgSVhKG7URMqBj/OHMvRjFyzRXtMEDccrf0FRsX6OXa7Oz8+GM
 Kp2Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ+6MS41e/XHt6OxGCdNMw3IYwBf70WJgCoYsge1ZGOy4EIQ/PAo/VP/a4lnEaUK68jF+FMVag/YoE2SBEA=@nongnu.org
X-Gm-Message-State: AOJu0YxaxbJdD4kF/WYdipSnafJjStIfIUHCXPV5C/MIfUIf4xdNdvcO
 7mTRyycyXYV8NbdJ1cR5kZkdvI5DrnHaHsQ2oNA6u/giMYiza9pCHDJ1bo4vWo7NGVau5MgT4BJ
 hUGNtrS1+fbc/HMAv4UF10L8zGCqzEcgpzSfKKo/btpUYi2MfTlPHSuehOJs=
X-Gm-Gg: Acq92OEoI3TOn9qkKNtVIINa/krII/UqnkYTM5etw2yoeK1Wv9SuPS0Y5vkZreAN8hA
 65PZuQnNC9PKvlCbCqIH81SqTn1JEwWwMtL7uf4Hb1cc/6AxUm4sfUKctKP6QI4keFMelUc139I
 0qVe1lucqlRTZIJ2Lud5tDFjsevmSRjuJ5L8H9AFDgXhH0TUtYTWDF4mCv+MboSyHEWMUoRiCsz
 IMlvOTtUD4Ofn1zL0meUAwmSi3iMNqUa++zchDgC53JKvAKD8mTjHtSS0dI5jXHxlDFnQK+M81V
 vPXgaQgPLqwlP/G1ucYSp1ssqZm+VUSbLHG2hDt5xaiiqOHYzVtCnUHqpI58LMEqTNerWf5aRBN
 QO7HbVQOTsjIPVXWS+Ui6VfOfWP+8gvRu/q/8CYy1v0rlo5v+20qBFZE=
X-Received: by 2002:a05:6000:2313:b0:448:7049:a6c9 with SMTP id
 ffacd0b85a97d-45e5c5b387bmr22665050f8f.5.1779112168147; 
 Mon, 18 May 2026 06:49:28 -0700 (PDT)
X-Received: by 2002:a05:6000:2313:b0:448:7049:a6c9 with SMTP id
 ffacd0b85a97d-45e5c5b387bmr22665000f8f.5.1779112167770; 
 Mon, 18 May 2026 06:49:27 -0700 (PDT)
Received: from [192.168.100.100] (82-64-211-94.subs.proxad.net. [82.64.211.94])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da0a19c2dsm38685201f8f.21.2026.05.18.06.49.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 May 2026 06:49:27 -0700 (PDT)
Message-ID: <49760042-7227-44ca-8471-dbea0b05307d@redhat.com>
Date: Mon, 18 May 2026 15:49:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] system/qtest: Fix length parameter in the b64write code
To: Thomas Huth <thuth@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org
References: <20260518134020.1420932-1-thuth@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
Autocrypt: addr=lvivier@redhat.com; keydata=
 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
In-Reply-To: <20260518134020.1420932-1-thuth@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: synm45M3nbnLRfZRIFaIk3p6GS4zIXu9MLkjjKJGN-w_1779112168
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org

On 5/18/26 15:40, Thomas Huth wrote:
> From: Thomas Huth <thuth@redhat.com>
> 
> The b64write code has a sanity check that the given lengths matches
> the real length of the given data, and calculates the minimum of the
> two values to be on the safe side. However, the address_space_write()
> then uses the original value and ignores the calculated minimum. Use
> out_len here to fix the problem.
> 
> Fixes: 70da30483e7 ("qtest: Use cpu address space instead of system memory")
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   system/qtest.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/system/qtest.c b/system/qtest.c
> index a79d10d1361..d6db057b0a2 100644
> --- a/system/qtest.c
> +++ b/system/qtest.c
> @@ -698,7 +698,7 @@ static void qtest_process_command(CharFrontend *chr, gchar **words)
>           }
>   
>           address_space_write(first_cpu->as, addr, MEMTXATTRS_UNSPECIFIED, data,
> -                            len);
> +                            out_len);
>   
>           qtest_send(chr, "OK\n");
>       } else if (strcmp(words[0], "endianness") == 0) {

Reviewed-by: Laurent Vivier <lvivier@redhat.com>


