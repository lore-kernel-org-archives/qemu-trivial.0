Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1khmHk-0001hY-H9
	for mharc-qemu-trivial@gnu.org; Tue, 24 Nov 2020 23:20:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1khmHi-0001gm-LV
 for qemu-trivial@nongnu.org; Tue, 24 Nov 2020 23:20:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1khmHf-00025l-CP
 for qemu-trivial@nongnu.org; Tue, 24 Nov 2020 23:20:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606277998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/cusLSheyvJx53R5gzIjKx1lxpzFxtddPlsSIBlsnvA=;
 b=B5zIZBm8U8eALIjM3eqB1PcsvQGL+nK9c5RXsVxMjwDfO0pwfnibI+g6MCTs029QBs+Yuj
 qmDWWZRPk0GfiEWAkWT1ktY5XUunIMEPKZFNHDMwmyUKu0CpbxA0NVh3TB53BIjQnil0Ry
 J2/6JmlEInm8cxsK7UulpZR6EPzxDjI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-262-3uO8ie28M5GmTZeDOJH0xQ-1; Tue, 24 Nov 2020 23:19:55 -0500
X-MC-Unique: 3uO8ie28M5GmTZeDOJH0xQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E0842805BE6;
 Wed, 25 Nov 2020 04:19:53 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-81.ams2.redhat.com [10.36.112.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E6CF510016FB;
 Wed, 25 Nov 2020 04:19:47 +0000 (UTC)
Subject: Re: [PATCH v1] configure: remove python pkg_resources check
To: Olaf Hering <olaf@aepfle.de>, qemu-devel@nongnu.org
References: <20201124211925.4194-1-olaf@aepfle.de>
Cc: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, QEMU Trivial <qemu-trivial@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <055163a8-9c26-4454-89e8-9b40c31d79a0@redhat.com>
Date: Wed, 25 Nov 2020 05:19:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201124211925.4194-1-olaf@aepfle.de>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
X-List-Received-Date: Wed, 25 Nov 2020 04:20:03 -0000

On 24/11/2020 22.19, Olaf Hering wrote:
> Since meson.git#0240d760c7699a059cc89e584363c6431cdd2b61 setuptools is not required anymore.

That commit was part of meson 0.55.1. We require at least meson 0.55.3. So
right, this should be fine.

> Signed-off-by: Olaf Hering <olaf@aepfle.de>
> ---
>  configure | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/configure b/configure
> index 8c5d2f9a69..ce9b3c0a33 100755
> --- a/configure
> +++ b/configure
> @@ -1913,9 +1913,6 @@ fi
>  
>  case "$meson" in
>      git | internal)
> -        if ! $python -c 'import pkg_resources' > /dev/null 2>&1; then
> -            error_exit "Python setuptools not found"
> -        fi
>          meson="$python ${source_path}/meson/meson.py"
>          ;;
>      *) meson=$(command -v "$meson") ;;

Reviewed-by: Thomas Huth <thuth@redhat.com>

I guess we could now also remove the corresponding package from the docker
and vm files?

$ grep -r setuptool tests/
tests/docker/dockerfiles/debian10.docker:     python3-setuptools \
tests/docker/dockerfiles/fedora-win32-cross.docker:    python3-setuptools \
tests/docker/dockerfiles/fedora-win64-cross.docker:    python3-setuptools \
tests/vm/freebsd:        "py37-setuptools",
tests/vm/openbsd:        "py3-setuptools",
tests/vm/haiku.x86_64:        "setuptools_python3"
tests/vm/netbsd:        "py37-setuptools",


