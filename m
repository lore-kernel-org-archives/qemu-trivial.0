Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pMvgA-0000kX-FE
	for mharc-qemu-trivial@gnu.org; Tue, 31 Jan 2023 13:48:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pMvg8-0000h8-S7
 for qemu-trivial@nongnu.org; Tue, 31 Jan 2023 13:48:24 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pMvg7-0000u8-DT
 for qemu-trivial@nongnu.org; Tue, 31 Jan 2023 13:48:24 -0500
Received: by mail-pg1-x52a.google.com with SMTP id 141so10770150pgc.0
 for <qemu-trivial@nongnu.org>; Tue, 31 Jan 2023 10:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8w7oPZU3khxNecWU+59JWC+ApepEBmgIMZeQYyhg21c=;
 b=F3GqmWMAtc1JTdwE5HYamNuVsRnUZzYRpYu6a18z1aANZAnMS//WmpObacdMFbC1wU
 kqd5syEWlVzQb78RDdjzi+duHoTCHfsrK5bcArDgtrMF14+W4OEKTWAq/xRWUzltTk3m
 EhRForDhGlAT2qJYwEc4+msea3Qm7ilRhcHidtJMoDM7FMCqMjviNh12it6kr+O3VP5D
 qehPXOg2lkGU28myOxmtg/i2v2Heo5Hf5aEoIzYTvbgQFjYDHkUxXK366iTVMCmvWb7S
 +vKYE2kODhQINEGR0JxOEJZS7XqX/U5Maa/VwVJeEo997yDMNy/E/LYM2OoUNJ5GI232
 ezhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8w7oPZU3khxNecWU+59JWC+ApepEBmgIMZeQYyhg21c=;
 b=Xq/1T3lDN5gpFRP8WwQA9pb9SImEocu18RgLtahBkDSXSAWIETNZupVhvfThHaYGTc
 FXret6Vz+rOOykYR5WwqAAZhAhgq8kv2UuP/cOwYDT9CogO1ntOfcIHYBCMlsV9ImNJW
 SzbJ5NrGvQpDp7EQXfutRTTLGBuQX+P3ZS7rpheBNGQVtBdMA9CgL22ZxcqllMHFtGd4
 gH7vRYffVzE/2WUq/ibtYU3US/ffM0H3LOoBSePuXIr7MCwmjeJ+oUEGvEjVzg42ITyk
 kgDyQVanwbHXsrz7mrRklVWBIIy3jxo/KP37XOB3k070/w1JWLU32phiyep8mahi3tGV
 Y20w==
X-Gm-Message-State: AO0yUKXOsyxBehi6SDHoYYv0j0XNH1eVlUKrhhi3WCYP325XZzBS49hQ
 7fcx3CKnK2Gvxu7rHnrtmTfQADQpxlb2CSQntzu/nQ==
X-Google-Smtp-Source: AK7set8k0YA/YH/tBzZxDRnC1Gbceo+xNjr09WZ5gPe9KuF8VDQcqHdn09p2SsZa1K+nJUbeJ/o+Bn9l4WK7iVMUrGg=
X-Received: by 2002:a62:f842:0:b0:590:3edc:d2ec with SMTP id
 c2-20020a62f842000000b005903edcd2ecmr4218395pfm.27.1675190901650; Tue, 31 Jan
 2023 10:48:21 -0800 (PST)
MIME-Version: 1.0
References: <20230131182048.15535-1-vlaomao@gmail.com>
In-Reply-To: <20230131182048.15535-1-vlaomao@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 31 Jan 2023 18:48:10 +0000
Message-ID: <CAFEAcA-7S75kL=GOiAO_pem=3RkacGL4mKe6dehibrbLc-k2uw@mail.gmail.com>
Subject: Re: [PATCH qemu 0/1] MAC address falls to permanent
To: Vlao Mao <vlaomao@gmail.com>
Cc: dmitry@daynix.com, jasowang@redhat.com, qemu-trivial@nongnu.org, 
 qemu-devel@nongnu.org, laurent@vivier.eu
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52a.google.com
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
X-List-Received-Date: Tue, 31 Jan 2023 18:48:25 -0000

On Tue, 31 Jan 2023 at 18:22, Vlao Mao <vlaomao@gmail.com> wrote:
>
> A bug was found with the vmxnet3 driver, after changing the MAC address
> and rebooting, it falls into the category of a permanent address until
> the VM is turned off.

For some network device models (those where the hardware has an
EEPROM and we're modelling "guest programmed a new MAC address
into the EEPROM") that is the correct behaviour. Is the vmxnet3
definitely one of the kind which is not supposed to have a
permanent MAC address backing storage ? (It's paravirtual, so
this would hopefully be indicated in the specs for it.)

thanks
-- PMM

