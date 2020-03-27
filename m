Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jHl2f-0006Ds-3q
	for mharc-qemu-trivial@gnu.org; Fri, 27 Mar 2020 05:12:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56318)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1jHl2Z-0006DE-52
 for qemu-trivial@nongnu.org; Fri, 27 Mar 2020 05:12:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1jHl2X-0005Nh-SN
 for qemu-trivial@nongnu.org; Fri, 27 Mar 2020 05:12:34 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:39985)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1jHl2X-0005Ls-LX
 for qemu-trivial@nongnu.org; Fri, 27 Mar 2020 05:12:33 -0400
Received: by mail-wm1-x344.google.com with SMTP id a81so11469126wmf.5
 for <qemu-trivial@nongnu.org>; Fri, 27 Mar 2020 02:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=VDKz5xj4Ag35S/nd/UOQDRJeyFgs4jGAjtuHHsGBYig=;
 b=rWilbccFXwYKObj51DLNPAnmhhMN2BppaN8gywMRgfR80CVww2X5chv9BmAmPrG2uu
 XVHhyR8vdMQ8dN3PLO32WBg0v15a+JpwQdWiNDVm8RN+gRfM3XxVxaUt6veU6uEIK6Oy
 crkMWOMgL5iAGcZ9mXCoRS7N+9uLn6mr7sLNh2rb7RSop93kKqfNVAI1twhdR/8OkQJv
 nAYISuOx56hAzz/ATQIiPC7xCt8hC+2eSgDYaSKl29UPiE+7mcxSJRg6vSRNg95kqgdE
 NkBrkmfKP2p3BZrTB9m7J5c+I6qcnhv7F1eGJNKzswDYaSPUjZAUtic1VhYqI5u48JQL
 STsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=VDKz5xj4Ag35S/nd/UOQDRJeyFgs4jGAjtuHHsGBYig=;
 b=QyIrQAZUGSQMTMt7Bq4OLCL5VXkGwouckU2PjWGutLgznDMJNwEfHTjgej8DTucECG
 jTOXRik0LflUoNRjQMbhVYbnZSRW67nDSL9sSTzhqvLtyaPR+VkFU/JX/qqqLdYZnwVB
 11tEwdBBHhasV0hNhqNjTHhMCZzThUfn/HqlDeX2H/9LHf+7h5Rxfk5jvncgHNE6t8xL
 aQa7zdazzaQifAgWdQhBBgKTJLh0XFTqOrUfTT+k6ii8cnebSJKlF/qwvbsKOpwOXdZS
 5tlut8VLHTlfGzssVlllISTaFbiqCEmjIl05FPqeidiaRh0mHJLH7o3NGx0kBpSibXgj
 EefQ==
X-Gm-Message-State: ANhLgQ1j8DDeE1ifLUetvyUAdgLeKd/qRTRFHTqfNU6+yjo+HZGE4yCZ
 depkQRtEEta6fPpycrocvjbnLA==
X-Google-Smtp-Source: ADFU+vtBFwaIl+FI+VAEuRXijAws3tpfe03tLc97TnjYUs5zM/v+9Px2Wwtc5QAcXeiSuo4fqRFnmg==
X-Received: by 2002:a1c:e442:: with SMTP id b63mr4476500wmh.174.1585300352260; 
 Fri, 27 Mar 2020 02:12:32 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id e5sm7136666wru.92.2020.03.27.02.12.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2020 02:12:31 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 90FF11FF7E;
 Fri, 27 Mar 2020 09:12:30 +0000 (GMT)
References: <20200325092137.24020-1-kuhn.chenqun@huawei.com>
 <20200325092137.24020-2-kuhn.chenqun@huawei.com>
User-agent: mu4e 1.3.10; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Chen Qun <kuhn.chenqun@huawei.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 zhang.zhanghailiang@huawei.com, laurent@vivier.eu, Euler Robot
 <euler.robot@huawei.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@redhat.com>
Subject: Re: [PATCH 1/3] gdbstub: prevent uninitialized warning
In-reply-to: <20200325092137.24020-2-kuhn.chenqun@huawei.com>
Date: Fri, 27 Mar 2020 09:12:30 +0000
Message-ID: <874kuanou9.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
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
X-List-Received-Date: Fri, 27 Mar 2020 09:12:39 -0000


Chen Qun <kuhn.chenqun@huawei.com> writes:

> According to the glib function requirements, we need initialise
>      the variable. Otherwise there will be compilation warnings:
>
> qemu/gdbstub.c: In function =E2=80=98handle_query_thread_extra=E2=80=99:
> /usr/include/glib-2.0/glib/glib-autocleanups.h:28:3: warning:
>  =E2=80=98cpu_name=E2=80=99 may be used uninitialized in this function [-=
Wmaybe-uninitialized]
>    g_free (*pp);
>    ^~~~~~~~~~~~
>
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>

Thanks,

I've pulled in a duplicate fix from:

  Message-Id: <20200326151407.25046-1-dplotnikov@virtuozzo.com>

and added your Reported-by's

> ---
> Cc: "Alex Benn=C3=A9e" <alex.bennee@linaro.org>
> Cc: "Philippe Mathieu-Daud=C3=A9" <philmd@redhat.com>
> ---
>  gdbstub.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/gdbstub.c b/gdbstub.c
> index 013fb1ac0f..171e150950 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -2060,8 +2060,8 @@ static void handle_query_thread_extra(GdbCmdContext=
 *gdb_ctx, void *user_ctx)
>          /* Print the CPU model and name in multiprocess mode */
>          ObjectClass *oc =3D object_get_class(OBJECT(cpu));
>          const char *cpu_model =3D object_class_get_name(oc);
> -        g_autofree char *cpu_name;
> -        cpu_name  =3D object_get_canonical_path_component(OBJECT(cpu));
> +        g_autofree char *cpu_name =3D
> +            object_get_canonical_path_component(OBJECT(cpu));
>          g_string_printf(rs, "%s %s [%s]", cpu_model, cpu_name,
>                          cpu->halted ? "halted " : "running");
>      } else {


--=20
Alex Benn=C3=A9e

