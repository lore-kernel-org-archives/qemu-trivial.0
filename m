Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pmDdO-0001fa-Rn
	for mharc-qemu-trivial@gnu.org; Tue, 11 Apr 2023 09:02:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pmDdI-0001bz-Bg
 for qemu-trivial@nongnu.org; Tue, 11 Apr 2023 09:02:04 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pmDd6-0007TG-Pa
 for qemu-trivial@nongnu.org; Tue, 11 Apr 2023 09:01:52 -0400
Received: by mail-wr1-x42e.google.com with SMTP id v29so7489354wra.13
 for <qemu-trivial@nongnu.org>; Tue, 11 Apr 2023 06:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681218097; x=1683810097;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NrJ2EqcIcPn4Va+m6vWRZ+bjH+VH9VSbpYhYF9zj+wQ=;
 b=Gp4AMTiRvup4Yc7DlSPHAukyE/eURwdvrEPBTVgOrxmakmQsOCDp4oul+7ToBX/nsf
 7O62hbLZg5ZJCUDKOHoamRc7zXREF6zAs5vBZIu7PzfbP4JUaH1tei558FL4B1LVMxom
 lx0m924C2+Vl0jpxMakkvOviBq+4qiPGyWW1/3sHxrwWvOXoCJQj7mHbv810U+trHNja
 kRoorHE4qwhlGHQQsT5itsmiLhAGuA4sIPxP9HrnTbaJxU0P4xpKPARzIlj41iSTiIjW
 6VDG5qyrnNy/eILjn37yAt5x1NErlb3bQ0QXIQKcdN1XPEP6XjYceMUfU4UUY4fgVEjv
 EvhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681218097; x=1683810097;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=NrJ2EqcIcPn4Va+m6vWRZ+bjH+VH9VSbpYhYF9zj+wQ=;
 b=A3/eVasW3TqD2kGS4SWEpjC9uS8yssumBETxVG0NPzyjhJGvJUtnuYHOSyal+mMurU
 C+bFWQ5YOH43A2EJBTjCU1e7zZQZ6mPqvZc4uBbDcl0Y0gUzxiz8DIZsG74SO/HroC7i
 yxnJ80EYmj+VG4lZTvtGK31Eqs7246GTJgxbl6rp6tUIZV4cDp3z94bvKJaEt4hRTZyn
 kvye7yqo5dV/6BdWCG2AEy+I6hvNhzBRNMilOv9xzsBCdgQTuMjUpoVRPbDw3omI8xFd
 wwQOEMDCkMGnt1cnjAoLu/Z2i+v1vjATYQE2vqsLfDXFtP3Nbbcv85g4/QBQtzJEOKaW
 8CHA==
X-Gm-Message-State: AAQBX9fTgh0QX/D+wIdi1V0elcCRXlX0UN7pbqXI4Po0RdJdJBW0Yl29
 uLHC7ce+iXI0WStot3RqdGi3fg==
X-Google-Smtp-Source: AKy350bFcsAdCFmTynFo66fxbC/aKAzT0iN/S02JiLJIQ8OeK6uqrf3D5Jy46QC2TPMMe+iVZ0B1Tg==
X-Received: by 2002:a5d:564b:0:b0:2db:2678:ffed with SMTP id
 j11-20020a5d564b000000b002db2678ffedmr2046106wrw.7.1681218096868; 
 Tue, 11 Apr 2023 06:01:36 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a5d688a000000b002f284f0f7a8sm3112730wru.107.2023.04.11.06.01.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 06:01:36 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0065D1FFB7;
 Tue, 11 Apr 2023 14:01:35 +0100 (BST)
References: <TYZPR06MB5418D6B0175A49E8E76988439D8E9@TYZPR06MB5418.apcprd06.prod.outlook.com>
User-agent: mu4e 1.10.0; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Yohei Kojima <y-koj@outlook.jp>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Subject: Re: [PATCH] qemu-options.hx: Update descriptions of memory options
 for NUMA node
Date: Tue, 11 Apr 2023 13:57:34 +0100
In-reply-to: <TYZPR06MB5418D6B0175A49E8E76988439D8E9@TYZPR06MB5418.apcprd06.prod.outlook.com>
Message-ID: <87sfd6po7k.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 11 Apr 2023 13:02:04 -0000


Yohei Kojima <y-koj@outlook.jp> writes:

> This commit adds the following description:
> 1. `memdev` option is recommended over `mem` option (see [1,2])
> 2. users must specify memory for all NUMA nodes (see [2])
>
> This commit also separates descriptions for `mem` and `memdev` into two
> paragraphs. The old doc describes legacy `mem` option first, and it was
> a bit confusing.
>
> Related documantations:
> [1] https://wiki.qemu.org/ChangeLog/5.1#Incompatible_changes
> [2] https://www.qemu.org/docs/master/about/removed-features.html
>
> Signed-off-by: Yohei Kojima <y-koj@outlook.jp>
> ---
>  qemu-options.hx | 25 ++++++++++++++++---------
>  1 file changed, 16 insertions(+), 9 deletions(-)
>
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 59bdf67a2c..174f0d0c2d 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -405,15 +405,22 @@ SRST
>          -numa node,nodeid=3D0 -numa node,nodeid=3D1 \
>          -numa cpu,node-id=3D0,socket-id=3D0 -numa cpu,node-id=3D1,socket=
-id=3D1
>=20=20
> -    Legacy '\ ``mem``\ ' assigns a given RAM amount to a node (not suppo=
rted
> -    for 5.1 and newer machine types). '\ ``memdev``\ ' assigns RAM from
> -    a given memory backend device to a node. If '\ ``mem``\ ' and
> -    '\ ``memdev``\ ' are omitted in all nodes, RAM is split equally betw=
een them.
> -
> -
> -    '\ ``mem``\ ' and '\ ``memdev``\ ' are mutually exclusive.
> -    Furthermore, if one node uses '\ ``memdev``\ ', all of them have to
> -    use it.
> +    '\ ``memdev``\ ' option assigns RAM from a given memory backend
> +    device to a node. It is recommended to use '\ ``memdev``\ ' option
> +    over legacy '\ ``mem``\ ' option. This is because '\ ``memdev``\ '
> +    option provides better performance and more control over the
> +    backend's RAM (e.g. '\ ``prealloc``\ ' parameter of
> +    '\ ``-memory-backend-ram``\ ' allows memory preallocation).
> +
> +    For compatibility reasons, legacy '\ ``mem``\ ' option is
> +    supported in 5.0 and older machine types. Note that '\ ``mem``\ '
> +    and '\ ``memdev``\ ' are mutually exclusive. If one node uses
> +    '\ ``memdev``\ ', the rest nodes have to use '\ ``memdev``\ '
> +    option, and vice versa.
> +
> +    Users must specify memory for all NUMA nodes by '\ ``memdev``\ '
> +    (or legacy '\ ``mem``\ ' if available). In QEMU 5.2, the support
> +    for '\ ``-numa node``\ ' without memory specified was removed.

I think this mixes up memdev and mem too much. It would be better to
make the lead up to the example just talk about memdev (as it is the
preferred option) and move the discussion about backwards compatibility
to after the example. You can use the .. note:: annotation to put it in
a nice little box, something like:

.. note::

    For compatibility reasons, legacy '\ ``mem``\ ' option is
    supported in 5.0 and older machine types. Note that '\ ``mem``\ '
    and '\ ``memdev``\ ' are mutually exclusive. If one node uses '\
    ``memdev``\ ', the rest of the nodes must also use the '\
    ``memdev``\ ' option, and vice versa.


>=20=20
>      '\ ``initiator``\ ' is an additional option that points to an
>      initiator NUMA node that has best performance (the lowest latency or


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

