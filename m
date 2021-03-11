Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lKQbY-0000Wu-B0
	for mharc-qemu-trivial@gnu.org; Thu, 11 Mar 2021 14:04:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKQbQ-0000TS-Pe
 for qemu-trivial@nongnu.org; Thu, 11 Mar 2021 14:04:10 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:39414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKQbO-0006om-Ab
 for qemu-trivial@nongnu.org; Thu, 11 Mar 2021 14:04:08 -0500
Received: by mail-ej1-x629.google.com with SMTP id p7so37112877eju.6
 for <qemu-trivial@nongnu.org>; Thu, 11 Mar 2021 11:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wPrPjCtHr/VVuVBVxvmWBB0IFWWKURKt2u5lBkFC14c=;
 b=pItZojk+ozYF8Kq35MCsEWQ0E9NDuje4jhFIM9nkASEX8kLfoJJ8oEhzAIzIRLgvWe
 KIX7nxq7FErCdl4BgiXBwkAvplpaatI6uAu/o8DyYYdLr50+2Af87eLcsFQrWDrdPI3t
 w6/8gxNA6ORb/PIwiUydcIczZhjWH/h7Dvc1D4Hxv9cIo9J0NX1IODDyVipKxHpKq9Z/
 D9fVLvoJr/BwDINog9rkFC5/Gn2cajX7XmHdmldh5YFwb8lvGgbvc8QW2WAkJ8+KS4y3
 8HNIW7O/dl2jmWNSj7ktEcI9qEGGX3Ln0G1Hg6je3mmjaeNWGZ+4gB3Y/kqGhhn5PSR3
 0irQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wPrPjCtHr/VVuVBVxvmWBB0IFWWKURKt2u5lBkFC14c=;
 b=ksWXfdvOb+mkXjCwxlFt304RbiJtI1sdZnwEPvOFoyrSkqWpAlw8DieKHMRkbS0xOZ
 Sgqt+LshCzkn/Uq+kU4iQZwSiSlhR2hlrCXrQwSBN/XRJDd9M1KUgO4m3Xikl9uapPDr
 FKJNeaNTD6IymHCJTy6XQPWyOPfecO63985b6zVZPD1Jp6IUHNnKWMFXRgzpGltQ1bTZ
 XgAP8ES1S8gec1Gm8DemdakE1kSOpNz3GYHACay6Bh7bM05wFWKu8AXmNUOwPf5Wj7kN
 vaYP6dWck+o0e+rBZGvmq4czBYSOyPDBrxEc87hG2SS/O7iZqYqYDFuoat0epOtsqrZZ
 6zFQ==
X-Gm-Message-State: AOAM532R8gd/IEIK4xW4pq6Gov0tENxjJadM4+8TMFVqUG3g17QSNMfB
 fG0j3P4zR88epuV4xZpDhMXe8GL1Rl4lDQD1zOAxbw==
X-Google-Smtp-Source: ABdhPJzCj/z+QX5tXSwEj1nz8e4NZ7UPdDsbzrH6S6gM4QJv4POwwQSimVcfLd8L22w71u+sSkT6SfMRWhu8aLtzCiE=
X-Received: by 2002:a17:906:16ca:: with SMTP id
 t10mr4575790ejd.85.1615489443305; 
 Thu, 11 Mar 2021 11:04:03 -0800 (PST)
MIME-Version: 1.0
References: <20210310214504.1183162-1-laurent@vivier.eu>
 <0a9adc53-f0ec-f3fe-ad1f-197ec89fd491@vivier.eu>
In-Reply-To: <0a9adc53-f0ec-f3fe-ad1f-197ec89fd491@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Mar 2021 19:03:44 +0000
Message-ID: <CAFEAcA-OcKZEFvpZk4hPXF8FWLq6qzWRq9e2hF31KfQ_gv_nhg@mail.gmail.com>
Subject: Re: [PULL 00/22] Trivial branch for 6.0 patches
To: Laurent Vivier <laurent@vivier.eu>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>, 
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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
X-List-Received-Date: Thu, 11 Mar 2021 19:04:11 -0000

On Wed, 10 Mar 2021 at 21:53, Laurent Vivier <laurent@vivier.eu> wrote:
>
> Peter,
>
> my "git publish" has failed at patch 20 with:
>
> Requested action aborted
> Mails per session limit exceeded.
>
> I think my email provider has added new limits :(
>
> can you merge this PR without I have to resend it?

Yeah, the cover letter is the only bit that's critical to the
process; the rest is just archive/information for other list
subscribers about what went in.

-- PMM

