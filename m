Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c3jJ0-0001Uo-UW
	for mharc-qemu-trivial@gnu.org; Mon, 07 Nov 2016 07:45:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35183)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1c3jIx-0001T3-Fi
	for qemu-trivial@nongnu.org; Mon, 07 Nov 2016 07:45:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1c3jIw-0000iF-3m
	for qemu-trivial@nongnu.org; Mon, 07 Nov 2016 07:45:39 -0500
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243]:34806)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
	id 1c3jIs-0000gz-BI; Mon, 07 Nov 2016 07:45:34 -0500
Received: by mail-lf0-x243.google.com with SMTP id o141so7819746lff.1;
	Mon, 07 Nov 2016 04:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=i5IlPCrLx8K24AwBqei8RjU3rIiGjTq8YEiMgBSGE84=;
	b=Pv4PkrloACiQzidYiV9o3YG7eKCnYn+xjUSmZFuOCWUyuo4cGV3WGxEsTTms6mW0ao
	XXsgp305K2gRjcbzVwMt7KX/8BGDz712O267I2BZ7TCTG02Ljy8Bk6DtB7Pej6A3wsHH
	IghodxbOKzbMR2WFFRM7T5xnqd/QFsvOCvyaTmlLA+Xko3NQ4FRQ9uct9UP3drjCOMva
	rQgV7PSJSocUMYmZWkl6x/LaA/AmJ9+wujDQmbOwKaa28puQQgDdSTMYNNiEMd3csZmj
	0+oZ3xLXXSH3eYK8iPyPIshCIFoSNz7SQscl70NK25VPS5ScfBA/2FG92ArZo9OD31rf
	rHjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=i5IlPCrLx8K24AwBqei8RjU3rIiGjTq8YEiMgBSGE84=;
	b=eaVgJBXX0+e7OV3idOy/c3Ig5IugTN8Z6sIc178FflW3bwkHLOpbf9oFu4t3kAaFPs
	T83en71KmQ9GSc3y9ywDpk6FLL6tETrAKfcQjEuCx0nqAvqv8ac5ZU3qvvSy1ET8w4te
	Pol11RK7q7dkKslDT1EUoluB8gYSyIi83W+WIPrZRF5d8q//ZPguBpR68z4621Djkc8a
	REy/YVxRCuRKr+EJs1ujmJRKPexonP4Rw7810Novsf9Xei2M+TkESvJ4lGVXkyKwuysN
	A11REzm31tC3feO9kK5MojQRBfGxwoDRBcs7A+I20REEJwnEqoG6x+bjcqyGY8nRHz/d
	Ledg==
X-Gm-Message-State: ABUngvcOMCRcVt5frMDKTZyclG0hM7WYSzt5gAHFBQIx93tskOC9XauuxTxGd9UWTPWwB4+wtan8jsORXuqiNA==
X-Received: by 10.25.165.81 with SMTP id o78mr2684575lfe.99.1478522732583;
	Mon, 07 Nov 2016 04:45:32 -0800 (PST)
MIME-Version: 1.0
References: <20161107122238.32205-1-marcandre.lureau@redhat.com>
In-Reply-To: <20161107122238.32205-1-marcandre.lureau@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 07 Nov 2016 12:45:21 +0000
Message-ID: <CAJ+F1CKtFyby1YwaM6=dhkCX_7fT2aAU3F+omJBe+geOq4UhtA@mail.gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, mjt@tls.msk.ru
Content-Type: multipart/alternative; boundary=001a11402ebc44a3a40540b56645
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] build-sys: remove libtool
 left-over
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
X-List-Received-Date: Mon, 07 Nov 2016 12:45:41 -0000

--001a11402ebc44a3a40540b56645
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 7, 2016 at 4:23 PM Marc-Andr=C3=A9 Lureau <
marcandre.lureau@redhat.com> wrote:

> Libtool support was removed in commit e999ee44349, there is a few
> left-over.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  Makefile      | 6 ++----
>  Makefile.objs | 1 -
>  .gitignore    | 2 --
>  configure     | 2 --
>  4 files changed, 2 insertions(+), 9 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 474cc5e..97dcbdd 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -231,12 +231,10 @@ ALL_SUBDIRS=3D$(TARGET_DIRS) $(patsubst %,pc-bios/%=
,
> $(ROMS))
>
>  recurse-all: $(SUBDIR_RULES) $(ROMSUBDIR_RULES)
>
> -$(BUILD_DIR)/version.o: $(SRC_PATH)/version.rc config-host.h |
> $(BUILD_DIR)/version.lo
> +$(BUILD_DIR)/version.o: $(SRC_PATH)/version.rc config-host.h
>         $(call quiet-command,$(WINDRES) -I$(BUILD_DIR) -o $@
> $<,"RC","version.o")
> -$(BUILD_DIR)/version.lo: $(SRC_PATH)/version.rc config-host.h
> -       $(call quiet-command,$(WINDRES) -I$(BUILD_DIR) -o $@
> $<,"RC","version.lo")
>
> -Makefile: $(version-obj-y) $(version-lobj-y)
> +Makefile: $(version-obj-y)
>
>  ######################################################################
>  # Build libraries
> diff --git a/Makefile.objs b/Makefile.objs
> index 06f74b8..0d7acd4 100644
> --- a/Makefile.objs
> +++ b/Makefile.objs
> @@ -97,7 +97,6 @@ common-obj-y +=3D disas/
>  ######################################################################
>  # Resource file for Windows executables
>  version-obj-$(CONFIG_WIN32) +=3D $(BUILD_DIR)/version.o
> -version-lobj-$(CONFIG_WIN32) +=3D $(BUILD_DIR)/version.lo
>
>  ######################################################################
>  # tracing
> diff --git a/.gitignore b/.gitignore
> index 3d7848c..b630cd7 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -82,8 +82,6 @@
>  *.d
>  !/scripts/qemu-guest-agent/fsfreeze-hook.d
>  *.o
> -*.lo
> -*.la
>  *.pc
>  .libs
>  .sdk
>

It looks like we could also remove *.pc & .libs


> diff --git a/configure b/configure
> index fd6f898..3194a98 100755
> --- a/configure
> +++ b/configure
> @@ -28,8 +28,6 @@ TMPB=3D"qemu-conf"
>  TMPC=3D"${TMPDIR1}/${TMPB}.c"
>  TMPO=3D"${TMPDIR1}/${TMPB}.o"
>  TMPCXX=3D"${TMPDIR1}/${TMPB}.cxx"
> -TMPL=3D"${TMPDIR1}/${TMPB}.lo"
> -TMPA=3D"${TMPDIR1}/lib${TMPB}.la"
>  TMPE=3D"${TMPDIR1}/${TMPB}.exe"
>  TMPMO=3D"${TMPDIR1}/${TMPB}.mo"
>
> --
> 2.10.0
>
>
> --
Marc-Andr=C3=A9 Lureau

--001a11402ebc44a3a40540b56645
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Mon=
, Nov 7, 2016 at 4:23 PM Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marca=
ndre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">Libtool support was removed in commit e999e=
e44349, there is a few<br class=3D"gmail_msg">
left-over.<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lurea=
u@redhat.com" class=3D"gmail_msg" target=3D"_blank">marcandre.lureau@redhat=
.com</a>&gt;<br class=3D"gmail_msg">
---<br class=3D"gmail_msg">
=C2=A0Makefile=C2=A0 =C2=A0 =C2=A0 | 6 ++----<br class=3D"gmail_msg">
=C2=A0Makefile.objs | 1 -<br class=3D"gmail_msg">
=C2=A0.gitignore=C2=A0 =C2=A0 | 2 --<br class=3D"gmail_msg">
=C2=A0configure=C2=A0 =C2=A0 =C2=A0| 2 --<br class=3D"gmail_msg">
=C2=A04 files changed, 2 insertions(+), 9 deletions(-)<br class=3D"gmail_ms=
g">
<br class=3D"gmail_msg">
diff --git a/Makefile b/Makefile<br class=3D"gmail_msg">
index 474cc5e..97dcbdd 100644<br class=3D"gmail_msg">
--- a/Makefile<br class=3D"gmail_msg">
+++ b/Makefile<br class=3D"gmail_msg">
@@ -231,12 +231,10 @@ ALL_SUBDIRS=3D$(TARGET_DIRS) $(patsubst %,pc-bios/%, =
$(ROMS))<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
=C2=A0recurse-all: $(SUBDIR_RULES) $(ROMSUBDIR_RULES)<br class=3D"gmail_msg=
">
<br class=3D"gmail_msg">
-$(BUILD_DIR)/version.o: $(SRC_PATH)/version.rc config-host.h | $(BUILD_DIR=
)/version.lo<br class=3D"gmail_msg">
+$(BUILD_DIR)/version.o: $(SRC_PATH)/version.rc config-host.h<br class=3D"g=
mail_msg">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(call quiet-command,$(WINDRES) -I$(BUILD_DIR) =
-o $@ $&lt;,&quot;RC&quot;,&quot;version.o&quot;)<br class=3D"gmail_msg">
-$(BUILD_DIR)/version.lo: $(SRC_PATH)/version.rc config-host.h<br class=3D"=
gmail_msg">
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(call quiet-command,$(WINDRES) -I$(BUILD_DIR) =
-o $@ $&lt;,&quot;RC&quot;,&quot;version.lo&quot;)<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
-Makefile: $(version-obj-y) $(version-lobj-y)<br class=3D"gmail_msg">
+Makefile: $(version-obj-y)<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
=C2=A0#####################################################################=
#<br class=3D"gmail_msg">
=C2=A0# Build libraries<br class=3D"gmail_msg">
diff --git a/Makefile.objs b/Makefile.objs<br class=3D"gmail_msg">
index 06f74b8..0d7acd4 100644<br class=3D"gmail_msg">
--- a/Makefile.objs<br class=3D"gmail_msg">
+++ b/Makefile.objs<br class=3D"gmail_msg">
@@ -97,7 +97,6 @@ common-obj-y +=3D disas/<br class=3D"gmail_msg">
=C2=A0#####################################################################=
#<br class=3D"gmail_msg">
=C2=A0# Resource file for Windows executables<br class=3D"gmail_msg">
=C2=A0version-obj-$(CONFIG_WIN32) +=3D $(BUILD_DIR)/version.o<br class=3D"g=
mail_msg">
-version-lobj-$(CONFIG_WIN32) +=3D $(BUILD_DIR)/version.lo<br class=3D"gmai=
l_msg">
<br class=3D"gmail_msg">
=C2=A0#####################################################################=
#<br class=3D"gmail_msg">
=C2=A0# tracing<br class=3D"gmail_msg">
diff --git a/.gitignore b/.gitignore<br class=3D"gmail_msg">
index 3d7848c..b630cd7 100644<br class=3D"gmail_msg">
--- a/.gitignore<br class=3D"gmail_msg">
+++ b/.gitignore<br class=3D"gmail_msg">
@@ -82,8 +82,6 @@<br class=3D"gmail_msg">
=C2=A0*.d<br class=3D"gmail_msg">
=C2=A0!/scripts/qemu-guest-agent/fsfreeze-hook.d<br class=3D"gmail_msg">
=C2=A0*.o<br class=3D"gmail_msg">
-*.lo<br class=3D"gmail_msg">
-*.la<br class=3D"gmail_msg">
=C2=A0*.pc<br class=3D"gmail_msg">
=C2=A0.libs<br class=3D"gmail_msg">
=C2=A0.sdk<br class=3D"gmail_msg"></blockquote><div><br></div><div>It looks=
 like we could also remove *.pc &amp; .libs<br>=C2=A0<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">
diff --git a/configure b/configure<br class=3D"gmail_msg">
index fd6f898..3194a98 100755<br class=3D"gmail_msg">
--- a/configure<br class=3D"gmail_msg">
+++ b/configure<br class=3D"gmail_msg">
@@ -28,8 +28,6 @@ TMPB=3D&quot;qemu-conf&quot;<br class=3D"gmail_msg">
=C2=A0TMPC=3D&quot;${TMPDIR1}/${TMPB}.c&quot;<br class=3D"gmail_msg">
=C2=A0TMPO=3D&quot;${TMPDIR1}/${TMPB}.o&quot;<br class=3D"gmail_msg">
=C2=A0TMPCXX=3D&quot;${TMPDIR1}/${TMPB}.cxx&quot;<br class=3D"gmail_msg">
-TMPL=3D&quot;${TMPDIR1}/${TMPB}.lo&quot;<br class=3D"gmail_msg">
-TMPA=3D&quot;${TMPDIR1}/lib${TMPB}.la&quot;<br class=3D"gmail_msg">
=C2=A0TMPE=3D&quot;${TMPDIR1}/${TMPB}.exe&quot;<br class=3D"gmail_msg">
=C2=A0TMPMO=3D&quot;${TMPDIR1}/${TMPB}.mo&quot;<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
--<br class=3D"gmail_msg">
2.10.0<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
</blockquote></div></div><div dir=3D"ltr">-- <br></div><div data-smartmail=
=3D"gmail_signature"><div dir=3D"ltr">Marc-Andr=C3=A9 Lureau<br></div></div=
>

--001a11402ebc44a3a40540b56645--

