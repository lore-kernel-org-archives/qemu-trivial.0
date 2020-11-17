Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kezGd-00087U-2v
	for mharc-qemu-trivial@gnu.org; Tue, 17 Nov 2020 06:35:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kezGb-00084b-CA
 for qemu-trivial@nongnu.org; Tue, 17 Nov 2020 06:35:21 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:39279)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kezGZ-00047w-I2
 for qemu-trivial@nongnu.org; Tue, 17 Nov 2020 06:35:20 -0500
Received: by mail-wr1-x443.google.com with SMTP id o15so22829005wru.6
 for <qemu-trivial@nongnu.org>; Tue, 17 Nov 2020 03:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=URD8fVosMHY5QVA8v8hRZ8DAuBSpaKGzeHLE1su1yps=;
 b=UtXI4nQjzvAfg0CdtQrfW9CBDV9kEdIo0YAOpvk5/kPY73Xm1W5Y+W+HjfP94Wh0iQ
 Al/v+8vFkmB0/aqKNQLW8C0vwTF+CZ6YWFed9RJyDAeYHtAyFLEjDZ4QjSigg7UPdKyd
 QZBdmapj0v5/oVXorI+QjEPc4dpnwNqE8c/tnPhQiG/GmGKoX7Tu9p8hryZKWhU9J6Ya
 q3zNges5YgoznHMeaccRxmUSJmGgwgkSnkabHpcm/DBs0i3jsmFqnqpPrvl9kJKjOOB+
 H4eeksh4COodXAWiygi7mDqHRmL+2X1mlay2dq/+dpKiUXwmKOwgd1qANpVYpQB3sQcF
 akLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=URD8fVosMHY5QVA8v8hRZ8DAuBSpaKGzeHLE1su1yps=;
 b=MyAh4gU0tkKHjsM/NLChAqXaNP+VX6BrZiGq2Nq/XI7HmsQa2YPSYfGG8XeNbriEZ3
 yrDJHEg1Iv3lIk8SmwrY8pGE/pYG0khLOE75iLD7BhxTMmDibruyN26y/m3qLwgD+XOI
 eyxqiLRssjvn7uKwwn7jA4RUzTX9U/BTTb2qmxToAsgPVPfmLM/U6b/xtY5Ayg5zZkEj
 PvXtO1QlRI5Mqj5ZVN+RWvuCxxAX4xW6J6r7btJN12idbV2N8ab1I4MrdtleD09YxUYi
 duSzWDpz0hdh6trFWh4MBW/0W3pTCA6PcSnXTu2efpfS04qrEoLXwH8M7Nhd+HIaupFP
 8W/A==
X-Gm-Message-State: AOAM533JQ0Htt8cNidoMVI+Gg0FECH7lqBgOZbo9T/yHXfIR+BdRjrAz
 /G77UxgbUd1EWWvUyUNCO9RA8Q==
X-Google-Smtp-Source: ABdhPJzRJPe/M+yIFYEGAazVoamrVbh9qCwkJQOLkQqIV4hjJB8NnSqOHM7wKlWHKvyK2uCPa5BWxg==
X-Received: by 2002:adf:f146:: with SMTP id y6mr24646811wro.298.1605612914421; 
 Tue, 17 Nov 2020 03:35:14 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k64sm1619879wmb.11.2020.11.17.03.35.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 03:35:13 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 723031FF7E;
 Tue, 17 Nov 2020 11:35:12 +0000 (GMT)
References: <5F9975F1.4080205@huawei.com>
 <c91f4827-0be0-b0d1-f183-d3d868079a50@redhat.com>
 <5FB3239E.6030709@huawei.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Alex Chen <alex.chen@huawei.com>
Cc: Thomas Huth <thuth@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 mjt@tls.msk.ru, qemu-trivial@nongnu.org, zhengchuan@huawei.com,
 qemu-devel@nongnu.org, zhang.zhanghailiang@huawei.com
Subject: Re: [PATCH 2/2] plugins: Fix two resource leaks in connect_socket()
In-reply-to: <5FB3239E.6030709@huawei.com>
Date: Tue, 17 Nov 2020 11:35:12 +0000
Message-ID: <87k0ukw70v.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x443.google.com
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
X-List-Received-Date: Tue, 17 Nov 2020 11:35:21 -0000


Alex Chen <alex.chen@huawei.com> writes:

> On 2020/11/17 0:50, Thomas Huth wrote:
>> On 28/10/2020 14.45, AlexChen wrote:
>>> Either accept() fails or exits normally, we need to close the fd.
>>>
>>> Reported-by: Euler Robot <euler.robot@huawei.com>
>>> Signed-off-by: AlexChen <alex.chen@huawei.com>
>>> ---
>>>  contrib/plugins/lockstep.c | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/contrib/plugins/lockstep.c b/contrib/plugins/lockstep.c
>>> index 319bd44b83..5aad50869d 100644
>>> --- a/contrib/plugins/lockstep.c
>>> +++ b/contrib/plugins/lockstep.c
>>> @@ -268,11 +268,13 @@ static bool setup_socket(const char *path)
>>>      socket_fd =3D accept(fd, NULL, NULL);
>>=20
>> I think you could also simply close(fd) here instead, then you don't hav=
e to
>> do it twice below.
>>=20
>
> Hi Thomas and Alex,
> Thanks for your suggestion. It's a simple and effective solution.
> Considering that the patch v3 has been queued by Alex Benn=C3=A9e,
> May I modify this patch and then send patch v4?

The fix has already been merged so a fresh patch would make more sense.

--=20
Alex Benn=C3=A9e

