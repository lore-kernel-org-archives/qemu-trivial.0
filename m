Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UQGy1-00019U-I0
	for mharc-qemu-trivial@gnu.org; Thu, 11 Apr 2013 08:51:05 -0400
Received: from eggs.gnu.org ([208.118.235.92]:58878)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1UQGxx-000149-DD
	for qemu-trivial@nongnu.org; Thu, 11 Apr 2013 08:51:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1UQGxs-0008BN-Tm
	for qemu-trivial@nongnu.org; Thu, 11 Apr 2013 08:51:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:8267)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>)
	id 1UQGxp-00089t-7d; Thu, 11 Apr 2013 08:50:53 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r3BCops5003961
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Thu, 11 Apr 2013 08:50:51 -0400
Received: from localhost (ovpn-113-145.phx2.redhat.com [10.3.113.145])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r3BCooRf021585; Thu, 11 Apr 2013 08:50:50 -0400
Date: Thu, 11 Apr 2013 08:50:50 -0400
From: Luiz Capitulino <lcapitulino@redhat.com>
To: Eric Blake <eblake@redhat.com>
Message-ID: <20130411085050.3c3847bf@redhat.com>
In-Reply-To: <1365621164-17079-1-git-send-email-eblake@redhat.com>
References: <1365621164-17079-1-git-send-email-eblake@redhat.com>
Organization: Red Hat
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: kwolf@redhat.com, qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] qapi: use valid JSON in schema
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
X-List-Received-Date: Thu, 11 Apr 2013 12:51:04 -0000

On Wed, 10 Apr 2013 13:12:44 -0600
Eric Blake <eblake@redhat.com> wrote:

> * qapi-schema.json: JSON doesn't allow trailing commas.
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>

Applied to the qmp branch, thanks.

> ---
> 
> a multi-line regex search for ',[ \n]*[]}]' didn't turn up any
> other violations
> 
>  qapi-schema.json | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/qapi-schema.json b/qapi-schema.json
> index db542f6..044517d 100644
> --- a/qapi-schema.json
> +++ b/qapi-schema.json
> @@ -1600,7 +1600,7 @@
>  ##
>  { 'union': 'BlockdevAction',
>    'data': {
> -       'blockdev-snapshot-sync': 'BlockdevSnapshot',
> +       'blockdev-snapshot-sync': 'BlockdevSnapshot'
>     } }
> 
>  ##


