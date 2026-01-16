Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B162FD47CD0
	for <qemu-trivial@archiver.kernel.org>; Fri, 16 Jan 2026 10:36:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1vggy9-0005oK-7Y; Fri, 16 Jan 2026 05:22:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vggxR-0005jK-9e
 for qemu-trivial@nongnu.org; Fri, 16 Jan 2026 05:21:39 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vggxO-0004qL-UP
 for qemu-trivial@nongnu.org; Fri, 16 Jan 2026 05:21:32 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-47ee76e8656so22135845e9.0
 for <qemu-trivial@nongnu.org>; Fri, 16 Jan 2026 02:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768558889; x=1769163689; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GRCzJ1T/ii3BQ4yYHUykbzhUcAB2CL1japuElVPuk5U=;
 b=fa35RRk0bYIt0oOn2jA7U1JbntIYV53FxOpq0FY/EwBGwVkF5DS/YokKfYwNektDc/
 /EQrxaADHQZj/KJWzZeqpbSXUrKtxjKxD9IakOxvqDlcvkvcsAoyocgYZ/kfaf/2ykqT
 /O+cwxqedBfol/Ov8ACe2vdDFErjC6Qts3qbLAAFukqZ9tYWl4e4fULks5PkUBT78fb7
 d9e4Ewg7UbXi2Mr/Z9Bdth5FWa/qPF3U9ZDb2QjbOuwjg+3RW6bYOYYThVT1EC9hqK6n
 +X3rX68nifxg7dRGdkueOwUVWMPo5y+qVlKy0fEwWm+ca1svK/Vw9gjvHAfRynZRUgFx
 vmCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768558889; x=1769163689;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GRCzJ1T/ii3BQ4yYHUykbzhUcAB2CL1japuElVPuk5U=;
 b=wuiUU0xNqq5ov59Ke312I1RlnbTXXStb/hDsObhfqpMWA24G76tYdi9Qv4J61+tnJ5
 ujakSiPTLu+YtvLK2OhB/p9ZPU8rRqE5uM/5c10fqpDJ1q7soDxUnGVD2deL2tqIgOoC
 sNfB1IYmkUAevb6MsDLVIZ7Z7oSlV/z0kz49mEc8auZUBpO4UL5rgoeWW82+du9hOsAD
 F38KvtvF6OoAf8nO0+H5vuE/5S8KpELCmUGPzcBr2nUDknG1oSI+f2dlU7Hi347ZnyH3
 GB73IepYA/Z0iyFsLI3TBdEq3oRlwlxr4haAI7MztKVX2VNpJVhE1j6svwC8sjytiDHU
 RncQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsQvHOCC6RrHhYsFybiVMNrIRGJ7/FKUuJw2Er8Q/UDLPbMTVibdAEGviqMoQgCBCqFXkxmDkeGfZynGA=@nongnu.org
X-Gm-Message-State: AOJu0YyS4eOQWWWs4mxdBtwY3HJNXB8ym4HUzGI6CRbFw+vIE5MW0JX+
 Fxd9Hek8YeStaZGgIJCUmTlQKo35AztBOMjlNXhduvmy9Dj56CRPDE+kpnnsmWDhdWU=
X-Gm-Gg: AY/fxX6VTb0LZF/BGRW49qZU+0T1SZPn8pAT9xs6gIv7cXXobOb35j1qY7sMFKkAGKs
 M/FVb0zFAevI4pR4ZeJrUWKbonhQkYl3Am7D2TyAL4EY//QUSqb5mPdhLV6GGhizERcjROigYP4
 iPWD/CzVCJ+TatHdLYTI/PLumf6IyLCU8eUsIwl2TlGKsdRmmzuGvfzptLdTyWCtsEcj1gF3L6Y
 w64Dp7Uv4SOLbtjEC9jToQmrM32nfgry+QRDVjU5LVebQjYR4NmtfjH93BPZSSdRSMPm4xFyaDL
 QwVomz63JpWa7qFIqkvT2tf0gnsIX9Tthr8u9x5X+oMIf0LtSt+UEifg51LTrfZKQIEXhOf6Jt7
 1TEiPAqPLEt5Pz2vT1MlnIrXYClVfNmkafAgPxa5Tu0nkL5Xld+o3+vxqtY+XLs7Zvtn86EsHKx
 fYRsNSDfQAU8zlzCOdqf1KcjTqk/DoJkn4YrpFWJj1biZJqkJJseStbQ==
X-Received: by 2002:a05:600c:548d:b0:477:9fcf:3fe3 with SMTP id
 5b1f17b1804b1-4801e2a4c3bmr33809425e9.0.1768558889126; 
 Fri, 16 Jan 2026 02:21:29 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4356996dadbsm4338360f8f.21.2026.01.16.02.21.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jan 2026 02:21:28 -0800 (PST)
Message-ID: <902e0196-b5f0-4222-a8b7-b98b8fc0a66f@linaro.org>
Date: Fri, 16 Jan 2026 11:21:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Add docs/system/i386/ to the general x86
 architecture section
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
Cc: Zhao Liu <zhao1.liu@intel.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-trivial@nongnu.org
References: <20260116101139.269906-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260116101139.269906-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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

On 16/1/26 11:11, Thomas Huth wrote:
> From: Thomas Huth <thuth@redhat.com>
> 
> We've got a section for generic x86 architecture support in our
> MAINTAINERS file - this should cover the docs/system/i386/ folder, too.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

