Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lfnyx-0007h9-Q0
	for mharc-qemu-trivial@gnu.org; Sun, 09 May 2021 14:16:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lfnyv-0007gh-Q9
 for qemu-trivial@nongnu.org; Sun, 09 May 2021 14:16:45 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:33373)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lfnyu-0007FJ-6b
 for qemu-trivial@nongnu.org; Sun, 09 May 2021 14:16:45 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 o26-20020a1c4d1a0000b0290146e1feccdaso8673162wmh.0
 for <qemu-trivial@nongnu.org>; Sun, 09 May 2021 11:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=YLBJl6ZuIQzPy8HS1eTa2lIwQhoJAFI+uv+WhmfTixc=;
 b=yib7YD+I8Tl/TXQKIu3/Y7qBNdVunTi2X/UDixyHfkNznNH26HtNd/Mvox+zZtFmNr
 iz33SrPAnea+8C1fK61wnsY1pRDnHt9raSrGp/5IxUNvtmWziv70EHyF+Ebg6Wyh79mQ
 6m92CYg83y4L706ZhlGLBjEUy2ng9NuLSK2Pg6n7VC/gbdGTbORBYQsGlzcsBynIOwgM
 pjKvpMv0SH4/kxCD+JX5iHjBclrYu8Nb1apG1qyx2nkCiCHlfFF0rlhxN+lCXcqkdVJk
 Q1w5FjRJagQqt23eFFE3rs6N5Tk7iVXKVMW6Ja9FZzlW/rsl2jBq7j6dDTUhrfJGGZCk
 UEVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=YLBJl6ZuIQzPy8HS1eTa2lIwQhoJAFI+uv+WhmfTixc=;
 b=EAlQsugQKn/Yd4hhC2cFfvQktcSF+69Kbl34UrtP3zLxyn+SX3AxN/CI5zggx5WMG9
 QZB6yPLuOfvoWdkjWnKM62LVaGYdh8yl9kZ2doovpN2mqSHTuhID/31e5yLOAnWOst3J
 hNCr4VcwuSnREK4U+X2HxS9i9OEyEvTBYhZu1ODwes+f2OEcjPnriRl20KemlkkEesEl
 0187K+uHLetAPOCf/6KiQquAeQItBD3c26FuhVnRnY8DgkianwLgZx/4ssABty+e+K1x
 wtsgpksHuCk6Lzet3byP720TKg7eC1IM+lD3/1dDhBn5zl5ZUhLI/u+zL0gUwqiKJv6M
 2Utw==
X-Gm-Message-State: AOAM5327xLkoaGlRDRPt0+Q36UvRhPKv7zafC4rSjUaE6E+BhniaIaNg
 iXEROAtJRieWjIXljZREul37Sg==
X-Google-Smtp-Source: ABdhPJwLqOUICg2u8odhNpQ7vpR3/nbRalVHm+hJVAS18QddZzdw6b7WaPff6HPXYmiFEE8S5Tq90A==
X-Received: by 2002:a7b:c7d0:: with SMTP id z16mr21915296wmk.22.1620584201555; 
 Sun, 09 May 2021 11:16:41 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 3sm16106840wms.30.2021.05.09.11.16.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 May 2021 11:16:39 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1EC601FF7E;
 Sun,  9 May 2021 19:16:38 +0100 (BST)
References: <FITkUaiC5DeyCU3e1T6EisgkkQ8Fnrwf2WZTBGE@cp4-web-031.plabs.ch>
 <f3e79a92-802d-b9d0-048a-cf8d80309388@linaro.org>
 <d18gk-AF0Wjro1nZkvwjmqlM5mzXO9j68Pp5aELgxzTnI6SMj8tuekbHJ8--baeNWr_zeWw-6BLzTm07cz1T_oxwFuxyAtmgGiV-XYpLL88=@remexre.xyz>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Nathan Ringo <nathan@remexre.xyz>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org
Subject: Re: [PATCH v2] This makes it easier to figure out whether a
 particular instruction was actually translated.
Date: Sun, 09 May 2021 19:15:41 +0100
In-reply-to: <d18gk-AF0Wjro1nZkvwjmqlM5mzXO9j68Pp5aELgxzTnI6SMj8tuekbHJ8--baeNWr_zeWw-6BLzTm07cz1T_oxwFuxyAtmgGiV-XYpLL88=@remexre.xyz>
Message-ID: <87lf8nhiwq.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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
X-List-Received-Date: Sun, 09 May 2021 18:16:46 -0000


Nathan Ringo <nathan@remexre.xyz> writes:

> I'm mostly looking at AArch64, so they're the same there :) I'm using
> this to collect code coverage information, so I have the disassembly,
> and it's slightly easier to report it that way;

Have you considered collecting this information with TCG plugins? That
way you can instrument what was actually instrumented directly.

> if you think it'd be
> more useful on other architectures to report the byte range instead,
> it'd be an easy change to my scripts.
>
> Also, noticed I accidentally deleted the first line of the commit
> message when I updated the patch... I can fix that if you want me to
> switch the size metric.


--=20
Alex Benn=C3=A9e

