Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d3drL-0007sy-PJ
	for mharc-qemu-trivial@gnu.org; Thu, 27 Apr 2017 03:29:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49677)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1d3drG-0007n2-Bo
	for qemu-trivial@nongnu.org; Thu, 27 Apr 2017 03:29:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1d3drF-0005Jr-Dl
	for qemu-trivial@nongnu.org; Thu, 27 Apr 2017 03:28:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37494)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1d3dr8-0005BX-PO; Thu, 27 Apr 2017 03:28:50 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B80E661B90;
	Thu, 27 Apr 2017 07:28:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com B80E661B90
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=lvivier@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com B80E661B90
Received: from [10.36.118.57] (unknown [10.36.118.57])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 60DE988D91;
	Thu, 27 Apr 2017 07:28:48 +0000 (UTC)
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	"open list:Block layer core" <qemu-block@nongnu.org>,
	Max Reitz <mreitz@redhat.com>
References: <20170426221046.4596-1-eblake@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <459d5638-9be2-c720-7470-5c14402462a0@redhat.com>
Date: Thu, 27 Apr 2017 09:28:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.0
MIME-Version: 1.0
In-Reply-To: <20170426221046.4596-1-eblake@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Thu, 27 Apr 2017 07:28:49 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] iotests: Fix typo in 026
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
X-List-Received-Date: Thu, 27 Apr 2017 07:29:02 -0000

On 27/04/2017 00:10, Eric Blake wrote:
> s/refcout/refcount/
> 
> CC: qemu-trivial@nongnu.org
> Signed-off-by: Eric Blake <eblake@redhat.com>

Reviewed-by: Laurent Vivier <lvivier@redhat.com>

> ---
>  tests/qemu-iotests/026             | 2 +-
>  tests/qemu-iotests/026.out         | 2 +-
>  tests/qemu-iotests/026.out.nocache | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/qemu-iotests/026 b/tests/qemu-iotests/026
> index f5a7f02..7fadfba 100755
> --- a/tests/qemu-iotests/026
> +++ b/tests/qemu-iotests/026
> @@ -119,7 +119,7 @@ done
> 
> 
>  echo
> -echo === Refcout table growth tests ===
> +echo === Refcount table growth tests ===
>  echo
>  CLUSTER_SIZE=512
> 
> diff --git a/tests/qemu-iotests/026.out b/tests/qemu-iotests/026.out
> index 59b8f74..86a50a2 100644
> --- a/tests/qemu-iotests/026.out
> +++ b/tests/qemu-iotests/026.out
> @@ -462,7 +462,7 @@ Event: cluster_alloc; errno: 28; imm: off; once: off; write -b
>  write failed: No space left on device
>  No errors were found on the image.
> 
> -=== Refcout table growth tests ===
> +=== Refcount table growth tests ===
> 
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1073741824
> 
> diff --git a/tests/qemu-iotests/026.out.nocache b/tests/qemu-iotests/026.out.nocache
> index b4aeebc..ea2e166 100644
> --- a/tests/qemu-iotests/026.out.nocache
> +++ b/tests/qemu-iotests/026.out.nocache
> @@ -470,7 +470,7 @@ Event: cluster_alloc; errno: 28; imm: off; once: off; write -b
>  write failed: No space left on device
>  No errors were found on the image.
> 
> -=== Refcout table growth tests ===
> +=== Refcount table growth tests ===
> 
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1073741824 
> 


