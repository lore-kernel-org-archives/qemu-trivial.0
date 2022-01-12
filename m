Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n7h4d-0008OF-Ce
	for mharc-qemu-trivial@gnu.org; Wed, 12 Jan 2022 12:06:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n7h4b-0008I1-KY
 for qemu-trivial@nongnu.org; Wed, 12 Jan 2022 12:06:09 -0500
Received: from [2a00:1450:4864:20::42e] (port=41530
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n7h4Z-0004Iv-Us
 for qemu-trivial@nongnu.org; Wed, 12 Jan 2022 12:06:09 -0500
Received: by mail-wr1-x42e.google.com with SMTP id v6so5400987wra.8
 for <qemu-trivial@nongnu.org>; Wed, 12 Jan 2022 09:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=N0o08J2eeJ2usJ3KVRna3CwSwhqUYmecvtj6wjkJb8U=;
 b=EJeXW2y1JX0XNV6uMD3OCQrjhwTXKf2XeKcNquGC9HPeFLartgUi+lhLIe9sAariTD
 ZQezLW615r0KroNUFtZZPYbvbK/hUbIjtcR01xHQYX+JNJM2dTnHK7arXhuqCN3oY6vx
 kZJuQoN0aJtILVDnS8ADAPLKTU8lVFbh7feHvV/I6rqryAsIQKklgdcn/hEB1uwyQf67
 puAzW1bjKpEcOqHYm1SA2LwYtN7lEAQkKRVmfDB5JCGkkY+Qdkscm9yTXlmVfsf+3+xd
 usxgQHM+c5pGdyauyJApXsRopYFAJHb5+Esrs9zVCPgonVbawsqqtCGwecUOjb00yQw6
 vU5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=N0o08J2eeJ2usJ3KVRna3CwSwhqUYmecvtj6wjkJb8U=;
 b=t/Z+an6DncBhYdWfjNRcLS1l4wo9O5JfZlCZ5Am/c8ybnCg4QpY0CJ3uh1Osq7azAS
 Tl0585Rvdigii9NtWXCOzLBJblcBbQRAdJyqdw3XBkV0Si5asgnH/y+f2yT0ui+IL+9k
 qj/zRDt9IVdW8zBIdmze6zva3+GhSlKVeWYthgq9jfDnJe59c0TpSC6zu4NDqV0Ig7eV
 FLoS5i80m4yUdlw4UgQPv5hEHlvjHnVfIh/TVaMnDu/3gERDAnR36Q9ryWQTtz/RCMfZ
 fUR/JXJF7Sq+Ji85id4CZz64Mp0I/2j6auetsgIUt/XIQlOQlUTf+GUO2spxcVp0wgkN
 lOww==
X-Gm-Message-State: AOAM533WevxlOISZsFbhQQFRh7sijC8M4AsP0HYxVShtsZQSstZBoWt2
 vjvru0AdURMdoMqGudVNygojzg==
X-Google-Smtp-Source: ABdhPJy/aksIen9WrudOUrNIniQmj+pvkAT2GeDehKD89F7pebj5kqnUX/HH1aMUyHPK3Gbi+xcD7g==
X-Received: by 2002:a5d:4087:: with SMTP id o7mr573520wrp.189.1642007165923;
 Wed, 12 Jan 2022 09:06:05 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id az4sm363449wrb.14.2022.01.12.09.06.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 09:06:05 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 882151FFB7;
 Wed, 12 Jan 2022 17:06:04 +0000 (GMT)
References: <20220111175528.22294-1-f4bug@amsat.org>
User-agent: mu4e 1.7.5; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: qemu-trivial@nongnu.org, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] tests: Fix typo in check-help output
Date: Wed, 12 Jan 2022 17:05:59 +0000
In-reply-to: <20220111175528.22294-1-f4bug@amsat.org>
Message-ID: <87lezkanpf.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 12 Jan 2022 17:06:10 -0000


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> Fix typo in 'make check-help' output.

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e

