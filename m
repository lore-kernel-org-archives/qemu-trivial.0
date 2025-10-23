Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D780FCCD1BC
	for <qemu-trivial@archiver.kernel.org>; Thu, 23 Oct 2025 14:46:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1vBwZw-0008Sa-Li; Thu, 23 Oct 2025 10:46:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBwZu-0008Rq-85
 for qemu-trivial@nongnu.org; Thu, 23 Oct 2025 10:46:11 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBwZs-0004Hm-5m
 for qemu-trivial@nongnu.org; Thu, 23 Oct 2025 10:46:10 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4710022571cso9721415e9.3
 for <qemu-trivial@nongnu.org>; Thu, 23 Oct 2025 07:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761230766; x=1761835566; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Qp3pcsU2dEu0k14ENpLaGUQV2wB7bT2BOba+91AwC9c=;
 b=u0rZLBmbU3CU/ZxdgQsFL3mp0kKCF6M2QxO1TjiAJYu6PP/soz4g23fpO5kjwODVfq
 5+LpTlwK+QIJE4ILUjrles9MTdpZ8t7IEpgIZ9AbJUaJbgJgm94BmFyx0RgN2PMEqUuJ
 RYTnC+cntnwRRRSczUOH8G26edRQQfrdAuU+OsFvaDf1a16pN6WvXI9U+Mz8I0UO6AVp
 f+Q6cTOfJcPqeqyS03svZ2wuka7HluCOA6lqXRxtURJaztn3Zy2gsyCQEgTRFs0svB5F
 4s7NaszvoG4S34ZSrQgUe9f0TV3Bet0T7zXZR2gYJES2PeC8uLmZfxUcDMIzbtInmmaA
 kXLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761230766; x=1761835566;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Qp3pcsU2dEu0k14ENpLaGUQV2wB7bT2BOba+91AwC9c=;
 b=GuDhXNRZMtaPlWGEkGa8ZQiq4uWdQ0VCYGsOdEEIowIo7y5A4emrhlEjtg2L9/pgef
 ulnUk3xzmqez/rrIrhpmh7pVq10sCnIWC4mfUEptmEwLpsqerPGlNYFD2MV2CcSVQSvg
 DJWlH+Vzorum+R0QlQU/i3yVzzqSaJc0WJ/Z1Db3zOO4xB1Ij2/+4GjOVi+K3O6Rs/Rz
 XXdTaoo/1MD+QSJZAgrMTwuEtYhC8Ohmbx0TWjA4Yb+FzqAHC0m3IM16KGOcay2tGrcu
 NDTShlMtXxNBKx3mSsE0+ppvmpLE+CGzoDHbJ9vptWVOc4H48IJW75CEg8zpEciArubv
 jTEw==
X-Gm-Message-State: AOJu0YwuwrO+xBE3zvnfLufBbHbDyqfMvrFQQFcaZjh9CrhbNuI+gl9C
 KgHHA2mul35eDexEl9Aj34Rt0lY0q+d5xFsizT/EwLN7BWdJFE9WiQQd6S9Uss3cynI=
X-Gm-Gg: ASbGncsCbmQmKiNJaY/0mGKAmfexr4UMSSIx5Lb3uHRYemQcXpPB4d2UTnHn00p1Zak
 /JLGgJXyMEGey//8YWi20c7zw6jlD/WSqux1diqpjlGhrQ8xpTrOvdRSmbbbqxjZdagwR+Dq1b/
 NK0wRuxgjvO/JF5Yd7o3lvKJC1HZqhDPIbxCCzDmhhUXbrLhqVgWPGbU/EGmE/9gmT+wqraHO0T
 EsJzvQF98WvpEqmKxtKozxGKpJW0VFf5hkAZWGoRnDjWDEDEV7nQ8mcE88dKl89wKlNa7XneHI9
 AtY7jcYjonhYhS8O+1uAbATBiS153mh8EyVatNTsVJa4Ne9zs5bWhklX6UMKT3oWzx2koyh1cGW
 ki46JuKefZuh6uMI82TGCIkjWBlkPL/X4XocOItKuNE0cTwqJ76RsrwNGAHEK65nwKp5C4YgPkm
 UEY4Q4n/+ip1DzktmdK79eyiylZGJrCiRQI/X1CHOqhEk=
X-Google-Smtp-Source: AGHT+IE486+GHoPqxGwVa66A7ZfMKoN5pHCSigRczAqY9dZXX4byWlO7S7mT/jRdyUyjNFyYCvkC2w==
X-Received: by 2002:a05:600c:450c:b0:46e:38cc:d3e2 with SMTP id
 5b1f17b1804b1-47117906a23mr191876125e9.22.1761230765892; 
 Thu, 23 Oct 2025 07:46:05 -0700 (PDT)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-474949f0312sm62697415e9.0.2025.10.23.07.46.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Oct 2025 07:46:05 -0700 (PDT)
Message-ID: <b619588b-6b6f-43e5-893c-93e04b963ed3@linaro.org>
Date: Thu, 23 Oct 2025 16:46:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] migration/vmstate: remove
 VMSTATE_BUFFER_POINTER_UNSAFE macro
Content-Language: en-US
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Peter Xu <peterx@redhat.com>,
 Fabiano Rosas <farosas@suse.de>
References: <20251023135316.31128-1-mjt@tls.msk.ru>
 <20251023135316.31128-3-mjt@tls.msk.ru>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251023135316.31128-3-mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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

On 23/10/25 15:53, Michael Tokarev wrote:
> The only user of this macro was VirtIONet.vlans, which has been
> converted to regular VMSTATE_BUFFER.
> 
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>   include/migration/vmstate.h | 9 ---------
>   1 file changed, 9 deletions(-)

Yay!

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


