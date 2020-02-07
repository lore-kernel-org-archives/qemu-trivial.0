Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j04Ci-0002WF-4P
	for mharc-qemu-trivial@gnu.org; Fri, 07 Feb 2020 09:01:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44840)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1j04CZ-0002Ej-A1
 for qemu-trivial@nongnu.org; Fri, 07 Feb 2020 09:01:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1j04CX-0008O6-2p
 for qemu-trivial@nongnu.org; Fri, 07 Feb 2020 09:01:46 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:40258
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1j04CU-0008Le-Qi
 for qemu-trivial@nongnu.org; Fri, 07 Feb 2020 09:01:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581084102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CoDS1or+vhNSfw1HUju5r2RTd90BR8aIipjKbTeKoug=;
 b=DtXQsF9Iw1bBhabTyjpNYhpLbh0RxwISUTpzuy1A5HwKti2lZjChvcwnQLHQO+jHc4oLHj
 +lKGmWfEz9qWkl57W5geI08eNc2GEoBg2Fmi461Hb6QQ+C/hVwmTpsbXFdxd/9hpnr4UiA
 KyK2s+GlCo/JNrtGc+xFJrBTull3BGs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-A82EdqvvMTaKn2x-ZKYqlw-1; Fri, 07 Feb 2020 09:01:21 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 29FB280256F;
 Fri,  7 Feb 2020 14:01:20 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-136.ams2.redhat.com
 [10.36.116.136])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A652790D7;
 Fri,  7 Feb 2020 14:01:14 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8002C11386A7; Fri,  7 Feb 2020 15:01:13 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>, John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 2/3] MAINTAINERS: Cover qapi/block{-core}.json in 'Block
 layer core' section
References: <20200207103012.27049-1-philmd@redhat.com>
 <20200207103012.27049-3-philmd@redhat.com>
Date: Fri, 07 Feb 2020 15:01:13 +0100
In-Reply-To: <20200207103012.27049-3-philmd@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri, 7 Feb 2020 11:30:11
 +0100")
Message-ID: <87blqaqyxi.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: A82EdqvvMTaKn2x-ZKYqlw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
X-List-Received-Date: Fri, 07 Feb 2020 14:01:54 -0000

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> List this file in the proper section, so maintainers get
> notified when it is modified.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> Cc: Kevin Wolf <kwolf@redhat.com>
> Cc: Max Reitz <mreitz@redhat.com>
> Cc: qemu-block@nongnu.org
> ---
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 903831e0a4..e269e9092c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1842,6 +1842,8 @@ S: Supported
   Block layer core
   M: Kevin Wolf <kwolf@redhat.com>
   M: Max Reitz <mreitz@redhat.com>
   L: qemu-block@nongnu.org
   S: Supported
>  F: block*
>  F: block/
>  F: hw/block/
> +F: qapi/block.json
> +F: qapi/block-core.json
>  F: include/block/
>  F: qemu-img*
>  F: docs/interop/qemu-img.rst

This is in addition to

    Block QAPI, monitor, command line
    M: Markus Armbruster <armbru@redhat.com>
    S: Supported
    F: blockdev.c
    F: block/qapi.c
    F: qapi/block*.json
    F: qapi/transaction.json
    T: git https://repo.or.cz/qemu/armbru.git block-next

I'm not sure this section makes much sense anymore.

Should qapi/transaction.json also be added to "Block layer core"?  Or
should it go into John's section "Block Jobs"?


