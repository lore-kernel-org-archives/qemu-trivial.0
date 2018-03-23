Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ezQ2d-0000UH-6Z
	for mharc-qemu-trivial@gnu.org; Fri, 23 Mar 2018 12:59:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54059)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ezQ2b-0000T3-GB
	for qemu-trivial@nongnu.org; Fri, 23 Mar 2018 12:59:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ezQ2a-0007fs-OB
	for qemu-trivial@nongnu.org; Fri, 23 Mar 2018 12:59:45 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:58184 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1ezQ2L-0007Vb-OM; Fri, 23 Mar 2018 12:59:29 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 68F074040073;
	Fri, 23 Mar 2018 16:59:24 +0000 (UTC)
Received: from [10.10.121.135] (ovpn-121-135.rdu2.redhat.com [10.10.121.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2D85910B2B26;
	Fri, 23 Mar 2018 16:59:09 +0000 (UTC)
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
References: <20180323143202.28879-1-lvivier@redhat.com>
	<20180323143202.28879-3-lvivier@redhat.com>
Cc: Alexander Graf <agraf@suse.de>, "Michael S. Tsirkin" <mst@redhat.com>,
	qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Fam Zheng <famz@redhat.com>, qemu-trivial@nongnu.org,
	Alberto Garcia <berto@igalia.com>, qemu-ppc@nongnu.org,
	Kevin Wolf <kwolf@redhat.com>, =?UTF-8?Q?Daniel_P._Berrang=c3=a9?=
	<berrange@redhat.com>, Max Reitz <mreitz@redhat.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, qemu-arm@nongnu.org,
	Yongbok Kim <yongbok.kim@mips.com>, Aurelien Jarno <aurelien@aurel32.net>, 
	Markus Armbruster <armbru@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>, Eduardo Habkost
	<ehabkost@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <rth@twiddle.net>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <0c54fe9f-fccc-58fc-6d43-22b1d53183f3@redhat.com>
Date: Fri, 23 Mar 2018 11:59:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180323143202.28879-3-lvivier@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Fri, 23 Mar 2018 16:59:24 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Fri, 23 Mar 2018 16:59:24 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eblake@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [PATCH v2 2/5] error: Strip trailing '\n' from
 error string arguments (again again)
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
X-List-Received-Date: Fri, 23 Mar 2018 16:59:46 -0000

On 03/23/2018 09:31 AM, Laurent Vivier wrote:
> Re-run Coccinelle script scripts/coccinelle/err-bad-newline.cocci,
> and found new error_report() occurences with '\n'.

s/occurences/occurrences/

> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>   target/i386/hvf/hvf.c | 24 ++++++++++++------------
>   1 file changed, 12 insertions(+), 12 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

