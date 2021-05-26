Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lly8A-0000Yg-O7
	for mharc-qemu-trivial@gnu.org; Wed, 26 May 2021 14:19:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lly80-0000Tw-Vg
 for qemu-trivial@nongnu.org; Wed, 26 May 2021 14:19:38 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:36835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lly7z-0001D1-0a
 for qemu-trivial@nongnu.org; Wed, 26 May 2021 14:19:36 -0400
Received: by mail-ed1-x532.google.com with SMTP id df21so2673278edb.3
 for <qemu-trivial@nongnu.org>; Wed, 26 May 2021 11:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QwV4GhApoNVUqgvh0vCDgT0m8jOlvKW+/rHy8uRm8vQ=;
 b=rCr2EYHANYA7GE2lIhsjKOS6PiNvAFatZsl4Lcka/uqc8v16gcJ8+8CTW21We8PQ8P
 r7cpVis+MhnS1o1zFAh9W3zChlRUKiaT+THZ7jwl+CXOFmtLkhehs6GCZ0q/xhuXWU6c
 hhmvGW0JnV/W6qMRJLCTD57+34CcOx+8my+nSIKSxvygB7wppsQNW81kiIVDEidaxICb
 uVIC2MXfocvTekjacUk3EJ8AKxWMjQESOm/1xbS4r4o3kyKOIiERsX+VXPTe86VGF0cS
 KioeTy63RhSMYbmWID8CNEq87qIFnSGUbG0Ysgk3KYboELsVmLJ6vjgBkFG9+DQ0CsqO
 +bug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QwV4GhApoNVUqgvh0vCDgT0m8jOlvKW+/rHy8uRm8vQ=;
 b=JhRV6ihXZNMq9G9e3gmlSCIQdk2qiiTbKJGLuXxMbirxnIyAYFL68U4vFVxJI2oBEk
 0MUFENcZ5jMq6G6iWRpbLHsMz5K8jIguSCZJhAXN+aGYU/zw9M8pp2+xdpHPuNielsN+
 qV9Lot2y+zHj9IzCD7HEK8iEH6NcO12pcdNNbNOkTRAUTa5ocUKMOZRL5y2i6kFdjaYU
 KOVOrUcjJDFeVFnrFRegHRjLmHXaZAryIcWQaZF5YXFEsImsMP5Had8agZkJxXhdgLpA
 PYq2qXH5j0Z+D2Xv/4xKpX8Qt1UDx03vw7T8v+qwtApF/EYMFZiI5ESl2v9O5rEaV634
 0VLA==
X-Gm-Message-State: AOAM5318JdtuQe/xUNtb1OywmGVt8rHDCNnuVQ725+V0nwrNNk5O3mro
 RedZjSdDzuDUkJMb6SEnaLek6uGT0MSNABH5wr9I+Q==
X-Google-Smtp-Source: ABdhPJzOsnRoWpyObbHLswJ+MCW06XRZUSCL/GlmsmdHbCvcKVxXmSrgAETjgOY93qdGvfxcSoMEU6rdrhH8wDHuZHA=
X-Received: by 2002:a05:6402:190e:: with SMTP id
 e14mr39437346edz.146.1622053173263; 
 Wed, 26 May 2021 11:19:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210525025823.3208218-1-swethajoshi139@gmail.com>
 <331a819e-1745-4d4b-cc4a-82521a58186a@linaro.org>
 <CAFEAcA8RbVafdjn2hkXifAPUF=wxZup20PqPcRpQ1ivtnWCxww@mail.gmail.com>
 <CALf2nm+LFqM2=vDs8=YfyxQSUT-0xxaCiVmcQzrKoOa+zaTtdg@mail.gmail.com>
 <CAFEAcA-oX0JR80UYzYKvczHsfxWG6oH3Pg4pbM6ByDe57XEHHw@mail.gmail.com>
 <CALf2nmKhPaWJa944dR+kFAQ1hCLXF0XPwXaHTqJQ-C6EW7ACKg@mail.gmail.com>
In-Reply-To: <CALf2nmKhPaWJa944dR+kFAQ1hCLXF0XPwXaHTqJQ-C6EW7ACKg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 26 May 2021 19:19:08 +0100
Message-ID: <CAFEAcA9E4s3dST0GJkdg24DDAn90WU1FEmXwoKD6oQmNSB1vVA@mail.gmail.com>
Subject: Re: [PATCH_V3] Adding ifdefs to call the respective routines only
 when their configs are enabled
To: Swetha Joshi <swethajoshi139@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, 
 QEMU Trivial <qemu-trivial@nongnu.org>, Dongjiu Geng <gengdongjiu1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Wed, 26 May 2021 18:19:39 -0000

On Wed, 26 May 2021 at 18:32, Swetha Joshi <swethajoshi139@gmail.com> wrote=
:
>
> Hello,
>
> One of the qemu machines we use has KVM enabled, but we don't want the CO=
NFIG_ARM_VIRT enabled as it pulls in emulation of a variety of physical har=
dware that we don't need. The compilation errors I mentioned are not in the=
 qemu mainline per say but we see them in one of the qemu derived machines =
we use.

Sure, but unless you can give me a recipe for reproducing the
build failure in mainline I can't really help...

thanks
-- PMM

