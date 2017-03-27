Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1csTvI-0007MG-Di
	for mharc-qemu-trivial@gnu.org; Mon, 27 Mar 2017 08:39:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48290)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1csTvG-0007L9-Ab
	for qemu-trivial@nongnu.org; Mon, 27 Mar 2017 08:38:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1csTvF-00057i-GI
	for qemu-trivial@nongnu.org; Mon, 27 Mar 2017 08:38:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51138)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1csTv3-000518-M0; Mon, 27 Mar 2017 08:38:45 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 74B844E334;
	Mon, 27 Mar 2017 12:38:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 74B844E334
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=pbonzini@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 74B844E334
Received: from [10.36.117.208] (ovpn-117-208.ams2.redhat.com [10.36.117.208])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id v2RCcfWq030530
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 27 Mar 2017 08:38:43 -0400
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20170327123223.1199-1-stefanha@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-block@nongnu.org
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <fda0f7d7-b86f-98d8-a22a-4c38fecb3f43@redhat.com>
Date: Mon, 27 Mar 2017 14:38:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <20170327123223.1199-1-stefanha@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Mon, 27 Mar 2017 12:38:44 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] nbd: drop unused
 NBDClientSession.is_unix field
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
X-List-Received-Date: Mon, 27 Mar 2017 12:38:59 -0000



On 27/03/2017 14:32, Stefan Hajnoczi wrote:
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  block/nbd-client.h | 2 --
>  block/nbd.c        | 2 --
>  2 files changed, 4 deletions(-)
> 
> diff --git a/block/nbd-client.h b/block/nbd-client.h
> index 8cdfc92..891ba44 100644
> --- a/block/nbd-client.h
> +++ b/block/nbd-client.h
> @@ -30,8 +30,6 @@ typedef struct NBDClientSession {
>  
>      Coroutine *recv_coroutine[MAX_NBD_REQUESTS];
>      NBDReply reply;
> -
> -    bool is_unix;
>  } NBDClientSession;
>  
>  NBDClientSession *nbd_get_client_session(BlockDriverState *bs);
> diff --git a/block/nbd.c b/block/nbd.c
> index f478f80..1b832c2 100644
> --- a/block/nbd.c
> +++ b/block/nbd.c
> @@ -285,8 +285,6 @@ static SocketAddress *nbd_config(BDRVNBDState *s, QDict *options, Error **errp)
>          goto done;
>      }
>  
> -    s->client.is_unix = saddr->type == SOCKET_ADDRESS_KIND_UNIX;
> -
>  done:
>      QDECREF(addr);
>      qobject_decref(crumpled_addr);
> 

Queued for 2.9, thanks.

Paolo

