Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XpDCm-00075a-Vf
	for mharc-qemu-trivial@gnu.org; Fri, 14 Nov 2014 04:30:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35834)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1XpDCf-0006t2-E3
	for qemu-trivial@nongnu.org; Fri, 14 Nov 2014 04:30:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1XpDCa-0004xd-Jq
	for qemu-trivial@nongnu.org; Fri, 14 Nov 2014 04:30:05 -0500
Received: from mx1.redhat.com ([209.132.183.28]:36516)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1XpDCQ-0004kC-Ii; Fri, 14 Nov 2014 04:29:50 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sAE9TjfZ022014
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Fri, 14 Nov 2014 04:29:46 -0500
Received: from blackfin.pond.sub.org (ovpn-116-89.ams2.redhat.com
	[10.36.116.89])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sAE9Thig002889
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 14 Nov 2014 04:29:44 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 5DA7330403AF; Fri, 14 Nov 2014 10:29:42 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: zhanghailiang <zhang.zhanghailiang@huawei.com>
References: <1415931488-2484-1-git-send-email-zhang.zhanghailiang@huawei.com>
Date: Fri, 14 Nov 2014 10:29:42 +0100
In-Reply-To: <1415931488-2484-1-git-send-email-zhang.zhanghailiang@huawei.com>
	(zhanghailiang's message of "Fri, 14 Nov 2014 10:18:08 +0800")
Message-ID: <87oasa2kqh.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, mjt@tls.msk.ru, qemu-devel@nongnu.org,
	peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] libcacard: fix resource
	leak
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Nov 2014 09:30:10 -0000

zhanghailiang <zhang.zhanghailiang@huawei.com> writes:

> In function connect_to_qemu(), getaddrinfo() will allocate memory
> that is stored into server, it should be freed by using freeaddrinfo()
> before connect_to_qemu() return.
>
> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
> ---
> v2:
> - fix typo in title ;)
> ---
>  libcacard/vscclient.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/libcacard/vscclient.c b/libcacard/vscclient.c
> index 80111df..fa6041d 100644
> --- a/libcacard/vscclient.c
> +++ b/libcacard/vscclient.c
> @@ -597,7 +597,7 @@ connect_to_qemu(
>      const char *port
>  ) {
>      struct addrinfo hints;
> -    struct addrinfo *server;
> +    struct addrinfo *server = NULL;
>      int ret, sock;
>  
>      sock = socket(AF_INET, SOCK_STREAM, 0);
> @@ -629,9 +629,14 @@ connect_to_qemu(
>      if (verbose) {
>          printf("Connected (sizeof Header=%zd)!\n", sizeof(VSCMsgHeader));
>      }
> +
> +    freeaddrinfo(server);
>      return sock;
>  
>  cleanup_socket:
> +    if (server) {
> +        freeaddrinfo(server);
> +    }
>      closesocket(sock);
>      return -1;
>  }

Reviewed-by: Markus Armbruster <armbru@redhat.com>

Aside: this code uses the first result from getaddrinfo(), and fails if
it can't connect.  This is a common misuse of getaddrinfo().

Consider a remote host with both an IPv4 and an IPv6 address, but only
one of them actually connects.  If getaddrinfo() puts the connectable
one first, we succeed.  Else, we fail.

We should try the addresses in order until connect() succeeds, like
qemu-sockets.c does.

