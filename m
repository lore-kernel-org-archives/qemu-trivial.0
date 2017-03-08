Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1clYOq-0001Pw-2h
	for mharc-qemu-trivial@gnu.org; Wed, 08 Mar 2017 05:00:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52495)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1clYOh-0001KV-J9
	for qemu-trivial@nongnu.org; Wed, 08 Mar 2017 05:00:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1clYOg-0005cN-TQ
	for qemu-trivial@nongnu.org; Wed, 08 Mar 2017 05:00:43 -0500
Received: from mx1.redhat.com ([209.132.183.28]:58636)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1clYOZ-0005a0-UD; Wed, 08 Mar 2017 05:00:36 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3B5B44D687;
	Wed,  8 Mar 2017 10:00:34 +0000 (UTC)
Received: from [10.36.116.244] (ovpn-116-244.ams2.redhat.com [10.36.116.244])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id v28A0Wel020867; Wed, 8 Mar 2017 05:00:33 -0500
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <20170307184517.21521-1-eblake@redhat.com>
Cc: qemu-trivial@nongnu.org
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <32c14d52-e8d0-09a7-4232-52dab2ae3e8c@redhat.com>
Date: Wed, 8 Mar 2017 11:00:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <20170307184517.21521-1-eblake@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Wed, 08 Mar 2017 10:00:35 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH for-2.9?] tests: Ignore more test
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
X-List-Received-Date: Wed, 08 Mar 2017 10:00:51 -0000

and tests/test-arm-mptimer?

Laurent

On 07/03/2017 19:45, Eric Blake wrote:
> Ignore test executables when building in-tree:
> test-crypto-hmac introduced in commit 4fd460b
> test-aio-multithread introduced in commit 0c330a7
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
> 
> Doesn't affect the built binaries, but does make it harder to
> accidentally commit an unintended binary when doing 'git add .'.
> Therefore, it's up to the maintainer if this is 2.9 or 2.10
> material.
> 
>  tests/.gitignore | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tests/.gitignore b/tests/.gitignore
> index dc37519..71521ac 100644
> --- a/tests/.gitignore
> +++ b/tests/.gitignore
> @@ -11,6 +11,7 @@ check-qom-proplist
>  qht-bench
>  rcutorture
>  test-aio
> +test-aio-multithread
>  test-base64
>  test-bitops
>  test-bitcnt
> @@ -24,6 +25,7 @@ test-crypto-afsplit
>  test-crypto-block
>  test-crypto-cipher
>  test-crypto-hash
> +test-crypto-hmac
>  test-crypto-ivgen
>  test-crypto-pbkdf
>  test-crypto-secret
> 


