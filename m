Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nmXeZ-0007Ns-Md
	for mharc-qemu-trivial@gnu.org; Thu, 05 May 2022 05:20:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nmXeX-0007Jk-8w
 for qemu-trivial@nongnu.org; Thu, 05 May 2022 05:20:05 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:33703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nmXeV-0005qx-7g
 for qemu-trivial@nongnu.org; Thu, 05 May 2022 05:20:04 -0400
Received: by mail-wr1-x42f.google.com with SMTP id x18so5290156wrc.0
 for <qemu-trivial@nongnu.org>; Thu, 05 May 2022 02:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=3haBgs4PIBPpKdoZTjBSTYT+BclEds/TNIsz5zmvEB0=;
 b=QQXY5zb4+AOWYN43qOX1efV+/tsWecH7ZaGjHSCktkEQhaW3pMHMzQt6ZL75CPiZDz
 OyaL1JSr9fWSPl93iA9RSph+U622vZIjVYI0yUeim+oelK4Xrstcz2dKfhipCI+4KruK
 tPIlNOE675X16efglI+Ao01rG8roI43EjCEwN7GtpO7I9uXiYsseM+ltIZFe5TVbpcR3
 Jlg2SFWxTd0SapRX17ANB6oFP19asvc7wfiWS8SAv4YJ8eRYvgX1rxRb0mjWx+TOFJv9
 xpDNvhHKSlckFz/wrAKP6MqulMLk1xQ3FaifoF2CmL4ZHHX2yWb4je7pj9C3Tiirxl0b
 NbCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=3haBgs4PIBPpKdoZTjBSTYT+BclEds/TNIsz5zmvEB0=;
 b=1cU5ukcpb5DuhSZgHvUf10noFzyQi6cxRmmZ5B8pncRjejD87du2P+taC6DDNNvG0l
 bNyO12li0NjU+BrVAuaERIu6EV8BysaPSBqfWJ70ibmPpYWCz+QAmoZt2PccKC7/ArXw
 zUoGR2L78rNbskXhz0m7BcfaL1dCkPLuG8RcpQRB+wEBRY5VJiT7jyE+LWOsD6P4bmq/
 nLpCqtGO502Z0IUNLBwOp6cz66pceWPuCKFogUqP6OaxzIoAMsaM97ddFcsNJVF6h846
 igbSN9UkCHbp2rsXglizzK2VogC3jo2Hq+FwyEYU9DVAVag92PLNKNohFWvuc8OsqEYI
 j/pw==
X-Gm-Message-State: AOAM530KlZZ2dBFI3tNVzzZ4F+ubi7OJV5Pl3a/z8DOYXbkcMd0TzP6I
 +qAWcvxgjGisHFUI0c0ULpzQPQ==
X-Google-Smtp-Source: ABdhPJyun+P5kUztrlJchx3TS293NwG9V12etsqhPkpcsCoTInFnOmA+IrM2jqGIMxL6hrxRMUvIjA==
X-Received: by 2002:a5d:6b11:0:b0:20a:a247:25f4 with SMTP id
 v17-20020a5d6b11000000b0020aa24725f4mr19555402wrw.234.1651742398314; 
 Thu, 05 May 2022 02:19:58 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 b4-20020a05600010c400b0020c5253d8fesm742274wrx.74.2022.05.05.02.19.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 02:19:57 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6B5D41FFB7;
 Thu,  5 May 2022 10:19:56 +0100 (BST)
References: <20220503200524.1868-1-luoyonggang@gmail.com>
 <177e1d2f-1f67-4921-a49c-413ac1488487@redhat.com>
User-agent: mu4e 1.7.13; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org, Wainer dos
 Santos Moschetta <wainersm@redhat.com>, qemu-trivial@nongnu.org, Beraldo
 Leal <bleal@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>
Subject: Re: [PATCH 0/2] Upgrade mingw base packages
Date: Thu, 05 May 2022 10:19:33 +0100
In-reply-to: <177e1d2f-1f67-4921-a49c-413ac1488487@redhat.com>
Message-ID: <87zgjwtjyb.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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
X-List-Received-Date: Thu, 05 May 2022 09:20:05 -0000


Thomas Huth <thuth@redhat.com> writes:

> On 03/05/2022 22.05, Yonggang Luo wrote:
>> v1. upgrade both cirrus and gitlab-ci to the newest mingw base release
>> Yonggang Luo (2):
>>    cirrus/win32: upgrade mingw base packages
>>    gitlab-ci: Upgrade mingw base package.
>>   .cirrus.yml              | 2 +-
>>   .gitlab-ci.d/windows.yml | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>=20
>
> Tested-by: Thomas Huth <thuth@redhat.com>
>
> I can take this through my next misc/testing pull request if nobody
> else wants to take it first.

Go for it, I don't have any testing/next brewing at the moment.

--=20
Alex Benn=C3=A9e

