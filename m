Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bwsso-0004YY-0n
	for mharc-qemu-trivial@gnu.org; Wed, 19 Oct 2016 11:34:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34984)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bwpgc-0002yd-5I
	for qemu-trivial@nongnu.org; Wed, 19 Oct 2016 08:09:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bwpgb-0005v0-8b
	for qemu-trivial@nongnu.org; Wed, 19 Oct 2016 08:09:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42832)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1bwpgW-0005pa-5v; Wed, 19 Oct 2016 08:09:28 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D7BF97DCFD;
	Wed, 19 Oct 2016 12:09:25 +0000 (UTC)
Received: from [10.36.112.25] (ovpn-112-25.ams2.redhat.com [10.36.112.25])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9JC9MFj026387; Wed, 19 Oct 2016 08:09:23 -0400
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <1476739794-19536-1-git-send-email-eblake@redhat.com>
Cc: qemu-trivial@nongnu.org, dave@natulte.net,
	Markus Armbruster <armbru@redhat.com>, quintela@redhat.com
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <530e792a-9217-ab1b-defb-5fcc7f906b93@redhat.com>
Date: Wed, 19 Oct 2016 14:09:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <1476739794-19536-1-git-send-email-eblake@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Wed, 19 Oct 2016 12:09:26 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
X-Mailman-Approved-At: Wed, 19 Oct 2016 11:34:19 -0400
Subject: Re: [Qemu-trivial] [PATCH] trivial: Restore blank line in
 qapi-schema
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
X-List-Received-Date: Wed, 19 Oct 2016 12:09:35 -0000



On 17/10/2016 23:29, Eric Blake wrote:
> Commit de63ab6 accidentally undid part of commit a43edcf,
> because the two patches were written in parallel, and the
> blank line was not noticed as a casualty of merge conflicts.
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  qapi-schema.json | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/qapi-schema.json b/qapi-schema.json
> index ded1179..6da520c 100644
> --- a/qapi-schema.json
> +++ b/qapi-schema.json
> @@ -737,6 +737,7 @@
>              '*tls-hostname': 'str',
>              '*max-bandwidth': 'int',
>              '*downtime-limit': 'int'} }
> +
>  ##
>  # @query-migrate-parameters
>  #
> 

Reviewed-by: Laurent Vivier <lvivier@redhat.com>

