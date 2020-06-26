Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1johLG-0002WY-F0
	for mharc-qemu-trivial@gnu.org; Fri, 26 Jun 2020 01:56:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1johLE-0002Uy-Mq
 for qemu-trivial@nongnu.org; Fri, 26 Jun 2020 01:56:00 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:20912
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1johLC-0000YM-58
 for qemu-trivial@nongnu.org; Fri, 26 Jun 2020 01:56:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593150955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lNUBecxSsw9uvMMev7CnQGU54kzF8T30xltIj4yOMBc=;
 b=fUFCHBMRCiVnrnco+jMGXvA22EfFyFEG+ktg+ezIwv6AZLni4CxhW1S+/MbZekbedpVw38
 MrjTiUWHQLkuS0W54fr29lvSqXhUbCYrOL0w63IVT3Qdowp7z+UPeEkkksnY4Un/mYYXkS
 q4Ypv07c5WzsZ6P3sSQyC6DgV7C6zzU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-iMt2GuZNMSWpl9RZJKGibQ-1; Fri, 26 Jun 2020 01:55:53 -0400
X-MC-Unique: iMt2GuZNMSWpl9RZJKGibQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5ED2C805F1C;
 Fri, 26 Jun 2020 05:55:52 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-125.ams2.redhat.com [10.36.112.125])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 82F9819934;
 Fri, 26 Jun 2020 05:55:51 +0000 (UTC)
Subject: Re: [PATCH v3] build: Haiku build fix
To: David CARLIER <devnexen@gmail.com>, QEMU Trivial
 <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
References: <CA+XhMqzX=OaRgxQbHKU82K2WhTBwL44sr+wpGKSjZWqaehLyJQ@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <6bd67e4d-7815-b7bc-7c64-fc42155afd1f@redhat.com>
Date: Fri, 26 Jun 2020 07:55:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CA+XhMqzX=OaRgxQbHKU82K2WhTBwL44sr+wpGKSjZWqaehLyJQ@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/26 01:55:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Fri, 26 Jun 2020 05:56:00 -0000

  Hi!

On 25/06/2020 23.30, David CARLIER wrote:
>  From 78706a28c6aa8b5e522b5781588b38961d79d6f6 Mon Sep 17 00:00:00 2001
> From: David Carlier <devnexen@gmail.com>
> Date: Thu, 25 Jun 2020 19:32:42 +0000
> Subject: [PATCH] build: haiku system build fix

The above header lines should not be part of the e-mail body (otherwise 
they will show up in the commit message if the patch gets applied with 
"git am").

> Most of missing features resides in the bsd library.
> Also defining constant equivalence.
> 
> Signed-off-by: David Carlier <devnexen@gmail.com>
> ---
>   configure            | 34 ++++++++++++++++++++++++++++++++--
>   include/qemu/bswap.h |  2 ++
>   include/qemu/osdep.h |  4 ++++
>   os-posix.c           |  4 ++++
>   util/Makefile.objs   |  2 +-
>   util/compatfd.c      |  2 ++
>   util/main-loop.c     |  1 +
>   util/oslib-posix.c   | 20 ++++++++++++++++++++
>   util/qemu-openpty.c  |  2 +-
>   9 files changed, 67 insertions(+), 4 deletions(-)
> 
> diff --git a/configure b/configure
> index ba88fd1824..43baeadf31 100755
> --- a/configure
> +++ b/configure
> @@ -901,8 +901,8 @@ SunOS)
>   ;;
>   Haiku)
>     haiku="yes"
> -  QEMU_CFLAGS="-DB_USE_POSITIVE_POSIX_ERRORS $QEMU_CFLAGS"
> -  LIBS="-lposix_error_mapper -lnetwork $LIBS"
> +  QEMU_CFLAGS="-DB_USE_POSITIVE_POSIX_ERRORS -D_BSD_SOURCE $QEMU_CFLAGS"
> +  LIBS="-lposix_error_mapper -lnetwork -lbsd $LIBS"
>   ;;
>   Linux)
>     audio_drv_list="try-pa oss"
> @@ -2373,6 +2373,30 @@ else
>     l2tpv3=no
>   fi
> 
> +cat > $TMPC <<EOF
> +#include <pty.h>
> +int main(int argc, char *argv[]) {
> +    return 0;
> +}
> +EOF

Please use the check_include function if you just want to test the 
availability of a header.

> +if compile_prog "" "" ; then
> +  pty_h=yes
> +else
> +  pty_h=no
> +fi

  Thanks,
   Thomas


