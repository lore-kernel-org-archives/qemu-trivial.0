Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rjeQW-0006gw-BK
	for mharc-qemu-trivial@gnu.org; Mon, 11 Mar 2024 08:06:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rjeQU-0006gd-Sf
 for qemu-trivial@nongnu.org; Mon, 11 Mar 2024 08:06:42 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rjeQT-0005uQ-Ba
 for qemu-trivial@nongnu.org; Mon, 11 Mar 2024 08:06:42 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5684f95cc9bso1969577a12.1
 for <qemu-trivial@nongnu.org>; Mon, 11 Mar 2024 05:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710158799; x=1710763599; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HHeF1kcO0KBNnDHvzwFJmaj+tfFkHCSkoe5qdulqK/E=;
 b=yxcFPCLQIFS04yyeb9IdF/Ts1T9zTA57TfuDzKyQk27a1gfZ3WmqW9hAtHUfy4Cksw
 kq6lpQum+3l4q2inuw0NNAugHod9/lmt6wsejIbKMy6WXVwMF8CPsz5GG0+BDq23Ht3v
 3QmLtoTUSFh0uBt7yW5EN+PhC4iapwwcCEgIK2Mus+H7A6oy+ByzKZ17OJMYTorMiXc6
 7bRvFcln+Kd6VH3vvb9Hl/ttVzGqsk3hvog1Xg3vCfBqtezs5kZrP+tgwRJUlXpZ+2Ev
 Hi1T7W2gHMukEbJ1vLxPh6XOLrekoNjozGxVJBNxtBycYpDVSzOQIwJkvcCFu/Pemc4f
 xxow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710158799; x=1710763599;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HHeF1kcO0KBNnDHvzwFJmaj+tfFkHCSkoe5qdulqK/E=;
 b=v2TvzTUtL58xMVOWWdjpX+i5K/lBUWGErAoN+dnj11cRtUIV+XVokdsjj6W5aL4uEs
 8vLWXRPZTpzY43kOE6AXgaFYVODI3+FPbSQ+/327Q+wv0q0C3XyexA39sqyLn1fl7Vo4
 JCo7fSVjkLdl3b8cZKC7PKLV94N2IH1CW8tIc3uDjSPGaIbA2aBf3jzM33oQkBPQpDkz
 6a8BhaCcCs4H7Ex7F7nhyrmZbhADmje9A5vVlWrhrHHXF9u1caavj8U5w/P4MWd1ZpXY
 9cIoONIb6OtxW1NBdItLWy5l7VZq8vgDC4xBHyToZzeGEPjblORYIZ+fb5Gj7xUzNhZH
 BmLA==
X-Gm-Message-State: AOJu0YyY0eCrfXu/zQk7BSThm9vdyz65/5wgCLnw60wCplNtoB470qYh
 KC7aezLKWGwO+x/mYwQg0H5StpQf/ISblbvGfssM3C6tXWFDIDJV2Y7W46aJh3DcLf34OW3j6YN
 Ql0lDoQMdaRa0TO0TGdxdeftGqukdOqodkoXBfUneBk2WtExj
X-Google-Smtp-Source: AGHT+IGU71GVKYfU28UjVSxcElyObnNBhcJkZpkJB6rFmtVxjTdJg0UgMpg5H4kg78PWXRyGTDQ8gCObHe+ZBCJfZwc=
X-Received: by 2002:a50:8e5a:0:b0:565:6b76:3140 with SMTP id
 26-20020a508e5a000000b005656b763140mr5709373edx.18.1710158799361; Mon, 11 Mar
 2024 05:06:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240311120346.9596-1-anisinha@redhat.com>
In-Reply-To: <20240311120346.9596-1-anisinha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Mar 2024 12:06:28 +0000
Message-ID: <CAFEAcA_kh4sXkxsk10hCB9vAaJg2oNAv3DS_QhkHmFsWtVdUBw@mail.gmail.com>
Subject: Re: [PATCH] docs: update copyright date to the year 2024
To: Ani Sinha <anisinha@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
X-List-Received-Date: Mon, 11 Mar 2024 12:06:43 -0000

On Mon, 11 Mar 2024 at 12:04, Ani Sinha <anisinha@redhat.com> wrote:
>
> We are already in the third month of 2024 but the copyright notices still refer
> to 2023. Update the date to 2024 in documentation and help texts.
>
> Cc: peter.maydell@linaro.org
> Cc: qemu-trivial@nongnu.org
> Signed-off-by: Ani Sinha <anisinha@redhat.com>
> ---
>  docs/conf.py              | 2 +-
>  include/qemu/help-texts.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Oops, yes, we always forget this. Thanks for catching it.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

