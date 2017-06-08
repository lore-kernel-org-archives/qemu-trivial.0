Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dIx8M-00085x-5t
	for mharc-qemu-trivial@gnu.org; Thu, 08 Jun 2017 09:05:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37660)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1dIx8J-00084D-A7
	for qemu-trivial@nongnu.org; Thu, 08 Jun 2017 09:05:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1dIx8I-0006EH-7J
	for qemu-trivial@nongnu.org; Thu, 08 Jun 2017 09:05:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37404)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1dIx8C-0006B7-EV; Thu, 08 Jun 2017 09:05:44 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5F8D0796FC;
	Thu,  8 Jun 2017 13:05:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 5F8D0796FC
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=pbonzini@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 5F8D0796FC
Received: from [10.36.117.229] (ovpn-117-229.ams2.redhat.com [10.36.117.229])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id v58D5dRi015959
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 8 Jun 2017 09:05:40 -0400
To: Mao Zhongyi <maozy.fnst@cn.fujitsu.com>, qemu-devel@nongnu.org
Cc: berrange@redhat.com, kraxel@redhat.com, armbru@redhat.com,
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
References: <20170608031124.8031-1-maozy.fnst@cn.fujitsu.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <faabf6b3-f7e3-fa2c-8adb-b1914dbe8f8a@redhat.com>
Date: Thu, 8 Jun 2017 15:05:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <20170608031124.8031-1-maozy.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Thu, 08 Jun 2017 13:05:42 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] util/qemu-sockets: Drop unused helper
 socket_address_to_string()
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
X-List-Received-Date: Thu, 08 Jun 2017 13:05:52 -0000

Cc: qemu-trivial@nongnu.org

On 08/06/2017 05:11, Mao Zhongyi wrote:
> Signed-off-by: Mao Zhongyi <maozy.fnst@cn.fujitsu.com>
> ---
>  include/qemu/sockets.h | 15 ---------------
>  util/qemu-sockets.c    | 34 ----------------------------------
>  2 files changed, 49 deletions(-)
> 
> diff --git a/include/qemu/sockets.h b/include/qemu/sockets.h
> index 7abffc4..8eb0172 100644
> --- a/include/qemu/sockets.h
> +++ b/include/qemu/sockets.h
> @@ -106,21 +106,6 @@ SocketAddress *socket_local_address(int fd, Error **errp);
>  SocketAddress *socket_remote_address(int fd, Error **errp);
>  
>  /**
> - * socket_address_to_string:
> - * @addr: the socket address struct
> - * @errp: pointer to uninitialized error object
> - *
> - * Get the string representation of the socket
> - * address. A pointer to the char array containing
> - * string format will be returned, the caller is
> - * required to release the returned value when no
> - * longer required with g_free.
> - *
> - * Returns: the socket address in string format, or NULL on error
> - */
> -char *socket_address_to_string(struct SocketAddress *addr, Error **errp);
> -
> -/**
>   * socket_address_flatten:
>   * @addr: the socket address to flatten
>   *
> diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
> index b39ae74..08b1a26 100644
> --- a/util/qemu-sockets.c
> +++ b/util/qemu-sockets.c
> @@ -1301,40 +1301,6 @@ SocketAddress *socket_remote_address(int fd, Error **errp)
>      return socket_sockaddr_to_address(&ss, sslen, errp);
>  }
>  
> -char *socket_address_to_string(struct SocketAddress *addr, Error **errp)
> -{
> -    char *buf;
> -    InetSocketAddress *inet;
> -
> -    switch (addr->type) {
> -    case SOCKET_ADDRESS_TYPE_INET:
> -        inet = &addr->u.inet;
> -        if (strchr(inet->host, ':') == NULL) {
> -            buf = g_strdup_printf("%s:%s", inet->host, inet->port);
> -        } else {
> -            buf = g_strdup_printf("[%s]:%s", inet->host, inet->port);
> -        }
> -        break;
> -
> -    case SOCKET_ADDRESS_TYPE_UNIX:
> -        buf = g_strdup(addr->u.q_unix.path);
> -        break;
> -
> -    case SOCKET_ADDRESS_TYPE_FD:
> -        buf = g_strdup(addr->u.fd.str);
> -        break;
> -
> -    case SOCKET_ADDRESS_TYPE_VSOCK:
> -        buf = g_strdup_printf("%s:%s",
> -                              addr->u.vsock.cid,
> -                              addr->u.vsock.port);
> -        break;
> -
> -    default:
> -        abort();
> -    }
> -    return buf;
> -}
>  
>  SocketAddress *socket_address_flatten(SocketAddressLegacy *addr_legacy)
>  {
> 

