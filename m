Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A29CCCD183
	for <qemu-trivial@archiver.kernel.org>; Mon, 13 Oct 2025 14:14:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1v8JJm-0007Co-6m; Mon, 13 Oct 2025 10:14:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v8JJk-0007CI-Ds
 for qemu-trivial@nongnu.org; Mon, 13 Oct 2025 10:14:28 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v8JJc-0003CL-Oq
 for qemu-trivial@nongnu.org; Mon, 13 Oct 2025 10:14:28 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-46e2826d5c6so25881625e9.1
 for <qemu-trivial@nongnu.org>; Mon, 13 Oct 2025 07:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760364855; x=1760969655; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qv7yKUSp1keAvGeIJTgsLzzM2Dd2vNSw3IfagjYR6Ak=;
 b=uXuAxnefmNz6JGOAoVwNRLPc9RonfOPoYevDGThYU6lJS2ib3imJoiURFfna4Gh/gc
 n2qIWXiq5fSahNS/RpUUh2Bj+tYee9WQfTA+RV4sgJlEM48VSmMCoU1yh5M6/6vqhteO
 3k1bbQjpU0IX8N5by1u76FJTG8tOJUNBttEcBPisySWblb203X6uXg9Xzh97IQWWqQG7
 aYy88r7arLIWdIOw1ntJt0eQBxy/2da8Lg5Fsb72Vdw18zqU9mK0uXU5CPuni9nZ8+Pz
 R4DhHjmH3XNJKBXwcaGxf62j1GLhokQdlprZwVI4bzVBcZQGOJzMtUR4hOacDBiQ4vtW
 Ui4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760364855; x=1760969655;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qv7yKUSp1keAvGeIJTgsLzzM2Dd2vNSw3IfagjYR6Ak=;
 b=Sggz0RvKOfeDKyl392GDmbUya4qu1tKO0k9Omv32zM7OKYICoLK48/9gVoGmBYpZ4m
 2qOE+kdUpNHfCWcHiumNXd6y8sBn7yQUWHdbizEWQfL0B77t2AIeDipdVplSb/el2BGV
 y5Vvnak83IlSpTLU6yTjdNCEMV0pbuxCT4wSbmMdW/TVzj7+o0zuHb/81EMWNQfHASfP
 vxwyvNHBeB3vtwxng3Zkfzh37WuA37Q3DdOsVB5NSh0KbMS357UT+nMUdo4tXRMzMCW6
 E+msUgf0sQwCZCuAmWd/b80xk//+VGbCgnDr02zGUApAeQwlvyZpfZxW4I2At3eCNnBx
 FngA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjVg7gLuCmGggz2FbEYIOjsOHkSMOLLuTDw8Iagh02pm1DQRllw36Rpo/5ASTM0kDwwewEe1fJuro0vc0=@nongnu.org
X-Gm-Message-State: AOJu0YxbqV0219Wz4QBqrdwfasPmSH0eh81i7ZfP3l66XCtlTEDgo6pO
 CihJYCZaMDEIcmuLA2xXCLsqsZNJBlwOtKcDqZZeA0kpiYAFqhc6UKzX35CtHHPIcqU=
X-Gm-Gg: ASbGncsb+f7p7vjHu2kP/emWROeBiZN7GPuGjZhjBNMeDmBUOqFNoITpJ2jJbPXMTma
 PXafySGT9hAgJ0YB42vMORq6eveXUgbT7Pgr0+xe9MPH+d3zmdOk4Lurg4wmL+5Zq0f2oR/uPFc
 vPc1DHydk+Dscsmkon8FUZH13wbkYsIJRHXsS0HgAzXIwwYllcSOZBgCqmBdo3UZe5ue3ZWD6nC
 lHpf7Ua28LEfQs7PQvjjjwJ0KqJazHqjVzqGOL0cZpaEJizVNqpeHsXK+beHn544vdBx/5qrzXK
 tnlPNWgB71vWogeeTSojsobVeakZhUZim6QltWVPo4AoSUhzA2yS7rZXUKoNgI8WQKllQfPqDo1
 r5q7z8pRQg43/xDZluSSYA0EYgmdveMQo8vq3KBr4uDIulk16e1+wq1Hk3tfNG/Wjx3cYACB4ut
 +z824QXRyIxYhd
X-Google-Smtp-Source: AGHT+IFpD7B4YpSeDObYU3xiNzf797WnP8ClM3/cdXiW5NpKO9VzUYIyFMpffvprfsk6KbSgYLlZIQ==
X-Received: by 2002:a05:600c:1f93:b0:46e:376c:b1f0 with SMTP id
 5b1f17b1804b1-46fa9a8ca9fmr151711385e9.7.1760364855227; 
 Mon, 13 Oct 2025 07:14:15 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fc155143fsm125262305e9.11.2025.10.13.07.14.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Oct 2025 07:14:14 -0700 (PDT)
Message-ID: <ba4ca63b-6d46-4df9-8d30-fc0537736adf@linaro.org>
Date: Mon, 13 Oct 2025 16:14:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/display/xenfb: Replace unreachable code by abort()
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: sstabellini@kernel.org, anthony@xenproject.org, paul@xen.org,
 edgar.iglesias@gmail.com, xen-devel@lists.xenproject.org,
 qemu-trivial@nongnu.org
References: <20250729111226.3627499-1-armbru@redhat.com>
 <877bwz6oqy.fsf@pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <877bwz6oqy.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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

On 13/10/25 13:10, Markus Armbruster wrote:
> Ping?
> 
> Markus Armbruster <armbru@redhat.com> writes:
> 
>> xenfb_mouse_event() has a switch statement whose controlling
>> expression move->axis is an enum InputAxis.  The enum values are
>> INPUT_AXIS_X and INPUT_AXIS_Y, encoded as 0 and 1.  The switch has a
>> case for both axes.  In addition, it has an unreachable default label.
>> This convinces Coverity that move->axis can be greater than 1.  It
>> duly reports a buffer overrun when it is used to subscript an array
>> with two elements.
>>
>> Replace the unreachable code by abort().
>>
>> Resolves: Coverity CID 1613906
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>   hw/display/xenfb.c | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

and queued with g_assert_not_reached(), thanks!

