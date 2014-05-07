Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wi2yi-0000OP-RT
	for mharc-qemu-trivial@gnu.org; Wed, 07 May 2014 10:37:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52565)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1Wi2yX-00006w-VG
	for qemu-trivial@nongnu.org; Wed, 07 May 2014 10:37:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1Wi2yR-000644-Q8
	for qemu-trivial@nongnu.org; Wed, 07 May 2014 10:37:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:21910)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>)
	id 1Wi2yD-0005vV-AL; Wed, 07 May 2014 10:37:17 -0400
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s47EbGOH032049
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 7 May 2014 10:37:16 -0400
Received: from localhost (ovpn-113-48.phx2.redhat.com [10.3.113.48])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s47EbFt0010411; Wed, 7 May 2014 10:37:15 -0400
Date: Wed, 7 May 2014 10:37:15 -0400
From: Luiz Capitulino <lcapitulino@redhat.com>
To: Eric Blake <eblake@redhat.com>
Message-ID: <20140507103715.3708b209@redhat.com>
In-Reply-To: <1399390743-21802-1-git-send-email-eblake@redhat.com>
References: <1399390743-21802-1-git-send-email-eblake@redhat.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] qmp: use valid JSON in transaction
	example
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
X-List-Received-Date: Wed, 07 May 2014 14:37:44 -0000

On Tue,  6 May 2014 09:39:03 -0600
Eric Blake <eblake@redhat.com> wrote:

> Our example should use the correct quotes to match what someone
> could actually pass over the wire.
> 
> * qmp-commands.hx: Use correct JSON quotes.
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>

Applied to the qmp branch, thanks.

> ---
>  qmp-commands.hx | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/qmp-commands.hx b/qmp-commands.hx
> index ed3ab92..e20fcf0 100644
> --- a/qmp-commands.hx
> +++ b/qmp-commands.hx
> @@ -1165,19 +1165,19 @@ Example:
> 
>  -> { "execute": "transaction",
>       "arguments": { "actions": [
> -         { 'type': 'blockdev-snapshot-sync', 'data' : { "device": "ide-hd0",
> +         { "type": "blockdev-snapshot-sync", "data" : { "device": "ide-hd0",
>                                           "snapshot-file": "/some/place/my-image",
>                                           "format": "qcow2" } },
> -         { 'type': 'blockdev-snapshot-sync', 'data' : { "node-name": "myfile",
> +         { "type": "blockdev-snapshot-sync", "data" : { "node-name": "myfile",
>                                           "snapshot-file": "/some/place/my-image2",
>                                           "snapshot-node-name": "node3432",
>                                           "mode": "existing",
>                                           "format": "qcow2" } },
> -         { 'type': 'blockdev-snapshot-sync', 'data' : { "device": "ide-hd1",
> +         { "type": "blockdev-snapshot-sync", "data" : { "device": "ide-hd1",
>                                           "snapshot-file": "/some/place/my-image2",
>                                           "mode": "existing",
>                                           "format": "qcow2" } },
> -         { 'type': 'blockdev-snapshot-internal-sync', 'data' : {
> +         { "type": "blockdev-snapshot-internal-sync", "data" : {
>                                           "device": "ide-hd2",
>                                           "name": "snapshot0" } } ] } }
>  <- { "return": {} }


