Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pCMEn-0003Gz-4h
	for mharc-qemu-trivial@gnu.org; Mon, 02 Jan 2023 09:56:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <blue@cmd.nu>) id 1pCDqC-0007os-Nq
 for qemu-trivial@nongnu.org; Mon, 02 Jan 2023 00:58:32 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <blue@cmd.nu>) id 1pCDqB-00032c-0N
 for qemu-trivial@nongnu.org; Mon, 02 Jan 2023 00:58:32 -0500
Received: by mail-ed1-x536.google.com with SMTP id g1so24529860edj.8
 for <qemu-trivial@nongnu.org>; Sun, 01 Jan 2023 21:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cmd.nu; s=google;
 h=cc:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Foi7/x1gD9aRS6Wu+MR5MBq6sIENBWZthvbUi4hjXtE=;
 b=TdtzQBQI5h/vtghRznY87bny5qadwjvkKam+0OWcaJs4m4rw1HgdGHw3MvsNqe2V0N
 Dplcl9baoPoUghC5iDsrYb2ASZ5ba68rU2Ii/GqQR10obFJ4dmtI+Sds+z7kWLt7blBU
 PBCci6UWvslixfnyrd2TV1xUMQFNUNA2mEGvw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Foi7/x1gD9aRS6Wu+MR5MBq6sIENBWZthvbUi4hjXtE=;
 b=qLQs4kr6mwc5vTRWd8AFfs4dYH152ztlSaXiT2tEZS0PAi0v9Dl0CmchOB5VKZQgMd
 4/LHlteDwTPPeSmlhsNoTSJlfklntW4/hoy7QsBbidh0Ppe9YHZ/oZKNCLH9aaAxltJV
 P3k08etf+rehJF7QT/m5pni6azes97f8l7dGxyH9dFKKMJcycxINORAj9AI4BArM23Jy
 h+oSyolMKmIcbct/ZPK+5/skhn9fMSZcpDOq1UcxNnp5eEpOYrzVGIGpUt989jNhrkCA
 rnkoO3IrmeZweuGJdSQgo25KcQyjel+9uKKqGy9W5AJu9KVj1XvPG0XgdekU5tXKEQwE
 zT7A==
X-Gm-Message-State: AFqh2kqN3tCuRXsWco4S5SEHehuxVHeDjh1Q/PtyrUbYcRFkip4QnXYb
 Hop7gYQk4A+2Kadmgtod0g+PGmrVnAwMgnhExWjuLg==
X-Received: by 2002:a50:fe18:0:b0:483:9ad4:3435 with SMTP id
 f24-20020a50fe18000000b004839ad43435mt3794554edt.301.1672639108504; Sun, 01
 Jan 2023 21:58:28 -0800 (PST)
MIME-Version: 1.0
References: <20221230202710.115187-1-blue@cmd.nu>
In-Reply-To: <20221230202710.115187-1-blue@cmd.nu>
From: Christian Svensson <blue@cmd.nu>
Date: Mon, 2 Jan 2023 06:58:18 +0100
Message-ID: <CADiuDARG-zoaPHHL6iyBu_Np2MwJ4_=wF4oes=Puy_UStFqEuQ@mail.gmail.com>
Subject: Re: [PATCH] net: Increase L2TPv3 buffer to fit jumboframes
Cc: Jason Wang <jasowang@redhat.com>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 qemu-trivial@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000e7f95505f141a397"
Received-SPF: pass client-ip=2a00:1450:4864:20::536; envelope-from=blue@cmd.nu;
 helo=mail-ed1-x536.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 MISSING_HEADERS=1.021, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 02 Jan 2023 09:56:24 -0500
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
X-List-Received-Date: Mon, 02 Jan 2023 05:58:33 -0000

--000000000000e7f95505f141a397
Content-Type: text/plain; charset="UTF-8"

+qemu-trivial

On Fri, Dec 30, 2022, 21:27 Christian Svensson <blue@cmd.nu> wrote:

> Increase the allocated buffer size to fit larger packets.
> Given that jumboframes can commonly be up to 9000 bytes the closest
> suitable
> value seems to be 16 KiB.
>
> Tested by running qemu towards a Linux L2TPv3 endpoint and pushing
> jumboframe traffic through the interfaces.
>
> Signed-off-by: Christian Svensson <blue@cmd.nu>
> ---
>  net/l2tpv3.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/net/l2tpv3.c b/net/l2tpv3.c
> index 5852e42738..3d5c6d11d3 100644
> --- a/net/l2tpv3.c
> +++ b/net/l2tpv3.c
> @@ -42,7 +42,7 @@
>   */
>
>  #define BUFFER_ALIGN sysconf(_SC_PAGESIZE)
> -#define BUFFER_SIZE 2048
> +#define BUFFER_SIZE 16384
>  #define IOVSIZE 2
>  #define MAX_L2TPV3_MSGCNT 64
>  #define MAX_L2TPV3_IOVCNT (MAX_L2TPV3_MSGCNT * IOVSIZE)
> --
> 2.36.2
>
>

--000000000000e7f95505f141a397
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>+qemu-trivial<br><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Fri, Dec 30, 2022, 21:27 Christian Sve=
nsson &lt;<a href=3D"mailto:blue@cmd.nu">blue@cmd.nu</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">Increase the allocated buffer size to fit =
larger packets.<br>
Given that jumboframes can commonly be up to 9000 bytes the closest suitabl=
e<br>
value seems to be 16 KiB.<br>
<br>
Tested by running qemu towards a Linux L2TPv3 endpoint and pushing<br>
jumboframe traffic through the interfaces.<br>
<br>
Signed-off-by: Christian Svensson &lt;<a href=3D"mailto:blue@cmd.nu" target=
=3D"_blank" rel=3D"noreferrer">blue@cmd.nu</a>&gt;<br>
---<br>
=C2=A0net/l2tpv3.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/net/l2tpv3.c b/net/l2tpv3.c<br>
index 5852e42738..3d5c6d11d3 100644<br>
--- a/net/l2tpv3.c<br>
+++ b/net/l2tpv3.c<br>
@@ -42,7 +42,7 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#define BUFFER_ALIGN sysconf(_SC_PAGESIZE)<br>
-#define BUFFER_SIZE 2048<br>
+#define BUFFER_SIZE 16384<br>
=C2=A0#define IOVSIZE 2<br>
=C2=A0#define MAX_L2TPV3_MSGCNT 64<br>
=C2=A0#define MAX_L2TPV3_IOVCNT (MAX_L2TPV3_MSGCNT * IOVSIZE)<br>
-- <br>
2.36.2<br>
<br>
</blockquote></div></div></div>

--000000000000e7f95505f141a397--

