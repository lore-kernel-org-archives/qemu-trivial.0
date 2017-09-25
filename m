Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dwWNb-0001z4-V3
	for mharc-qemu-trivial@gnu.org; Mon, 25 Sep 2017 12:37:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56251)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dwWNZ-0001xP-6S
	for qemu-trivial@nongnu.org; Mon, 25 Sep 2017 12:37:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dwWNY-0007MN-Et
	for qemu-trivial@nongnu.org; Mon, 25 Sep 2017 12:37:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53840)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1dwWNU-0007LW-3j; Mon, 25 Sep 2017 12:37:04 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 26FD5C047B66;
	Mon, 25 Sep 2017 16:37:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 26FD5C047B66
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from [10.36.116.26] (ovpn-116-26.ams2.redhat.com [10.36.116.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C3846061E;
	Mon, 25 Sep 2017 16:37:02 +0000 (UTC)
To: Daniel Loffgren <daniel@loffgren.org>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <5DAE0523-80F8-4F68-93CB-0571C0C62B20@loffgren.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <7726e35d-4869-e5aa-4151-f40bed148825@redhat.com>
Date: Mon, 25 Sep 2017 18:37:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <5DAE0523-80F8-4F68-93CB-0571C0C62B20@loffgren.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Mon, 25 Sep 2017 16:37:03 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/2] thunk.h uses
 TARGET_ABI_BITS without including abitypes.h
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
X-List-Received-Date: Mon, 25 Sep 2017 16:37:10 -0000


Did this cause any trouble? ... one of two sentences in the patch
description would be nice, I think.

 Thomas


On 25.09.2017 03:02, Daniel Loffgren wrote:
> 
> Signed-off-by: Daniel Loffgren <daniel@loffgren.org>
> ---
>  include/exec/user/thunk.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/exec/user/thunk.h b/include/exec/user/thunk.h
> index f19ef4b230..12b5449d8c 100644
> --- a/include/exec/user/thunk.h
> +++ b/include/exec/user/thunk.h
> @@ -19,6 +19,7 @@
>  #ifndef THUNK_H
>  #define THUNK_H
>  
> +#include "abitypes.h"
>  #include "cpu.h"
>  
>  /* types enums definitions */
> 


