Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kOPY6-0006Wx-6H
	for mharc-qemu-trivial@gnu.org; Fri, 02 Oct 2020 14:12:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kOPY3-0006Tw-3U
 for qemu-trivial@nongnu.org; Fri, 02 Oct 2020 14:12:51 -0400
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142]:39257)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kOPY0-0007RE-N0
 for qemu-trivial@nongnu.org; Fri, 02 Oct 2020 14:12:50 -0400
Received: by mail-lf1-x142.google.com with SMTP id q8so2954747lfb.6
 for <qemu-trivial@nongnu.org>; Fri, 02 Oct 2020 11:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=OKqy472fUMrJBKwtMvHg7gM9AOg8x860cCBh3AvmB/s=;
 b=crHx/xW1Srsnutr0GrghR2gR4vSEC4moh9e9DvR+QH7sE5DUnwoO+10bKkT6953mCj
 YZKzEchTcZqfoRQG4SwQQ+OKlWJxVD+RzBvI3Yv44olWOXPBa7YXQAx26rGmh24b8Y/e
 peZxuJRF8/7bIdpHLjq7Ic3JH1xJp0hk6/LOfyp03gNALXDyB74bs9f9IbzifQ1U6Wf/
 SpejKM+uAmHyT6xgLQqTrBzx0HfztaLfWmo+Le0JTquBibdHd6OKeERH15Q8iz5PQHex
 TJjBI5Q24omZbrnfB0iY3BAGEo+JaAI8bJr6R+qsNhWHQEpyblVQsxsCKwOpbiET6bho
 miKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=OKqy472fUMrJBKwtMvHg7gM9AOg8x860cCBh3AvmB/s=;
 b=CjG36NCRODXtVlpZdC3hbQ1U+zYKHlMfZvFYJ04+JvXEf2p2yj3ZsOCHogo8/ljI2D
 zfQaIF70SaXDCLh1rWdi5FCrC3ASKlKPSi4wL/upe5Y0RDDlcjfal7fHDSBP+FgTjXV1
 Wmv8IvXnBcsgRjkNTDAprwm1KwZMqssB8pKCI2QMw2DA0sTKqyHkQn1GTc5fMyp4L0lH
 d7C/EdsmeJ81TpkbKovaGagB9tvKJhxjj0FU5HLBqJpVcDBAJVUB0aJ/QtdSHBQFHvFz
 3CUxvRX2dOa/F0pY/0hGmE+8kO2tj8INIoIEHLVh+v1/MwiHIP+Wm5k0Vx04A7+jELrn
 /eiw==
X-Gm-Message-State: AOAM5308cdX1gEJuGSjW83pBv712eBw2MSJJ2ZqxaN9bxowcD8PrMeCz
 iQjiwRpsCmNbJANTSNJJ3+UtRY/A2Ts47yKDBN4=
X-Google-Smtp-Source: ABdhPJx3TX8EUIwYwl8KBLl39wi52BD5SIzf9okYBTWiSheiz52tJ/o5z5Nky0pjO0kxe0A21ozfzIHGkyYFYRi966Q=
X-Received: by 2002:a19:383:: with SMTP id 125mr1366050lfd.356.1601662366802; 
 Fri, 02 Oct 2020 11:12:46 -0700 (PDT)
MIME-Version: 1.0
References: <20201002180838.2047-1-luoyonggang@gmail.com>
 <20201002180838.2047-2-luoyonggang@gmail.com>
In-Reply-To: <20201002180838.2047-2-luoyonggang@gmail.com>
Reply-To: luoyonggang@gmail.com
From: =?UTF-8?B?572X5YuH5YiaKFlvbmdnYW5nIEx1byk=?= <luoyonggang@gmail.com>
Date: Sat, 3 Oct 2020 02:12:35 +0800
Message-ID: <CAE2XoE_YJtrszdCS_v0j5_oPUbXW_ugasMnWrvrZFFiNq=xSEw@mail.gmail.com>
Subject: Re: [PATCH v7 2/4] curses: Fixes compiler error that complain don't
 have langinfo.h on msys2/mingw
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000006c683f05b0b41498"
Received-SPF: pass client-ip=2a00:1450:4864:20::142;
 envelope-from=luoyonggang@gmail.com; helo=mail-lf1-x142.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 02 Oct 2020 18:12:51 -0000

--0000000000006c683f05b0b41498
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Forget to cc you

On Sat, Oct 3, 2020 at 2:08 AM Yonggang Luo <luoyonggang@gmail.com> wrote:
>
> msys2/mingw lacks the POSIX-required langinfo.h.
>
> gcc test.c -DNCURSES_WIDECHAR -I/mingw64/include/ncursesw -pipe
-lncursesw -lgnurx -ltre -lintl -liconv
> test.c:4:10: fatal error: langinfo.h: No such file or directory
>     4 | #include <langinfo.h>
>       |          ^~~~~~~~~~~~
> compilation terminated.
>
> So we using g_get_codeset instead of nl_langinfo(CODESET)
>
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  configure   |  5 +----
>  ui/curses.c | 10 +++++-----
>  2 files changed, 6 insertions(+), 9 deletions(-)
>
> diff --git a/configure b/configure
> index 8f7bdbfdd3..fa53bd5c43 100755
> --- a/configure
> +++ b/configure
> @@ -3672,17 +3672,14 @@ if test "$curses" !=3D "no" ; then
>  #include <locale.h>
>  #include <curses.h>
>  #include <wchar.h>
> -#include <langinfo.h>
>  int main(void) {
> -  const char *codeset;
>    wchar_t wch =3D L'w';
>    setlocale(LC_ALL, "");
>    resize_term(0, 0);
>    addwstr(L"wide chars\n");
>    addnwstr(&wch, 1);
>    add_wch(WACS_DEGREE);
> -  codeset =3D nl_langinfo(CODESET);
> -  return codeset !=3D 0;
> +  return 0;
>  }
>  EOF
>    IFS=3D:
> diff --git a/ui/curses.c b/ui/curses.c
> index a59b23a9cf..12bc682cf9 100644
> --- a/ui/curses.c
> +++ b/ui/curses.c
> @@ -30,7 +30,6 @@
>  #endif
>  #include <locale.h>
>  #include <wchar.h>
> -#include <langinfo.h>
>  #include <iconv.h>
>
>  #include "qapi/error.h"
> @@ -526,6 +525,7 @@ static void font_setup(void)
>      iconv_t nativecharset_to_ucs2;
>      iconv_t font_conv;
>      int i;
> +    g_autofree gchar *local_codeset =3D g_get_codeset();
>
>      /*
>       * Control characters are normally non-printable, but VGA does have
> @@ -566,14 +566,14 @@ static void font_setup(void)
>        0x25bc
>      };
>
> -    ucs2_to_nativecharset =3D iconv_open(nl_langinfo(CODESET), "UCS-2");
> +    ucs2_to_nativecharset =3D iconv_open(local_codeset, "UCS-2");
>      if (ucs2_to_nativecharset =3D=3D (iconv_t) -1) {
>          fprintf(stderr, "Could not convert font glyphs from UCS-2:
'%s'\n",
>                          strerror(errno));
>          exit(1);
>      }
>
> -    nativecharset_to_ucs2 =3D iconv_open("UCS-2", nl_langinfo(CODESET));
> +    nativecharset_to_ucs2 =3D iconv_open("UCS-2", local_codeset);
>      if (nativecharset_to_ucs2 =3D=3D (iconv_t) -1) {
>          iconv_close(ucs2_to_nativecharset);
>          fprintf(stderr, "Could not convert font glyphs to UCS-2: '%s'\n"=
,
> @@ -581,7 +581,7 @@ static void font_setup(void)
>          exit(1);
>      }
>
> -    font_conv =3D iconv_open(nl_langinfo(CODESET), font_charset);
> +    font_conv =3D iconv_open(local_codeset, font_charset);
>      if (font_conv =3D=3D (iconv_t) -1) {
>          iconv_close(ucs2_to_nativecharset);
>          iconv_close(nativecharset_to_ucs2);
> @@ -602,7 +602,7 @@ static void font_setup(void)
>      /* DEL */
>      convert_ucs(0x7F, 0x2302, ucs2_to_nativecharset);
>
> -    if (strcmp(nl_langinfo(CODESET), "UTF-8")) {
> +    if (strcmp(local_codeset, "UTF-8")) {
>          /* Non-Unicode capable, use termcap equivalents for those
available */
>          for (i =3D 0; i <=3D 0xFF; i++) {
>              wchar_t wch[CCHARW_MAX];
> --
> 2.28.0.windows.1
>


--
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

--0000000000006c683f05b0b41498
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Forget to cc you<br><br>On Sat, Oct 3, 2020 at 2:08 AM Yon=
ggang Luo &lt;<a href=3D"mailto:luoyonggang@gmail.com">luoyonggang@gmail.co=
m</a>&gt; wrote:<br>&gt;<br>&gt; msys2/mingw lacks the POSIX-required langi=
nfo.h.<br>&gt;<br>&gt; gcc test.c -DNCURSES_WIDECHAR -I/mingw64/include/ncu=
rsesw -pipe -lncursesw -lgnurx -ltre -lintl -liconv<br>&gt; test.c:4:10: fa=
tal error: langinfo.h: No such file or directory<br>&gt; =C2=A0 =C2=A0 4 | =
#include &lt;langinfo.h&gt;<br>&gt; =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~~<br>&gt; compilation terminated.<br>&gt;<br=
>&gt; So we using g_get_codeset instead of nl_langinfo(CODESET)<br>&gt;<br>=
&gt; Signed-off-by: Yonggang Luo &lt;<a href=3D"mailto:luoyonggang@gmail.co=
m">luoyonggang@gmail.com</a>&gt;<br>&gt; Reviewed-by: Gerd Hoffmann &lt;<a =
href=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&gt;<br>&gt; ---<br>=
&gt; =C2=A0configure =C2=A0 | =C2=A05 +----<br>&gt; =C2=A0ui/curses.c | 10 =
+++++-----<br>&gt; =C2=A02 files changed, 6 insertions(+), 9 deletions(-)<b=
r>&gt;<br>&gt; diff --git a/configure b/configure<br>&gt; index 8f7bdbfdd3.=
.fa53bd5c43 100755<br>&gt; --- a/configure<br>&gt; +++ b/configure<br>&gt; =
@@ -3672,17 +3672,14 @@ if test &quot;$curses&quot; !=3D &quot;no&quot; ; t=
hen<br>&gt; =C2=A0#include &lt;locale.h&gt;<br>&gt; =C2=A0#include &lt;curs=
es.h&gt;<br>&gt; =C2=A0#include &lt;wchar.h&gt;<br>&gt; -#include &lt;langi=
nfo.h&gt;<br>&gt; =C2=A0int main(void) {<br>&gt; - =C2=A0const char *codese=
t;<br>&gt; =C2=A0 =C2=A0wchar_t wch =3D L&#39;w&#39;;<br>&gt; =C2=A0 =C2=A0=
setlocale(LC_ALL, &quot;&quot;);<br>&gt; =C2=A0 =C2=A0resize_term(0, 0);<br=
>&gt; =C2=A0 =C2=A0addwstr(L&quot;wide chars\n&quot;);<br>&gt; =C2=A0 =C2=
=A0addnwstr(&amp;wch, 1);<br>&gt; =C2=A0 =C2=A0add_wch(WACS_DEGREE);<br>&gt=
; - =C2=A0codeset =3D nl_langinfo(CODESET);<br>&gt; - =C2=A0return codeset =
!=3D 0;<br>&gt; + =C2=A0return 0;<br>&gt; =C2=A0}<br>&gt; =C2=A0EOF<br>&gt;=
 =C2=A0 =C2=A0IFS=3D:<br>&gt; diff --git a/ui/curses.c b/ui/curses.c<br>&gt=
; index a59b23a9cf..12bc682cf9 100644<br>&gt; --- a/ui/curses.c<br>&gt; +++=
 b/ui/curses.c<br>&gt; @@ -30,7 +30,6 @@<br>&gt; =C2=A0#endif<br>&gt; =C2=
=A0#include &lt;locale.h&gt;<br>&gt; =C2=A0#include &lt;wchar.h&gt;<br>&gt;=
 -#include &lt;langinfo.h&gt;<br>&gt; =C2=A0#include &lt;iconv.h&gt;<br>&gt=
;<br>&gt; =C2=A0#include &quot;qapi/error.h&quot;<br>&gt; @@ -526,6 +525,7 =
@@ static void font_setup(void)<br>&gt; =C2=A0 =C2=A0 =C2=A0iconv_t nativec=
harset_to_ucs2;<br>&gt; =C2=A0 =C2=A0 =C2=A0iconv_t font_conv;<br>&gt; =C2=
=A0 =C2=A0 =C2=A0int i;<br>&gt; + =C2=A0 =C2=A0g_autofree gchar *local_code=
set =3D g_get_codeset();<br>&gt;<br>&gt; =C2=A0 =C2=A0 =C2=A0/*<br>&gt; =C2=
=A0 =C2=A0 =C2=A0 * Control characters are normally non-printable, but VGA =
does have<br>&gt; @@ -566,14 +566,14 @@ static void font_setup(void)<br>&gt=
; =C2=A0 =C2=A0 =C2=A0 =C2=A00x25bc<br>&gt; =C2=A0 =C2=A0 =C2=A0};<br>&gt;<=
br>&gt; - =C2=A0 =C2=A0ucs2_to_nativecharset =3D iconv_open(nl_langinfo(COD=
ESET), &quot;UCS-2&quot;);<br>&gt; + =C2=A0 =C2=A0ucs2_to_nativecharset =3D=
 iconv_open(local_codeset, &quot;UCS-2&quot;);<br>&gt; =C2=A0 =C2=A0 =C2=A0=
if (ucs2_to_nativecharset =3D=3D (iconv_t) -1) {<br>&gt; =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0fprintf(stderr, &quot;Could not convert font glyphs from U=
CS-2: &#39;%s&#39;\n&quot;,<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0strerror(errno));<br>&g=
t; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit(1);<br>&gt; =C2=A0 =C2=A0 =C2=A0}=
<br>&gt;<br>&gt; - =C2=A0 =C2=A0nativecharset_to_ucs2 =3D iconv_open(&quot;=
UCS-2&quot;, nl_langinfo(CODESET));<br>&gt; + =C2=A0 =C2=A0nativecharset_to=
_ucs2 =3D iconv_open(&quot;UCS-2&quot;, local_codeset);<br>&gt; =C2=A0 =C2=
=A0 =C2=A0if (nativecharset_to_ucs2 =3D=3D (iconv_t) -1) {<br>&gt; =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0iconv_close(ucs2_to_nativecharset);<br>&gt; =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr, &quot;Could not convert font=
 glyphs to UCS-2: &#39;%s&#39;\n&quot;,<br>&gt; @@ -581,7 +581,7 @@ static =
void font_setup(void)<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit(1);<br=
>&gt; =C2=A0 =C2=A0 =C2=A0}<br>&gt;<br>&gt; - =C2=A0 =C2=A0font_conv =3D ic=
onv_open(nl_langinfo(CODESET), font_charset);<br>&gt; + =C2=A0 =C2=A0font_c=
onv =3D iconv_open(local_codeset, font_charset);<br>&gt; =C2=A0 =C2=A0 =C2=
=A0if (font_conv =3D=3D (iconv_t) -1) {<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0iconv_close(ucs2_to_nativecharset);<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0iconv_close(nativecharset_to_ucs2);<br>&gt; @@ -602,7 +602,7 @@ s=
tatic void font_setup(void)<br>&gt; =C2=A0 =C2=A0 =C2=A0/* DEL */<br>&gt; =
=C2=A0 =C2=A0 =C2=A0convert_ucs(0x7F, 0x2302, ucs2_to_nativecharset);<br>&g=
t;<br>&gt; - =C2=A0 =C2=A0if (strcmp(nl_langinfo(CODESET), &quot;UTF-8&quot=
;)) {<br>&gt; + =C2=A0 =C2=A0if (strcmp(local_codeset, &quot;UTF-8&quot;)) =
{<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Non-Unicode capable, use ter=
mcap equivalents for those available */<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0for (i =3D 0; i &lt;=3D 0xFF; i++) {<br>&gt; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0wchar_t wch[CCHARW_MAX];<br>&gt; --<br>&gt; 2.28=
.0.windows.1<br>&gt;<br><br><br>--<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=E6=
=AD=A4=E8=87=B4<br>=E7=A4=BC<br>=E7=BD=97=E5=8B=87=E5=88=9A<br>Yours<br>=C2=
=A0 =C2=A0 sincerely,<br>Yonggang Luo</div>

--0000000000006c683f05b0b41498--

