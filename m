Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c3ei0-0000Ks-Sl
	for mharc-qemu-trivial@gnu.org; Mon, 07 Nov 2016 02:51:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51855)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1c3ehz-0000JV-6n
	for qemu-trivial@nongnu.org; Mon, 07 Nov 2016 02:51:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1c3ehu-0007zt-Lj
	for qemu-trivial@nongnu.org; Mon, 07 Nov 2016 02:51:11 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52978)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1c3ehh-0007sk-UC; Mon, 07 Nov 2016 02:50:54 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 36F5A8553F;
	Mon,  7 Nov 2016 07:50:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-47.ams2.redhat.com
	[10.36.116.47])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uA77ooIX015492
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 7 Nov 2016 02:50:51 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id A5FCD11386CE; Mon,  7 Nov 2016 08:50:49 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Changlong Xie <xiecl.fnst@cn.fujitsu.com>
Cc: qemu devel <qemu-devel@nongnu.org>, qemu block <qemu-block@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>, Eric Blake <eblake@redhat.com>, 
	qemu trival <qemu-trivial@nongnu.org>,
	zhanghailiang <zhang.zhanghailiang@huawei.com>
References: <1478490505-9315-1-git-send-email-xiecl.fnst@cn.fujitsu.com>
Date: Mon, 07 Nov 2016 08:50:49 +0100
In-Reply-To: <1478490505-9315-1-git-send-email-xiecl.fnst@cn.fujitsu.com>
	(Changlong Xie's message of "Mon, 7 Nov 2016 11:48:25 +0800")
Message-ID: <87fun320fa.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Mon, 07 Nov 2016 07:50:52 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] docs/block-replication.txt:
 Introduce nbd qmp commands
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
X-List-Received-Date: Mon, 07 Nov 2016 07:51:12 -0000

Changlong Xie <xiecl.fnst@cn.fujitsu.com> writes:

> Signed-off-by: Changlong Xie <xiecl.fnst@cn.fujitsu.com>
> ---
>  docs/block-replication.txt | 22 +++++++++++++++++-----
>  1 file changed, 17 insertions(+), 5 deletions(-)
>
> diff --git a/docs/block-replication.txt b/docs/block-replication.txt
> index 6bde673..6b9c77b 100644
> --- a/docs/block-replication.txt
> +++ b/docs/block-replication.txt
> @@ -152,9 +152,22 @@ Primary:
>           children.0.driver=raw
>  
>    Run qmp command in primary qemu:
> -    { 'execute': 'human-monitor-command',
> +    { 'execute': 'blockdev-add',
>        'arguments': {
> -          'command-line': 'drive_add -n buddy driver=replication,mode=primary,file.driver=nbd,file.host=xxxx,file.port=xxxx,file.export=colo1,node-name=nbd_client1'
> +          'driver': 'replication',
> +          'node-name': 'nbd_client1',
> +          'mode': 'primary',
> +          'file': {
> +              'driver': 'nbd',
> +              'export': 'colo1',
> +              'server': {
> +                  'type': 'inet',
> +                  'data': {
> +                      'host': 'xxxx',
> +                      'port': 'xxxx'
> +                  }
> +              }
> +          }
>        }
>      }
>      { 'execute': 'x-blockdev-change',
> @@ -223,12 +236,11 @@ Primary:
>          'child': 'children.1'
>      }
>    }
> -  { 'execute': 'human-monitor-command',
> +  { 'execute': 'x-blockdev-del',
>      'arguments': {
> -        'command-line': 'drive_del xxxx'
> +        'node-name': 'nbd_client1'
>      }
>    }
> -  Note: there is no qmp command to remove the blockdev now
>  
>  Secondary:
>    The primary host is down, so we should do the following thing:

This is premature: both blockdev-add and x-blockdev-del still aren't
ready for production.  Getting close, though.

