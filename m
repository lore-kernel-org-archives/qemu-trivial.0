Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oMRhm-0006Bk-9S
	for mharc-qemu-trivial@gnu.org; Fri, 12 Aug 2022 06:15:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMRhl-0006BE-4w
 for qemu-trivial@nongnu.org; Fri, 12 Aug 2022 06:15:49 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:42808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMRhi-0004ip-Ky
 for qemu-trivial@nongnu.org; Fri, 12 Aug 2022 06:15:48 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id 199so758984ybl.9
 for <qemu-trivial@nongnu.org>; Fri, 12 Aug 2022 03:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=1Kv/7Qh8sV7qc8d6b4Ku+Yv3mZMFgfBPgj3eNPlwIDI=;
 b=SpdggizlS/fPySYxoQBlCjD5OIqfr/cevKrPRPNUYHzItYmWDLOb7uO1CSqKKg4wzG
 o6T4TBSG312Md4n9Awt+SGY3gKnwhRU/IEykNzHrrLOOtJFHLiryTugUavDgS1AmWN8P
 l7Q/ZWFbh90+bu4awrO8CB8Dk9VcnEdoA4i/BBS2sBSZCXUR11U24KwWZMfQ5ibC0xHu
 8nAiE1MBqnMXT5LI3AFyxhWXu4MhMZcvnPiZduADbYO51lbv9wlcqI/5rtAsWPQc1Ngj
 zZJUmS5JTe+cfXkQ9JGxqxtBydQETtpy3J7nh9fQ9bB0PyIbSRdnD6cnZxqeJazBgKKs
 oAiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=1Kv/7Qh8sV7qc8d6b4Ku+Yv3mZMFgfBPgj3eNPlwIDI=;
 b=sytenZqKcyTFgZ8Bgfs0ga74Ao8R9zBaT0qfdXRlx+Rzgi0HxvcE0kDqjOOYTM/Jnw
 gHdumx/U59V6Urym0oVGz2pYT7jlglvICIwxBQHt1XV8UOSDE9wXOpyXLh40VbmlQRa2
 IFO9h2Ny1/Uv1MIgm/B4bQViGLjQ7tag6JmkO/NKJSDQTkhnNbL4MHrVlrAvju1SL1zE
 ckwPLcGX4PV5HMz4p/xY62Q+Ztr8OawwHfPRov8+D4drx51373oJ7JxCkM2dDvd9kiVR
 4ez/daLxRt9QNpWV3C6ZQVec0+Sk6xK46WBInOpjBjyuR6BydJbQdCrGhMRN23SGk828
 tu4g==
X-Gm-Message-State: ACgBeo06iBSBqqQq3Rl+ztnmjcBAfT172Su+NW+5xpoygjAyrMw65p1X
 vKEEXL3ZfEyQYFL9xid21dgr9Fqxkl9K01cxL5b9Tw==
X-Google-Smtp-Source: AA6agR6PrTQ2teFKCgCTqCtQ6vxs+ZSKA69vZoTNZ17pE2C5E1gDv2eq8YxBeDO05KAHz3y9Yx/gCqzZbtPddaR9SS0=
X-Received: by 2002:a25:d4a:0:b0:671:6d11:d14e with SMTP id
 71-20020a250d4a000000b006716d11d14emr2878452ybn.479.1660299345331; Fri, 12
 Aug 2022 03:15:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220812075642.1200578-1-sw@weilnetz.de>
In-Reply-To: <20220812075642.1200578-1-sw@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Aug 2022 11:15:34 +0100
Message-ID: <CAFEAcA-QqFh8hCxu5A86ReGgo1=vm57FJAHraRU28NzBa-dNWA@mail.gmail.com>
Subject: Re: [PATCH for-7.1?] Fix some typos in documentation (most of them
 found by codespell)
To: Stefan Weil <sw@weilnetz.de>
Cc: qemu-devel@nongnu.org, Hongren Zheng <i@zenithal.me>,
 libvir-list@redhat.com, 
 "Canokeys . org" <contact@canokeys.org>, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Fri, 12 Aug 2022 10:15:49 -0000

On Fri, 12 Aug 2022 at 08:59, Stefan Weil via <qemu-devel@nongnu.org> wrote:
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

