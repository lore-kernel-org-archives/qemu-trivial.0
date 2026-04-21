Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F20F327C8
	for <qemu-trivial@archiver.kernel.org>; Tue, 21 Apr 2026 09:01:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wF6z9-00018O-Ig; Tue, 21 Apr 2026 05:01:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wF6z7-00017d-Qh
 for qemu-trivial@nongnu.org; Tue, 21 Apr 2026 05:01:34 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wF6z6-0007Je-AW
 for qemu-trivial@nongnu.org; Tue, 21 Apr 2026 05:01:33 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4891c00e7aeso17884825e9.2
 for <qemu-trivial@nongnu.org>; Tue, 21 Apr 2026 02:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776762090; x=1777366890; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nXQ2IHDXTbEKPoc80gqzdwc+ZOiq9E9sWXaw5VmnG+I=;
 b=TmboJgqGnoyhV9EhhjBBpVuYLip3hJjmq/hQdl1i36ctj5Jbq6Omxj3hz0WIJIrx2Z
 5Xesr9ZjvCv1pAzKzprhGZ2vxqUeAzE+OAEdDP9c8xzZyznIwVPcRXThjr3/w9m+Sq3r
 1dJt+OShoAmv1izd1faY8KaOikuvQHrDKIkJRMZFa3KaX/WZQlodQDzQ9WtAxX+oQ68+
 oMdnzQfCMGdC0fQ9hMp+8oZNMGDi2PokTIzw/SDwKks5u/E2DIrD8hyX7qAz/Akyob+4
 f4MzgFaMafernqrzB8ZpmWaQGKFGXo9CdL3gRPH5pqockMmGTSjErIhI2mO81cgvYM6U
 uL4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776762090; x=1777366890;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nXQ2IHDXTbEKPoc80gqzdwc+ZOiq9E9sWXaw5VmnG+I=;
 b=JIvNGpPz67hVI71Ph+q6JoET00d+k7qe9oaWVaRFsC7rREJkjNOHN+l54+8F1ub2s+
 tBkKffKrcWPxH3cs15h+aE9wpAUdA/+Fi2eFmDwL0QSpGnDjbdV26RcXOmZj7+HmMujd
 vCasK5WtH7hGrxyqIYvsgO15W3vxOoG5j52JXHfyaC5ma0Gpa/TeLhB49C5HOltdbSJG
 b2AburV0R0LMDboSySnMQypkcrwSSukwsaZCAHh3SAchdXRjZF1kJi4s5JqjjdvPzx69
 U9Ca1Qrc+ZBidvfJYaSXnZoD5aSzbPNrGehZrll8nGEePiBMOrSVCQ9Zd7QW1X8xe4BE
 mUZQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/NatA4Y54JCyCtza302qur23u9uKUhtoM5+gQ7UNXgzgsuhrQhJzXHE9CcNTlpwzd03ROT6Axc/6gbplQ=@nongnu.org
X-Gm-Message-State: AOJu0Yw4dlAlcpo6wEwuAvTikDGpqFU/iHJUAckzL9aDWrW7+9DpJyM3
 lcYDmPRLd/sNlu9IPNiXhbLgI1rhsD7BB/SghpillQESeut69jWzXavtZJaPxI99jxw=
X-Gm-Gg: AeBDietNHrQCK6RMnYRmoqSLNVhjR87ff8lok6cJZXQbYxV8qOgPHTXWertd6FNv7+Z
 yC61OXZ3WwOXzxmrrG69qM6Jzd5xYbeUbgzMg3f3Sj9GAmteJ4Q76Gg7GU6ddcm33GuueeHVNcv
 k9mVnujZz/AG7ue48MWpKitg8Bjue8wocbTPDYtZDDZxkBqxfhEvP/mzUaihekdobyDlZH9rYGA
 9IvPRLeDqA+eoI3zftGoFTMvUm+Bl2GUO2RzPTqwy5n3MjpuLIqwJHKqfYvMEiVRh9NuUzuMXU+
 1nZQ48ue7F2eW5xIOd7gVJRkDueMwL3sW8jV5fcLY+fzDy2BxdvI8ZdtUX6nzUenWlkN8bnFJHp
 B9R/+rZhI/DcjDfSzSz2GgnnarsagHX9NVQZpIIMVjBlthE1vPP84qSnXy3n16dwSYitm3xGI9Y
 uN4O+AVZMMKBM1SsYnooDbVQR0SqGmFs5fEercIo8PFLb19gFMbF4zr9WvHBNpHXT3b+mBYzaJq
 JV2
X-Received: by 2002:a05:600c:33a6:b0:489:1c1f:35f9 with SMTP id
 5b1f17b1804b1-4891c1f38b6mr64277975e9.9.1776762089935; 
 Tue, 21 Apr 2026 02:01:29 -0700 (PDT)
Received: from [192.168.69.228] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4891c08faffsm269481385e9.1.2026.04.21.02.01.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Apr 2026 02:01:29 -0700 (PDT)
Message-ID: <1a5a1371-421b-409f-bda2-63f1f29a3966@linaro.org>
Date: Tue, 21 Apr 2026 11:01:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/misc: Fix the valid access size to the avr-power device
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org
References: <20260421082935.85995-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260421082935.85995-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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

On 21/4/26 10:29, Thomas Huth wrote:
> From: Thomas Huth <thuth@redhat.com>
> 
> Accessing the device with in non-single byte mode currently causes
> QEMU to abort:
> 
>   $ echo "writew 0x800064 0x4142" | \
>     ./qemu-system-avr -M mega2560 -display none -qtest stdio -accel qtest
>   [I 0.000000] OPENED
>   [R +0.001784] writew 0x800064 0x4142
>   qemu-system-avr: ../../devel/qemu/hw/misc/avr_power.c:58: avr_mask_write:
>    Assertion `offset == 0' failed.
>   Aborted                    (core dumped)
> 
> Set the valid max access size to 1 to fix the problem.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3393
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   hw/misc/avr_power.c | 3 +++
>   1 file changed, 3 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

and queued, thanks!

