Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d3w8R-00065P-IT
	for mharc-qemu-trivial@gnu.org; Thu, 27 Apr 2017 22:59:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47132)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1d3w8N-00064J-Lc
	for qemu-trivial@nongnu.org; Thu, 27 Apr 2017 22:59:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1d3w8M-0008FZ-Ua
	for qemu-trivial@nongnu.org; Thu, 27 Apr 2017 22:59:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52042)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1d3w8G-0008Bg-SR; Thu, 27 Apr 2017 22:59:44 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 81B476DD8C;
	Fri, 28 Apr 2017 02:59:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 81B476DD8C
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=thuth@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 81B476DD8C
Received: from [10.36.116.17] (ovpn-116-17.ams2.redhat.com [10.36.116.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6006217B59;
	Fri, 28 Apr 2017 02:59:41 +0000 (UTC)
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <20170428022329.30726-1-eblake@redhat.com>
Cc: qemu-trivial@nongnu.org, dgilbert@redhat.com
From: Thomas Huth <thuth@redhat.com>
Message-ID: <3f6725f5-3ec7-5a2f-0476-47bd2ae840a6@redhat.com>
Date: Fri, 28 Apr 2017 04:58:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170428022329.30726-1-eblake@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Fri, 28 Apr 2017 02:59:42 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] tests: Ignore another built executable
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
X-List-Received-Date: Fri, 28 Apr 2017 02:59:52 -0000

On 28.04.2017 04:23, Eric Blake wrote:
> Commit 78f86a2b7 added a new test, but forgot to exclude the built
> binary from version control.
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  tests/.gitignore | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/.gitignore b/tests/.gitignore
> index 5ab00a9..40c2e3e 100644
> --- a/tests/.gitignore
> +++ b/tests/.gitignore
> @@ -40,6 +40,7 @@ test-crypto-tlssession-server/
>  test-crypto-xts
>  test-cutils
>  test-hbitmap
> +test-hmp
>  test-int128
>  test-iov
>  test-io-channel-buffer

Ah, ok, I'm only doing out-of-tree builds, that's why I did not notice
this...

Reviewed-by: Thomas Huth <thuth@redhat.com>


