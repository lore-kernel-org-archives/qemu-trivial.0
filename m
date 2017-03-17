Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cosZi-00012i-HJ
	for mharc-qemu-trivial@gnu.org; Fri, 17 Mar 2017 10:09:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38593)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1cosZb-0000yk-F2
	for qemu-trivial@nongnu.org; Fri, 17 Mar 2017 10:09:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1cosZa-0003aP-9i
	for qemu-trivial@nongnu.org; Fri, 17 Mar 2017 10:09:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52592)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1cosZV-0003Z6-JC; Fri, 17 Mar 2017 10:09:37 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 69BAB8050B;
	Fri, 17 Mar 2017 14:09:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 69BAB8050B
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=thuth@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 69BAB8050B
Received: from [10.36.116.214] (ovpn-116-214.ams2.redhat.com [10.36.116.214])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 758C0187A8;
	Fri, 17 Mar 2017 14:09:31 +0000 (UTC)
To: Jordan Justen <jordan.l.justen@intel.com>, qemu-devel@nongnu.org
References: <20170316090048.23185-1-jordan.l.justen@intel.com>
Cc: Fam Zheng <famz@redhat.com>, 1673373@bugs.launchpad.net,
	Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org
From: Thomas Huth <thuth@redhat.com>
Message-ID: <a5007f28-f936-0a92-be74-c131cd527ee0@redhat.com>
Date: Fri, 17 Mar 2017 15:09:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <20170316090048.23185-1-jordan.l.justen@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Fri, 17 Mar 2017 14:09:37 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu: Fix -version with
 configure --with-pkgversion
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
X-List-Received-Date: Fri, 17 Mar 2017 14:09:49 -0000

On 16.03.2017 10:00, Jordan Justen wrote:
> This appears to have regressed in 67a1de0d19.
> 
> When the configure --with-pkgversion=foo option is used, the output
> from -version will look like:
> 
> QEMU emulator version 2.8.90(foo)
> Copyright (c) 2003-2017 Fabrice Bellard and the QEMU Project developers
> 
> After this patch, it will be:
> 
> QEMU emulator version 2.8.90 (foo)
> Copyright (c) 2003-2017 Fabrice Bellard and the QEMU Project developers
> 
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Fam Zheng <famz@redhat.com>
> Fixes: https://bugs.launchpad.net/bugs/1673373
> Cc: 1673373@bugs.launchpad.net
> Signed-off-by: Jordan Justen <jordan.l.justen@intel.com>
> ---
>  Makefile  | 2 +-
>  configure | 2 +-
>  vl.c      | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 1c4c04f6f2..c9df119798 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -289,7 +289,7 @@ qemu-version.h: FORCE
>  			printf '"$(PKGVERSION)"\n'; \
>  		else \
>  			if test -d .git; then \
> -				printf '" ('; \
> +				printf '"('; \
>  				git describe --match 'v*' 2>/dev/null | tr -d '\n'; \
>  				if ! git diff-index --quiet HEAD &>/dev/null; then \
>  					printf -- '-dirty'; \
> diff --git a/configure b/configure
> index 99d8bece70..e94b06b5fc 100755
> --- a/configure
> +++ b/configure
> @@ -1004,7 +1004,7 @@ for opt do
>    ;;
>    --disable-blobs) blobs="no"
>    ;;
> -  --with-pkgversion=*) pkgversion=" ($optarg)"
> +  --with-pkgversion=*) pkgversion="($optarg)"
>    ;;
>    --with-coroutine=*) coroutine="$optarg"
>    ;;
> diff --git a/vl.c b/vl.c
> index 0b4ed5241c..3e60e61905 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -1904,7 +1904,7 @@ static void main_loop(void)
>  
>  static void version(void)
>  {
> -    printf("QEMU emulator version " QEMU_VERSION QEMU_PKGVERSION "\n"
> +    printf("QEMU emulator version " QEMU_VERSION " " QEMU_PKGVERSION "\n"
>             QEMU_COPYRIGHT "\n");
>  }

Reviewed-by: Thomas Huth <thuth@redhat.com>


