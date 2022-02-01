Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nEqEh-0008Vf-MC
	for mharc-qemu-trivial@gnu.org; Tue, 01 Feb 2022 05:18:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nEqEU-0008So-Qo
 for qemu-trivial@nongnu.org; Tue, 01 Feb 2022 05:17:54 -0500
Received: from [2a00:1450:4864:20::62f] (port=36485
 helo=mail-ej1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nEqEN-0003iU-PJ
 for qemu-trivial@nongnu.org; Tue, 01 Feb 2022 05:17:52 -0500
Received: by mail-ej1-x62f.google.com with SMTP id s13so52713178ejy.3
 for <qemu-trivial@nongnu.org>; Tue, 01 Feb 2022 02:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=7ejQz4zmASG8K5kSmVEDZnl6Zusvm5+Hadrnix/u4fI=;
 b=aw1Cxg7ob0XoNVRMyEp6cRY+fSaw5LTsyjxNn++29i9p5GSX4KumD6VrEt6gx8lkI9
 r12DYIfrFZ2P8lMtIuW/QmkFEDtph0zQgIOvamfd21R+79WDqBUGatD793Hi0byvXzCb
 wy0wPAWoFlzqQYFEvwd+d2k0jiG5SvCqxsjtxGdX7GETsZ+JWhtFD1Oafb+UgGNFNd9c
 2N5ZYRpGd8qM9Dq9rrP73lPGR4cxRa1YmhvhdQM6Q/SBbOU198QC8pZl3NrG2ypevhii
 Dplh+HSY6kFzlpA6MJ2h05Vl8JaVQwEjwiq6lUX6CHrjlsHWngekuuxVz4GDRjFUp+JC
 M5Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=7ejQz4zmASG8K5kSmVEDZnl6Zusvm5+Hadrnix/u4fI=;
 b=ocrJo/smHpg1C3qsQhMuX99oTQT9cP8CsiaCFSpjbZUo/LZ1M0Ou4Kkf7pGHS6BK21
 nHYcBkpc+YrrAdv0cA7wxF4k6n97azitOQ2nujpZvLUQgcSKSvhq4zYkipvyIVsO7ml9
 p4+IQlJ5O4h5booG6xOd44K5niY0UJROWGpyPpplYzLtXR9A+66QUfQcTe9hIVBWJmKg
 dwHAQJpMm4KvWqp6NbltVOe/HoZxOiBsvl2RoRG4Fnekr6b8ZjeyoioxzSPNGenr0+6X
 QybuQ7GtFmJOSWdFZMlvFZIUtCEgBYKmB2EhTub1gXWafglyR6F31JrDdBtwsC3lcVsF
 ng/A==
X-Gm-Message-State: AOAM530+fdce44hSQs6WYMiuYCTYtKbxsfOGl+HPw6obxbrVG0QVBnJ6
 Xb+Zzy2ykVkXHMzhBbIgqFdLvA==
X-Google-Smtp-Source: ABdhPJz7sF16pAovZOML+m8FDYyTSMXjEoLRfSia5K5P3XAPSNXBwalcL3SY9N9ln0+iZszKuCFfng==
X-Received: by 2002:a17:907:2da2:: with SMTP id
 gt34mr21138097ejc.620.1643710638945; 
 Tue, 01 Feb 2022 02:17:18 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k7sm14309930ejp.182.2022.02.01.02.17.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 02:17:18 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 89DFE1FFB7;
 Tue,  1 Feb 2022 10:17:17 +0000 (GMT)
References: <20220201085554.85733-1-thuth@redhat.com>
User-agent: mu4e 1.7.6; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>, qemu-trivial@nongnu.org, Wainer dos Santos Moschetta
 <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>, =?utf-8?Q?Daniel?=
 =?utf-8?Q?_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH] tests/lcitool: Allow lcitool-refresh in out-of-tree
 builds, too
Date: Tue, 01 Feb 2022 10:17:12 +0000
In-reply-to: <20220201085554.85733-1-thuth@redhat.com>
Message-ID: <87a6fazyaa.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
X-List-Received-Date: Tue, 01 Feb 2022 10:17:56 -0000


Thomas Huth <thuth@redhat.com> writes:

> When running "make lcitool-refresh" in an out-of-tree build, it
> currently fails with an error message from git like this:
>
>  fatal: not a git repository (or any parent up to mount point /)
>  Stopping at filesystem boundary (GIT_DISCOVERY_ACROSS_FILESYSTEM not set=
).
>
> Fix it by changing to the source directory first before updating
> the submodule.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e

