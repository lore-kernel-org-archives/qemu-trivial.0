Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22381CD4F52
	for <qemu-trivial@archiver.kernel.org>; Mon, 18 May 2026 12:32:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wOx8J-0003mS-Vv; Mon, 18 May 2026 08:31:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wOx81-0003hT-Qu
 for qemu-trivial@nongnu.org; Mon, 18 May 2026 08:31:37 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wOx7y-0004Ap-WD
 for qemu-trivial@nongnu.org; Mon, 18 May 2026 08:31:25 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-48e6db3ff7eso10695175e9.0
 for <qemu-trivial@nongnu.org>; Mon, 18 May 2026 05:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779107479; x=1779712279; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rnmPHNPmta8CCozdFB65/vpV59t/dWrCTqBol6zfTRA=;
 b=am4QlRHNj4Kh9KUjIpeoTQsIyiGDHIBlFNes5y/WrJQQImfqdeDGdRkFyAYtMtNd1R
 iG2M3391M3a5cMTUM3Aah2qlWFMVwqhvXWRu1ukBU8YJojRAOYbNod5Cknn0d+Ongp/6
 n+8bqQUlsEJgIVtQL3Mc1NVli032tfAvae2x4s9np7P0gjrAVUgbzdnzZIsIri9gG1jR
 c36ODmPXfwwPcr3+8RTmjuJ8qohaJ0OJUljz+0jdIO2zHyFsMo6043ktJervYj4BmfF6
 XmH9d8+u6YTglgs+5BD1X/1ZALEaJOPy4dsejF2iBlbWjI1RDwkcokFXutMb3Xr0/NXJ
 7Xiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779107479; x=1779712279;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rnmPHNPmta8CCozdFB65/vpV59t/dWrCTqBol6zfTRA=;
 b=Ln/GjAUOBGrAGe2mV7UrLTHOYXtxZuF30ZocEmu5eaJdEYFA1Kgc5YxJ/1iF8ajHe1
 O+5zhdQP8ohlxi5Z0txAW9lthsnRdiewz7wtkwYIrJLFh8O/uikxXPQjca/bzbYiZ+LO
 SzuQopVgz8Z9b9ktxklCdcAMvznT7B1a/2jDthncdfJFjdt90JtuUa8w1D80qi4evZ77
 LKUivlTtLaWS2U3UR8PpIDsGCq10NYvpmnUTC4UqQGjnXv7S2JusRsoQ01yX7wFhD326
 tsvetWT5TWX9eOel1ToR5ISQLyItKA1QdSP/lgzDtvI2CgIisELkay12znOdeRhalxfS
 lWHA==
X-Gm-Message-State: AOJu0YxCXAQR83yO5E5Mjn1hLSA/5nC/3Qee/aNWvB0Dn3axWNd8C+U+
 G7eNRQuuGFdwGDsXnzgjkLuei4AOBUg/E42Re4bsPeuLNcxXeFwPvrmldCYJyAZ+sE0=
X-Gm-Gg: Acq92OFDE/cljOrv4sfHHqKGUosevlR7io8x9f3ZE8iTIaILWfGxGVhV2pkRAsQXwIR
 DFhpLz2U8WWsp06gb9RKJVUJXMIGiR212uYM5ywKn7TsbmQcr7KqltCaZ+A7+WXKZggIN7sVa7d
 8busmp4BqRdTREUfzsC93WoFjmqIyhMHnog0tc/hNHP1dJVtDNQ86oXU9xC43PT1D0ILDmQeVLp
 1W68LqtauOqnl0d6hFI4M5b7Aw7OowcI2NcSCyutV6ssibEnQZt0O6UfMKn1HofwHPcweDEVh30
 oUOcGiKfo8mHxc1wW1E/3alLU93sQnPOij3nOCdinCcp1UNwllMEqV6PqRLJKIGpZXU49b1xsYE
 Fqc9lss8+C5uiY8Xz34vlYq5UOG6zMPbq4H4Dljd2Jo/EEm65tlWIXlnZA/vUpNzpXKRrzVIaHA
 Gld6198Z/5zJUcSk/mqXGf4Zgv7bdjTrV0opanf0PqLIlQchENbjjMVU7q4tSu9ILXs+aWycLA6
 77LjJTRtQZpv/g=
X-Received: by 2002:a05:600c:1f8c:b0:489:1f08:91b with SMTP id
 5b1f17b1804b1-48fe6323821mr208173365e9.16.1779107478848; 
 Mon, 18 May 2026 05:31:18 -0700 (PDT)
Received: from [192.168.69.200] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48ff43f213esm102074095e9.1.2026.05.18.05.31.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 May 2026 05:31:18 -0700 (PDT)
Message-ID: <a216d6b7-7101-4352-bca1-eba4383255f7@linaro.org>
Date: Mon, 18 May 2026 14:31:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] system/vl: Free allocate memory for pid file name in
 case realpath() failed
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, f.ebner@proxmox.com
References: <20260518114514.684401-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260518114514.684401-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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

On 18/5/26 13:45, Thomas Huth wrote:
> From: Thomas Huth <thuth@redhat.com>
> 
> In case realpath() fails, the code returns early in the function
> qemu_maybe_daemonize(), without freeing the allocated memory. Add
> a g_free() here to fix it.
> And while we're at it, also free the memory in the qemu_unlink_pidfile()
> function - it's not that important since QEMU is going to terminate anyway,
> but some malloc sanitizers might still complain if we don't free it.
> 
> Fixes: dee2a4d4d2f ("vl: defuse PID file path resolve error")
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   v2: Free memory in qemu_unlink_pidfile(), too
> 
>   system/vl.c | 3 +++
>   1 file changed, 3 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

