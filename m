Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kQa00-0003Sa-Jp
	for mharc-qemu-trivial@gnu.org; Thu, 08 Oct 2020 13:46:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kQZzz-0003Od-3T
 for qemu-trivial@nongnu.org; Thu, 08 Oct 2020 13:46:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kQZzu-00034r-0Y
 for qemu-trivial@nongnu.org; Thu, 08 Oct 2020 13:46:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602179192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GVI1fC/mwjxmZEbiNUHeHmKJvtlbMn3IB/PcLR93yKU=;
 b=cTdPlidcuIXfb8k1MFES5i1vyIQZRHZtqi7J5okq5jiWwxOC97wU0ilHB/zTEuLG2BYMPZ
 3oId+8SPtKpRcdzdzj0jpstmeZml4ErgPrqY7Rp6Zrmt0YIz39e6+uy7A0Av6G8X0VWFpn
 QN9Scxj6/RejtgbypSDiLtGzpLYZhBU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-fOPZcB_ANCy9m1N406psCA-1; Thu, 08 Oct 2020 13:46:31 -0400
X-MC-Unique: fOPZcB_ANCy9m1N406psCA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EFBAD8030BA;
 Thu,  8 Oct 2020 17:46:29 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-113-40.ams2.redhat.com [10.36.113.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D4A155C1A3;
 Thu,  8 Oct 2020 17:46:28 +0000 (UTC)
Subject: Re: [PATCH] mingw: Fix builds on f33 mingw
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>,
 qemu-devel@nongnu.org, quintela@redhat.com
References: <20201008174359.157627-1-dgilbert@redhat.com>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <7f8ffa77-cc95-b121-0da8-269d37c52830@redhat.com>
Date: Thu, 8 Oct 2020 19:46:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20201008174359.157627-1-dgilbert@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/08 01:56:49
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.214, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
X-List-Received-Date: Thu, 08 Oct 2020 17:46:39 -0000

On 08/10/2020 19.43, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> Fedora 33's mingw moans about:
> 
> In file included from ../tests/test-bitmap.c:12:
> /home/dgilbert/git/migpull/include/qemu/osdep.h:76: error: "__USE_MINGW_ANSI_STDIO" redefined [-Werror]
>    76 | #define __USE_MINGW_ANSI_STDIO 1
>       |
> 
> the fix is to make sure osdep.h is the first include - which is our
> rule anyway; but one we broke in a couple of places.
> 
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  migration/dirtyrate.c | 2 +-
>  tests/test-bitmap.c   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
> index ab9e1301f6..42b71e771e 100644
> --- a/migration/dirtyrate.c
> +++ b/migration/dirtyrate.c
> @@ -10,8 +10,8 @@
>   * See the COPYING file in the top-level directory.
>   */
>  
> -#include <zlib.h>
>  #include "qemu/osdep.h"
> +#include <zlib.h>
>  #include "qapi/error.h"
>  #include "cpu.h"
>  #include "qemu/config-file.h"
> diff --git a/tests/test-bitmap.c b/tests/test-bitmap.c
> index 2f5b71458a..c3c9d79667 100644
> --- a/tests/test-bitmap.c
> +++ b/tests/test-bitmap.c
> @@ -8,8 +8,8 @@
>   * Author: Peter Xu <peterx@redhat.com>
>   */
>  
> -#include <stdlib.h>
>  #include "qemu/osdep.h"
> +#include <stdlib.h>
>  #include "qemu/bitmap.h"
>  
>  #define BMAP_SIZE  1024
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


