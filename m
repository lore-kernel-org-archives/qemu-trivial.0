Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k5rWQ-00035Z-8q
	for mharc-qemu-trivial@gnu.org; Wed, 12 Aug 2020 10:14:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1k5rWN-00033r-0O
 for qemu-trivial@nongnu.org; Wed, 12 Aug 2020 10:14:27 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:40716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1k5rWK-0001Sb-CJ
 for qemu-trivial@nongnu.org; Wed, 12 Aug 2020 10:14:26 -0400
Received: by mail-wr1-x443.google.com with SMTP id l2so2182675wrc.7
 for <qemu-trivial@nongnu.org>; Wed, 12 Aug 2020 07:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=Y9PJZPxuFj03Tta6HauHoX9FGhAG+P1HJCTgWdBdjjQ=;
 b=Op5UsonmdqDprCSrKvcAHZIyQLFdXRFLv84fIfF7czaoKTBZjcRKqLoENpgiqBz4oN
 2rKLMg1C2C9i77INg+sbRCwJxMOElg6d/7IeAnnqec/hkqq+X5oGI8biJEuamz08AA0P
 eFI+q2UvpxP+2/iPXWfOnrLXZrnX0PYcFlrLR4kS3ZacGChl9r90dbrnhzPBqGrv5f7B
 HWuSn597/z8PP3f85PXcftRhLzYBkJd62byiXvu7zTlv5KxMZnsg3KIFy6EvA/iDL/XH
 ilG43MyYuIV89blHz633QMt6SYv8M00AOkWYEMBDDAtzJS/0Zm26LELtG6oJWP9vaRdU
 JTdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=Y9PJZPxuFj03Tta6HauHoX9FGhAG+P1HJCTgWdBdjjQ=;
 b=Oo6i9nuENuW/M3JIkGyNIdH2ziCISYqeVpL3jfwOFiZO/cslkQvpkxJVoz1o8E1MkZ
 AgMFldX+wamGFImF6A5lhYZWAZRNXx8tlpF56gr4Bj89/b0kU4F9VWrAE8NSHDECW0pT
 OC7bDFP65W1NGP2370nmAXd+tqZh/zivuFQZ2R1AK40Cg2donHg3SO2HLAFuO7gNmL9n
 bN0o7nbUJU90FMDcjKTFizO9Qg8Tn2TWsl5bIyFszI3r7Z2deXsScDL1dcevcBJb8u33
 M0xJt3LJPOR9Tkqu06VjCrtqHcCxwuCHNcg2pFUcl8rRNGV7vbdjvmOdEQLPq1JTOUBz
 DMvw==
X-Gm-Message-State: AOAM5319rEbLki8fptM8aYV/lsgDG2dDqD2ARNO9u2wbDsHu0kEba9qz
 KDnVquvjWsG4ZU2a4Vhq2T9H8rIqmZU=
X-Google-Smtp-Source: ABdhPJxvqC7bSp0oZq5KRVftVrIzy+cYSgrRe/k+fC8tXVmsgq4dUdsXTvEzrOBpnZhtzMxEX1O/6w==
X-Received: by 2002:a5d:55c9:: with SMTP id i9mr32978475wrw.31.1597241662825; 
 Wed, 12 Aug 2020 07:14:22 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l11sm3810944wme.11.2020.08.12.07.14.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2020 07:14:21 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F12081FF7E;
 Wed, 12 Aug 2020 15:14:20 +0100 (BST)
References: <20200812101500.2066-1-zhaolichang@huawei.com>
 <20200812101500.2066-6-zhaolichang@huawei.com>
User-agent: mu4e 1.5.5; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: zhaolichang <zhaolichang@huawei.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH RFC 05/10] util/: fix some comment spelling errors
In-reply-to: <20200812101500.2066-6-zhaolichang@huawei.com>
Date: Wed, 12 Aug 2020 15:14:20 +0100
Message-ID: <878sek0x4z.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x443.google.com
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
X-List-Received-Date: Wed, 12 Aug 2020 14:14:27 -0000


zhaolichang <zhaolichang@huawei.com> writes:

> I found that there are many spelling errors in the comments of qemu,
> so I used the spellcheck tool to check the spelling errors
> and finally found some spelling errors in the util folder.
>
> Signed-off-by: zhaolichang <zhaolichang@huawei.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

