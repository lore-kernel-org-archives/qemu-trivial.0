Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l58RH-0005hJ-DE
	for mharc-qemu-trivial@gnu.org; Thu, 28 Jan 2021 09:38:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l58RD-0005fZ-6P
 for qemu-trivial@nongnu.org; Thu, 28 Jan 2021 09:38:24 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:33651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l58RA-0006Ce-RT
 for qemu-trivial@nongnu.org; Thu, 28 Jan 2021 09:38:22 -0500
Received: by mail-ej1-x629.google.com with SMTP id by1so8151019ejc.0
 for <qemu-trivial@nongnu.org>; Thu, 28 Jan 2021 06:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BOUtrUQbu4v4DcBOyp3QHTI9z/QDDXd95PtlE1x7RnU=;
 b=esnld8CMrPBUhXNe/av8piYuONGbvNGhHTxp571wsxa00L0pCrdGBsLTOo/PYzz/5D
 xEVul5br5U2/dA+q23ucGHf1rlBDCG1LdLHRngyO8no5Ow/2mAIg2CP/SEYx/zFRL1jd
 dwCUYLUIUTTHm99DV/VexRIbzWY3nPOkPoYJaKME7+3GxVa0HvCV6loB3if/dDrEsStS
 p1KCq0LCXJcmOz4OtFSlkVwEwf3z6xZRSrCaqcI4VsqK1FkyHGFNeXhNsdx11dnIXuvl
 1u+VGG57g0KLEukT4cCeAxM9sKsae2ySokq0RiV8nHtxDK4sMfihWLbDPoVd0PJx8Fqr
 PSMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BOUtrUQbu4v4DcBOyp3QHTI9z/QDDXd95PtlE1x7RnU=;
 b=EasWa/cDrOBaIcTENJaf7edjCkax3jzuZwnWNQCGBAx8gvUS8qSHt0IZHllj4N9PMK
 3+UQjFkkfJeq/bGL4kCmCDKaEfLyQhAS8Ha5PYmGYCRyp+xcAbX1lU9AFxnaLr7IBPol
 a5N4Z5p2XRgdUEbMAaiiOCV6EDAK3pZA60EZTqtkj2i3C8spT+AaLUNBCA6Wpuh2N2UG
 oWGNZwiVRMszIbDYRnIMqgMIyXVyHm8ylbCg3MJYgO4iCEympK+YSJgWtzS4x+99EQAJ
 y0L98SIZxfT9R06AvJAfo7/hmeV4Ezx7ruGFYSrrcY3YNKYM4ixMKVnFvQmTj19W7j29
 F0Dg==
X-Gm-Message-State: AOAM5319ngVNGnzl5iQwlbZybYDr8IA761SEvNL6Le1yDclqB5csm2CU
 eQqA33t4tZ4Lgf0jt78Ae/QB5vzTT1C3A6lz6QREbQ==
X-Google-Smtp-Source: ABdhPJyI9TP7ov/1P3UAanPd7JEGWctGR4ePuKKd78/7NTmQGUnfYq4SNeZPdcUlbeR/w8K5PKpmVOG/W4c10dXiMqg=
X-Received: by 2002:a17:906:2747:: with SMTP id
 a7mr11928329ejd.250.1611844699361; 
 Thu, 28 Jan 2021 06:38:19 -0800 (PST)
MIME-Version: 1.0
References: <20210128143102.7834-1-michael.nawrocki@gtri.gatech.edu>
In-Reply-To: <20210128143102.7834-1-michael.nawrocki@gtri.gatech.edu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jan 2021 14:38:08 +0000
Message-ID: <CAFEAcA-tj9+WETE-Jsq0Wt5xHZcX2ysx7BB-jNrVY1X4xravHA@mail.gmail.com>
Subject: Re: [PATCH 0/1] target/arm: Fix SCR_EL3 migration issue
To: Mike Nawrocki <michael.nawrocki@gtri.gatech.edu>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
 QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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
X-List-Received-Date: Thu, 28 Jan 2021 14:38:24 -0000

On Thu, 28 Jan 2021 at 14:31, Mike Nawrocki
<michael.nawrocki@gtri.gatech.edu> wrote:
>
> The SCR_EL3 register reset value (0)  and the value produced when
> writing 0 via the scr_write function (set as writefn in the register
> struct) differ. This causes migration to fail.
>
> I believe the solution is to specify a raw_writefn for that register.
>
> Failing invocation:
> $ qemu-system-arm -machine vexpress-a9 -cpu cortex-a9 -nographic
> QEMU 5.2.0 monitor - type 'help' for more information
> (qemu) migrate "exec:cat > img"
> (qemu) q
> $ qemu-system-arm -machine vexpress-a9 -cpu cortex-a9 -nographic -incoming "exec:cat img"
> qemu-system-arm: error while loading state for instance 0x0 of device 'cpu'
> qemu-system-arm: load of migration failed: Operation not permitted

I'll review the patch later, but for the moment just a note that
I'm pretty sure this is not the only issue you'll run into with
trying to migrate an AArch32 TrustZone-enabled CPU.
https://bugs.launchpad.net/qemu/+bug/1839807 has the details
but in summary we aren't migrating the Secure banked contents
of cp15 registers which are banked Secure/Non-Secure. The
symptom will be that migration succeeds but the guest doesn't
behave correctly on the destination/after state restore.

thanks
-- PMM

