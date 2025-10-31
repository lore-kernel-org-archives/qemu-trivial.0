Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69987CCFA02
	for <qemu-trivial@archiver.kernel.org>; Fri, 31 Oct 2025 20:49:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1vEw3o-0002eV-9C; Fri, 31 Oct 2025 16:49:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vEw3l-0002cJ-Te
 for qemu-trivial@nongnu.org; Fri, 31 Oct 2025 16:49:21 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vEw3d-0005k6-SQ
 for qemu-trivial@nongnu.org; Fri, 31 Oct 2025 16:49:20 -0400
Received: by mail-wm1-x342.google.com with SMTP id
 5b1f17b1804b1-46e6a689bd0so25563865e9.1
 for <qemu-trivial@nongnu.org>; Fri, 31 Oct 2025 13:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761943747; x=1762548547; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=K4vzKiOpSEPLbPdX9g4kxHhPangU7MLtZcrVapfDmrw=;
 b=aDEWhpnzgefKUpnfWAWPY9eOVAk2Bpm9xxmD2ES9j8VhCMY6IP/EcYGGuYiNG1bAVD
 q+B7vNKNNokZycOvk5VvsWsQzRcFclGIPCqLBrqoPvjbk/LUTRDvUdDsNnc/NMKiEtKk
 NazsY0uzR9NW20UI177Bf1dBRtaSVgkW9WicmgII3f0C/abY8Ateduzbj7ZBbElu2+eU
 C9sQGrWr2SHatC6KGym88W1xWprnKleRHICAbP4hoBCI6KQpE/q/Dj5xuU/Dku6jfnZK
 CHQNrLgHPXXBwYNPdO01f8ozJibPy0k0OkH9kpraFG3HzJushu8sxXdqbVo2Wq+QrZig
 lJxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761943747; x=1762548547;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K4vzKiOpSEPLbPdX9g4kxHhPangU7MLtZcrVapfDmrw=;
 b=gjOp8OZ5C7HLmlSE7d/R6SWKoDDaN8HK+9UdHdnqqhlhuYqfRBaapQz41ZZwKXc6SN
 6OlhX4TzQQZN4NAENp4+fXovTRoUwZdwc516sQXq6gU1He8V4R+MQJv60oW+Yja4D/WQ
 luv38ZWm90yE7aq+mKXQfK2td0Bhn3CvcffN7JZYHM1zhyhP0DJtj6I+8ATw4FS6J0G3
 eOJlolQhC4rbNRIg+1kPan3tJPKHDSvw7KU7gMcWdgbn3RUHWagqu0wORp6DTAaVsGnd
 G7CX1ViNPTU6BpzykgTTg9XdITZ1J+Zz99gM5msvbg40zgtIpA77sIFvAmVpXrdTSXlV
 LMvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5zpZ2C3cLU9EOw5YmcwmKFZfg3YL+fBNOdqbjsUvcBt4rMTdHMt46Kxc2g/kHl5gP5KBiSr50W5N8eLM=@nongnu.org
X-Gm-Message-State: AOJu0YweyNfdQxjKhnC7hELEA8W33yEf752kxq263nlWrvwe/0Xpybx5
 5m8sQczGers9Qd57fdiaFM07K9SkeeljSySJRFldp50aS2JxQ/7+QyEaCTAyYctbq85w3dbGaHW
 1JBf1mhzazMnD
X-Gm-Gg: ASbGncumO4pUganLdCuvbjOzHBS/Q2qYfeE/L9GKlslhVIN7G1MGUv65NNI04+asHFE
 kAZbQ5Nq4+RM6e/LXt1FKPpswLBsqeesY/wXU6/adJZeW+UrzlPplllGGFqyz35h1sWIvOpIreX
 7Bkj4mouy0jg4thcBu/bS5scwDkcrBzYMttRAHo/LS78Z8NuLjsLS3Nr9x7F9rKZB5/R496DoUi
 UCEP/CGiqn3GEfgeis0dINqbzmEPax2C6V7mm6DjmPr266j9BFUieziwFh0x28ZNjF+mfKSDw5F
 x7j020h4/JOUHTn3BeRkdIkkwL37TJ7TnjJ3TOkSQb3YTXTf4skqjGpouMwRN8L3JwdoSO+hlpS
 oe7o3VoFmJ+BdXwEXLiTLAZyLtBA9bwUcnKzW0dguO65raHEW5L0UAzdOeerYjwa5nwPhRKv/Cz
 i8iaquHeJhomiGrYzwXtdO5cTD1ZkSh5hRHHFO+a4KWa2zwOD9c4bjlTMAPvNurj/6kA==
X-Google-Smtp-Source: AGHT+IGTm8J5MorjQnazo5DI+siLkW2PZYdFtm3Won7iNXGDYOMfmY2fBN8B3VXnbXdWMWJvW7g+fg==
X-Received: by 2002:a05:600d:6352:b0:45f:28d2:bd38 with SMTP id
 5b1f17b1804b1-4773163825dmr22363895e9.18.1761943746917; 
 Fri, 31 Oct 2025 13:49:06 -0700 (PDT)
Received: from [192.168.1.17] (adijon-656-1-155-31.w90-33.abo.wanadoo.fr.
 [90.33.190.31]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4773c394e6csm14053995e9.15.2025.10.31.13.49.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Oct 2025 13:49:06 -0700 (PDT)
Message-ID: <80c53cdb-45eb-48c5-978f-bcc30fe832bf@linaro.org>
Date: Fri, 31 Oct 2025 21:49:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/xen: Avoid non-inclusive language in params.h
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Paul Durrant <paul@xen.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-trivial@nongnu.org
References: <20251013111152.25807-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251013111152.25807-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x342.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 13/10/25 13:11, Thomas Huth wrote:
> From: Thomas Huth <thuth@redhat.com>
> 
> Copy the latest version of Xen's params.h to the QEMU repository:
> 
> https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=0291089f6ea81690f37035a124d54c51fa7ba097#patch8
> 
> With this patch, we get rid of a non-inclusive word in the comment
> there.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   include/hw/xen/interface/hvm/params.h | 9 ++-------
>   1 file changed, 2 insertions(+), 7 deletions(-)

Merged as commit aba49488cb4.

