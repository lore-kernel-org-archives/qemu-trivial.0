Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A26ACD4661B
	for <qemu-trivial@archiver.kernel.org>; Thu, 15 Jan 2026 19:53:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1vgTPC-0003Ni-U2; Thu, 15 Jan 2026 14:53:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vgTPB-0003N6-57
 for qemu-trivial@nongnu.org; Thu, 15 Jan 2026 14:53:17 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vgTP9-0000hL-LP
 for qemu-trivial@nongnu.org; Thu, 15 Jan 2026 14:53:16 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4801eb2c0a5so856625e9.3
 for <qemu-trivial@nongnu.org>; Thu, 15 Jan 2026 11:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768506794; x=1769111594; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oxg48iJpicsxkRKyRe0DmuSZk4wGUzVv/6pVl2gFEUo=;
 b=UiG5ZlHN9cPcrU5FVna4oJqsVuGeLT4xkLxsLMX/P4xC7/iCuYICbVBTRbJnpG6OaB
 bxavBZwHREuOELHzHiuxc4OeTyOWuHJiNRxl/EgPS8/fJVPpxOqhkNSLrA6hLJ8cXy60
 7DnlykNZKfjG6slgB+oH3Rq37jQserZn3XvSuY8TfzEXeBJpg8ZYNOKPVFmBCWxXdYYm
 E1BnMQYeX5bm2qpNQEk8/KifhxFwpw26YfvGkryQZSQxi8BZdIe0ZMPOaDWetCcOqqgN
 zwUxJPUD06aYYfva0ACd47l/J5eR6b0Aab66pZE39KektBwtFpKGeL1AMGpEaRoEoH8D
 5XQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768506794; x=1769111594;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oxg48iJpicsxkRKyRe0DmuSZk4wGUzVv/6pVl2gFEUo=;
 b=PWTRyLoveNUHpS7M95hzV7VmQRohC07sB7T18mM0CyKJqg1m+c2QqAwTMsJa/PbTId
 5oICbQozlcii5t6rev4NEckfqb/cvC4/6fqV5MEVof6OLCRgcZfoNJtaLiVBJNCeJOHh
 q14sFdBzbvAwKdQPKmB4oXrc00ek0YaVvuoAVOD3/QOZZqZGY8/ZFl6oY3kIooBw5AYc
 vzvyrpTOPizAL2QaavzX/6/FwAhKbcEqebL7do6s2WFStU3psSxFh6+B7c5o3mtvxPbN
 ohzF5ZkdQ1c+s/6xuL8H26ZNFit85bj793+0w2bn6xph9ntjI1zqk25psiS8c7PCpEna
 C2Hw==
X-Gm-Message-State: AOJu0YwB1vgtFkbNPEBIyvMioGjb5Wkm+8qOZYhpxKi4Hsqtjiy8iHAc
 1mDqIgqwF9yF1RpyOoPPC5Xhi6DS7q8S8wr+3/rFKkMWL/4lz8/BvFfojdp06VPNQl8=
X-Gm-Gg: AY/fxX5nj7Q2V+ZOZP5nHnEoegEWtRozgomGbWHqCLyay19PBpv56u1l+atWxUeOPXz
 UBY/j0eLUwu5m9z+o36T+Pxy9Rly2OWSNWP1D9G1se6vcdpSflTpHGfVcrO0nYcs17HMCu9ND//
 yRwkTF76QCXNARGrmdP+tSIAuy8OH6+2p5H+gXuPmSz4fTsGQIpOqMz9rB8Bvrtc0k0wBhsHhbs
 0T7MJ1hfDCDjkAdedgx2/HlNK3AbHB5f/n2MxkZl+VgTHfVhGJtVJNDEnNdGyAnVSxwvdUgu5qu
 pZO8PQNNXv6cCqyxaOiJ0LnJ02FYyOdiVI44NsTeFbMmWJZp2OtDcvv9mXPiX/3t+jmcl04yEb1
 JIdraKY6GbgHH9COZPg9IjdC5mUhteJiXy3AZjADKnpYYVRmYA75Z7AJD2oxOrO/ERQDAbuJ4ZG
 QyBYHhV/cGrYnEI+ctfmjEA2q5F0C0eCoTvU1JXFqbSvwyngqjYISZdw==
X-Received: by 2002:a05:600c:1909:b0:479:1a09:1c4a with SMTP id
 5b1f17b1804b1-4801e33c745mr11015495e9.31.1768506793746; 
 Thu, 15 Jan 2026 11:53:13 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47f4b2755absm80395205e9.15.2026.01.15.11.53.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jan 2026 11:53:13 -0800 (PST)
Message-ID: <2e0cd040-b80b-4dbd-9645-eff04d84a8ac@linaro.org>
Date: Thu, 15 Jan 2026 20:53:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/i386/nvmm: Include missing ramlist.h header
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Reinoud Zandijk <reinoud@netbsd.org>
Cc: qemu-trivial@nongnu.org
References: <20260114083812.18496-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260114083812.18496-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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

On 14/1/26 09:38, Thomas Huth wrote:
> From: Thomas Huth <thuth@redhat.com>
> 
> Compiling on NetBSD currently fails with:
> 
>   ../src/target/i386/nvmm/nvmm-all.c:1136:22: error: unknown type name 'RAMBlockNotifier'
>    1136 | nvmm_ram_block_added(RAMBlockNotifier *n, void *host, size_t size,
>         |                      ^~~~~~~~~~~~~~~~
>   ../src/target/i386/nvmm/nvmm-all.c:1152:15: error: variable 'nvmm_ram_notifier' has initializer but incomplete type
>    1152 | static struct RAMBlockNotifier nvmm_ram_notifier = {
>         |               ^~~~~~~~~~~~~~~~
>   ../src/target/i386/nvmm/nvmm-all.c:1153:6: error: 'struct RAMBlockNotifier' has no member named 'ram_block_added'
>    1153 |     .ram_block_added = nvmm_ram_block_added
>         |      ^~~~~~~~~~~~~~~
>   ../src/target/i386/nvmm/nvmm-all.c:1153:24: error: 'nvmm_ram_block_added' undeclared here (not in a function)
>    1153 |     .ram_block_added = nvmm_ram_block_added
>         |                        ^~~~~~~~~~~~~~~~~~~~
> 
> Include the right header to get this fixed.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   target/i386/nvmm/nvmm-all.c | 1 +
>   1 file changed, 1 insertion(+)

Queued via accel-next tree, thanks!

