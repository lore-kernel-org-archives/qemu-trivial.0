Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D75ACD5BB4
	for <qemu-trivial@archiver.kernel.org>; Tue, 26 May 2026 07:46:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wRmUa-0006Yj-6e; Tue, 26 May 2026 03:46:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wRmUX-0006YJ-Uv
 for qemu-trivial@nongnu.org; Tue, 26 May 2026 03:46:21 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wRmUW-00075K-8P
 for qemu-trivial@nongnu.org; Tue, 26 May 2026 03:46:21 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-45e7c636e74so5385622f8f.0
 for <qemu-trivial@nongnu.org>; Tue, 26 May 2026 00:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779781578; x=1780386378; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=leggKKmGxNPdiFeNog7jh0ClRambOF8a/6CbW08Kkr8=;
 b=qqWdKUys5tjT9HNgPA3E4RGQQbyqlhF5KbZw3BBl0W7W4UbEbHigTlXW8BJMqLQevS
 vX2Jog2igQK+2D2lY/+Mq33oXRV7Gv4A68OeEWjJbvbC0+yvi94UMNTPf3Cx7IQ8nBlI
 KLleANwN3JmCwtS034OC2+LE4sjXL4hr/MnJxgPX8Kgc9F7E/rsRtNc4xf9H91ZbThyg
 HVWsqJkwsrKQ/70uohbgPHMpmEN+rq62yZ/hi633bhfCR9Q4N9iUB3xB4O7kQcVCNUi6
 hCyFQf9K0nLEo1VGMDhVUPD/3FbOjdlisceMMpCkrrf0IyVzwq21qg1BGPMrOOybtY9u
 k6GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779781578; x=1780386378;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=leggKKmGxNPdiFeNog7jh0ClRambOF8a/6CbW08Kkr8=;
 b=BIWUuAcEUIB5/0ejT1eJJd+mG3v5HKsVA8hlP75a4sBug/MnHxUooP4EK+cLq6TAUP
 W5aHElkdIdyIa6WpYecSACzcI3SosCwwZEJUt+NrLsZZsIM3ftITy5kZZpnwuJJBgslj
 7JMYOVAfpoXuvnBB1kzlkYqJOyJCyClZ6kcCUs4WbWn7SnZx4VFjMvN2tvYMZkfvglHe
 KAMel5Fw1tdxonk3WYCTNdc3Vl2/zo/g1HNOG2OpogvJ+Gyp2hMCsAFbRuMcJlVegAGq
 zEc+fTCWW0WBSLWFIK7iJbXn+VOqXMWo7M5EP1fbebYPEK6O5Z8NB6b4uNZED+qSzMp7
 qB2g==
X-Gm-Message-State: AOJu0YxqqDmBtf14r3mtrPxK958QjxRSZSzx6C6NahB+BJICdsNS1qr1
 h3sBfajfeiI01ouoYCU/KSalHdm3CtkEB5jvpZMPcirgdS81PI0RpVK0EZRj7Y2T5o4=
X-Gm-Gg: Acq92OHC+GsjkCui2ADgVcTocD4MUV+Muf8JlYT0NrlGKFchwDUf2UbgcOwRvq4Mtzu
 ZfsxTnkK7Pe4nt/hW8aJbtjM8zvc57+60TkILOEoNQBl6BBTY+m61EFUqTeOedvgiT31UHJJ/up
 r9W2ddA4+JgX6kHXyYYPseay/7E2w9XW6z9ZVRXRU0o/0JWbO5fvlSyEPrDBMeBt/ZmbadKGI5g
 6vbiEGKVSvZHAlUz2KAeC9jfx5KnrQOcOgUZHPEL/hwQLyZ77l+Uo4ju5vpMhvPQe5pnE6iNGwY
 M7xyaJ1L2//Xf+wT2gerXA19gybnCz6SQrsc9P9VglYAm9a90MQDeUYCr5F6fr9ODqbbUBKGuxW
 DAyV0ag/XHr7dp//EhL4GJao7oFL3cNlkx5XXne7YPu9VgH0LIsgRjrJIoQ+9MIHMdC2hDMu4a4
 baIBfpFUgw99Hidla5AvZuRvS49XjBGGD1iJEEZ2MNR8rFHgn+b0vfvaKC+F4O2G+dbQ==
X-Received: by 2002:a05:6000:1acb:b0:45e:a225:6dfe with SMTP id
 ffacd0b85a97d-45eb38a64e2mr33162591f8f.25.1779781578085; 
 Tue, 26 May 2026 00:46:18 -0700 (PDT)
Received: from [192.168.69.207] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ed1939c6asm12200230f8f.2.2026.05.26.00.46.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 May 2026 00:46:16 -0700 (PDT)
Message-ID: <519063f1-c3ef-4dd2-a15e-fdc62cb96c8d@linaro.org>
Date: Tue, 26 May 2026 09:46:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] net/colo-compare: Use QEMU_LOCK_GUARD to simplify
 mutex handling
Content-Language: en-US
To: Evgeny Kolmakov <randomjack94dev@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, stefanha@redhat.com, fam@euphon.net,
 kwolf@redhat.com, hreitz@redhat.com, zhangckid@gmail.com,
 lizhijian@fujitsu.com, jasowang@redhat.com
References: <20260522080644.9531-1-randomjack94dev@gmail.com>
 <20260522080644.9531-2-randomjack94dev@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260522080644.9531-2-randomjack94dev@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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

On 22/5/26 10:06, Evgeny Kolmakov wrote:
> Replace qemu_mutex_(un)lock() calls with the QEMU_LOCK_GUARD().
> 
> Signed-off-by: Evgeny Kolmakov <randomjack94dev@gmail.com>
> ---
>   net/colo-compare.c | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

