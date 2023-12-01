Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1r90qc-0002Wd-8x
	for mharc-qemu-trivial@gnu.org; Fri, 01 Dec 2023 05:34:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r90qa-0002WA-CQ
 for qemu-trivial@nongnu.org; Fri, 01 Dec 2023 05:34:12 -0500
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r90qY-0002F4-MM
 for qemu-trivial@nongnu.org; Fri, 01 Dec 2023 05:34:12 -0500
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-50bba815f30so2670784e87.2
 for <qemu-trivial@nongnu.org>; Fri, 01 Dec 2023 02:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701426848; x=1702031648; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=c5iZ6p8KI2BDZxQ/lnUtD7QcF4BNQHLsHWsBSL0yBfk=;
 b=i6CNQQgGiBpoYc6kbHfcBm9LCSsQwf3eXqAMjm+bMJwkXMnDzD5Ps9Ie65tyTAZLbr
 o6AuXoCTig0M7z6XLQTd3f4IJ5sYQpcG+FsJxyEX46558GwX1blV6Y6odUG531tG5spX
 4txyDByy7xhW6R9c9iDme6b7rfVLHmXOOxQ65gVeni1H3W8/0JHcbgWMmOSfDTHvNAJ7
 7IPuhrstdm3qEED4XYgSGgZgSwl+7qCWgHr+MPW8/Wlv7nx36bbZWBv+ab2fm7az3Q/n
 T+jL1eAS+p9JxZ3f4GADXqVwLtUpDtqDeqwKNsfQWkkz5fe9ctRYBJYr4dh8B8JYTcwB
 Ds8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701426848; x=1702031648;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=c5iZ6p8KI2BDZxQ/lnUtD7QcF4BNQHLsHWsBSL0yBfk=;
 b=mLc3EoVyZyAGxmrPYjQEGNT/9JVCdnBoPbGdgAEQqvcDuShJcgcB2edhO7YsPBaIKm
 YqgRUG/CQ2gG9lCkZmuFp67ogGbgfwFK+sn2X3/sOku7IxX+MqVlHdLXpQsL0NBhQp22
 zeFFH31edAyJyYfSljEllx8JXvwzObBj94vwAnfp0l2N3VOw2YfuCFjC7p2gCTKImhTj
 ulMCDo8ZuWtzByqbGelg483r3TxmjDMpngYDcgiAUEjLSapsrs5Lur+A3ciFL2KRyOO8
 nszTDIkWPpmuLWWvB45jS9WO14AuMxaOrzy76FTwqAJpOf2kms8UHlsINbM2GYksAaul
 jYZA==
X-Gm-Message-State: AOJu0Yw+GLXbLnDvSMiUE0UDcDn+GIujQZdk229a+MXG8Y9bUm3g6DOV
 RkJ0j6nswod8/HgMhaNsBtx4oQ==
X-Google-Smtp-Source: AGHT+IEEKVMlX8VlSgQ5gho18q/xdxh2nYR39vdkI3nj5727df+Xm3z7gEeZp9KH/AphJNG6bwV9Uw==
X-Received: by 2002:a05:6512:3286:b0:50b:d764:8e73 with SMTP id
 p6-20020a056512328600b0050bd7648e73mr319747lfe.133.1701426847996; 
 Fri, 01 Dec 2023 02:34:07 -0800 (PST)
Received: from [192.168.69.100] ([176.176.160.225])
 by smtp.gmail.com with ESMTPSA id
 g18-20020a05600c311200b0040b42df75fcsm4942802wmo.39.2023.12.01.02.34.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Dec 2023 02:34:07 -0800 (PST)
Message-ID: <5ad86689-322f-42dc-8901-ca4b12591397@linaro.org>
Date: Fri, 1 Dec 2023 11:34:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] accel/kvm: Turn DPRINTF macro use into tracepoints
Content-Language: en-US
To: Jai Arora <arorajai2798@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, peter.maydell@linaro.org,
 alex.bennee@linaro.org
References: <38e5b2bff5475185eeb528f6b73140c47ae00b82.1701394286.git.arorajai2798@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <38e5b2bff5475185eeb528f6b73140c47ae00b82.1701394286.git.arorajai2798@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 01 Dec 2023 10:34:12 -0000

Hi Jai,

On 1/12/23 02:36, Jai Arora wrote:
> Patch removes DRPINTF macro and adds multiple tracepoints

Typo "DPRINTF".

> to capture different kvm events.
> 
> We also drop the DPRINTFs that don't add any additional
> information than trace_kvm_run_exit already does.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1827
> 
> Signed-off-by: Jai Arora <arorajai2798@gmail.com>

Please keep previous tags if the patch is identical:

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> ---
> v5: Adds Reviewed-by tag as requested by Alex Bennee
> 
> Added it now, thanks for the feedback. :)
> 
>   accel/kvm/kvm-all.c    | 28 ++++++----------------------
>   accel/kvm/trace-events |  7 ++++++-
>   2 files changed, 12 insertions(+), 23 deletions(-)


> diff --git a/accel/kvm/trace-events b/accel/kvm/trace-events
> index 399aaeb0ec..f61a21019a 100644
> --- a/accel/kvm/trace-events
> +++ b/accel/kvm/trace-events
> @@ -25,4 +25,9 @@ kvm_dirty_ring_reaper(const char *s) "%s"
>   kvm_dirty_ring_reap(uint64_t count, int64_t t) "reaped %"PRIu64" pages (took %"PRIi64" us)"
>   kvm_dirty_ring_reaper_kick(const char *reason) "%s"
>   kvm_dirty_ring_flush(int finished) "%d"
> -
> +kvm_destroy_vcpu(void) ""
> +kvm_failed_get_vcpu_mmap_size(void) ""
> +kvm_cpu_exec(void) ""
> +kvm_interrupt_exit_request(void) ""
> +kvm_io_window_exit(void) ""
> +kvm_run_exit_system_event(int cpu_index, uint32_t event_type) "cpu_index %d, system_even_type %d"

Nitpicking, the uin32_t type is unsigned, so its format is "%u" ("%d" is
for signed). Also, if the type is uint32_t, the preferred generic format
is PRIu32 (see for example the kvm_dirty_ring_reap trace event earlier).

Regards,

Phil.

