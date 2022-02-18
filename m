Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nL1ay-0003AA-Cn
	for mharc-qemu-trivial@gnu.org; Fri, 18 Feb 2022 06:38:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nL1ap-00038b-TQ
 for qemu-trivial@nongnu.org; Fri, 18 Feb 2022 06:38:33 -0500
Received: from [2607:f8b0:4864:20::b29] (port=42998
 helo=mail-yb1-xb29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nL1an-0006o2-Es
 for qemu-trivial@nongnu.org; Fri, 18 Feb 2022 06:38:31 -0500
Received: by mail-yb1-xb29.google.com with SMTP id e140so18907732ybh.9
 for <qemu-trivial@nongnu.org>; Fri, 18 Feb 2022 03:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G/VSXKZO4kk4KttMdl+Oq45G8UpP7pW+r2icGfXdWIQ=;
 b=EopMrW1Q26PeWHIJcoJueTh8kp6r83o95mVK13LZVmPjAZ0KZIocwy7DKKRTPXPWBU
 zxfqxtjpWSCkM6erFvl+GyE8aDq4YcPhwoMG6oiof8ORl4dNRso5ikdTBQnQdGUTwviv
 ODdjcdBjh4P94d1fr6emWs2olli5ZCh6//SxQFRnSw2ipqctuBBJpICFahVrhEwV8SSM
 MACSc9Zofa2UwPWwawsl/SxgRsP6zzVxFd7dxBA6rNCElJmRXGfewqn3OYSXHCeON/KM
 3yIEpHvazgc1Is8HM0LFV0T3v3UAeK+CEmqU+xG0pLefVCCi1U6JAP9wiDtIShlHlrZY
 coew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G/VSXKZO4kk4KttMdl+Oq45G8UpP7pW+r2icGfXdWIQ=;
 b=x161e1ng1uxZsUlOhXPOFYT7jGS7iO16iFPErpHFtWG0oh72doB4pkCVJhzdMEuKGs
 R6j8I2RbHEWIPOxdlWpLAtWoDC0y2VoEn53nBG264wR1TotkzIsX4QuhUkcltm+gkc1P
 cnE0tIzywxHpSYv0qgAf/o8lFi2nRYaY+NNs6iOOUaqpgIRU0CvRgGs9vcMKhzkFU9xC
 7N5J3+8yP2l8fFi989Vtu4lXZos1lCmboX6uI1Fw0WyLyjwUuK6DemSTYMES7PP0O1XJ
 Eyo4pi1w3usjcRaE/P01PsHspc4eeyWaTFmZew0O07WKanPGHyc1Aqa9AR6AvUlJB+JP
 EQ3g==
X-Gm-Message-State: AOAM530eKnvR/F72yDc9a7Z/WRXoyQiAs7oq11C/VMWnnezHOZ4brPc2
 rpbo/aMQCDNrfdF5VakMdjsXWLiYqmOTOZ8c70jRZw==
X-Google-Smtp-Source: ABdhPJzQPZkBzztA1Mndypag9uAUeb1B5coK5ZVqj/CkLgr3HJ7xGmUAvHKFX2gLwdqK8cOTM1OU++jnkTdDTWxVkfA=
X-Received: by 2002:a25:8084:0:b0:5fe:cadd:2532 with SMTP id
 n4-20020a258084000000b005fecadd2532mr6918346ybk.193.1645184298206; Fri, 18
 Feb 2022 03:38:18 -0800 (PST)
MIME-Version: 1.0
References: <20220117145805.173070-1-shentey@gmail.com>
In-Reply-To: <20220117145805.173070-1-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Feb 2022 11:38:07 +0000
Message-ID: <CAFEAcA_eFitfKzarU8XS+JT5m6uhGMecQzWjp9wruFBByk+oog@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Mark remaining global TypeInfo instances as const
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b29
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 18 Feb 2022 11:38:34 -0000

On Mon, 17 Jan 2022 at 15:35, Bernhard Beschow <shentey@gmail.com> wrote:
>
> Applied review comments:
> * Mention the sed-expression used for the cleanup in the commit message
> * Have checkpatch.pl error on further non-const TypeInfo introduction
>
> Bernhard Beschow (2):
>   Mark remaining global TypeInfo instances as const
>   checkpatch: Ensure that TypeInfos are const



Applied to target-arm.next, thanks.

-- PMM

