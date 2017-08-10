Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dfkdj-0005Vl-VI
	for mharc-qemu-trivial@gnu.org; Thu, 10 Aug 2017 06:24:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38693)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1dfkdi-0005UU-2z
	for qemu-trivial@nongnu.org; Thu, 10 Aug 2017 06:24:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1dfkdh-0006ds-1I
	for qemu-trivial@nongnu.org; Thu, 10 Aug 2017 06:24:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35702)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kwolf@redhat.com>)
	id 1dfkdb-0006c6-Hf; Thu, 10 Aug 2017 06:24:23 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4E72DC014164;
	Thu, 10 Aug 2017 10:24:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 4E72DC014164
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=kwolf@redhat.com
Received: from localhost.localdomain (ovpn-117-100.ams2.redhat.com
	[10.36.117.100])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C12E287F8C;
	Thu, 10 Aug 2017 10:24:15 +0000 (UTC)
Date: Thu, 10 Aug 2017 12:24:14 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Hu Chaojian <chaojianhu@hotmail.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"ppandit@redhat.com" <ppandit@redhat.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>,
	"stefanha@redhat.com" <stefanha@redhat.com>
Message-ID: <20170810102414.GB3650@localhost.localdomain>
References: <DM5PR17MB1451D437FA7145AEBE4688CFDB880@DM5PR17MB1451.namprd17.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM5PR17MB1451D437FA7145AEBE4688CFDB880@DM5PR17MB1451.namprd17.prod.outlook.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Thu, 10 Aug 2017 10:24:22 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] block/qcow2-snapshot: Fix a null pointer
 dereference in qcow2_free_snapshots
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
X-List-Received-Date: Thu, 10 Aug 2017 10:24:31 -0000

Am 10.08.2017 um 09:52 hat Hu Chaojian geschrieben:
> From: chaojianhu <chaojianhu@hotmail.com>
> 
> In function qcow2_do_open, if "go fail;" before calling qcow2_read_snapshots, then snapshots 
> will always be NULL. When dealing with "fail:", qcow2_free_snapshots will be called, and 
> s->snapshots will be dereferenced without checked.

Did you try to reproduce an actual crash?

Becasue I don't think there will be one. In this case, s->nb_snapshots
is 0, so the loop doesn't even run.

Kevin

> Reported-by: chaojianhu <chaojianhu@hotmail.com>
> Signed-off-by: chaojianhu <chaojianhu@hotmail.com>
> 
> ---
>  block/qcow2-snapshot.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/block/qcow2-snapshot.c b/block/qcow2-snapshot.c
> index 44243e0..4a8128c 100644
> --- a/block/qcow2-snapshot.c
> +++ b/block/qcow2-snapshot.c
> @@ -35,6 +35,10 @@ void qcow2_free_snapshots(BlockDriverState *bs)
>      BDRVQcow2State *s = bs->opaque;
>      int i;
>  
> +    if (NULL == s->snapshots) {
> +        return;
> +    }
> +
>      for(i = 0; i < s->nb_snapshots; i++) {
>          g_free(s->snapshots[i].name);
>          g_free(s->snapshots[i].id_str);
> -- 
> 1.9.1
> 

