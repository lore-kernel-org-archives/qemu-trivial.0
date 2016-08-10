Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bXJZu-00044o-DJ
	for mharc-qemu-trivial@gnu.org; Tue, 09 Aug 2016 22:49:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59652)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1bXJZs-0003wD-4l
	for qemu-trivial@nongnu.org; Tue, 09 Aug 2016 22:49:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1bXJZq-0004Ed-12
	for qemu-trivial@nongnu.org; Tue, 09 Aug 2016 22:49:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40038)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>)
	id 1bXJZi-0004A5-EK; Tue, 09 Aug 2016 22:48:58 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 33D62635F;
	Wed, 10 Aug 2016 02:48:57 +0000 (UTC)
Received: from localhost (dhcp-15-47.nay.redhat.com [10.66.15.47])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u7A2mtra005047; Tue, 9 Aug 2016 22:48:56 -0400
Date: Wed, 10 Aug 2016 10:41:55 +0800
From: Fam Zheng <famz@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Message-ID: <20160810024155.GI11351@al.usersys.redhat.com>
References: <1470027888-24381-1-git-send-email-famz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1470027888-24381-1-git-send-email-famz@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Wed, 10 Aug 2016 02:48:57 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] curl: Cast fd to int for
 DPRINTF
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
X-List-Received-Date: Wed, 10 Aug 2016 02:49:09 -0000

On Mon, 08/01 13:04, Fam Zheng wrote:
> Currently "make docker-test-mingw@fedora" has a warning like:
> 
>     /tmp/qemu-test/src/block/curl.c: In function 'curl_sock_cb':
>     /tmp/qemu-test/src/block/curl.c:172:6: warning: format '%d' expects
>     argument of type 'int', but argument 4 has type 'curl_socket_t {aka long
>     long unsigned int}'
>          DPRINTF("CURL (AIO): Sock action %d on fd %d\n", action, fd);
>           ^
>     cc1: all warnings being treated as errors
> 
> Cast to int to suppress it.
> 
> Signed-off-by: Fam Zheng <famz@redhat.com>
> ---
>  block/curl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/block/curl.c b/block/curl.c
> index da9f5e8..426fb4d 100644
> --- a/block/curl.c
> +++ b/block/curl.c
> @@ -169,7 +169,7 @@ static int curl_sock_cb(CURL *curl, curl_socket_t fd, int action,
>      state->sock_fd = fd;
>      s = state->s;
>  
> -    DPRINTF("CURL (AIO): Sock action %d on fd %d\n", action, fd);
> +    DPRINTF("CURL (AIO): Sock action %d on fd %d\n", action, (int)fd);
>      switch (action) {
>          case CURL_POLL_IN:
>              aio_set_fd_handler(s->aio_context, fd, false,
> -- 
> 2.7.4
> 
> 

Since this is blocking the mingw testing on patchew, I'm taking this in my
tree. Applied to my docker branch:

https://github.com/famz/qemu/tree/docker

Thanks,
Fam

