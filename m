Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1duwUD-00042S-Le
	for mharc-qemu-trivial@gnu.org; Thu, 21 Sep 2017 04:05:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38228)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1duwU8-0003ya-AN
	for qemu-trivial@nongnu.org; Thu, 21 Sep 2017 04:05:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1duwU7-0008LL-DI
	for qemu-trivial@nongnu.org; Thu, 21 Sep 2017 04:05:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38976)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1duwU1-0008HI-EH; Thu, 21 Sep 2017 04:05:17 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 78D7B61475;
	Thu, 21 Sep 2017 08:05:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 78D7B61475
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=imammedo@redhat.com
Received: from nial.brq.redhat.com (unknown [10.43.2.209])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 11C715D980;
	Thu, 21 Sep 2017 08:05:12 +0000 (UTC)
Date: Thu, 21 Sep 2017 10:05:11 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	qemu-trivial@nongnu.org
Message-ID: <20170921100511.2f082330@nial.brq.redhat.com>
In-Reply-To: <1505811746-29439-1-git-send-email-thuth@redhat.com>
References: <1505811746-29439-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Thu, 21 Sep 2017 08:05:16 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] trivial: Add missing "-m" parameter in
 docs/memory-hotplug.txt
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
X-List-Received-Date: Thu, 21 Sep 2017 08:05:28 -0000

On Tue, 19 Sep 2017 11:02:26 +0200
Thomas Huth <thuth@redhat.com> wrote:

> The example obviously lacks the "-m" parameter.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  docs/memory-hotplug.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/docs/memory-hotplug.txt b/docs/memory-hotplug.txt
> index 56bdd0a..d96397c 100644
> --- a/docs/memory-hotplug.txt
> +++ b/docs/memory-hotplug.txt
> @@ -24,7 +24,7 @@ Where,
>  
>  For example, the following command-line:
>  
> - qemu [...] 1G,slots=3,maxmem=4G
> + qemu [...] -m 1G,slots=3,maxmem=4G
>  
>  Creates a guest with 1GB of memory and three hotpluggable memory slots.
>  The hotpluggable memory slots are empty when the guest is booted, so all


