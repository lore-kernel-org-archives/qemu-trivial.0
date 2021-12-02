Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1msjxZ-0003I9-KS
	for mharc-qemu-trivial@gnu.org; Thu, 02 Dec 2021 06:09:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1msjxX-0003EP-37
 for qemu-trivial@nongnu.org; Thu, 02 Dec 2021 06:09:03 -0500
Received: from [2a00:1450:4864:20::330] (port=37773
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1msjxU-000274-Ls
 for qemu-trivial@nongnu.org; Thu, 02 Dec 2021 06:09:02 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 k37-20020a05600c1ca500b00330cb84834fso2006461wms.2
 for <qemu-trivial@nongnu.org>; Thu, 02 Dec 2021 03:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=gqvfiMrvq3TxlvSgddkBc5CRwKssRB2Bgp1Pg4hF3ZA=;
 b=QZHC4IThu34f1FJAMzx0fx4bznoY3FWWxiplaqncoWB6UvEj64pjzj1ElKw+TtxJjF
 JUbZPZYzF2/1GGc1kj10jyGlmpljt0pqZRljfg6+2tvDEAjs23bFBxqGyCPczIbgodlo
 W+DuUZXUIrrDcvEUAm57kijmxmAfY3YExl7m6XRPBoL8VtcKZGtMGg/LFOzM1XfcWc1c
 UgKVjujT8hqYCaw0NJH7azJHcno6gbZPtzdUNHNaEGGITeyjSyJNRWGJXWrqyCYYH6P0
 j3PaFaxqDsJBwzzDnOppJHuBr2F2SW9XZs6mqMNP7DYZRKsC/DL9Y2JO7/asl/0Kx3Nd
 tkUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=gqvfiMrvq3TxlvSgddkBc5CRwKssRB2Bgp1Pg4hF3ZA=;
 b=TQzjAFaIA3Kxm3vpd+I8fYSYnOlLU/I05+j15yIbjDySf09QKOeBu1jHtNm2VoFyee
 ag4gwQtMf38G80ICklkcl4Sot3ALJbqU73St0JdR2QSA9nCLcb74DBVn0qCb1sHziP9o
 VZgpti91tIN3Tl3gtE5JsRLeJgD1S3CdtGKUrMq7AXVdCtO18QFrR7hfPW5QskaM6dZK
 d+wSMJKIaYOV2r1UADeYBzhFZ4qkxQq+qGTtMJJw9VFXryXoSQt/n9KmoSwcpqNGsnc7
 sxrPuCng3nJ2nZrtw+lyw/Qt3ih2eEF62ZamLbaI81eADzqm5c620JB4sitcn2kL0AKr
 WYrA==
X-Gm-Message-State: AOAM532VzvApg8F95x40BMADKJmQn2qdPqhoPYc4bLsbJsGiMI2hOHnw
 4q6Qolk5pZO6FiK4AgBazWXg0w==
X-Google-Smtp-Source: ABdhPJy72ZrsIrn10A0gSJwb3j+llMY1pTWxWqIMSM8T1XIQfPhxXTx62wnB31xdDDe9BhCdZQhiLw==
X-Received: by 2002:a7b:c301:: with SMTP id k1mr5586727wmj.36.1638443338736;
 Thu, 02 Dec 2021 03:08:58 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i15sm2158647wmq.18.2021.12.02.03.08.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 03:08:57 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2161D1FF96;
 Thu,  2 Dec 2021 11:08:57 +0000 (GMT)
References: <20211128011551.2115468-1-juro.bystricky@intel.com>
 <87r1azyv88.fsf@linaro.org>
 <81d05a81-8ade-2a6c-427e-79a93543554f@amsat.org>
User-agent: mu4e 1.7.5; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: Juro Bystricky <juro.bystricky@intel.com>, qemu-trivial@nongnu.org,
 erdnaxe@crans.org, ma.mandourr@gmail.com, qemu-devel@nongnu.org,
 jurobystricky@hotmail.com
Subject: Re: [PATCH] tests/plugin/syscall.c: fix compiler warnings
Date: Thu, 02 Dec 2021 11:08:30 +0000
In-reply-to: <81d05a81-8ade-2a6c-427e-79a93543554f@amsat.org>
Message-ID: <87fsrbxnzq.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 02 Dec 2021 11:09:03 -0000


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> On 11/29/21 13:58, Alex Benn=C3=A9e wrote:
>>=20
>> Juro Bystricky <juro.bystricky@intel.com> writes:
>>=20
>>> Fix compiler warnings. The warnings can result in a broken build.
>>> This patch fixes warnings such as:
>>=20
>> Queued to for-6.2/more-misc-fixes, thanks.
>
> I wondered if this single patch would justify delaying the 6.2
> release by one week, but then I noticed the IDE pull request,
> so let it be...

Already in - as I had a PR in flight ;-)

>
> Note, -Werror=3Dmaybe-uninitialized forces an ugly alignment style
> to the g_autofree + g_strdup_printf() combination.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Thanks anyway.


--=20
Alex Benn=C3=A9e

