Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n5UjF-0003Zm-9k
	for mharc-qemu-trivial@gnu.org; Thu, 06 Jan 2022 10:31:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5UjA-0003X7-KC
 for qemu-trivial@nongnu.org; Thu, 06 Jan 2022 10:30:58 -0500
Received: from [2a00:1450:4864:20::42d] (port=46831
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5Uj8-00082e-Mo
 for qemu-trivial@nongnu.org; Thu, 06 Jan 2022 10:30:55 -0500
Received: by mail-wr1-x42d.google.com with SMTP id i22so5452295wrb.13
 for <qemu-trivial@nongnu.org>; Thu, 06 Jan 2022 07:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=SPT9VI7GBl6WYs/pCOqgYRgyVBO0CYt8yUXoSIbF61k=;
 b=tbvsiy7c30FoGlu0GdYS1YupcFf+ut7L8YnCSodpnWMmUtcebxHeS+17rCZ6/CI+xu
 IB3L3EnYPz4U0kgVdLA/mAGat9aBulOiPs7YtQ4Fznz30a4f46W8OI+Zr9DosywHKR/G
 r7w6tjlyU82XZKaJKJ3gs/84U0kkAb4GWXTmi4RsT/+uA/R0LoE3k+91do7Wjr0pPhfS
 WxlgEzE/33kJd0h/KSbw2+H0lPEhy1XlywQndNzKrg2Bchff3M/8lbayu+9y1q2twNHC
 BByyNRzpR3xqfeaGrupFUgimNeUxgiZh7SN/74COlPVasW/G+3M2uXZjjH5ZmoR3VFze
 2Nkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SPT9VI7GBl6WYs/pCOqgYRgyVBO0CYt8yUXoSIbF61k=;
 b=k81QYSRjaWKrL05AWhRZQyNYDrIOUhmUzRykxaO8LJSu34GpqrQa9gQ1fR0iFFZmxq
 C/YY9QJQMUJZfxvQWaQcJl71Yl2zQwKcAQcDwpHfLqDSneNIryzzOJdevTfZyY7QsVaO
 O7JU+OnaL/vTxD8NmrqjLJWFIQHYirHQEW8T8eSlbNbWyOMjerJjMOUMKXtc1Gne+R2h
 029hiK+nzlxJFAg0VU44GjUpgP/dfU/MYv7eqigpfc5+18pktX8QMp2Cj1d6rQ5jseyC
 E/HQGJjcWpvDojO36Xrf/IiGdIRjzt3fpMZwV6tuJklReOmQm7gHWGPKQ0ORz0YRzhe4
 d6GQ==
X-Gm-Message-State: AOAM533nflZV+qHbaeha2bOLHB8GTapXV+nT/lx8DBLBtyU1wVA+e4Np
 SQaUcKx03/uSDxyYEpdKztMJwQWUh3f+9xTAbShlVQ==
X-Google-Smtp-Source: ABdhPJzj0ZI8tArgp0lJ8YdMPfO/KHuF9Os78gXftew06Jd7spRTCySByVZNG2XdBjIWkheL+hVs5tHKM+Rz9HubmyU=
X-Received: by 2002:a5d:6986:: with SMTP id g6mr59268wru.172.1641483053225;
 Thu, 06 Jan 2022 07:30:53 -0800 (PST)
MIME-Version: 1.0
References: <20211218130437.1516929-1-f4bug@amsat.org>
 <5a44d69a-3db9-6629-50b3-dbf48ab4f8d5@amsat.org>
In-Reply-To: <5a44d69a-3db9-6629-50b3-dbf48ab4f8d5@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Jan 2022 15:30:42 +0000
Message-ID: <CAFEAcA_=eMh4RMTwyhgnxiDmS_RurnAZ97FR6dFd9rmi6FfYMg@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] hw/qdev: Clarify qdev_connect_gpio_out()
 documentation
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 06 Jan 2022 15:30:58 -0000

On Thu, 23 Dec 2021 at 09:05, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Hi Peter.
>
> Since you reviewed v1, and Ack-by on v2 would be welcomed.
> Otherwise, if you don't object, I plan to queue this via
> machine-next tree.

Been on holiday since mid-Dec :-)  I see this is already
upstream, which is fine, I have no objections.

-- PMM

