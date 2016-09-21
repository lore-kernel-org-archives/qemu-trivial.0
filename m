Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bmZMM-0006Fj-MZ
	for mharc-qemu-trivial@gnu.org; Wed, 21 Sep 2016 00:42:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51644)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1bmZMK-0006Ci-2L
	for qemu-trivial@nongnu.org; Wed, 21 Sep 2016 00:42:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1bmZMH-0006MZ-TZ
	for qemu-trivial@nongnu.org; Wed, 21 Sep 2016 00:42:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56834)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>)
	id 1bmZMD-0006Gd-Fw; Wed, 21 Sep 2016 00:42:05 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 90B034E4D4;
	Wed, 21 Sep 2016 04:42:04 +0000 (UTC)
Received: from localhost (vpn1-5-197.pek2.redhat.com [10.72.5.197])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8L4g2cB026327; Wed, 21 Sep 2016 00:42:03 -0400
Date: Wed, 21 Sep 2016 12:42:01 +0800
From: Fam Zheng <famz@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, berto@igalia.com,
	rth@twiddle.net
Message-ID: <20160921044201.GA28328@lemon>
References: <1474382581-12766-1-git-send-email-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1474382581-12766-1-git-send-email-eblake@redhat.com>
User-Agent: Mutt/1.7.0 (2016-08-17)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Wed, 21 Sep 2016 04:42:04 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tests: Ignore test
 executables
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
X-List-Received-Date: Wed, 21 Sep 2016 04:42:13 -0000

On Tue, 09/20 09:43, Eric Blake wrote:
> Commits 9ef8112a and efad6682 introduced new tests, but forgot
> to ignore the built executables from an in-tree build.
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  tests/.gitignore | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tests/.gitignore b/tests/.gitignore
> index b4a9cfc..bb25b7e 100644
> --- a/tests/.gitignore
> +++ b/tests/.gitignore
> @@ -12,7 +12,9 @@ rcutorture
>  test-aio
>  test-base64
>  test-bitops
> +test-blockjob
>  test-blockjob-txn
> +test-bufferiszero
>  test-clone-visitor
>  test-coroutine
>  test-crypto-afsplit
> -- 
> 2.7.4
> 
> 

Reviewed-by: Fam Zheng <famz@redhat.com>

