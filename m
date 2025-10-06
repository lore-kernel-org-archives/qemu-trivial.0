Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1EC2CCA470
	for <qemu-trivial@archiver.kernel.org>; Mon,  6 Oct 2025 04:13:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1v5cbW-000395-SU; Mon, 06 Oct 2025 00:13:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v5cbP-00035a-3A
 for qemu-trivial@nongnu.org; Mon, 06 Oct 2025 00:13:38 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v5cbN-0004yP-2n
 for qemu-trivial@nongnu.org; Mon, 06 Oct 2025 00:13:34 -0400
Received: by mail-wm1-x342.google.com with SMTP id
 5b1f17b1804b1-46b303f7469so27441685e9.1
 for <qemu-trivial@nongnu.org>; Sun, 05 Oct 2025 21:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759724010; x=1760328810; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mSCSzwRwaRfpqUx3t2B4UZXbIF9qMkIFjMUd8+SdCbg=;
 b=VHymPSr4/Jp+Wft1F7lQT/hPx2ph/K+tEgMkXuNR/00bbLz+2acruVUzsEH5wa+cWd
 dGs/kL4mN12WbCqRcYl68kQ/lgTjjGFyVaS9QnRIB/8EZ/hJt7q8uIyP2HiABTbVMwBI
 /4D21Xt+CJGvLhmtk3MdX8xG4yW0GgYdeWdd/2ALsa/r85Qok9RlH2qfMDTqTdhzv1qU
 U1N1ONKwDGOOmDW6kgiF9laGqch6YGbKeSaKf5Mgr5AJ7UGPXyIjqNASfEXB5ktqGG6g
 0TNzbFaty2EmXYZvCK8oWPOxF3tIe4sqebzUR6qU4PQVvscEN/Ya0tXihbLA/DbueYf4
 yBAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759724010; x=1760328810;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mSCSzwRwaRfpqUx3t2B4UZXbIF9qMkIFjMUd8+SdCbg=;
 b=aE89CerGRMSgMlN4GR7YO3RES50lB0gYi77bj6lWZeF0qYa1PqRoSYhHTRqZI+Q9cU
 vCQVsW+yBLnbT1o10AuoFYtBUKxLh4V4DS60I1DRM6IbtfKvHWpOvZncXDXyV3cy9JLc
 7fDSVqrEy6VsrMRkt5E6VYJx4v27RXcupwQ/4WkL2UYHgPL/Zvlrh6mRybkkqc7ANOSr
 oy/7zukCJjzN1z5KcuJ8iQ9JeWtP9UywP5d5uouwyuUy4ilQOKhb+WfbClPLjaIp1X6j
 eV+su8rCwps+K57dj9BPK6xOfITiRTrLl4/1qXzSvM3sA7vuu/9SO2DKURPYdFGa5CsG
 9YWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyI8eAKtG1vvbxYL5F4t1yZZZoHWy9qCU8/PM9+gn98r8RlMaMV2GQIaG02Fm5yqd1K/udETP/uINTxF0=@nongnu.org
X-Gm-Message-State: AOJu0YxiTv4zc3nCE9yStZ98JTceNPpIUlsC6NbiuKM0OWc7QQjYm2m2
 N99hZtCdCE9NWX5tTzQrKqQVUEWIYXZN7LRQ+toirC3I1CnpfnDH/cavwRREwryV/nI=
X-Gm-Gg: ASbGncuSf10tsWKpmCrTBTYyGgcHJoboHijfuxYXuF6n5r6zbQ5wpdco9qSQtEmTmJW
 fvw1Ert/JQBY4NbF7AdIWXp/nCBGVf9l6E1CDueYh2f9iLjP5rqp3qUWJd/SI2Dp5n2G9oc8m75
 EuFmgeF69AxJ0ywkydSEgQT0sryWNpnqGHmJ+dzvuG7bcOycL1p7+1IUiXsmyu+H/0+2vSRPcfy
 rriCNuVqFQafEnXsjFvRFfXrK4D1wVNOCG5fIUaDn2g7emvhJ+5mB/gnSZ8GNp6tbJZ3oHNUmc6
 wyGSe29covyIRmN9ktj0fHOdwyPpNa4glSWrhByaiWi+GJQII3hFHpFGfabzYEzxz4LwA9yHEaI
 CmG5hAqmRTSTIoLjnj0kv8542nl2NROkQunOjc6mtALookGpbxWLqvwdYpDbJDdTR4cCLl1Nl3B
 g0MfYNhIh289y0KvbTiKlQGT+rqi+e
X-Google-Smtp-Source: AGHT+IEedF/kN3qVWtu0wiW8Asf9H290x0FWKY+sdPDKKuqPCLBFrFJW7kfdbyBRE8tsSjUl2If3fw==
X-Received: by 2002:a05:600c:8b42:b0:46d:3a07:73cd with SMTP id
 5b1f17b1804b1-46e7113f6f4mr68683655e9.23.1759724009666; 
 Sun, 05 Oct 2025 21:13:29 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e72375b31sm147110775e9.20.2025.10.05.21.13.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Oct 2025 21:13:29 -0700 (PDT)
Message-ID: <86053cd3-fd3e-4b34-8bce-9a93ab3f72a6@linaro.org>
Date: Mon, 6 Oct 2025 06:13:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] scripts/checkpatch: Avoid recommending legacy
 qemu_bh_new_guarded()
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
Cc: Alexander Bulekov <alxndr@bu.edu>, Thomas Huth <thuth@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, qemu-trivial@nongnu.org
References: <20250924163911.51479-1-philmd@linaro.org>
 <2891f8d5-e4ea-433f-84ba-a878875bb4d6@linaro.org>
In-Reply-To: <2891f8d5-e4ea-433f-84ba-a878875bb4d6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x342.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

ping?

On 24/9/25 18:40, Philippe Mathieu-Daudé wrote:
> (forgot to Cc qemu-block@nongnu.org)
> 
> On 24/9/25 18:39, Philippe Mathieu-Daudé wrote:
>> qemu_bh_new_guarded() is considered legacy since commit 9c86c97f12c
>> ("async: Add an optional reentrancy guard to the BH API"); recommend
>> the new API: aio_bh_new_guarded().
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   scripts/checkpatch.pl | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
>> index 91616c974f2..6a0c06bebb9 100755
>> --- a/scripts/checkpatch.pl
>> +++ b/scripts/checkpatch.pl
>> @@ -3197,9 +3197,9 @@ sub process {
>>           if ($line =~ /\bsignal\s*\(/ && !($line =~ /SIG_(?:IGN| 
>> DFL)/)) {
>>               ERROR("use sigaction to establish signal handlers; 
>> signal is not portable\n" . $herecurr);
>>           }
>> -# recommend qemu_bh_new_guarded instead of qemu_bh_new
>> -        if ($realfile =~ /.*\/hw\/.*/ && $line =~ / 
>> \bqemu_bh_new\s*\(/) {
>> -            ERROR("use qemu_bh_new_guarded() instead of qemu_bh_new() 
>> to avoid reentrancy problems\n" . $herecurr);
>> +# recommend aio_bh_new_guarded instead of legacy qemu_bh_new / 
>> qemu_bh_new_guarded
>> +        if ($realfile =~ /.*\/hw\/.*/ && $line =~ / 
>> \bqemu_bh_new(_guarded)?\s*\(/) {
>> +            ERROR("use aio_bh_new_guarded() instead of qemu_bh_new*() 
>> to avoid reentrancy problems\n" . $herecurr);
>>           }
>>   # recommend aio_bh_new_guarded instead of aio_bh_new
>>           if ($realfile =~ /.*\/hw\/.*/ && $line =~ / 
>> \baio_bh_new\s*\(/) {
> 


