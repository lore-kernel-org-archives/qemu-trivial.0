Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kPkIN-0005sM-Un
	for mharc-qemu-trivial@gnu.org; Tue, 06 Oct 2020 06:34:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kPkIH-0005q1-89
 for qemu-trivial@nongnu.org; Tue, 06 Oct 2020 06:34:09 -0400
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:41338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kPkIC-0000WQ-UG
 for qemu-trivial@nongnu.org; Tue, 06 Oct 2020 06:34:03 -0400
Received: by mail-ej1-x644.google.com with SMTP id ly6so15602094ejb.8
 for <qemu-trivial@nongnu.org>; Tue, 06 Oct 2020 03:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kxE8PjBsWXiYOR28MiHtwsXhbAi4gt6gIwPX8ni2D9o=;
 b=ERv1JDYoPYtClOGYBeT4XkTOySUYMQn3bahDE88u5i2A6VFANZ1o/ZQk+IGLmpRLN3
 114dQ7By5AxLFH2Pi+4PXLbt4ZgCw8vuKU9e6DOjQGImux2tRWlaZWKv1Ju8iEXZGJED
 54csw0nEE962Lx8df1qr6T+w1TdYiQgQNripjolNM8o/3cS4lxxuANShkVsA5ekw7E56
 2F0JFmldzk94HeGIyEQgG1ePjDQNU3fSZCj4tjGPAwS9AIrIfLbNg3jMfmKPh8Ad3P2/
 0KSgM6hqAEX1VJOAsLixW3dPOeZ+oXmd8Mj2edDWlm9BsrHuzDJ8Oyyk+b5HPVom7d0t
 RGqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kxE8PjBsWXiYOR28MiHtwsXhbAi4gt6gIwPX8ni2D9o=;
 b=aWZ1zJCkWXvNV8xYOnLc7QHtKrguIuYPhXjjkCZ66xOTRJ11RvIN80mKpi38Ghv1eL
 17jLllosdMuDvjHKWs8CEcBZelo0JT+5O86gce91mvSysI9MxOGUZKuG+riL0eErDDhJ
 9GXlTw1Yo7HtbqTiqYiCTfyunzKzRZGXIWk4Kw8B0kOoAbk7ScKZu5FC2Mf1aOCcFDCp
 jIlgC5rjUDp1uSGampLrUfG1Q3GphU+okxh1kUk/2NKr38CzsVygMwmWdBZN6x2rv2B6
 ehO/uygZMvsSzN4kg8saNesKQ+P149Jh08akHdiMPtIYrjeBcIQt6/QpU9asGHY//l4L
 uhAg==
X-Gm-Message-State: AOAM530BAv3rY4ggG716h5akw1tk1z/qs++VSPb1T/0tR6EgMIr0tUMp
 phCQlxgKkuRFkNNE9ifv6hJruudZSRrnHcBvvNPLNw==
X-Google-Smtp-Source: ABdhPJzFu6QjAlak5uRV/Dm9q+VGTq8eZp3CqSlpy3UBU8ufgFqJsUqzNH5Jhe6XArqG9XT6rT27MlDHFZn1MycynzA=
X-Received: by 2002:a17:906:ad87:: with SMTP id
 la7mr4403200ejb.85.1601980439378; 
 Tue, 06 Oct 2020 03:33:59 -0700 (PDT)
MIME-Version: 1.0
References: <20201005195129.1507-1-luoyonggang@gmail.com>
In-Reply-To: <20201005195129.1507-1-luoyonggang@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Oct 2020 11:33:48 +0100
Message-ID: <CAFEAcA8oa7A8f9EjSTnutUKC8tZ98Y_DrSYxdhy22T3y9NHRaQ@mail.gmail.com>
Subject: Re: [PATCH v3] scripts: Convert qemu-version.sh to qemu-version.py
To: Yonggang Luo <luoyonggang@gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x644.google.com
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
X-List-Received-Date: Tue, 06 Oct 2020 10:34:09 -0000

On Mon, 5 Oct 2020 at 20:51, Yonggang Luo <luoyonggang@gmail.com> wrote:
>
> The sh script are harder to maintain for compatible different
> xsh environment so convert it to python script
> Also incorporate the fixes in
> https://patchew.org/QEMU/20200929143654.518157-1-marcandre.lureau@redhat.com/
>
> Testing args length and if not enough, setting pkgversion and version to ''
>
> +#
> +# Script for retrieve qemu git version information
> +#
> +# Author: Yonggang Luo <luoyonggang@gmail.com>
> +#
> +# This work is licensed under the terms of the GNU GPL, version 2.  See
> +# the COPYING file in the top-level directory.

Does this have to be GPL-v2-only ? We strongly prefer
v2-or-later...

thanks
-- PMM

