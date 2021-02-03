Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l7Jhq-0004pq-OL
	for mharc-qemu-trivial@gnu.org; Wed, 03 Feb 2021 10:04:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l7Jhp-0004nc-Fh
 for qemu-trivial@nongnu.org; Wed, 03 Feb 2021 10:04:33 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:38756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l7Jhn-0002EJ-Ma
 for qemu-trivial@nongnu.org; Wed, 03 Feb 2021 10:04:33 -0500
Received: by mail-ed1-x532.google.com with SMTP id s11so27287848edd.5
 for <qemu-trivial@nongnu.org>; Wed, 03 Feb 2021 07:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sYjK2sNZ7YwEcqxCTbX/55ZyauI7vehyX9IyfM56pok=;
 b=lQDctnkKYpcs6fRIoeluFgdBvEvjdYN7OsEwqcXWX7hBif80rBjcrIOlQqy+VjeDf5
 5jEjqNXxa30xkyeU6kYvcTGG4NO/gcrDvnkLfUAO0IpKhB0DxwG15ImFHfbPQoVhAFrb
 mwvdwzVISMgzaNcCY5WgZickxfjF3IX8RdUQsP0M1F81cJDTsZqEB6rOFBXmyrLBvu0R
 NBEa9GhrIKb5Ksl0BEARPMIhZzY+xcfkINExtCRfi7bU/oX/4qYnjMnyuLTH6JiOtNRT
 PgrYhAQetNmgBTrpP3NLuyyVh+LUEIsKMQBFUBDUleht4Cy1zhfnPW4TzSUwow8oSmPO
 TgXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sYjK2sNZ7YwEcqxCTbX/55ZyauI7vehyX9IyfM56pok=;
 b=gTrhWxraDtpnK1kW3MvqpoeZbjLgosnLfCgYBkFwaBEPLnd+12j60Ri2IHhvjRdkL9
 t3uyx936bp+FmQuAva7Wub0yKA7VqjsBVw9e0XlvhpGqItDQbdMANXKdOg4VsD0LKQZN
 OcDOvjrkoaq3pRyWxs9ITsCvlI8cPNK/E5+Moes/zNQ/Ko06ULVgWiKueDZb3X+FmTWf
 78CvkkjSNBrml/gMQi9FSccq7BpxF/JCnfzm5xaxoTL2FZLPBNb6KzoGuprUYIz5UJ7J
 jRS6WH1nyN8De+OQbtbFNdSg9GQNC5xuSlMBuHi43AL4SG/q/hCSvS9wyANEwQ1LP004
 F5sA==
X-Gm-Message-State: AOAM530DmShymHdNRRf3jpXfqlISyAZmNKLAWlYpm1UfAB0ROIbI8YJf
 nAAKH9GKwmkRwMqtWsZoxCNUOhYPmy9yOWfOYeSWxpzL0eTNrQ==
X-Google-Smtp-Source: ABdhPJyKjyQ3TgIlutnU4Ykci2/Mzy4o2ZZnKNZfjazfTzb2e7H7hcEGyaXPgCJeRcpk0Soe1aM0ubz9Iqk998b3Fwg=
X-Received: by 2002:a05:6402:5107:: with SMTP id
 m7mr3376206edd.52.1612364670122; 
 Wed, 03 Feb 2021 07:04:30 -0800 (PST)
MIME-Version: 1.0
References: <20210128143102.7834-1-michael.nawrocki@gtri.gatech.edu>
 <20210128143102.7834-2-michael.nawrocki@gtri.gatech.edu>
 <CAFEAcA9Wi+jSPEZa2Thft1Q899VW0YyHB8Cb+U86m+WbB-Ns=w@mail.gmail.com>
 <15dbbf3e-3386-583a-4813-4d1a93123d2a@gtri.gatech.edu>
In-Reply-To: <15dbbf3e-3386-583a-4813-4d1a93123d2a@gtri.gatech.edu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 3 Feb 2021 15:04:19 +0000
Message-ID: <CAFEAcA_y2G62w13aK+8tKBGPYUyt8rUFKeXV8reovSaG6JV1TQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] target/arm: Add raw_writefn to SCR_EL3 register
To: Michael Nawrocki <michael.nawrocki@gtri.gatech.edu>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
 QEMU Trivial <qemu-trivial@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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
X-List-Received-Date: Wed, 03 Feb 2021 15:04:33 -0000

On Wed, 3 Feb 2021 at 14:50, Michael Nawrocki
<michael.nawrocki@gtri.gatech.edu> wrote:
>
> On 2/2/21 6:29 AM, Peter Maydell wrote:
> I see what you mean. Does QEMU support AArch64-only CPU models, and if
> so, is there a way to determine if the CPU has AArch32?

We don't have any currently, but in theory the support is there
and we'll likely end up adding some in future.

More specifically, in this case what you want to know is "can
the guest ever see the AArch32 view of SCR_EL3", which is
"is there support for AArch32 at EL1 or above"?", which you can
check for in the EL1 field of ID_AA64PFR0.

So you need a function similar to the existing isar_feature_aa64_aa32(),
but which cecks the EL1 field instead of the EL0 field (you could
call it isar_feature_aa64_aa32_el1()). Then you can test it with
 cpu_isar_feature(aa64_aa32_el1, cpu).

NB that you must only call it when you know that the CPU has
AArch64, ie when arm_feature(env, ARM_FEATURE_AARCH64) is true.

thanks
-- PMM

