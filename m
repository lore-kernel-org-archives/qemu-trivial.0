Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k5rYJ-00063p-W0
	for mharc-qemu-trivial@gnu.org; Wed, 12 Aug 2020 10:16:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1k5rYF-00061S-NU
 for qemu-trivial@nongnu.org; Wed, 12 Aug 2020 10:16:23 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:35826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1k5rYD-0001td-RF
 for qemu-trivial@nongnu.org; Wed, 12 Aug 2020 10:16:23 -0400
Received: by mail-wm1-x341.google.com with SMTP id 184so2122793wmb.0
 for <qemu-trivial@nongnu.org>; Wed, 12 Aug 2020 07:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=OESi9kWDWzE0wDAuRk4VQjADNSJ3geoF82XY5I2b1ic=;
 b=C2kPASnvEPKC/WHLTwQLAUmuKJ0J5hnPNtVqq5y4TjYYTAlFgfxa4n/94VgXOARML+
 mmv1oaA6W4mzNFykmJjcOMnfcGV+HPrAh73avVkpK94DGlugIQHEP3HmE7jGmDSHgd9A
 exEsb8OlRwuyJc+dT3a/oLGy+eOMgNkSK2+ksNmSrw/Bv/Z8vK3GOrwsB41Gaj7NZrb6
 RObxYcETb9uEfymBsqorAQbcQgsWTY0R/aiXUx6LAPLouWQmUNWaHX47sVvu3ZYBEq/w
 y+bbAQYgBr2ALhQtkkQCQ9RmulMSPOJ67dcetAlZ+JnhB2/yAFIsveEIT/N6BTI70xwQ
 6uhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=OESi9kWDWzE0wDAuRk4VQjADNSJ3geoF82XY5I2b1ic=;
 b=hPi7p32DZeJBm0EM9SJXx68rpmab9psmDM5G+FTT8ETfpXTeqn/sQE0YUrmMWll2el
 omoS/yRVyo8alrpQ8OrgXS+Xw4YvURSiee0hSwwf6x0O7fsgFdQHSje/cioHqGEBQAam
 lmcOIAkMDk3QZoA7k9mJHHSU7RHaLutvrCZKNVQ2iyfCHxp1X/3dv6I2FoT+b9SaAnmm
 +7dxO09ZhEcZNP+vE4raZbRB2/9q5LjhdyX+Q2ZkMOS94kow5XoqQ26byg4hgMCy48py
 skhoE8IcK13FzjOcJaoqgOTvsJSDK/PzxiiS7MJzVo9Rf6kbN39bdjHXEty3797ASokG
 m/qA==
X-Gm-Message-State: AOAM533ttQJkpRXQx7QcH+LiVTz3upaXo7c+M2WlTTierDdGrCQQbj+f
 n3mS8GwbsDI2uxGuKRrDbcZ6tA==
X-Google-Smtp-Source: ABdhPJyzdpHNe8LT9fMBbEt8d3d5dFAMDMTZaTAELS2sSPri8Bm0KDupjGCnk4uMyQQL2nLR4Lq4jA==
X-Received: by 2002:a1c:32c3:: with SMTP id y186mr8645082wmy.15.1597241780589; 
 Wed, 12 Aug 2020 07:16:20 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i6sm4201758wrp.92.2020.08.12.07.16.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2020 07:16:18 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 561F21FF7E;
 Wed, 12 Aug 2020 15:16:18 +0100 (BST)
References: <20200812101500.2066-1-zhaolichang@huawei.com>
 <20200812101500.2066-11-zhaolichang@huawei.com>
User-agent: mu4e 1.5.5; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: zhaolichang <zhaolichang@huawei.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH RFC 10/10] contrib/: fix some comment spelling errors
In-reply-to: <20200812101500.2066-11-zhaolichang@huawei.com>
Date: Wed, 12 Aug 2020 15:16:18 +0100
Message-ID: <87364s0x1p.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_TONAME_EQ_TOLOCAL_SHORT=1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 12 Aug 2020 14:16:24 -0000


zhaolichang <zhaolichang@huawei.com> writes:

> I found that there are many spelling errors in the comments of qemu,
> so I used the spellcheck tool to check the spelling errors
> and finally found some spelling errors in the contrib folder.
>
> Signed-off-by: zhaolichang <zhaolichang@huawei.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

