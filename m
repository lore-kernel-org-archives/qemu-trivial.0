Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sPIsl-0001uy-4h
	for mharc-qemu-trivial@gnu.org; Thu, 04 Jul 2024 05:36:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sPIsj-0001ty-0u
 for qemu-trivial@nongnu.org; Thu, 04 Jul 2024 05:36:01 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sPIsL-0002rm-8C
 for qemu-trivial@nongnu.org; Thu, 04 Jul 2024 05:36:00 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-57ccd1111b0so308029a12.3
 for <qemu-trivial@nongnu.org>; Thu, 04 Jul 2024 02:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720085735; x=1720690535; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HmY7sgA1giYdLexKfeUXxNv0Ke5XVPxlGYl4+WbrtEw=;
 b=pdD+zizt1mlQCf13Ztpgbry5ye/aVL7yOMz33bNh/zuUrEk57sPDIF/MwmzAvTytPi
 aB6g0d+6p/+rBFkVKp+BtjvJIi4QD/IMzS1KpLOkAZDYFH0o3AkMeuIjtUxhrl2549Ld
 ON7I4m6ym/T7xo1spPkzTcYT1aivsrncbGCkFr9vCRHZKBGLsgSvHZjb6tREceH7FQ0g
 2MoLSme5I64boiJJYzAX1SoAmqN2/pUqO+XbPTriBqaehUKNEVRAHzdYtihuWFNWf+w1
 My8Supg1Dh4LItFgtzcM/BpG0nsmn8KJ2iA4tnlYTWshAnNTC80Ke+/N1s4ppK+OBp03
 QegA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720085735; x=1720690535;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HmY7sgA1giYdLexKfeUXxNv0Ke5XVPxlGYl4+WbrtEw=;
 b=DJybFoSM6HDCKWMmtezEUL39rF8lqPqn4tjZnSpuISdqZkcqKxCHEGHq0QFVW+qerD
 1EB94isrJfz2ZSg139G4ItZMqCgVWvIlR6PFI+hE7yeV7fCbHl25XrJFmwVtTk9fJUy5
 TChlfSQiYVhbXj774VXiGcDjD3+642tQz/UXNs+WF2LPEAIWFbYWav0S9H04t974Jjq5
 7CVV67cdycZBDax8jIE022Dwc0rcSpQICWQrhPiS9O6+P5rzMgZQ48ToO+iWHVtLIznO
 k6mIWqUM/+I5g1NPqtStKlu4YNU2RbHMqVtcCM+jGJD0SN0XFQcVwjRFZlzE6vpf8ODn
 zS7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUo/JsZUnVCVX8+EXF5nSzIVmK6r2CP4gMnKjBFHTVofR/HPG2rm2XNbuJKSaZFnSd5WTGCt8jtmd3BRU0VXbIWy79qKU2Msg==
X-Gm-Message-State: AOJu0YyN+g5llLXtZWUFqxYqaRYEk+WgPpAgeqcZqy79wvoPQudjH4bT
 38v7mFXSCcnjgELs8P+/XhOSta1uSM20Bkj1K2IyzpJqIdV6jt6q/ERxQQ6IOV5OyL1ySaEh8yx
 Y1LjKl5xuUDo5jTv5heA1xx+/3x2jqpPJpTQyTw==
X-Google-Smtp-Source: AGHT+IFbTR1Ef8u6fiv4NGrNg+TDdT/8wn4LheWeXDbrLfZ5rFHVZYOsQZhTrUGZRUFyhc0OfK7HzcqhafOmq3me9r4=
X-Received: by 2002:a05:6402:b29:b0:58c:3252:3ab8 with SMTP id
 4fb4d7f45d1cf-58e5bd7d6f3mr938422a12.37.1720085735488; Thu, 04 Jul 2024
 02:35:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240704084759.1824420-1-zhao1.liu@intel.com>
 <20240704084759.1824420-2-zhao1.liu@intel.com>
In-Reply-To: <20240704084759.1824420-2-zhao1.liu@intel.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 Jul 2024 10:35:24 +0100
Message-ID: <CAFEAcA9CLhREMhbNs4MU8+YfjLoZBeQR3Y1Hjtxs3g6AAdCxYw@mail.gmail.com>
Subject: Re: [PATCH 1/4] accel/kvm/kvm-all: Fix superfluous trailing semicolon
To: Zhao Liu <zhao1.liu@intel.com>
Cc: Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 04 Jul 2024 09:36:01 -0000

On Thu, 4 Jul 2024 at 09:32, Zhao Liu <zhao1.liu@intel.com> wrote:
>
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> ---
>  accel/kvm/kvm-all.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index 2b4ab896794b..64bf47a03300 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -3878,7 +3878,7 @@ static StatsList *add_kvmstat_entry(struct kvm_stats_desc *pdesc,
>      /* Alloc and populate data list */
>      stats = g_new0(Stats, 1);
>      stats->name = g_strdup(pdesc->name);
> -    stats->value = g_new0(StatsValue, 1);;
> +    stats->value = g_new0(StatsValue, 1);
>
>      if ((pdesc->flags & KVM_STATS_UNIT_MASK) == KVM_STATS_UNIT_BOOLEAN) {
>          stats->value->u.boolean = *stats_data;

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

