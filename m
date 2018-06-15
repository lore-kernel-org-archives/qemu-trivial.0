Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fTnsm-0005sd-1N
	for mharc-qemu-trivial@gnu.org; Fri, 15 Jun 2018 08:31:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33134)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fTnsj-0005ok-Bv
	for qemu-trivial@nongnu.org; Fri, 15 Jun 2018 08:31:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fTnse-000643-VV
	for qemu-trivial@nongnu.org; Fri, 15 Jun 2018 08:31:09 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:39973)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fTnse-00063Y-Hn
	for qemu-trivial@nongnu.org; Fri, 15 Jun 2018 08:31:04 -0400
Received: by mail-oi0-x243.google.com with SMTP id f79-v6so8630698oib.7
	for <qemu-trivial@nongnu.org>; Fri, 15 Jun 2018 05:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=jKE4XPj52RVHJ1sPJyWhdBG+MgTtPq8FNSKUr1cdOzE=;
	b=Q6655tuprBwm4mihJr0u47CbatKmQceBrw2ib018T5Pt/IOXZ5PMcnYbaQP9Ixx36X
	1yIWAwOkm5dTkJPhI9W+wr7ecAGfqRlaEQpBSayKZNmeSW6gD8ufyiN7r2CNafvmS/YJ
	Qe4YZIt7NTK9Bp2cJ1k7per3gb/dsg8szyQL0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=jKE4XPj52RVHJ1sPJyWhdBG+MgTtPq8FNSKUr1cdOzE=;
	b=N5wemtiMejkRimIxnZH6fhCbnasBjMuIoCV2yU8b7P3NsQ3D96ql5iUTPkVJiOdz9M
	MztbfsBLzvXqP0hndt2rl3DY2CxC+1rc1cgebzTopvkYUMu7rguLIv6gTVxloBnNtwN/
	aSYkHEh+EZmQeZW0FQ6xlSb3w+JnEFFF1ZJRNhQjygEsDkyg3U5IWTjNMHDjGMwWZStD
	La6a3FYfvLgK8fNjU+hvPtlBJg1gddmGpatpHcipqGrem4iPXCdrgNgCFo7y33pd4iFv
	suq5Gbz0qyJj5GRj8TeMWimX+v4sIlmQRsjKMVlK0MbclcWiTpp7tZAjl3fo2w9XC93/
	ot8w==
X-Gm-Message-State: APt69E1Ezlo8lpbiZu9rhS+msMg5nFig+l+hndL3lJLa8VR6Wm4cTJJK
	Lo+RRHI9QzQZQrKs9Y8/i9hIDiLGxWBzb7MN8aLIjw==
X-Google-Smtp-Source: ADUXVKKOkw+kBUFL8HHIrjBYTzAb7bq0LHL4F4eEkwWYnYpKLSOmC5PIpU1h+ebPl8foB0Bv46DPnrxU8ELM4sorm7s=
X-Received: by 2002:aca:a846:: with SMTP id r67-v6mr798487oie.12.1529065863841;
	Fri, 15 Jun 2018 05:31:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Fri, 15 Jun 2018 05:30:43
	-0700 (PDT)
In-Reply-To: <20180609151048.9628-1-f4bug@amsat.org>
References: <20180609151048.9628-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Jun 2018 13:30:43 +0100
Message-ID: <CAFEAcA-2GKS-hJnHp6Lv7OJ8-QnirGLAUikNvfYooa=yk4k9aw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	Thomas Huth <thuth@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, 
	=?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-trivial] [PATCH v2] Makefile: Check for more dangling
 scratch files in out-of-tree builds
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
X-List-Received-Date: Fri, 15 Jun 2018 12:31:10 -0000

On 9 June 2018 at 16:10, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrot=
e:
> It is easy to catch the generated 'config-host.mak' in the source
> tree, however qemu-version.h and qemu-options.def are also generated
> files and are hidden by .gitignore rules.
>
> Improve the out-of-tree safety net rule added in d1bd2423a90,
> by also checking for these two files.
>
> This solves building issues with out-of-tree builds from a
> source tree that has been built in:
>
> - /qemu-version.h existing in source tree:
>
>     /source/qemu/qemu-nbd.c: In function =E2=80=98version=E2=80=99:
>     /source/qemu/qemu-nbd.c:133:6: error: expected =E2=80=98)=E2=80=99 be=
fore
>     =E2=80=98QEMU_FULL_VERSION=E2=80=99
>      "%s " QEMU_FULL_VERSION "\n"
>           ^~~~~~~~~~~~~~~~~~
>           )
>     /source/qemu/qemu-nbd.c:133:3: error: format =E2=80=98%s=E2=80=99 exp=
ects a matching
>     =E2=80=98char *=E2=80=99 argument [-Werror=3Dformat=3D]
>      "%s " QEMU_FULL_VERSION "\n"
>       ~^
>     cc1: all warnings being treated as errors
>
> - /qemu-options.def existing in source tree:
>
>     /source/qemu/vl.c: In function =E2=80=98main=E2=80=99:
>     /source/qemu/vl.c:3052:18: error: =E2=80=98QEMU_OPTION_blockdev=E2=80=
=99 undeclared
>     (first use in this function); did you mean =E2=80=98QEMU_OPTION_clock=
=E2=80=99?
>                  case QEMU_OPTION_blockdev:
>                       ^~~~~~~~~~~~~~~~~~~~
>                       QEMU_OPTION_clock
>     /source/qemu/vl.c:3052:18: note: each undeclared identifier is report=
ed
>     only once for each function it appears in

This commit message should I think also mention that it is
only needed to deal with source trees that have these stale
files from failed build attempts that predate commit
428952cfa966f5af8. Otherwise the existing test on config-host.mak
is sufficient.

> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> Since v1 http://lists.nongnu.org/archive/html/qemu-devel/2018-06/msg02254=
.html:
> Peter noticed [1] those files already are in GENERATED_FILES
>
> [1] http://lists.nongnu.org/archive/html/qemu-devel/2018-06/msg02338.html
>
>  Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 023b3437ec..521009964c 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -55,7 +55,8 @@ endif
>  # Check that we're not trying to do an out-of-tree build from
>  # a tree that's been used for an in-tree build.
>  ifneq ($(realpath $(SRC_PATH)),$(realpath .))
> -ifneq ($(wildcard $(SRC_PATH)/config-host.mak),)
> +scratch_files =3D config-host.mak qemu-version.h qemu-options.def
> +ifneq ($(wildcard $(addprefix $(SRC_PATH)/,$(scratch_files))),)
>  $(error This is an out of tree build but your source tree ($(SRC_PATH)) =
\
>  seems to have been used for an in-tree build. You can fix this by runnin=
g \
>  "$(MAKE) distclean && rm -rf *-linux-user *-softmmu" in your source tree=
)
> --
> 2.17.1

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

