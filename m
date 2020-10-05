Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kPW4o-0001nA-9e
	for mharc-qemu-trivial@gnu.org; Mon, 05 Oct 2020 15:23:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kPW4m-0001iE-8N
 for qemu-trivial@nongnu.org; Mon, 05 Oct 2020 15:23:12 -0400
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:42226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kPW4j-0003Ua-Mb
 for qemu-trivial@nongnu.org; Mon, 05 Oct 2020 15:23:11 -0400
Received: by mail-ed1-x544.google.com with SMTP id j2so10727275eds.9
 for <qemu-trivial@nongnu.org>; Mon, 05 Oct 2020 12:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jfIe+ax7/FYKwNc3Q73tdb1xfdCyd5kHUTSwCu2yi28=;
 b=LOix/pzZWUXv130EW4mNCyvbQN3jITwiB53XKl4t6lcvhrmJWMnin1+sllAGW/lsmm
 lSeCnmspCOElW+QIrrOJZBbeB6AMxyrYboYs0C/1/C21o0LQVIZoIbeZsmuPlTAHnr+t
 Pj90wKXK5Cljx9gnoHjfg+Eue7a+RDXfLBIGXuFOQoqJ0AEDBmMZJSaTMc66hGmtMn2x
 EAUJU/z7Xq0R8b3fBHEDBGgqNM7h1BxTlr6/CojXeoL6UFXSEXAUM2J6I4D+JjLFRzKw
 JTD/hX0LyqLD9sh07NquLijY86pJ/A6GgBPz0Z2T3cWzZh/kDY8oOZVw3jb+tJFJJ1Ks
 MKLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jfIe+ax7/FYKwNc3Q73tdb1xfdCyd5kHUTSwCu2yi28=;
 b=NimToWkMfHYvYdOryvptxAsyBV2a5BzgJBjsC/gR3GJ2mcw0mr1LXE6VhkUO2nK5Cv
 ZemBvbd7MoWH2YQtOI8jUHsEidoErLiYz8Fs517YsgNN5YEb7piAwoUjdYFR8w2gyKnx
 WzfBWRDBp4CyQSvojlbgSkYtbCTZtAdYUhyul1ihjt/nuVzb0wK7p1tT2U2Q3wYImn3G
 14B9JKo4KZ4KB4XDXnlWQVMkKX/9H7ozhwi3BS3j/obvOPIzl9K7U8nm6A+SqjZ/uG1B
 Wr8JWd1fAz09lXVKdoOefMSgYehHHMDPQM1wwrmzbyWTfqLX6uQLpWazGb5n0NJ237mn
 eS/A==
X-Gm-Message-State: AOAM531um1wO9Bok3au40plTn4VowI5YGifszclCRFZMyIJtku4UJNpA
 p27ecuStReGwxxDi/pyfv1d8MOUV+MfR3Y/4ksG9MQ==
X-Google-Smtp-Source: ABdhPJztg9Jl/vqrrvBKB6rrPrTKbntL6coa+W8TGAbGNB+vi7f2LYgEQaDfh61+8vTepoeKkizUye90zQ+vfx8la6U=
X-Received: by 2002:aa7:d75a:: with SMTP id a26mr1346328eds.36.1601925787570; 
 Mon, 05 Oct 2020 12:23:07 -0700 (PDT)
MIME-Version: 1.0
References: <20201005172109.416-1-luoyonggang@gmail.com>
In-Reply-To: <20201005172109.416-1-luoyonggang@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Oct 2020 20:22:56 +0100
Message-ID: <CAFEAcA95r2FZibphrO0N_rckWOKigM_d80Qi0grtpWWzN3d19A@mail.gmail.com>
Subject: Re: [PATCH v2] scripts: Convert qemu-version.sh to qemu-version.py
To: Yonggang Luo <luoyonggang@gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::544;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x544.google.com
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
X-List-Received-Date: Mon, 05 Oct 2020 19:23:12 -0000

On Mon, 5 Oct 2020 at 18:24, Yonggang Luo <luoyonggang@gmail.com> wrote:
>
> The sh script are harder to maintain for compatible different
> xsh environment
>
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> ---
>  meson.build             |  2 +-
>  scripts/qemu-version.py | 30 ++++++++++++++++++++++++++++++
>  scripts/qemu-version.sh | 25 -------------------------
>  3 files changed, 31 insertions(+), 26 deletions(-)
>  create mode 100644 scripts/qemu-version.py
>  delete mode 100755 scripts/qemu-version.sh
>
> diff --git a/meson.build b/meson.build
> index 95a532bd29..20f653b6eb 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1072,7 +1072,7 @@ tracetool = [
>     '--backend=' + config_host['TRACE_BACKENDS']
>  ]
>
> -qemu_version_cmd = [find_program('scripts/qemu-version.sh'),
> +qemu_version_cmd = [find_program('scripts/qemu-version.py'),
>                      meson.current_source_dir(),
>                      config_host['PKGVERSION'], meson.project_version()]
>  qemu_version = custom_target('qemu-version.h',
> diff --git a/scripts/qemu-version.py b/scripts/qemu-version.py
> new file mode 100644
> index 0000000000..384c54027d
> --- /dev/null
> +++ b/scripts/qemu-version.py
> @@ -0,0 +1,30 @@
> +#!/usr/bin/env python3
> +
> +# Script for retrieve qemu git version information
> +# and output to stdout as QEMU_PKGVERSION and QEMU_FULL_VERSION header
> +# Author: Yonggang Luo <luoyonggang@gmail.com>

Can we have a license statement in all new files, please?

> +
> +import sys
> +import subprocess
> +
> +def main(args):
> +    if len(args) <= 3:
> +        sys.exit(0)
> +
> +    dir = args[1]
> +    pkgversion = args[2]
> +    version = args[3]
> +    pc = subprocess.run(['git', 'describe', '--match', "'v*'", '--dirty', '--always'],
> +        stdout=subprocess.PIPE, stderr=subprocess.DEVNULL, cwd=dir)
> +    if pc.returncode == 0:
> +        pkgversion = pc.stdout.decode('utf8').strip()
> +    fullversion = version
> +    if len(pkgversion) > 0:
> +        fullversion = "{} ({})".format(version, pkgversion)
> +
> +    version_header = '''#define QEMU_PKGVERSION "{}"
> +#define QEMU_FULL_VERSION "{}"'''.format(pkgversion, fullversion)
> +    sys.stdout.buffer.write(version_header.encode('utf8'))
> +
> +if __name__ == "__main__":
> +    main(sys.argv)

Wow, python really makes this kind of task clunky compared to shell...

This doesn't seem to be the same logic as the original shell.
I'm not too familiar with python, but:
 * the shell script doesn't run git if pkgversion is not the empty string
 * the shell script doesn't run git unless the .git directory exists
If these are intentional behaviour changes you should mention
them in the commit message.

Also worth mentioning that you're fixing the bug in the shell
script where we ignore the output from git (the intention was
to ignore a failure from git but otherwise to keep its output;
this patch:
https://patchew.org/QEMU/20200929143654.518157-1-marcandre.lureau@redhat.com/
is the fix for that in the existing shell script).

> diff --git a/scripts/qemu-version.sh b/scripts/qemu-version.sh
> deleted file mode 100755
> index 03128c56a2..0000000000
> --- a/scripts/qemu-version.sh
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -#!/bin/sh
> -
> -set -eu
> -
> -dir="$1"
> -pkgversion="$2"
> -version="$3"
> -
> -if [ -z "$pkgversion" ]; then
> -    cd "$dir"
> -    if [ -e .git ]; then
> -        pkgversion=$(git describe --match 'v*' --dirty | echo "")
> -    fi
> -fi
> -
> -if [ -n "$pkgversion" ]; then
> -    fullversion="$version ($pkgversion)"
> -else
> -    fullversion="$version"
> -fi
> -
> -cat <<EOF
> -#define QEMU_PKGVERSION "$pkgversion"
> -#define QEMU_FULL_VERSION "$fullversion"
> -EOF

thanks
-- PMM

