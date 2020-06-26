Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jooZN-0008RD-V4
	for mharc-qemu-trivial@gnu.org; Fri, 26 Jun 2020 09:39:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jooZM-0008Pv-0m
 for qemu-trivial@nongnu.org; Fri, 26 Jun 2020 09:39:04 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:37459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jooZJ-0008S7-MY
 for qemu-trivial@nongnu.org; Fri, 26 Jun 2020 09:39:03 -0400
Received: by mail-oi1-x243.google.com with SMTP id 12so1579653oir.4
 for <qemu-trivial@nongnu.org>; Fri, 26 Jun 2020 06:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g6rP+I7OcxR0JAnDkJ0llpNmylekoaWGwlpiJZqQuGQ=;
 b=KLt3w1Z7TIZW6DU3B7B+0BTVY7GMOmt1Mgf0R2bJ2NgjQ9aTnIK8w6QrItrVuzboVJ
 rfdLIllUXEi+CZRujO/g51Vmv4HC/I2NDgYghnZ9RzJzYFs/2uP2LB7yGFW50J7oIoJx
 FmOH95VjD0SNUjEF7hj6JoQcFms2aLZO8oGrcQB5Fyu3vKHa82/qgDM2oihoRuU11HLe
 zJ7550tlJ+tM64ddUeRizGze7khJG3Sy7bkodwdGYH7QSBNDrYhWU390rA5LEMYZJjhH
 0NvDHj9A1b/PX8vRGdyBfrqqcGV9I2VppVM0VPKcwoIqVudYvlSmstOPFFUPMk5nzwto
 WGQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g6rP+I7OcxR0JAnDkJ0llpNmylekoaWGwlpiJZqQuGQ=;
 b=BM3obyJLU2GbzapDcQ5qv5gHrQ1oBBR5Egz8C/Vz4k18pV+W8K0TuLS+pvxoaA0P+x
 ep1rfOeMmt9AQeo/xhWgLjPKVTVqPGrNrd8PIbbC99pr+MiHm2ABcrdIYCfHSbGG2cB4
 ffOvo+A1bz8N1kUZCc7Rw+w/clFkMnTU2bHwtZmEi5sGEkp9aC5tDVwbe+eyQH5jSXjJ
 +6el45sJFnBgg8qOXvuPReIRUjNDkksC51K9CrU4W78V9UZS7Fyw2n5xeVJeN3XYRxA2
 bpwKsLwKLHYDtoRQnxkhSPzDoAV2nBYcRjAg4yFj+kvzmPHCexlivecMRbvAYBwSmgng
 OPmg==
X-Gm-Message-State: AOAM531XATHS50BQ3g856PMnGSyojooYBMmmI16OAJq3/BBgfi9h/be4
 QyDKEPENSFw3Ye1rfkL6uTejdb04pJTOEBGggrf6vg==
X-Google-Smtp-Source: ABdhPJwFVbeelNmlR/2iQBDQq4UYCMbXhBak0Vw3g5umyciLpQeZBmjN0hSMWSaxUE0JFNTHO4fz1cfqzSzUDzrsNYA=
X-Received: by 2002:aca:1a07:: with SMTP id a7mr2442216oia.163.1593178740487; 
 Fri, 26 Jun 2020 06:39:00 -0700 (PDT)
MIME-Version: 1.0
References: <CA+XhMqwDLw2BJ9Cf0kEyUW+J+rTPOOvebRPPkBSiWdD50wct5Q@mail.gmail.com>
In-Reply-To: <CA+XhMqwDLw2BJ9Cf0kEyUW+J+rTPOOvebRPPkBSiWdD50wct5Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Jun 2020 14:38:49 +0100
Message-ID: <CAFEAcA8mpiPcwgz9-7c0GgSWz2hujzegOBvHn5qasCBtuyG8ww@mail.gmail.com>
Subject: Re: [PATCH 1/3] haiku build fix second batch
To: David CARLIER <devnexen@gmail.com>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x243.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Fri, 26 Jun 2020 13:39:04 -0000

On Fri, 26 Jun 2020 at 14:02, David CARLIER <devnexen@gmail.com> wrote:
>
> From 95ef79ddff73eebd1f1bec6673c2c68209fab107 Mon Sep 17 00:00:00 2001
> From: David Carlier <devnexen@gmail.com>
> Date: Fri, 26 Jun 2020 13:56:14 +0000
> Subject: [PATCH 1/3] Include endian.h for Haiku to solve bswap* macros build
>  failure.
>
> Signed-off-by: David Carlier <devnexen@gmail.com>

I'm afraid I'm now confused about which is the right version
of the various patches you've sent to the list. Our
https://wiki.qemu.org/Contribute/SubmitAPatch
documentation asks:
 * Include a meaningful cover letter
 * When resending patches add a version tag
 * even if you only change one patch, you resend the entire series
   and mark it as "v2"

Please could you send the whole set of patches you'd like
applied, with the subject header including "[PATCH v2]" and
with a cover letter email that describes the whole series?

thanks
-- PMM

