Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kdEfW-0002TX-28
	for mharc-qemu-trivial@gnu.org; Thu, 12 Nov 2020 10:37:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdEfU-0002RI-SY
 for qemu-trivial@nongnu.org; Thu, 12 Nov 2020 10:37:48 -0500
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:43554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdEfR-0007zH-HP
 for qemu-trivial@nongnu.org; Thu, 12 Nov 2020 10:37:48 -0500
Received: by mail-ej1-x642.google.com with SMTP id me8so8437077ejb.10
 for <qemu-trivial@nongnu.org>; Thu, 12 Nov 2020 07:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EtEI5Q4U/QascOeY/zwdZKd6fPB1Koi4hWWnSw3WvWY=;
 b=Y6J/KXi9zL7zY+koy8kAnEgbg+SUhvgs7w5OFWW0LKvVerbpb/5gGLAoNHa+bXnXiP
 EfX1hbBHg8fkk92SD+/Va899gUXexjZT1eeo1Y46HDEkq/RypBkan7FH0iJyxa2Y7H18
 HtK11MsfWQ6IRELm3Q51/lKZnDhXd3Uc6eojZj/MPiDt7Hjf5Xap0YBth7/qlR4Y9qTX
 RhaNicl1EIS3TPa/pJVB1PW7CykuqXO1U2k8TkLl0JoeVP4l1RJus9Z9UZ0fgZ77+xyj
 WR5npjkQf4Yp/pcM8Nkh4PJQ9gPeNaw0OSBwbYmnxDgX7iDIoxBNmg4arsuRYdjZaytz
 D1pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EtEI5Q4U/QascOeY/zwdZKd6fPB1Koi4hWWnSw3WvWY=;
 b=cxf01CPpYLQ2hzyfkszVHdLYXb1N+dyi2OpnSN27N2LPsYO7FGI1S8CHiVWZAaJj6q
 waP+fnHme6j+OLaihiW68IKNl+BdEQVJ3J1rBraGfq5Z0QBCihPxpozbjiFQU4XBeEs5
 LB3G2ueNWx+s9NF/1SjRfgUk0ySifdiYd0N5QxTKkSce5Fr+nGl05yFcEfCOIgguG9C7
 4S2Jj9LgMdvljzSEmFNdKRAvpzgzjiNn/vmVUAqAgxa4M8u9KqCf0yR6+sTPl39k3wdN
 ZOmSg9588p/T86DT8ayYltV8gBXi66jK4Ar38tKMP+cRGTxq9NBBsnUkJ7CrHX6+ArYn
 /TPg==
X-Gm-Message-State: AOAM533dT74IaLaUGxAl35rSdmDG9VGxHGCdYCfR2rMUZMRnhbk8AUg4
 MRZ08+sRNykE56vl4zPSyJ5eTnyDwRrrBHjzrCr1OrowvI8=
X-Google-Smtp-Source: ABdhPJwqEJWPj7/8thjmpMHwl3tdxAeENsyJxhdfjzd1eZ2UuMutpkIae9nhtLvPFscqlEI/qDkNcMCPsn4xn0Qr9HI=
X-Received: by 2002:a17:906:6949:: with SMTP id
 c9mr30730830ejs.482.1605195464150; 
 Thu, 12 Nov 2020 07:37:44 -0800 (PST)
MIME-Version: 1.0
References: <20201101133258.4240-1-peter.maydell@linaro.org>
In-Reply-To: <20201101133258.4240-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Nov 2020 15:37:32 +0000
Message-ID: <CAFEAcA8ypMwheOKZ5MYdjNK8osD98n5eFVFHb9Xx2Dsd2=1Fsg@mail.gmail.com>
Subject: Re: [PATCH] hw/input/ps2.c: Remove remnants of printf debug
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 12 Nov 2020 15:37:49 -0000

On Sun, 1 Nov 2020 at 13:33, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> In commit 5edab03d4040 we added tracepoints to the ps2 keyboard
> and mouse emulation. However we didn't remove all the debug-by-printf
> support. In fact there is only one printf() remaining, and it is
> redundant with the trace_ps2_write_mouse() event next to it.
> Remove the printf() and the now-unused DEBUG* macros.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org

I'll take this via target-arm.next since I'm putting
a pullreq together anyway.

thanks
-- PMM

