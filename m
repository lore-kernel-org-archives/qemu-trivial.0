Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jvLDI-0007FM-Hl
	for mharc-qemu-trivial@gnu.org; Tue, 14 Jul 2020 09:43:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jvLDH-0007D9-35
 for qemu-trivial@nongnu.org; Tue, 14 Jul 2020 09:43:15 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:43572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jvLDF-0001On-I6
 for qemu-trivial@nongnu.org; Tue, 14 Jul 2020 09:43:14 -0400
Received: by mail-pl1-x643.google.com with SMTP id x8so7039005plm.10
 for <qemu-trivial@nongnu.org>; Tue, 14 Jul 2020 06:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LaymbafiOWcJLlHvWfftD4ZEH6QqzyKcrvc/ye3Z+KQ=;
 b=Tx5dgfcect/pT34P1zIypaUOEMx+XAjBcEfdKW2iqTasy7Wgz/0keJIWsf5mH5dIGl
 9MPVoL/h3Vu4bnEJ6BYNIMC5wy3ggeqzPfbFtjEM+VAAx+foeS7VCZ0aSeUorfPt7Ad1
 YpOX+01/FZpTL7pHWz3WWc7jGJbuuL1C1+BOj0zQQKnAqo800C2sd0dW+bYg4nIQpoew
 zmJw6SWIEFJd7M0xbjZJsGUjfJTAMT8MXBrgo2qk7kMPL76q0r7t8Gg9I6ioSSUW5PeM
 aS6YuIvHxPYrLg8BW0KWk7hgILaExY7TYoAps4IcBO3r2dvt/Y2QeZkXmxMGmJCcaGae
 Fmfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LaymbafiOWcJLlHvWfftD4ZEH6QqzyKcrvc/ye3Z+KQ=;
 b=mEWHaB6mYxBiin4pDnjZCEtrD/WP33ZnABlWY+gr7x+d22UPYj98cLz7qcAgt8H0ZA
 HAD4V2O6m2fjJroHnr83Zh0U4NokWINa7Fx+ngRAS4OYt5IMPco6T8nzt6BkGIjIcco3
 3ayW94NjRs6MItlf6qzO2lV80lB3Sy1DEVnTssnEQuJrFkYIK+EbQLwvDDSxjgLQ6Tap
 LCzzatfvdPFEw2f2RhGu+ulAMCLrNpOWIsnsW2ZSuQIEWfH6sgVlpJFycpfSoPJl+3Lp
 5YZqJ9y2G6NUhtnklRzWcgQ7TeeQCgARzMKKjY6O0RL/HMcTqF6koHXGSaBpt7dC73uD
 UtYQ==
X-Gm-Message-State: AOAM533NK681IAE1k9F7CMOTtql44C6684HMVwEZVt1kWXb6DyXUlemV
 IokUaGI5fxlVZeIBy1MiL2vafSEX7r4=
X-Google-Smtp-Source: ABdhPJzCmYAyZfC3PmAvaZKgQo0Ul8eOncNAv7YoufI9VIkUNbk3fBepFWVJfqp5CfQQ7TV3F2E3ow==
X-Received: by 2002:a17:902:bc44:: with SMTP id
 t4mr3989063plz.290.1594734191995; 
 Tue, 14 Jul 2020 06:43:11 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id nk22sm2760067pjb.51.2020.07.14.06.43.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jul 2020 06:43:11 -0700 (PDT)
Subject: Re: [PATCH] virtfs-proxy-helper: Remove the superfluous break
To: Yi Wang <wang.yi59@zte.com.cn>, qemu-devel@nongnu.org
Cc: Liao Pingfang <liao.pingfang@zte.com.cn>, wang.liang82@zte.com.cn,
 xue.zhihong@zte.com.cn, qemu-trivial <qemu-trivial@nongnu.org>
References: <1594600429-23052-1-git-send-email-wang.yi59@zte.com.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <aa1bcca2-5413-c847-01a2-27d5b8965149@linaro.org>
Date: Tue, 14 Jul 2020 06:43:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1594600429-23052-1-git-send-email-wang.yi59@zte.com.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 14 Jul 2020 13:43:15 -0000

On 7/12/20 5:33 PM, Yi Wang wrote:
> From: Liao Pingfang <liao.pingfang@zte.com.cn>
> 
> Remove the superfluous break, as there is a "return" before it.
> 
> Signed-off-by: Liao Pingfang <liao.pingfang@zte.com.cn>
> ---
>  fsdev/virtfs-proxy-helper.c | 1 -
>  1 file changed, 1 deletion(-)

Cc: qemu-trivial
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

