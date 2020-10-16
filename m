Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kTSFq-0007qq-3U
	for mharc-qemu-trivial@gnu.org; Fri, 16 Oct 2020 12:06:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kTSFo-0007oK-0t
 for qemu-trivial@nongnu.org; Fri, 16 Oct 2020 12:06:52 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:36486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kTSFm-0006fT-7r
 for qemu-trivial@nongnu.org; Fri, 16 Oct 2020 12:06:51 -0400
Received: by mail-wm1-x342.google.com with SMTP id e2so3524952wme.1
 for <qemu-trivial@nongnu.org>; Fri, 16 Oct 2020 09:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=7ku0Gva7D3sTMkjXgfpGSE1IoTHzYKFNJPHpLObE8tQ=;
 b=Pmvz+cHQ0EotTkrFYFC4RcVR70P65dklHXhNgfwF3SLWyTr+/os25Y7lnO4JEFVLVV
 CqxYBvNvKuX7zB8spPJbPbSQH3S40itfCfCrsYlAyzVEktp5/3CSEGim6g83SsrGysrQ
 7u9cLLjMy0oVndoDH7CMnafsdxLnWUzfUWMViSUfWaR6Lw3mA9GFj4YLYn3yfrldEdqo
 YV4JEER+R4SBlzC0Nsiq+aXN4j3rwU+il4TopCqwosKDXIC9xB/byjUCg79GSvYk3zQc
 xUBEBbiz0ltHcNZLEdfB5TfBnwqGrifgd81Qc9/fRGMbJ8o64iqckOTcfVnAX5CD6IfO
 xDLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=7ku0Gva7D3sTMkjXgfpGSE1IoTHzYKFNJPHpLObE8tQ=;
 b=nmgJ3kOi+DQPpBm7XFhaWUBS8vot7RsW186HUpyryVlk0ELdCsIKpO1Nr/ldfJUSqL
 5ms0cuFy1SGT5N6TBNUl/VgQnOkeFVZqYPXdSNASCTI9AWW/kn6jDr/sFWi+TqHk9a0t
 QGoFFi9cQ538t7SaUxrBlO2v0hwLyb4U09AwfMRmZX5z+tLmZlR8mjP8TlXL9GygOgX7
 360vmH1wJDIe2S3GWC1S/ky9Xf09ZV95eCiF4ZMo/oCnMazM2u+Mf3Qt9wyZMrZqsoSm
 Ryykr3zsyJUOR1rl24SsveHOdH/xGnBbgN03VXp4U10tzx+W1g4gWP9VAoej0VDc5Deh
 5cXA==
X-Gm-Message-State: AOAM530xuc+dfLtXO5bvso5sLn8F7QtacfECz7txFXXqWLLpabEb2ynt
 8Fpalgvpca8V9MeNd1ozUHqgMA==
X-Google-Smtp-Source: ABdhPJzvitgeFE6Ay3VDDnJzkI4hX/7tSe6vtVkqfHwFcKNiIVQUVyo3fk4L5NdDSI0h/YtSPmWVMg==
X-Received: by 2002:a1c:9952:: with SMTP id b79mr4676563wme.144.1602864408329; 
 Fri, 16 Oct 2020 09:06:48 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s2sm3340699wmf.45.2020.10.16.09.06.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 09:06:47 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 69D121FF7E;
 Fri, 16 Oct 2020 17:06:46 +0100 (BST)
References: <20201016143509.26692-1-chetan4windows@gmail.com>
 <20201016144243.26817-1-chetan4windows@gmail.com>
User-agent: mu4e 1.5.5; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Chetan Pant <chetan4windows@gmail.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH 6/30] semihosting: Fix Lesser GPL version number
In-reply-to: <20201016144243.26817-1-chetan4windows@gmail.com>
Date: Fri, 16 Oct 2020 17:06:46 +0100
Message-ID: <87zh4mupd5.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x342.google.com
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
X-List-Received-Date: Fri, 16 Oct 2020 16:06:52 -0000


Chetan Pant <chetan4windows@gmail.com> writes:

> There is no "version 2" of the "Lesser" General Public License.
> It is either "GPL version 2.0" or "Lesser GPL version 2.1".
> This patch replaces all occurrences of "Lesser GPL version 2" with
> "Lesser GPL version 2.1" in comment section.
>
> Signed-off-by: Chetan Pant <chetan4windows@gmail.com>

Acked-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

