Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lme2Y-0002ZD-II
	for mharc-qemu-trivial@gnu.org; Fri, 28 May 2021 11:04:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lme2X-0002Xw-69
 for qemu-trivial@nongnu.org; Fri, 28 May 2021 11:04:45 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:35547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lme2V-0003bQ-Gv
 for qemu-trivial@nongnu.org; Fri, 28 May 2021 11:04:44 -0400
Received: by mail-wr1-x432.google.com with SMTP id m18so3634786wrv.2
 for <qemu-trivial@nongnu.org>; Fri, 28 May 2021 08:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=7MBybLcU/BPuXa38tVgLj7WefWdY7dawobNrCW9qb7o=;
 b=h7VO991rHWGQGV8yfJoOHdFRH8wU0+3AFeIL1Zhce+XOq+gW4FdIkAcz+hcLG93z49
 ld0e8WwjMHSB4/FSImilVTQvlGQqQJ7N/EXMd9+1bBfRhHocb1bO9M+UhTP0b6QxVTLy
 B/ALMHnlglaKhg1FJv1YxH20FKxWhi+2QFeRc90Y/tRXjdwVTIyZZ0DbCK5hhmN+ohAI
 oEskJQvTpBaaf70HbTiIRtfX5RUTV8zTod3+SOPxNqTg3sUZZRX86jWYxSo81t0wzj9z
 EFsYJpQrK0PUxdRJuDcCBKH6Bdo9L0hErzNu1vmbDA5T7YZohYwdEVYNEmrkuH4GOLF/
 c20w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=7MBybLcU/BPuXa38tVgLj7WefWdY7dawobNrCW9qb7o=;
 b=CVs5DZlaP2hwlDoHePP8HMKUgp7inqp5O5Limzorn1eyf32dYkt5MJknStHzdMAMHV
 rxy4J7MknmLhKsfoyu/aPFCiqaYRX5f6dj/yKdCHT6iIsA0kzB3OKRRqg4XMzz6uCi+c
 kJBhNuYMwrLTQYd520JDaeXsrD9HT/02SfyVP1f43eb1TgDBwXtssmF6lZBPbgNw5m3Z
 NH/Iq7/NVWrqQxWRLfBmIYY51P9WTKlEtuo/CQH8tp7R1RT1y4tc6fYGaQittC6kUjmS
 nN/sHteMW+hgu/F2O9hELMSocEZHjKFhXeRS/p8odawyfsq44asY7/pUeKVcbDzT54cD
 pMNg==
X-Gm-Message-State: AOAM531oGl65Rw7exnvA0+d2z2szXlOPCDAW2l1Y/0iq3iN7yhI7PlKw
 hl+QfQVl6lxhWpQXuBR0cxkNtA==
X-Google-Smtp-Source: ABdhPJzJ1Kd0IK5p4xeyJ1aqPE8yV/4hh6IUiLDrtK8Sqo0EzVcWX+FBRUHv93EsnfnJgbKJ9ltBKg==
X-Received: by 2002:adf:ec48:: with SMTP id w8mr9044130wrn.176.1622214280407; 
 Fri, 28 May 2021 08:04:40 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l8sm4429979wrf.0.2021.05.28.08.04.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 May 2021 08:04:39 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 880601FF7E;
 Fri, 28 May 2021 16:04:38 +0100 (BST)
References: <20210528123526.144065-1-luis.pires@eldorado.org.br>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Luis Pires <luis.pires@eldorado.org.br>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Subject: Re: [PATCH RESEND 1/1] docs/devel: Add a single top-level header to
 MTTCG's doc
Date: Fri, 28 May 2021 16:04:24 +0100
In-reply-to: <20210528123526.144065-1-luis.pires@eldorado.org.br>
Message-ID: <87k0ni292x.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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
X-List-Received-Date: Fri, 28 May 2021 15:04:45 -0000


Luis Pires <luis.pires@eldorado.org.br> writes:

> Without a single top-level header in the .rst file, the index ended
> up linking to all of the top-level headers separately. Now the index
> links to the top-level header at the beginning of the document and
> any inner headers are correctly linked as sub-items in the index.
>
> Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>

Queued to testing/next for want of a better tree. thanks.

> ---
>  docs/devel/multi-thread-tcg.rst | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/docs/devel/multi-thread-tcg.rst b/docs/devel/multi-thread-tc=
g.rst
> index 92a9eba13c..5b446ee08b 100644
> --- a/docs/devel/multi-thread-tcg.rst
> +++ b/docs/devel/multi-thread-tcg.rst
> @@ -4,8 +4,9 @@
>    This work is licensed under the terms of the GNU GPL, version 2 or
>    later. See the COPYING file in the top-level directory.
>=20=20
> -Introduction
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Multi-threaded TCG
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20=20
>  This document outlines the design for multi-threaded TCG (a.k.a MTTCG)
>  system-mode emulation. user-mode emulation has always mirrored the


--=20
Alex Benn=C3=A9e

