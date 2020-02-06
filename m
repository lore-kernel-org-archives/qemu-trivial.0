Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1izkQw-0003wo-8A
	for mharc-qemu-trivial@gnu.org; Thu, 06 Feb 2020 11:55:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58233)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1izkQt-0003v2-Vi
 for qemu-trivial@nongnu.org; Thu, 06 Feb 2020 11:55:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1izkQr-00020p-VB
 for qemu-trivial@nongnu.org; Thu, 06 Feb 2020 11:55:15 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:43036
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1izkQr-0001zl-QV
 for qemu-trivial@nongnu.org; Thu, 06 Feb 2020 11:55:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581008113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fpToknbMbQO8u6/kOoi+5h/0vxJJu9SJaVqT6g5cPvA=;
 b=gwqWOxL1f1CDN7R11c/3Qlx2qHtWMT+Awov5T+tj7phInB1IZ8xQSZBZXjnOJnUeHO/8ok
 M1ptfC/aUOOLIRBfUoQzL9ZDuvSMW5jaRNsUGg+DFeGosRhJnzetgmC7H7rjiJJo8QZ9U2
 Q0ccOvr89eL7DwZNhWEEnIM7HodNGdE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-j_V__971NZKok27yX1rxMw-1; Thu, 06 Feb 2020 11:55:11 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2FB06800D54;
 Thu,  6 Feb 2020 16:55:09 +0000 (UTC)
Received: from [10.3.117.249] (ovpn-117-249.phx2.redhat.com [10.3.117.249])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 260BF84DB8;
 Thu,  6 Feb 2020 16:55:07 +0000 (UTC)
Subject: Re: [PULL 3/5] nbd: fix uninitialized variable warning
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
 Pan Nengyuan <pannengyuan@huawei.com>, Euler Robot <euler.robot@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20200108160233.991134-1-laurent@vivier.eu>
 <20200108160233.991134-4-laurent@vivier.eu>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <1ce40cae-eb8b-a18c-f651-2e6432c1b213@redhat.com>
Date: Thu, 6 Feb 2020 10:55:06 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200108160233.991134-4-laurent@vivier.eu>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: j_V__971NZKok27yX1rxMw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
X-List-Received-Date: Thu, 06 Feb 2020 16:55:17 -0000

On 1/8/20 10:02 AM, Laurent Vivier wrote:
> From: Pan Nengyuan <pannengyuan@huawei.com>
> 
> Fixes:
> /mnt/sdb/qemu/nbd/server.c: In function 'nbd_handle_request':
> /mnt/sdb/qemu/nbd/server.c:2313:9: error: 'ret' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>       int ret;
> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> Message-Id: <20200108025132.46956-1-pannengyuan@huawei.com>
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>   nbd/server.c | 10 +---------
>   1 file changed, 1 insertion(+), 9 deletions(-)
> 

This patch is broken; I first noticed it when testing libnbd, where the 
symptoms are a hung interop/dirty-bitmap.sh test.

> diff --git a/nbd/server.c b/nbd/server.c
> index 24ebc1a80571..87fcd2e7bfac 100644
> --- a/nbd/server.c
> +++ b/nbd/server.c
> @@ -2384,20 +2384,12 @@ static coroutine_fn int nbd_handle_request(NBDClient *client,
>                                                  !client->export_meta.bitmap,
>                                                  NBD_META_ID_BASE_ALLOCATION,
>                                                  errp);
> -                if (ret < 0) {
> -                    return ret;
> -                }
> -            }
> -
> -            if (client->export_meta.bitmap) {
> +            } else {              /* client->export_meta.bitmap */
>                   ret = nbd_co_send_bitmap(client, request->handle,
>                                            client->exp->export_bitmap,
>                                            request->from, request->len,
>                                            dont_fragment,
>                                            true, NBD_META_ID_DIRTY_BITMAP, errp);
> -                if (ret < 0) {
> -                    return ret;
> -                }
>               }

The NBD spec says that clients can request more than one meta context at 
a time. Qemu does not (and hence we didn't notice the breakage until 
now), but libnbd does, and this change prevents qemu from obeying the 
spec (if the client requested both contexts, then we must return both, 
and not short-circuit after the first).

I'll post a patch to fix this unintended regression soon.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


