Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ezTel-0006vO-BL
	for mharc-qemu-trivial@gnu.org; Fri, 23 Mar 2018 16:51:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48493)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ezTei-0006qV-FH
	for qemu-trivial@nongnu.org; Fri, 23 Mar 2018 16:51:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ezTeh-0003hw-M6
	for qemu-trivial@nongnu.org; Fri, 23 Mar 2018 16:51:20 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:36244 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1ezTeT-0003RN-Eg; Fri, 23 Mar 2018 16:51:05 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BCF66EAEB8;
	Fri, 23 Mar 2018 20:51:04 +0000 (UTC)
Received: from [10.10.121.135] (ovpn-121-135.rdu2.redhat.com [10.10.121.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AB81610B2B4B;
	Fri, 23 Mar 2018 20:50:55 +0000 (UTC)
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
References: <20180322161226.29796-1-lvivier@redhat.com>
	<20180322161226.29796-3-lvivier@redhat.com>
Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	=?UTF-8?Q?Daniel_P._Berrang=c3=a9?= <berrange@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>, 
	Richard Henderson <rth@twiddle.net>, qemu-arm@nongnu.org,
	Jason Wang <jasowang@redhat.com>, Max Reitz <mreitz@redhat.com>,
	Fam Zheng <famz@redhat.com>, qemu-trivial@nongnu.org,
	Alexander Graf <agraf@suse.de>, qemu-ppc@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Alberto Garcia <berto@igalia.com>, 
	qemu-block@nongnu.org, Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Yongbok Kim <yongbok.kim@mips.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost
	<ehabkost@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Markus Armbruster <armbru@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <51925b27-09cc-1c3e-674c-d80b423f92c8@redhat.com>
Date: Fri, 23 Mar 2018 15:50:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180322161226.29796-3-lvivier@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Fri, 23 Mar 2018 20:51:04 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Fri, 23 Mar 2018 20:51:04 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eblake@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [PATCH 2/4] error: Remove NULL checks on
 error_propagate() calls
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
X-List-Received-Date: Fri, 23 Mar 2018 20:51:21 -0000

On 03/22/2018 11:12 AM, Laurent Vivier wrote:
> Re-run Coccinelle patch
> scripts/coccinelle/error_propagate_null.cocci
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>   io/channel-websock.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 

Misses an offender in numa.c, why?

https://lists.gnu.org/archive/html/qemu-devel/2018-03/msg06382.html

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

