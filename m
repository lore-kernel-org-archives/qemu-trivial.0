Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D45BBC87FC9
	for <qemu-trivial@archiver.kernel.org>; Tue, 29 Jul 2025 13:01:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1ugjwx-0003V6-L8; Tue, 29 Jul 2025 09:01:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ugjw0-0002hd-1B
 for qemu-trivial@nongnu.org; Tue, 29 Jul 2025 09:00:06 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ugjvw-0006ou-M5
 for qemu-trivial@nongnu.org; Tue, 29 Jul 2025 08:59:59 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3b7892609a5so1134272f8f.1
 for <qemu-trivial@nongnu.org>; Tue, 29 Jul 2025 05:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753793988; x=1754398788; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8cArS9/nRylKOD3Huk40tSuXpNtAKJs4oRFsn3gdCtU=;
 b=R48IJ++fgu4ICHaoO7LwbX1eU5ABlQ+krLkYvYM4XCQEgOR6FLcZon3Hn3J9QmL18c
 r/2HN3t+AE/rPlHR5N1TPv4yJJ6jtDVx54BGhhuBiUl4jfWBLJ5ImA0NtLbHZO/v653v
 VkL5iuMyO/pTmJtv0KyORkKcXGZd6xlgpp1pNn4+xF5zZ/lj750zZCEmkrJr0lw6Ma8i
 lGa4YhZJJc4v7z3/MNtVNAyz7AJjZOoTnb/DIs8qj0telPqpxj9FNlPbnCYL1ao/fHEM
 SfpxrQ6qA275vBjiaiTvXtbT72PmZ/z3nFuChPUwt7EOqSqK+SRYdV/Eq6qd6CNOCQd8
 onJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753793988; x=1754398788;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8cArS9/nRylKOD3Huk40tSuXpNtAKJs4oRFsn3gdCtU=;
 b=ccD48pj/2ORttlE3IGDWvg8KjV1Ti49K1Dogj/MFzYQ6Hq2ewuiwBvaRbEtu3pCMkn
 hjPU+ix/uFCGH4kCtkDTd8wW2vxmZAR56GQOpHWvMXFc6LzLKctEbA9UN1mLXBOcjkGq
 1Y70Gzb1ql2g+esaiKGQJ4VdqnsqPgxlTEndnbfRW+T6ax2x7IBKroH5ZxierLcOWoN4
 kbCXogiew1hsTH3CCF52d2+b0OYcC9fGGUC8GZz5gACsekp5QKIAdHPo/4zt+1jHdw4e
 X+chv+SOwNvpzXoZQGuWrPspIH5QxlQtlsZTSE2xLoK8D0h2a/K+OxRnUUdtOM1dzC4B
 hUpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJbdFw2S8EIK27K1TPpLp8USS1VWV/NtBfKVrIbrQB2+oRx/EPp2BuSa13ArirK49272VVul7CHH7k4UA=@nongnu.org
X-Gm-Message-State: AOJu0Yxt0DSl5QkQnZcokkgir/KBPF8n0hwNWhAQPPEpis4QqQm2lih9
 ROHULcRsy8+3sZcL3/po8LZuo+MCmkVG/QLcf58tTJOeFJX/UrD4xrE4VWtp+NULAjk=
X-Gm-Gg: ASbGncvlw69QnwcFZ7Y/cUzRmgJNX/hIraywzrkeWrZ6PPLwVlWKegTKgfN5TAwyc7G
 UMHEIbGmS+ZnrBR5ze2QwUQfo+5dBMWIi8UTT1aqHNSpU3jNhc8E0IEdnW0I0I15MOxS43+LTpt
 74vEdYMOShvMvrzU9NcETOdKZCFVw1gminvyE3Rq5ALV93E9FUkYTmvHnlQtlCB4kExmUHnwij2
 G0ViaHQuqNh5QzkEjAFs9gTMTiQb6h33a6iKzY+dQdfjVSWtPNl/PkDXaI0EHNxG/Ay9ZNYiJI4
 MeBD8ZG8v6HKMncC/HdBJNAHvbfLxBiXysZGe7Nq6T1XCMXk0BlCm0apsp6pDzLnebhHYXs4mfx
 L217o6y3DNCNcYcjaSjnj+XfFrfLWUWApTrPdOS1md7Vy4G51T5MJIRkQYPc6mZ7aydu2EEaKOq
 Gw
X-Google-Smtp-Source: AGHT+IEB10v4PlEVCKKxdtNYOiBMcTLcOBbKf1RgZTNhwbScPufdOsX77u3Fjs46TLXC/DBoqvBPLA==
X-Received: by 2002:a5d:64e8:0:b0:3b7:899c:e88b with SMTP id
 ffacd0b85a97d-3b7899cea54mr5166832f8f.11.1753793988424; 
 Tue, 29 Jul 2025 05:59:48 -0700 (PDT)
Received: from [192.168.69.209] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b78d45d152sm3585536f8f.3.2025.07.29.05.59.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jul 2025 05:59:47 -0700 (PDT)
Message-ID: <15536eea-5a66-4dff-b4bd-8a43fbfa9365@linaro.org>
Date: Tue, 29 Jul 2025 14:59:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/display/xenfb: Replace unreachable code by abort()
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, sstabellini@kernel.org, anthony@xenproject.org,
 paul@xen.org, edgar.iglesias@gmail.com, xen-devel@lists.xenproject.org,
 qemu-trivial@nongnu.org
References: <20250729111226.3627499-1-armbru@redhat.com>
 <14fff91b-7434-4d90-adb1-ebbe3f51d605@linaro.org>
 <87v7nbdwfx.fsf@pond.sub.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <87v7nbdwfx.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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

On 29/7/25 14:16, Markus Armbruster wrote:
> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
> 
>> On 29/7/25 13:12, Markus Armbruster wrote:
>>> xenfb_mouse_event() has a switch statement whose controlling
>>> expression move->axis is an enum InputAxis.  The enum values are
>>> INPUT_AXIS_X and INPUT_AXIS_Y, encoded as 0 and 1.  The switch has a
>>> case for both axes.  In addition, it has an unreachable default label.
>>> This convinces Coverity that move->axis can be greater than 1.  It
>>> duly reports a buffer overrun when it is used to subscript an array
>>> with two elements.
>>> Replace the unreachable code by abort().
>>> Resolves: Coverity CID 1613906
>>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>>> ---
>>>    hw/display/xenfb.c | 3 +--
>>>    1 file changed, 1 insertion(+), 2 deletions(-)
>>> diff --git a/hw/display/xenfb.c b/hw/display/xenfb.c
>>> index 22822fecea..5e6c691779 100644
>>> --- a/hw/display/xenfb.c
>>> +++ b/hw/display/xenfb.c
>>> @@ -283,8 +283,7 @@ static void xenfb_mouse_event(DeviceState *dev, QemuConsole *src,
>>>                    scale = surface_height(surface) - 1;
>>>                    break;
>>>                default:
>>> -                scale = 0x8000;
>>> -                break;
>>> +                abort();
>>
>> We prefer GLib g_assert_not_reached() over abort() because it displays
>> the file, line number & function before aborting.
> 
> The purpose of this line is to tell the compiler we can't get there,
> with the least amount of ceremony.
> 
> We have ~600 calls of abort().

And ~1600 of g_assert_not_reached() =)

$ git grep -w 'abort();' | wc -l
      556
$ git grep -w 'g_assert_not_reached();' | wc -l
     1551

> Whoever merges this: feel free to replace by g_assert_not_reached().
> 
>>>                }
>>>                xenfb->axis[move->axis] = move->value * scale / 0x7fff;
>>>            }
> 


