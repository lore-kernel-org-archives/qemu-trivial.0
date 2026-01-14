Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 824E3D31A2A
	for <qemu-trivial@archiver.kernel.org>; Wed, 14 Jan 2026 08:47:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1vfwQ5-0003V3-4j; Wed, 14 Jan 2026 03:40:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1vfwQ3-0003Ue-S0
 for qemu-trivial@nongnu.org; Wed, 14 Jan 2026 03:39:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1vfwQ2-0001Tq-Jm
 for qemu-trivial@nongnu.org; Wed, 14 Jan 2026 03:39:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1768379997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=8kbfMex7/QOi3NosnbNEngwjDksl4ME1KUGOLTf9fZQ=;
 b=SXaJCTVjMbhpTAQPNBZh3CjUs/O8Eh7aeu66QYmGvGIf3WfEPYJ55QZmysWtxHJ3brzJTf
 JdIdUtXwgAwTQZYQ/M/+s13u+FRDFv9DUXdtihTwlVif02HSvaJsgN+8u/QzeYhgCpDLTP
 pF7cGpjUQ51vq75KHWeQNH0dNfiPqB8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-237-lBdMbTXlNym3cVF903tHLw-1; Wed, 14 Jan 2026 03:39:56 -0500
X-MC-Unique: lBdMbTXlNym3cVF903tHLw-1
X-Mimecast-MFC-AGG-ID: lBdMbTXlNym3cVF903tHLw_1768379995
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-430fd96b440so4250551f8f.1
 for <qemu-trivial@nongnu.org>; Wed, 14 Jan 2026 00:39:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768379995; x=1768984795;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8kbfMex7/QOi3NosnbNEngwjDksl4ME1KUGOLTf9fZQ=;
 b=ltXPfRAKnPEO7Bfspy0iaodKIM5voxcovnihrY5usbXMWBHXa+dqX5yguVwVkRVSJX
 W+OD/VmdyGfdOFiogmbDCxq6Ha9FlfmEUKUe+W2KyplL78XRkWOoIqLq3WhqwtdO7AoO
 pj8X4CouKfhhokgaSMiyyaaD78hpBI4k3q2jWlBXeRN448bG7ILbWaN1TmUlq1GalBbl
 KOyDwf4R2UFePWWtQCjOBogSjgd5ySQJs25ewPWmJLJdvA0Lussp5ztuiKk/Y8MOakA5
 1dcUsgixQHqdb8X2EdJOPQ0+CC59hdKe94mLWfMGWDAgRFy/Vvs/mVkS0fxCMBGFCwoo
 ErQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVPsrDUrfBwTYI7hywns14uMbYKnn74XtRVGZAY7DdYXcOehiEBTVV2GErdz82/d+gE4AKbR+7AxxQ86w=@nongnu.org
X-Gm-Message-State: AOJu0YydasEWer/xoEcN+JfOKq2NT6c4e0BcjFxHFBThfqDGL7GmjuR3
 aZf2a7JCuzaGpeAWUpFCyz+Eu/5OmJxbEUeaQ+wqI5L9mi+1GwB6iRy2XuxItgzxHh+nFmPct/8
 4ceHHLVR63VzXnGmJvg9zVLHj8c4zYCfiPwI6GFxLnN1K+QIqlBhXaXu3rNE=
X-Gm-Gg: AY/fxX7W7MUxnwqZ2n4bsq7/N0mbhc5p4JWcm6S3x8UyFTMH+My1BZpxBiBsRl6bcrM
 ato017zb1YsHUhsNQQ/0c7CojYDyv0/NHBlcVmSooUj/YvR3lLDC8UDKaOEQx4lMJuZi0RzyKd/
 mQ7o+AACUdP6Fv9ZBMHarl+9nyuw3DlCrdnqWX83JkzFlakoa2UhoJ41an1/yQ2VIdegb/LZheD
 Z1pL7Rufvw9BUwmhqPKJ4yHS0WprGT07oiJPssJeo7bYOvTbJkTjnewrG9wTvSwy/CBPh4YMoOV
 sRXHyeke9l+XNS8uU3Jfv3QRxwF/Ixol8vLyAuaCgWLH1aEOOOSPo50x31abaPZNi+p66Xz4Yuz
 3gXBFmBs=
X-Received: by 2002:a05:600c:4713:b0:47a:814c:eea1 with SMTP id
 5b1f17b1804b1-47ee33af4camr20358985e9.35.1768379994888; 
 Wed, 14 Jan 2026 00:39:54 -0800 (PST)
X-Received: by 2002:a05:600c:4713:b0:47a:814c:eea1 with SMTP id
 5b1f17b1804b1-47ee33af4camr20358695e9.35.1768379994478; 
 Wed, 14 Jan 2026 00:39:54 -0800 (PST)
Received: from [192.168.0.9] ([47.64.113.220])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd0dadcfsm47780985f8f.3.2026.01.14.00.39.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jan 2026 00:39:53 -0800 (PST)
Message-ID: <7a195ae1-69a5-482b-92be-c9ea7a56f5bb@redhat.com>
Date: Wed, 14 Jan 2026 09:39:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/nvmm: Fix 'cpu' typo in nvmm_init_vcpu()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Reinoud Zandijk <reinoud@netbsd.org>, qemu-stable@nongnu.org,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20260113203924.81560-1-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20260113203924.81560-1-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3SGw2sjKG44wJChyhORU921Pth6l4fqsWKYJRTH5TOU_1768379995
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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

On 13/01/2026 21.39, Philippe Mathieu-Daudé wrote:
> Fix typo to avoid the following build failure:
> 
>    target/i386/nvmm/nvmm-all.c: In function 'nvmm_init_vcpu':
>    target/i386/nvmm/nvmm-all.c:988:9: error: 'AccelCPUState' has no member named 'vcpu_dirty'
>      988 |     qcpu->vcpu_dirty = true;
>          |         ^~
> 
> Cc: qemu-stable@nongnu.org
> Reported-by: Thomas Huth <thuth@redhat.com>
> Fixes: 2098164a6be ("accel/nvmm: Replace @dirty field by generic CPUState::vcpu_dirty field")
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> Untested.
> ---
>   target/i386/nvmm/nvmm-all.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/i386/nvmm/nvmm-all.c b/target/i386/nvmm/nvmm-all.c
> index b9bd9ed985a..f808828d492 100644
> --- a/target/i386/nvmm/nvmm-all.c
> +++ b/target/i386/nvmm/nvmm-all.c
> @@ -985,7 +985,7 @@ nvmm_init_vcpu(CPUState *cpu)
>           }
>       }
>   
> -    qcpu->vcpu_dirty = true;
> +    cpu->vcpu_dirty = true;
>       cpu->accel = qcpu;
>   
>       return 0;

Thanks, this fixes the issue:

Tested-by: Thomas Huth <thuth@redhat.com>


