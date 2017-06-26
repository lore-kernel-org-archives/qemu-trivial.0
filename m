Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dPR7d-0007ME-5R
	for mharc-qemu-trivial@gnu.org; Mon, 26 Jun 2017 06:19:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38351)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dPR7Z-0007KG-3J
	for qemu-trivial@nongnu.org; Mon, 26 Jun 2017 06:19:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dPR7Y-0004w4-4r
	for qemu-trivial@nongnu.org; Mon, 26 Jun 2017 06:19:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37960)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1dPR7T-0004t0-Pi; Mon, 26 Jun 2017 06:19:47 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A3B6337EE9;
	Mon, 26 Jun 2017 10:19:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com A3B6337EE9
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=thuth@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com A3B6337EE9
Received: from [10.36.116.47] (ovpn-116-47.ams2.redhat.com [10.36.116.47])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F6EE174B3;
	Mon, 26 Jun 2017 10:19:41 +0000 (UTC)
To: "Daniel P. Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20170626101159.19676-1-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <c4381bd8-a417-0c3b-f3c2-1292ca9f6dfc@redhat.com>
Date: Mon, 26 Jun 2017 12:19:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <20170626101159.19676-1-berrange@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Mon, 26 Jun 2017 10:19:46 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] sockets: avoid formatting
 buffer that may not be NULL terminated
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
X-List-Received-Date: Mon, 26 Jun 2017 10:19:54 -0000

On 26.06.2017 12:11, Daniel P. Berrange wrote:
> The 'sun_path' field in the sockaddr_un struct is not required
> to be NULL termianted, so when reporting an error, we must use

s/NULL/NUL/

NULL is a pointer, NUL is the '\0' character.

> the separate 'path' variable which is guaranteed terminated.
> 
> Fixes a bug spotted by coverity that was introduced in
> 
>   commit ad9579aaa16d5b385922d49edac2c96c79bcfb62
>   Author: Daniel P. Berrange <berrange@redhat.com>
>   Date:   Thu May 25 16:53:00 2017 +0100
> 
>     sockets: improve error reporting if UNIX socket path is too long
> 
> Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
> ---
>  util/qemu-sockets.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
> index 51bf279..37d386f 100644
> --- a/util/qemu-sockets.c
> +++ b/util/qemu-sockets.c
> @@ -930,7 +930,7 @@ static int unix_listen_saddr(UnixSocketAddress *saddr,
>      strncpy(un.sun_path, path, sizeof(un.sun_path));
>  
>      if (bind(sock, (struct sockaddr*) &un, sizeof(un)) < 0) {
> -        error_setg_errno(errp, errno, "Failed to bind socket to %s", un.sun_path);
> +        error_setg_errno(errp, errno, "Failed to bind socket to %s", path);
>          goto err;
>      }
>      if (listen(sock, 1) < 0) {

Apart from the nit in the comment, the patch looks right to me:

Reviewed-by: Thomas Huth <thuth@redhat.com>

