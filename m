Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fId3O-00007q-IL
	for mharc-qemu-trivial@gnu.org; Tue, 15 May 2018 12:43:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34080)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1fId3M-00005P-If
	for qemu-trivial@nongnu.org; Tue, 15 May 2018 12:43:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1fId3L-0000Hr-QG
	for qemu-trivial@nongnu.org; Tue, 15 May 2018 12:43:56 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:41280 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1fId3G-0000G1-Ky; Tue, 15 May 2018 12:43:50 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 26D3640261CB;
	Tue, 15 May 2018 16:43:50 +0000 (UTC)
Received: from [10.10.124.57] (ovpn-124-57.rdu2.redhat.com [10.10.124.57])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BB63C111CBAC;
	Tue, 15 May 2018 16:43:49 +0000 (UTC)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	Jason Wang <jasowang@redhat.com>
References: <1526401580-20535-1-git-send-email-thuth@redhat.com>
Cc: qemu-trivial@nongnu.org
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <9e5b3375-7949-e409-9047-5d9e0f386198@redhat.com>
Date: Tue, 15 May 2018 11:43:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <1526401580-20535-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Tue, 15 May 2018 16:43:50 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Tue, 15 May 2018 16:43:50 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eblake@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [PATCH] qapi/net.json: Fix the version number of
 the "vlan" removal
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
X-List-Received-Date: Tue, 15 May 2018 16:43:57 -0000

On 05/15/2018 11:26 AM, Thomas Huth wrote:
> "vlan" will be dropped in 2.13, not in 2.12. And while we're at it,
> use the better wording "dropped in" instead of "removed with" (also
> for the "dump" removal).
> 
> Reported-by: Stefan Hajnoczi <stefanha@redhat.com>
> Reported-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   qapi/net.json | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

