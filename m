Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kPlBp-0007Fp-GX
	for mharc-qemu-trivial@gnu.org; Tue, 06 Oct 2020 07:31:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kPlBn-0007Dz-F6
 for qemu-trivial@nongnu.org; Tue, 06 Oct 2020 07:31:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kPlBl-0007qt-A5
 for qemu-trivial@nongnu.org; Tue, 06 Oct 2020 07:31:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601983884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wjcNNMJhWr1GcCod35r4/KZkRcXUZ1UnznJ5NE5wdkA=;
 b=ZEl5zOZreMgWh23LB9zatzxv4CLVt8UHS2sviVtFR88AYE+5LJO+FH/HsHKXqk4Hf6d3Fz
 eHn5aMDfNLxKPfZ2KWtBzY7H+QasgIh18nnDpiKhejX9UHkQop5uNJnP7D/TMpljM3xcQZ
 x2gSl1t+2qF/5QTeJV0RWbeq0w4DjxQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-104-ANOjuF0UPoe6ULJ8HXPOMg-1; Tue, 06 Oct 2020 07:31:22 -0400
X-MC-Unique: ANOjuF0UPoe6ULJ8HXPOMg-1
Received: by mail-wm1-f69.google.com with SMTP id p17so591378wmi.7
 for <qemu-trivial@nongnu.org>; Tue, 06 Oct 2020 04:31:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wjcNNMJhWr1GcCod35r4/KZkRcXUZ1UnznJ5NE5wdkA=;
 b=j3/G8dgcbLNkKhUqvhidNGBsDsqBcx1Hfk3Sn7scMnePvJxHxtOB0+CT81VtaALSRr
 7DxMF1D97g4TYkIca6jyrwMBJjfQYE6byhhjpnJfwqsWHmN+Vg7UeDsA6mADKc73N4so
 1dK1i+wX4t7rcdYldREdSsSG6EZEZLrjij1mBQsnxgH4/BY9U9ycQLwXHhfxOHNezXJg
 7KmlPf4GMd/1tGxPWFkRcIfiRTe/haf/OTD9fuxtDffdpdO2iXfTkzjqN5enhtbO4p2N
 0JXpT2H/XNiMdktatfXpCi7O0C1YqCFqXumAOxICp02/29r3SirZIUjltX+5MBtAOCjs
 6Xaw==
X-Gm-Message-State: AOAM532+uJiY+4jwvYvK0t1bS+Nz33TXSGgFH6TIBm43i2hOwBnsHgZT
 dzurlxr4xTBgCXS711HSCdIkLMlswAHeS8meWS0yL5zK2zWXjfOwueIqukPCqq1dsBOBJ81VIxr
 PWnmVXBllnJk7VdIEUQ==
X-Received: by 2002:a1c:66d5:: with SMTP id a204mr4201945wmc.62.1601983880652; 
 Tue, 06 Oct 2020 04:31:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzVT9z6XDWnwYATZyCpNqpsh4Lwv+lckgW9bdSyXhaDuZGUtOWiBxtHR46HIQokS49kmTeO2g==
X-Received: by 2002:a1c:66d5:: with SMTP id a204mr4201925wmc.62.1601983880400; 
 Tue, 06 Oct 2020 04:31:20 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5aca:cd0b:c4a1:9c2e?
 ([2001:b07:6468:f312:5aca:cd0b:c4a1:9c2e])
 by smtp.gmail.com with ESMTPSA id l17sm3424229wme.11.2020.10.06.04.31.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Oct 2020 04:31:19 -0700 (PDT)
Subject: Re: [PATCH v5] scripts: Convert qemu-version.sh to qemu-version.py
To: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=e8=8c=85?= <f4bug@amsat.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, Thomas Huth <thuth@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20201006112139.700-1-luoyonggang@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <0e1a884d-895d-dd4d-104d-ae391e016d20@redhat.com>
Date: Tue, 6 Oct 2020 13:31:19 +0200
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
X-List-Received-Date: Tue, 06 Oct 2020 11:31:27 -0000

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

Queued, thanks.

Paolo


