Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qxpeL-0003fM-4j
	for mharc-qemu-trivial@gnu.org; Tue, 31 Oct 2023 10:23:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qxpeJ-0003f9-CB
 for qemu-trivial@nongnu.org; Tue, 31 Oct 2023 10:23:19 -0400
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qxpe4-0006OZ-I6
 for qemu-trivial@nongnu.org; Tue, 31 Oct 2023 10:23:19 -0400
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-50939d39d0fso114096e87.1
 for <qemu-trivial@nongnu.org>; Tue, 31 Oct 2023 07:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698762182; x=1699366982; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/8Nilxmvy1oMbEpx2HDo0XnG9uQmJ/Z0DBhjyvb4FL0=;
 b=g+WzPBv5TB7gUtEiKDytTMiYgdrtgeCdn2So1G7Yu77GY+PQEeIQy0nWXWL3kKEQ5z
 PpDtKdDE34Hag8bUSV0LHLSr3azcrMSNFAlQp0xr9Slg/WJd7yolHXEp6kGawiv4yUGR
 K5UH5MiWO0oVxlGysVkvhWiS04HUFYXFszg3rGn4iJT/BU1xnLe4SqAtM4A2R6F94tTn
 atMdj05Z3yau9HQlG0Pc1+uvhRLCeFPE2kAE8TWaNCrrADnKU6XMdFlvftyHJDd2Qd22
 4Ua+Rthewsd5p8WoJ4weOTFiZVaiWqUtm0oZ8JFao309uBDX8QlmweHVolN/SotCmIhB
 lkeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698762182; x=1699366982;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/8Nilxmvy1oMbEpx2HDo0XnG9uQmJ/Z0DBhjyvb4FL0=;
 b=Szd5K0Frrs1IjgtmIvZaEfSU+xo6uxgdOXFd1AuFf6uj39wk/j/DAcNnTyzsZdB3kM
 a8BlNxcRRrjoDKJ0bQCG55TJ+VPNsAJtTPuD25gSDGy0DiV+gWFSDgIGAw05+yyyZAcy
 hGatPY91T4iTjoB6CstoK/wLe66SgBArEADCXK3UGbkHwRsl70/ue42p3yNHzRFnTSoY
 SLh8weeVSEE4kISGaPipADIUi4c9AmEgCjlD3DVq7N4+iMblEdRAFmpHirt0LsXYnHh5
 /Eex/8aRjoe1vjIyry8nxZyusqZ991Q0e2RWnQuvlUqJIV8fFkp9IhTrEUIsTbjTXv9r
 +g0w==
X-Gm-Message-State: AOJu0Yz2uzEbDltg/nEzZ1VGP5VSDELdM7y7USDrgFs+JUygH6Ny8fMu
 zY7MPM0Iq6ahq2iDNDfAfaV4FQ5Pz8otmAKJz8GUMQ==
X-Google-Smtp-Source: AGHT+IEjcThKR972kE/2R+UK10KPtJx/gIokcQLfyR0Wz8wBC7N0KX6dpU/CAPu+NcqM3RnXIMDRlLj+FHXBwBBX/KA=
X-Received: by 2002:ac2:4d81:0:b0:503:388f:30a3 with SMTP id
 g1-20020ac24d81000000b00503388f30a3mr9191715lfe.26.1698762181949; Tue, 31 Oct
 2023 07:23:01 -0700 (PDT)
MIME-Version: 1.0
References: <20231027060709.242388-1-thuth@redhat.com>
In-Reply-To: <20231027060709.242388-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 31 Oct 2023 14:22:51 +0000
Message-ID: <CAFEAcA_299ZdoWs2kb9mUJc_thzEztuP_ou_uHs+p-z7Kf1y6Q@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Make sure that gicv3_internal.h is covered,
 too
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x12c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 31 Oct 2023 14:23:19 -0000

On Fri, 27 Oct 2023 at 07:07, Thomas Huth <thuth@redhat.com> wrote:
>
> gic_internal.h is already covered by the "ARM cores" section.
> Let's adapt the entry with a wildcard to cover gicv3_internal.h, too.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to target-arm.next, thanks. (Let me know if you'd rather
take it via some other route to avoid possible conflicts with
other MAINTAINERS updates you've been doing, though it looks to
me like this is probably not going to run into conflicts.)

-- PMM

