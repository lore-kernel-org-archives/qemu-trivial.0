Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kPhdA-0005Mg-Sf
	for mharc-qemu-trivial@gnu.org; Tue, 06 Oct 2020 03:43:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kPhd8-0005K1-Rn
 for qemu-trivial@nongnu.org; Tue, 06 Oct 2020 03:43:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kPhd6-0003Cm-3k
 for qemu-trivial@nongnu.org; Tue, 06 Oct 2020 03:43:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601970202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=42beawBw5KhBW4GEpH6o392CQfSZGLffzjgdNgIBlcU=;
 b=HlUBEjd03rZqX0UoEIEl6ON1jElvBd3R0XQhHCv+Pnp7YRy8xw2sWLCcUU9tMUJDCoo+Vb
 dh0XBWpjqvabWbgpVrxBiHWFznHuRGQxpj+WT6QRRcGv/js0O04EgNTvqbqOgzLlqnCLQZ
 1a8JFZLzuI0Q8Q4QwlnEgr9VVGR3+dM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-udxJHOIpOP2GAD9s8U9pEQ-1; Tue, 06 Oct 2020 03:43:18 -0400
X-MC-Unique: udxJHOIpOP2GAD9s8U9pEQ-1
Received: by mail-wr1-f69.google.com with SMTP id c6so4053195wrt.6
 for <qemu-trivial@nongnu.org>; Tue, 06 Oct 2020 00:43:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=42beawBw5KhBW4GEpH6o392CQfSZGLffzjgdNgIBlcU=;
 b=udmsXz69msqK0ZbUaZPwaUCaIC6CWGTG471Rz4YPpQtLUm/3Msg+1BQwT+aWYnXUNI
 Rk3X3a/78mphuNpCRLmqnbHp3hC2OJduoi/G2lNgudAmjhHmqDVoL8u4FWuJvgHSmmn/
 ZyAdFEfbgSrHAxpdiem5hiLefhzL7cDaHQCQps88eEnvxNYW2f2Wv8graGwVFG3f7K0l
 Cy+uY66N7SSZtyWoCRCZdRSDgLz/CaBP2nKoNhYmHuqqagv9SKDw/cMe/UPy6ok3DKFV
 EFl2BhxDs6XdWBpHELolqyJgbGPF6gASvedGeiXq1seBJh23lCkkuCiy3kA6tQV++J0C
 5voA==
X-Gm-Message-State: AOAM530dOMqDaZrBYvlcMVD/AXqIb0xdMv/KtTnT0V3C8LBpaZ1ftr2t
 Qb+IeCan564LkH2CVTl/6I2R/d8mW60zaj48CscgVOtea0Wx0aspVTqwjg7vg/cnB20jI9EciyB
 XmndmOVV8cuHGaEsZ1Q==
X-Received: by 2002:a1c:4e0e:: with SMTP id g14mr459789wmh.69.1601970197393;
 Tue, 06 Oct 2020 00:43:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwbKa4t9GLjeBaB4C5E7NJdow4bS4hu1RHicA4HEOY1LpgAZm3qfuZP79sP8OwZZkeWyySXWQ==
X-Received: by 2002:a1c:4e0e:: with SMTP id g14mr459770wmh.69.1601970197162;
 Tue, 06 Oct 2020 00:43:17 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5aca:cd0b:c4a1:9c2e?
 ([2001:b07:6468:f312:5aca:cd0b:c4a1:9c2e])
 by smtp.gmail.com with ESMTPSA id w7sm2583449wmc.43.2020.10.06.00.43.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Oct 2020 00:43:16 -0700 (PDT)
Subject: Re: [PATCH v3] scripts: Convert qemu-version.sh to qemu-version.py
To: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, Thomas Huth <thuth@redhat.com>
References: <20201005195129.1507-1-luoyonggang@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <f484d69a-6208-df83-1393-8c14e8568069@redhat.com>
Date: Tue, 6 Oct 2020 09:43:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20201005195129.1507-1-luoyonggang@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/06 01:55:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.733,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 06 Oct 2020 07:43:27 -0000

On 05/10/20 21:51, Yonggang Luo wrote:
> The sh script are harder to maintain for compatible different
> xsh environment so convert it to python script
> Also incorporate the fixes in
> https://patchew.org/QEMU/20200929143654.518157-1-marcandre.lureau@redhat.com/
> 
> Testing args length and if not enough, setting pkgversion and version to ''
> 
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> ---
>  meson.build             |  2 +-
>  scripts/qemu-version.py | 37 +++++++++++++++++++++++++++++++++++++
>  scripts/qemu-version.sh | 25 -------------------------
>  3 files changed, 38 insertions(+), 26 deletions(-)
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
> index 0000000000..fc1531ef2b
> --- /dev/null
> +++ b/scripts/qemu-version.py
> @@ -0,0 +1,37 @@
> +#!/usr/bin/env python3
> +
> +#
> +# Script for retrieve qemu git version information
> +#
> +# Author: Yonggang Luo <luoyonggang@gmail.com>
> +#
> +# This work is licensed under the terms of the GNU GPL, version 2.  See
> +# the COPYING file in the top-level directory.
> +#
> +
> +import sys
> +import subprocess
> +
> +def main(args):
> +    pkgversion = ''
> +    version = ''
> +    if len(args) > 3:
> +        dir = args[1]
> +        pkgversion = args[2]
> +        version = args[3]
> +        if len(pkgversion) == 0:
> +            pc = subprocess.run(['git', 'describe', '--match', "'v*'", '--dirty', '--always'],
> +                                stdout=subprocess.PIPE, stderr=subprocess.DEVNULL, cwd=dir)
> +            if pc.returncode == 0:
> +                pkgversion = pc.stdout.decode('utf8').strip()
> +
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

Can you apply the changes I suggested in v2?

Paolo

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
> 


