Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cg6Ps-00013S-W7
	for mharc-qemu-trivial@gnu.org; Tue, 21 Feb 2017 04:07:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55794)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1cg6Pr-000128-3J
	for qemu-trivial@nongnu.org; Tue, 21 Feb 2017 04:07:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1cg6Pq-0005eh-6X
	for qemu-trivial@nongnu.org; Tue, 21 Feb 2017 04:07:23 -0500
Received: from mx1.redhat.com ([209.132.183.28]:49070)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1cg6Pj-0005dP-Ul; Tue, 21 Feb 2017 04:07:16 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 06223624CA;
	Tue, 21 Feb 2017 09:07:16 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-55.ams2.redhat.com
	[10.36.116.55])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v1L97Eig005399
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 21 Feb 2017 04:07:15 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 166C31138647; Tue, 21 Feb 2017 10:07:13 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Vincenzo Maffione <v.maffione@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, pbonzini@redhat.com
References: <20170220164509.27868-1-v.maffione@gmail.com>
Date: Tue, 21 Feb 2017 10:07:13 +0100
In-Reply-To: <20170220164509.27868-1-v.maffione@gmail.com> (Vincenzo
	Maffione's message of "Mon, 20 Feb 2017 17:45:09 +0100")
Message-ID: <87efyrnc8u.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 21 Feb 2017 09:07:16 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-options.hx: add
 missing id=chr0 chardev argument in vhost-user example
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
X-List-Received-Date: Tue, 21 Feb 2017 09:07:24 -0000

Vincenzo Maffione <v.maffione@gmail.com> writes:

> In the vhost-user example, a chardev with id chr0 is referenced by the
> vhost-user net backend, but the id is not specified in the chardev option.
>
> Signed-off-by: Vincenzo Maffione <v.maffione@gmail.com>
> ---
>  qemu-options.hx | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 5633d3914f..ed22fc479a 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -2127,7 +2127,7 @@ Example:
>  @example
>  qemu -m 512 -object memory-backend-file,id=mem,size=512M,mem-path=/hugetlbfs,share=on \
>       -numa node,memdev=mem \
> -     -chardev socket,path=/path/to/socket \
> +     -chardev socket,id=chr0,path=/path/to/socket \
>       -netdev type=vhost-user,id=net0,chardev=chr0 \
>       -device virtio-net-pci,netdev=net0
>  @end example

Reviewed-by: Markus Armbruster <armbru@redhat.com>

Aside: a test that extracts its test cases out of qemu-options.hx and
verifies they at least don't make startup fail would be nice.  Bit-sized
task only if you have a really big jaw, I'm afraid.

