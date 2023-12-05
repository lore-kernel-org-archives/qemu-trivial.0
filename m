Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rAROx-0004CS-PT
	for mharc-qemu-trivial@gnu.org; Tue, 05 Dec 2023 04:07:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rAROu-0004Bq-Ee
 for qemu-trivial@nongnu.org; Tue, 05 Dec 2023 04:07:32 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rAROs-00079Y-Nm
 for qemu-trivial@nongnu.org; Tue, 05 Dec 2023 04:07:32 -0500
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-54c5ed26cf6so5150656a12.3
 for <qemu-trivial@nongnu.org>; Tue, 05 Dec 2023 01:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701767248; x=1702372048; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=o4LUhuAQmdNvhNwoAmcjERPVwyQQTyUv0QlU/6hTOSo=;
 b=L5/mGBRQj40c6NPQiBPWNXbsYYZenXkm5ARO9YLnPPAus7tO99s1ACrzgZwE77CSie
 VPfMCNEXNHNXriBCGvRPspgdGj4UTl3JFVS2ov3RSHMAgwSXM0KsrSe1IsblObN0N3FM
 B54ddL827kDqEuJpc1GnQhrEoK0g3w/Fxx8UfT9vGk7BAidBMcxXAFo92bg0Axvm17ck
 W05IHWxG6gl81Y1B9RlbyYoIGszMooJaunmrhHIIHfoNbnecZxWdGlDFD6iADmWYE4CN
 w5pF/2NOMZpbk2xfzxcSuM7zQbSFPYU7VSTKuOsflCvUmYV2UdeCK8+KvLgUTTab8pR/
 EXhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701767248; x=1702372048;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o4LUhuAQmdNvhNwoAmcjERPVwyQQTyUv0QlU/6hTOSo=;
 b=jLD8ZyAivgXpR8zp3WGu8ivYTAWhzsi1B/CnNcvoynJFe4rC/zsypZ3lgEFUPQUqV8
 7x/rMzEV3oVl/3SyYJhxqTs4GjFVi4gdDv/XXc3xuva/RR9hu8tcNuk6omZ4UxJ4VpLD
 2i8HAV2A9qs44uZEBzAqKrrALuBdwGgVw+o/Uya441VeO6bTkT1eMkXlnoUJV8dDgDUT
 LBokEk5CQV1uswnzSVMobH8nrjXUd7VLWxG3ZL/tmyL8LVTpdnGRvk//EMt6nMpjRPS1
 mvliQVlp1L2wnoVP5s0DMlYCC9sFW4iXgNoT6p2F6pXKqS7vEq0LyjVfYAacR61tfwDc
 0NKw==
X-Gm-Message-State: AOJu0YywO9ggrwKaKxx6N28Xt1KOi1kwSDsO3KLv0T0zMIcpq3z+Z0ih
 6zwCJ4IsfH1fH0OkUT/gOsmgCv5MMdsu5EQoLm+ALg==
X-Google-Smtp-Source: AGHT+IEsl7r/T66q/2nawImcw3+DWNafkP4WbX/oa2zzOTZAvYhNx6w3uF+tAesfb7vdto1EgJboRJa/t5cX/Hjb1Jw=
X-Received: by 2002:a50:9b50:0:b0:54c:4837:81e2 with SMTP id
 a16-20020a509b50000000b0054c483781e2mr4056401edj.51.1701767248699; Tue, 05
 Dec 2023 01:07:28 -0800 (PST)
MIME-Version: 1.0
References: <20231202044846.258855-1-arorajai2798@gmail.com>
 <CA+9mx632wGOa2egPZBKLnr5UZLzeX74V8wF0=pkfO+jQg0dM2A@mail.gmail.com>
In-Reply-To: <CA+9mx632wGOa2egPZBKLnr5UZLzeX74V8wF0=pkfO+jQg0dM2A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Dec 2023 09:07:17 +0000
Message-ID: <CAFEAcA-Mpv_Braq_wPNb4nE_Bh5FFDsd7jC_R4QOwx=9BZVOAQ@mail.gmail.com>
Subject: Re: [PATCH v5] accel/kvm: Turn DPRINTF macro use into tracepoints
To: JAI ARORA <arorajai2798@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, pbonzini@redhat.com, 
 alex.bennee@linaro.org, philmd@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 05 Dec 2023 09:07:33 -0000

On Tue, 5 Dec 2023 at 04:05, JAI ARORA <arorajai2798@gmail.com> wrote:
>
> Hello maintainers,
>
> This is a friendly ping.
> Are there any other review comments for this patch?

Hi; the patch looks good and it's been reviewed; but we're
in the middle of codefreeze for the upcoming 8.2 release
at the moment, so the patch won't be applied until that
has gone out the door (should be in a few weeks' time).

thanks
-- PMM

