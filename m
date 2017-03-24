Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1crRQx-0000de-Vu
	for mharc-qemu-trivial@gnu.org; Fri, 24 Mar 2017 11:47:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58352)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1crRQu-0000bo-Fv
	for qemu-trivial@nongnu.org; Fri, 24 Mar 2017 11:47:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1crRQt-0001QG-G6
	for qemu-trivial@nongnu.org; Fri, 24 Mar 2017 11:47:20 -0400
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244]:36066)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
	id 1crRQr-0001PC-BG; Fri, 24 Mar 2017 11:47:17 -0400
Received: by mail-lf0-x244.google.com with SMTP id n78so710690lfi.3;
	Fri, 24 Mar 2017 08:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=0pvH46Pjn7N9i+9bZsWNh1E8C0HoV2c936Tvl35WUv0=;
	b=gpT5KABiIPngxRHFNQpcvv51xRTNvvgrU5C6DRluc7qmYqFcMPNYYniUlsSyn9h4Sh
	9YsXtmy1Q3LUqp+KnSp7YW9DYgn9dwnhxcT5u4gZZVdX/pwtfNgSQgaD3be+TdisY3bO
	W0sYK4QUmJFET4lBVGr4FtGD/Gp7gDTlcUKAcCg+vTmwuTodKQbkKlXLDL5MZJCDw4y/
	/3eli6c6z4rdazz485LWQICAqLXznOcegWPP3NvccM1wDPYMuaxALzlKw8swdeShknRD
	MQxpkCxbLbx11XsR4OsPHJR0XjWOrsJyTn1W5/UiOuPdnd9gmx293JK6Fa9KfaAawQTK
	CKLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0pvH46Pjn7N9i+9bZsWNh1E8C0HoV2c936Tvl35WUv0=;
	b=puuSMYH52e8UT2X8gT3G7rLhx6la7rXb3iMOQPqT3J+uQuwHv3dz8xFpPOfzywSFVN
	ibSjOkBcpYOoLebUxyfoFRaIswD/LHPIuKlbIRk33qVT8vpc9XQSfZySIm2VVmtK6daP
	fO+oZJVmKG149f/u0eELoRquVu81lW5HQH7oQXEA1YaS7NwlPjSUNQ1dKKScYLc42Y6+
	C41txEODbFCDbYwJKCZMtTTXzkytejZl2ZWbzaNUjR1ETrSD/mU1P0c+qLNBy0jC5RV5
	HDVOyHzJ0uOEFQsB0ijVJYSts22Dmdq7zvGNAmFSVA2DZ/EWHhgO4DNht+3J2P/17Ume
	wq+A==
X-Gm-Message-State: AFeK/H2etDY7MHCobvyCyZEneAcTGfsMPwJkofeZ2SHNjkcU3UnR47tB8HSTwGZtjtDg6QmfVRae3K1OpGvCag==
X-Received: by 10.25.129.149 with SMTP id c143mr4749946lfd.15.1490370436001;
	Fri, 24 Mar 2017 08:47:16 -0700 (PDT)
MIME-Version: 1.0
References: <1490365705-2912-1-git-send-email-sochin@aliyun.com>
In-Reply-To: <1490365705-2912-1-git-send-email-sochin@aliyun.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 24 Mar 2017 15:47:04 +0000
Message-ID: <CAJ+F1CJPqHqGZ7r-hQ2E2P7-S8KqGyRbzOhijtet-cCHy4BXtA@mail.gmail.com>
To: "sochin.jiang" <sochin@aliyun.com>, berrange@redhat.com
Cc: QEMU <qemu-devel@nongnu.org>, sochin.jiang@huawei.com, 
	qemu trival <qemu-trivial@nongnu.org>
Content-Type: multipart/alternative; boundary=001a113eaad06bf65b054b7be8b6
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::244
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] channel-file: fix wrong
 parameter comments
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Mar 2017 15:47:21 -0000

--001a113eaad06bf65b054b7be8b6
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 24, 2017 at 7:32 PM sochin.jiang <sochin@aliyun.com> wrote:

> From: "sochin.jiang" <sochin@aliyun.com>
>
>     fix wrong parameter comments in channel-file.h.
>
> Signed-off-by: sochin.jiang <sochin@aliyun.com>
>


Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>



> ---
>  include/io/channel-file.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/io/channel-file.h b/include/io/channel-file.h
> index d2462c2..79245f1 100644
> --- a/include/io/channel-file.h
> +++ b/include/io/channel-file.h
> @@ -71,7 +71,7 @@ qio_channel_file_new_fd(int fd);
>
>  /**
>   * qio_channel_file_new_path:
> - * @fd: the file descriptor
> + * @path: the file path
>   * @flags: the open flags (O_RDONLY|O_WRONLY|O_RDWR, etc)
>   * @mode: the file creation mode if O_WRONLY is set in @flags
>   * @errp: pointer to initialized error object
> --
> 1.8.3.1
>
>
> --
Marc-Andr=C3=A9 Lureau

--001a113eaad06bf65b054b7be8b6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Fri=
, Mar 24, 2017 at 7:32 PM sochin.jiang &lt;<a href=3D"mailto:sochin@aliyun.=
com">sochin@aliyun.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">From: &quot;sochin.jiang&quot; &lt;<a href=3D"mailto:sochin@aliyun.com" =
class=3D"gmail_msg" target=3D"_blank">sochin@aliyun.com</a>&gt;<br class=3D=
"gmail_msg">
<br class=3D"gmail_msg">
=C2=A0 =C2=A0 fix wrong parameter comments in channel-file.h.<br class=3D"g=
mail_msg">
<br class=3D"gmail_msg">
Signed-off-by: sochin.jiang &lt;<a href=3D"mailto:sochin@aliyun.com" class=
=3D"gmail_msg" target=3D"_blank">sochin@aliyun.com</a>&gt;<br class=3D"gmai=
l_msg"></blockquote><div><br><br>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a=
 href=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.com</a=
>&gt;<br><br>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
---<br class=3D"gmail_msg">
=C2=A0include/io/channel-file.h | 2 +-<br class=3D"gmail_msg">
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
diff --git a/include/io/channel-file.h b/include/io/channel-file.h<br class=
=3D"gmail_msg">
index d2462c2..79245f1 100644<br class=3D"gmail_msg">
--- a/include/io/channel-file.h<br class=3D"gmail_msg">
+++ b/include/io/channel-file.h<br class=3D"gmail_msg">
@@ -71,7 +71,7 @@ qio_channel_file_new_fd(int fd);<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
=C2=A0/**<br class=3D"gmail_msg">
=C2=A0 * qio_channel_file_new_path:<br class=3D"gmail_msg">
- * @fd: the file descriptor<br class=3D"gmail_msg">
+ * @path: the file path<br class=3D"gmail_msg">
=C2=A0 * @flags: the open flags (O_RDONLY|O_WRONLY|O_RDWR, etc)<br class=3D=
"gmail_msg">
=C2=A0 * @mode: the file creation mode if O_WRONLY is set in @flags<br clas=
s=3D"gmail_msg">
=C2=A0 * @errp: pointer to initialized error object<br class=3D"gmail_msg">
--<br class=3D"gmail_msg">
1.8.3.1<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
</blockquote></div></div><div dir=3D"ltr">-- <br></div><div data-smartmail=
=3D"gmail_signature"><div dir=3D"ltr">Marc-Andr=C3=A9 Lureau<br></div></div=
>

--001a113eaad06bf65b054b7be8b6--

