Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sOwHs-0005ix-Bo
	for mharc-qemu-trivial@gnu.org; Wed, 03 Jul 2024 05:28:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sOwHo-0005i7-Rl
 for qemu-trivial@nongnu.org; Wed, 03 Jul 2024 05:28:25 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sOwHn-00012q-46
 for qemu-trivial@nongnu.org; Wed, 03 Jul 2024 05:28:24 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3678fbf4a91so619318f8f.1
 for <qemu-trivial@nongnu.org>; Wed, 03 Jul 2024 02:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719998900; x=1720603700; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nvDDaddWStiuAEXkjaHTFzNMTV623UXsDh8TnkvvexM=;
 b=lLep8DVlIvQyUj58L/No3Y6iT8lMULDQmctR7pMj93JBesk5PrY+G+DjkzNyPoH7zA
 /AuhNhxixya3NFoeH97Mbd7YV/jcTaTYB4RKESZSL2qI6J3crq4ukZJquZfnA+Hz2T/L
 Sjf/M9up9CbDzXS4GFWTFuycVcV+ajUltIUgcemTtBOy0OUQpXbLFPlzMO/uVXrGeCPV
 z6NtJrTzu/Gyf7GhJdMrWuAjmGSQqcsBtvad/MKmfQ8453VPOn8xO30didf7G3Qdf0r2
 R/KPInPcYpJx87zm3Scx3fWeYY9qFQ8FwKuWO9Ut9VW03y+p1h2E4UifE4uSXHXwkIHj
 ZqIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719998900; x=1720603700;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nvDDaddWStiuAEXkjaHTFzNMTV623UXsDh8TnkvvexM=;
 b=fb8AvEOL5E/gjmUl+T7olTPr5modYttbiIk04NMFJZBvqUh2n2W9LMjH8WNCJqy7DC
 0ArOLKaDUtWzCg21S41tuZGeLcvpVksI0AX2ntsvtTEhuLd5J6qUyGUs3FngA0vH2eAK
 06LCxyjwppq20ms+7W79ldC3nztD4z0FZRCDU+KxPjYJE6w7PanLr3PyymwDoZif825c
 QyZKZQ2O/AJAgAnhj5cEW1aFGG8SMN1ZS9JMiDb1vDFpWdH3BJ1Uw/sx/7TXRau/2s2z
 LszGdsx6ntFKizlUGAOlxeC6O0eI49dlVOWT54vi5JGWgxKQ73On3FEqL/ilYPgfSP5j
 essQ==
X-Gm-Message-State: AOJu0Yw/Cdp1jowzSKIXv2TKnasK+g4qwDpcmTaK1bTBKB6WHTCjQ+x+
 aFBeiz2a08AbGJFZ/lcgy1CCY2XrncUbqtOYs0HZKTWZLtpf6Y57R5AxQDt0Bnc=
X-Google-Smtp-Source: AGHT+IFviZQnl8O20qtv2GdC13H8BHZPoo4pjZezqE4AHPw2v6HQPuYO7KhCzEj6wRdC6AY1yCV8bw==
X-Received: by 2002:adf:f303:0:b0:364:81e7:3917 with SMTP id
 ffacd0b85a97d-3677569e98bmr7228878f8f.3.1719998900451; 
 Wed, 03 Jul 2024 02:28:20 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.220.97])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a0d9ef3sm15445694f8f.46.2024.07.03.02.28.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jul 2024 02:28:19 -0700 (PDT)
Message-ID: <7e0a73d9-705c-4b8e-9d69-ae8c9def55fb@linaro.org>
Date: Wed, 3 Jul 2024 11:28:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw: Fix crash that happens when introspecting scsi-block
 on older machine types
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, yong.huang@smartx.com
Cc: qemu-trivial@nongnu.org, Fam Zheng <fam@euphon.net>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>
References: <20240703090904.909720-1-thuth@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240703090904.909720-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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
X-List-Received-Date: Wed, 03 Jul 2024 09:28:25 -0000

On 3/7/24 11:09, Thomas Huth wrote:
> "make check SPEED=slow" is currently failing the device-introspect-test on
> older machine types since introspecting "scsi-block" is causing an abort:
> 
>   $ ./qemu-system-x86_64 -M pc-q35-8.0 -monitor stdio
>   QEMU 9.0.50 monitor - type 'help' for more information
>   (qemu) device_add scsi-block,help
>   Unexpected error in object_property_find_err() at
>   ../../devel/qemu/qom/object.c:1357:
>   can't apply global scsi-disk-base.migrate-emulated-scsi-request=false:
>   Property 'scsi-block.migrate-emulated-scsi-request' not found
>   Aborted (core dumped)
> 
> The problem is that the compat code tries to change the
> "migrate-emulated-scsi-request" property for all devices that are
> derived from "scsi-block", but the property has only been added
> to "scsi-hd" and "scsi-cd" via the DEFINE_SCSI_DISK_PROPERTIES macro.
> 
> Thus let's fix the problem by only changing the property on the devices
> that really have this property.
> 
> Fixes: b4912afa5f ("scsi-disk: Fix crash for VM configured with USB CDROM after live migration")

(FTR this commit was not reviewed).

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   hw/core/machine.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)


