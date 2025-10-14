Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1C3ECCD192
	for <qemu-trivial@archiver.kernel.org>; Tue, 14 Oct 2025 15:20:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1v8goW-0003on-E0; Tue, 14 Oct 2025 11:19:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v8goP-0003mr-Je
 for qemu-trivial@nongnu.org; Tue, 14 Oct 2025 11:19:42 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v8goL-0006g6-Ux
 for qemu-trivial@nongnu.org; Tue, 14 Oct 2025 11:19:41 -0400
Received: by mail-wr1-x442.google.com with SMTP id
 ffacd0b85a97d-426ed6f4db5so569823f8f.0
 for <qemu-trivial@nongnu.org>; Tue, 14 Oct 2025 08:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760455173; x=1761059973; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jlHFOQXWxzzjDjPOVpHQOqqqqeQmwHzOFbxMqWe9zH8=;
 b=BFXFrE1hlVNmjoGzQCp4EF7lWP/Cg9D/70cACDIpqhnNdGadWgOUnVHBXPFZC+BlqO
 n/V1jmfnbqjsF1KQZeqlEB+Kbhm67OkuJyefj9JTIEfWPAR8C+wF+/zLL7Mmlq2LjptF
 Pn5MLSmhRF59fA98lQOYzdRLyGFu9PqiJPLh7vb3CC5RX/dFdBW3vy/JYKBe6aqLNDdC
 jfS2yZLx0jqBTYkZMUmgv5DB2/mARauMbIyV1bFfiLEUidd71fjOlI6PDUkzgawlnhV5
 bvPYfwa+X3se/88SxSQgkn8LtaGOTBV1/gKHYKXxcWtCtvPLsabDfQjHMzkpA5gnj4Et
 8fmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760455173; x=1761059973;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jlHFOQXWxzzjDjPOVpHQOqqqqeQmwHzOFbxMqWe9zH8=;
 b=s6vSzMXyfrPCKl0fJBgP8PPg7MAC1/usBtffMNzQPFWfEVcHjlteOKQ2G7vaia1LKp
 tX80u/a2VtNLTSVEJPfMN3M6K9WkmpsW8seiBtuduQk4uH6NL+O6SwMSaeEQjijj6tH6
 Z0WZ1IodfywbZgDHdj6/Ovuz9CNeC4LDquPssX4qM7OPvXPDlNTAAB1iK1V1rr/uSBAa
 khRuatjWz5BD8tIz/4ZnVjZYd40jNpeEp6GnvsdA1U8389dnQljXo9wyKs0fLNAMkmAY
 ZACQJhWrS4Xf3R/pPg6T0AxjXjjTPnz9IWS4zBUB9c/l+mERI2PlmL9JFJgCmecoCqUV
 /ULg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXY9IQYaqpkdupyuuhWJkz+CK8GyRZOaeWgxRGWaH+U8IELHknW8vAafDEVMJAVp2x5TBR+GXkMsdDPvmo=@nongnu.org
X-Gm-Message-State: AOJu0Yzu3K+hl524dJNSY3ayocu+3rl5FS5BbgDX86cO3WO2BUf50G3f
 ggH1XlXpMt06XZxjAvm4lSPmCs3l81bANYGCfshsAojNIdZewA/XzYGxrokm3JbSOhE=
X-Gm-Gg: ASbGncu1xNhJ4dJI5LBws6ASpdshXgg29exwTxK4oCIce1zew52PqlrjGJE6xyTt7vH
 Kyrf1Z5tgTydLUGPNNZ4H3J6262s2F8zPowc7p/n7rTlO0JyqUiPFELQbANTBolvuKUbPJ36CH8
 XuAgV3NK8v9r0EEvw6ybLiGmxXgaDprJx4/xtLK1cKF+My8QT200HV0l+SwxhXC4ajXydT7rdxd
 nfmtsWA5B1rx31pxci8q+66y93Ffnlki2AlPCM7tgpywBLNVyhETqMRJIfOBLRzTOLgkEhiR6Hw
 tgV+G4ZEfl1cr11XiDLg2I9KW4OF4mWBdNnt+EOhfBTsgyFk1n0F8l5S20gsHrF0H5qmpzYc5DT
 xeZvetCWOM2zfzJcRPg6fz+qqykUtSnW9G2aN7+Rkn/ePr41cT9rUX9V0nPfQihALKEeaICpjI5
 /gm+yrLp4LOaF+
X-Google-Smtp-Source: AGHT+IEZPI24EUKrC4LPcFULvad8y2pBqW6url1+99+3ODje+BCbQxk5FqxB1JsN34Villm1JYw9vg==
X-Received: by 2002:a05:6000:4283:b0:3ee:1368:a921 with SMTP id
 ffacd0b85a97d-4266e7cfb85mr20417961f8f.28.1760455173374; 
 Tue, 14 Oct 2025 08:19:33 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce5e833dsm24167850f8f.53.2025.10.14.08.19.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Oct 2025 08:19:32 -0700 (PDT)
Message-ID: <2cad2907-5a93-4630-856f-7237063eb3ce@linaro.org>
Date: Tue, 14 Oct 2025 17:19:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/display/xenfb: Replace unreachable code by abort()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, sstabellini@kernel.org, anthony@xenproject.org,
 paul@xen.org, edgar.iglesias@gmail.com, xen-devel@lists.xenproject.org,
 qemu-trivial@nongnu.org
References: <20250729111226.3627499-1-armbru@redhat.com>
 <CAFEAcA-UrCD7mrmX_4dCK0urMmY5+qs=Y268WerQVq1c+7nB=Q@mail.gmail.com>
 <CAFEAcA-01WR=jgdiCY57P_88ez-mRw07ShU0eWyzLPB+WbT_xg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA-01WR=jgdiCY57P_88ez-mRw07ShU0eWyzLPB+WbT_xg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x442.google.com
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

On 14/10/25 14:59, Peter Maydell wrote:
> On Tue, 14 Oct 2025 at 09:36, Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> On Tue, 29 Jul 2025 at 12:14, Markus Armbruster <armbru@redhat.com> wrote:
>>>
>>> xenfb_mouse_event() has a switch statement whose controlling
>>> expression move->axis is an enum InputAxis.  The enum values are
>>> INPUT_AXIS_X and INPUT_AXIS_Y, encoded as 0 and 1.  The switch has a
>>> case for both axes.  In addition, it has an unreachable default label.
>>> This convinces Coverity that move->axis can be greater than 1.  It
>>> duly reports a buffer overrun when it is used to subscript an array
>>> with two elements.
>>
>> I think also that Coverity gets confused by QAPI's convention
>> in generated code of defining enumerations like this:
>>
>> typedef enum InputAxis {
>>      INPUT_AXIS_X,
>>      INPUT_AXIS_Y,
>>      INPUT_AXIS__MAX,
>> } InputAxis;
>>
>> Coverity thinks that INPUT_AXIS__MAX might be a valid
>> value it can see in move->axis, because we defined the
>> enum that way.
>>
>> In theory I suppose that since the __MAX value is only
>> there to be an array or enumeration bound that we could
>> emit code that #defines it rather than making it part
>> of the enum.
> 
> Also, there's an argument that this function should
> ignore unknown input-axis enum values. If we ever in future
> extend this to support a Z-axis, it would be better to
> ignore the events we can't send, the same way we already
> do for unknown INPUT_EVENT_KIND_BTN button types, rather
> than aborting. But it's not very important, so the
> g_assert_not_reached() will do.
> 
> (In some other languages, we'd get a compile failure for
> adding a new value to the enum that we didn't handle.
> But not in C :-))

See this thread where it was discussed (until I gave up...):
https://lore.kernel.org/qemu-devel/873564spze.fsf@pond.sub.org/

