Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rrg02-0000Ke-Jy
	for mharc-qemu-trivial@gnu.org; Tue, 02 Apr 2024 11:24:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rrg01-0000KO-R6
 for qemu-trivial@nongnu.org; Tue, 02 Apr 2024 11:24:33 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rrg00-0005bw-22
 for qemu-trivial@nongnu.org; Tue, 02 Apr 2024 11:24:33 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-56b8e4f38a2so6439784a12.3
 for <qemu-trivial@nongnu.org>; Tue, 02 Apr 2024 08:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712071470; x=1712676270; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=W7usfDbTF8k8Atd/dvmfgTO/s/lXiH3RGJfcDBXIt4U=;
 b=NsXh7bMfbaHneFRi4W7w4CFyPqsFFnsGx9viBb7Ln/ViW8qZkz2g6qsnP8MtUgG+IG
 1jr6SKQSy/01oAz02/WPMuoUG07/vyu7i94ljXzcYSnCtnsuoATQaTe86xcgXeJA69aN
 jcB7KEXi4b18zD5i+vmPcvMiou8JgUxcKZ/AnR5KkkyxLNFcDbanen4mUflrjalFm4hY
 moMxNSmKb9Ia2qeWshZWa7sdJPxBqA0uX6OzcX+mfJ9IsSBwazHUcNsWXdg/OqSNA7Xy
 59rspVdz/FaLziXbrRqfdlizMfjwMMHfsCah8/8Y169LfMqEql+OKHD4tltnQXLaFGSm
 1NMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712071470; x=1712676270;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W7usfDbTF8k8Atd/dvmfgTO/s/lXiH3RGJfcDBXIt4U=;
 b=FFH7YVODRBRfEpUHCPlSXyPfc1V4zMU3+uORbxXIoXMycCntK5iyYBDeCEix33AuH8
 AlYaPfTAQCdLZNH39q6OYr5uH5L4/SqyiIs+KfKi8NwEQ1+SPHNU3ic4GYxjPoMCVy1U
 faWJJD7uHxfaX3LGsDLwkRT2aCp4QY7wsYcAuVXco4PWD3gArSPf/ohVAUVYTgAJx0y+
 vYmqwFZ3dMiCmx8SDfaIJXLlbovHh6yMoW/m4ehALbHwcUKPLiQDiERxaM6sQEeow0vh
 //68ij+X6hCjZ//KUPcveSuj+YhMxMFpkoxK8dZij+lm6g1ja7G+fOU70r5xu1l6nosT
 uPeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrTjN+W1ELllVdqvjdYzVJ/wqdt9Dl3HLjFzaBE4WJ/GvK/Epz1EeP5PbVzZ1L6AkBNwqzfiA+quA+VfpIH3q6xyANAp+sNQ==
X-Gm-Message-State: AOJu0YzoKEXum14K0CDZOaepoFr2dr0usfd9OFZboqEr4pHDktlSHOCP
 uBSflZhCktnji1yeI/LjrQSoXuszQ/Xd2gN+JqYZGUjwEVlJ/I51GINIXDlJmQ9XZLaaa5DP4tE
 vupMZeZlaRtGZNhNXtElRjmnsE5sqwIGbYxf3VYsxM//TIs93
X-Google-Smtp-Source: AGHT+IH6h4xslpbOfqAPGKufamCm+fMYSjjB7/uf2mXTdHf8jfInZH8Hy6oKUyvDPPyEcj3A7ONEL3r/EaFKn3gZ0X0=
X-Received: by 2002:a50:cc82:0:b0:56a:2b6b:42cd with SMTP id
 q2-20020a50cc82000000b0056a2b6b42cdmr116642edi.3.1712071468200; Tue, 02 Apr
 2024 08:24:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240402093157.2931117-1-mjt@tls.msk.ru>
 <CAFEAcA8UBewAHriNkbJNO9CFKgf5bBGRHntbb_y11JdfoNTvcQ@mail.gmail.com>
 <60faa39d-52e8-46f1-8bd9-9d9661794880@tls.msk.ru>
 <465cd941-4830-4adf-be76-011702bb71b3@vivier.eu>
In-Reply-To: <465cd941-4830-4adf-be76-011702bb71b3@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Apr 2024 16:24:17 +0100
Message-ID: <CAFEAcA-=_gBYN8Vb1Q0khmDy+nJJ-hzTvN6UaTBtrBPP9qE43Q@mail.gmail.com>
Subject: Re: [PULL 0/4] Trivial patches for 2024-04-02
To: Laurent Vivier <laurent@vivier.eu>
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 02 Apr 2024 15:24:34 -0000

On Tue, 2 Apr 2024 at 15:30, Laurent Vivier <laurent@vivier.eu> wrote:
> To post PR I generally use git-publish and I have a hook that checks that.
>
> $ cat .git/hooks/pre-publish-send-email
> !/bin/bash
>
> NAME=$(git config --get user.name)
> EMAIL=$(git config --get user.email)
>
> for PATCH in $1/*.patch; do
>      if [ $(basename $PATCH) = "0000-cover-letter.patch" ]; then
>          continue
>      fi
>      if ! grep -q "^Signed-off-by: $NAME <$EMAIL>" $PATCH; then
>          echo "Error: Missing sender S-o-B in $PATCH"
>          exit 1
>      fi
>      if grep "^From: " $PATCH | grep -q "<qemu-devel@nongnu.org>" ; then
>          echo "Error: Author email address is mangled by the mailing list in $PATCH"
>          exit 1
>      fi

You should check for qemu-.*, not just qemu-devel...

thanks
-- PMM

