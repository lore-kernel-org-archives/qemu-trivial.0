Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kPlEk-0001UX-B1
	for mharc-qemu-trivial@gnu.org; Tue, 06 Oct 2020 07:34:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kPlEb-0001ST-81
 for qemu-trivial@nongnu.org; Tue, 06 Oct 2020 07:34:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kPlEY-00084G-90
 for qemu-trivial@nongnu.org; Tue, 06 Oct 2020 07:34:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601984057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gJyvbLDNu+d+c/zI7H5aK0+b2ctGwhtVvqaTeLeClss=;
 b=RUbUeWR3kM59EYwBW8a6ePij4fSOpWQxhHCft682hA4jA3stV6cbIIClDhqbIqwiQLZk8Y
 l3P4GG2g6pEKTRDK5I/pHJTt0TNxZo1remNYbCodnZIrNbG1kZTk4EYw1AfRpKMlkfBas4
 EKtAzkcZPpEHEcYvRgTTHGMRN2F25zA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-NmW-MBpOPrON5oA6eLPuFQ-1; Tue, 06 Oct 2020 07:34:15 -0400
X-MC-Unique: NmW-MBpOPrON5oA6eLPuFQ-1
Received: by mail-wr1-f71.google.com with SMTP id t17so1918467wrm.13
 for <qemu-trivial@nongnu.org>; Tue, 06 Oct 2020 04:34:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gJyvbLDNu+d+c/zI7H5aK0+b2ctGwhtVvqaTeLeClss=;
 b=ZRGsOp36DeUDr0ni5tKsPt4k2FJDMiY6ySJLPiZAIPjnYlZ+QeD8P4LlvQRb4GX12T
 v9sKBOXbt4bp5Q/R24W9rwF/DTRmMyEQysZF6yW21LnG7wvQX6AiC3WSdKEyl1N/eIB5
 zfQt1nTbr5g+x5TdyluyEWnuZjkoBSL+zbPMErvhlxjjOEk2T4Os4LzEhweEIH/jm9d8
 UHjUcqL26fatzxdrROL6uSfrwuUI7t+lmN+rtDAkD4AcHu2BFrVpKwJsWqDz8WWPe88J
 rdsvHqdS4uvXOOSKwwnSo19qjwEhH9rf+oxDEoMAmdj7mrKq/LnCQNBHPyDwmLcpW9/P
 +lHA==
X-Gm-Message-State: AOAM532PspJzIcIWPmNlrSEloOI88T+x+/SSgFTrL1JEt1yb28dSjYoL
 96mjLbdeDhLwSv7dFI/F4BeEXadqnp5/wdwl4nmP8XxUwbIDK8nOMaMTjGP+muV3q4Kllh0HzRJ
 e7erNJv41vw5Ise6ktA==
X-Received: by 2002:a5d:67c2:: with SMTP id n2mr4222787wrw.4.1601984053985;
 Tue, 06 Oct 2020 04:34:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwEztE/PGa9UvgUzIic3I0JUq3bond3JPbdpgcGqyLnNMX+drrRHuqk24hi1m1REZKjI/IpFA==
X-Received: by 2002:a5d:67c2:: with SMTP id n2mr4222770wrw.4.1601984053759;
 Tue, 06 Oct 2020 04:34:13 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5aca:cd0b:c4a1:9c2e?
 ([2001:b07:6468:f312:5aca:cd0b:c4a1:9c2e])
 by smtp.gmail.com with ESMTPSA id z191sm3691594wme.40.2020.10.06.04.34.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Oct 2020 04:34:13 -0700 (PDT)
Subject: Re: [PATCH v5] scripts: Convert qemu-version.sh to qemu-version.py
To: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=e8=8c=85?= <f4bug@amsat.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, Thomas Huth <thuth@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20201006112139.700-1-luoyonggang@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d8097b12-f5d8-cd12-6e87-c12774ba5f5b@redhat.com>
Date: Tue, 6 Oct 2020 13:34:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20201006112139.700-1-luoyonggang@gmail.com>
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
X-List-Received-Date: Tue, 06 Oct 2020 11:34:23 -0000

On 06/10/20 13:21, Yonggang Luo wrote:
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
>  scripts/qemu-version.py | 31 +++++++++++++++++++++++++++++++
>  scripts/qemu-version.sh | 25 -------------------------
>  3 files changed, 32 insertions(+), 26 deletions(-)
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
> index 0000000000..e6eb548220
> --- /dev/null
> +++ b/scripts/qemu-version.py
> @@ -0,0 +1,31 @@
> +#!/usr/bin/env python3
> +
> +#
> +# Script for retrieve qemu git version information
> +#
> +# Authors:
> +#  Yonggang Luo <luoyonggang@gmail.com>
> +#
> +# This work is licensed under the terms of the GNU GPL, version 2
> +# or, at your option, any later version.  See the COPYING file in
> +# the top-level directory.
> +
> +import sys
> +import subprocess
> +
> +def main(_program, dir, pkgversion, version, *unused):
> +    if len(pkgversion) == 0:
> +        pc = subprocess.run(['git', 'describe', '--match', "'v*'", '--dirty', '--always'],
> +                            stdout=subprocess.PIPE, stderr=subprocess.DEVNULL, cwd=dir)
> +        if pc.returncode == 0:
> +            pkgversion = pc.stdout.decode('utf8').strip()
> +
> +    fullversion = version
> +    if pkgversion:
> +        fullversion = "{} ({})".format(version, pkgversion)
> +
> +    print('#define QEMU_PKGVERSION "%s"' % pkgversion)
> +    print('#define QEMU_FULL_VERSION "%s"' % fullversion)
> +
> +if __name__ == "__main__":
> +    main(*sys.argv)
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

Hmm it still doesn't check for a ".git" directory.  I'll fix it up, but
please pay more attention to the reviews.

Paolo


