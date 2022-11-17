Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oveRD-0007vg-0I
	for mharc-qemu-trivial@gnu.org; Thu, 17 Nov 2022 07:56:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oveRB-0007vX-Um
 for qemu-trivial@nongnu.org; Thu, 17 Nov 2022 07:56:13 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oveRA-0000zg-9P
 for qemu-trivial@nongnu.org; Thu, 17 Nov 2022 07:56:13 -0500
Received: by mail-pf1-x434.google.com with SMTP id 140so1685854pfz.6
 for <qemu-trivial@nongnu.org>; Thu, 17 Nov 2022 04:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3H4L/9rfa1Bemqd1kfcwCQAL7GIQ1T+ovNHB/eCpUKA=;
 b=fTMWr1qEStTfC2ytMKYZ1Ik/4TnT30fWQtoR93ymHbSN+DAtRsrvP9lrpsQ/gdx0Gp
 Q4Lv+4WcHT7yyvFt016J+X8w15INZdPJJKlUiqFeYSDVXgPEVGx174vxDXWLGBqY4O5O
 S/QUaGiDRBIig6QhzWBXPZjYaw8X7hi2UG/KrGIurdX+Jz3iu97mkn5MGV1sXehLoah3
 H9+6KV3TUEUjqjhKect99zJJKIreX8bM1AQf1dmlYz+5P/B6uTp4Eo3lnTN4VjAdpEOW
 SAZ7rUxs/51LL4m0D5ct+FTVnlIadzV48GDU2cdznEIg2xbQu/1t25Fe7UusI2YRAJ4R
 Iq7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3H4L/9rfa1Bemqd1kfcwCQAL7GIQ1T+ovNHB/eCpUKA=;
 b=6DBi1vDkb9xoR6H2ca5yj4EU4imloY04fo5/l9IBzZylZ8ojpk0LlOD20ZBEu/t6B9
 E4Oc1Kv6N6EXo6Oc+XVg91ehrBEsTL981COYX+MsO5h6uE87pQS0T1rhnTvo9PbgCiH8
 ojrRiJ1KmGPdxDNxL0LgR0iIcIn8Z5IHKPRXYPtvN1EM+oNdnDtTZxRXQdgWHf0sZREG
 IpsC7EcUu+LtTlJdk41VkTy+Sw/E7zGycj6sh2DBHU6K474brCJ8Lg3Dzl5jJEJc0Q31
 yGaY108921lR4LCjw9/J1KpbTGbV4DjLx0cDrTyyCrh2htRqa3kkc4YV2Eoekjcfj/WA
 Jo2g==
X-Gm-Message-State: ANoB5plqwFZbNZW+pOxlGKctFU6/uXOQXlHaFpLwaznkey4JzXU6LoEV
 cV035Y2CDg57NwL2tyGM+Rt7+Nl/RjHKtkRC4wP+MQ==
X-Google-Smtp-Source: AA0mqf5VpMaAfXIaoB9E5xXxj97/ITUhcEl1HmxNwW+1hdVUF+1BaXl0xYn5/u/JUr8wAaCFnpiUISS/3MFUjNCscA8=
X-Received: by 2002:a62:6283:0:b0:572:698b:5f6d with SMTP id
 w125-20020a626283000000b00572698b5f6dmr2808410pfb.51.1668689770953; Thu, 17
 Nov 2022 04:56:10 -0800 (PST)
MIME-Version: 1.0
References: <20221117124634.574180-1-thuth@redhat.com>
In-Reply-To: <20221117124634.574180-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Nov 2022 12:55:59 +0000
Message-ID: <CAFEAcA8i5GXNKEK+75drx-YqqRxFTFiuwQFvX1sNPjFE0Ckp0g@mail.gmail.com>
Subject: Re: [PATCH for-7.2] tests/avocado/boot_linux: Increase the timeout of
 the ppc64 test
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-trivial@nongnu.org, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-ppc@nongnu.org, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Greg Kurz <groug@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x434.google.com
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
X-List-Received-Date: Thu, 17 Nov 2022 12:56:14 -0000

On Thu, 17 Nov 2022 at 12:46, Thomas Huth <thuth@redhat.com> wrote:
>
> The BootLinuxPPC64.test_pseries_tcg test currently times out in
> the gitlab-CI or when building QEMU with --enable-debug. It takes
> way more than 300 seconds to finish the test in such environments,
> so let's bump the timeout to a more appropriate value.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

I sent a patch for this one last week:
https://patchew.org/QEMU/20221110142901.3832318-1-peter.maydell@linaro.org/
(although it only pushes the timeout up to 360, not 420).

thanks
-- PMM

