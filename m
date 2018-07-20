Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fgcjW-0004V6-AA
	for mharc-qemu-trivial@gnu.org; Fri, 20 Jul 2018 17:14:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38072)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1fgcjQ-0004Pe-57
	for qemu-trivial@nongnu.org; Fri, 20 Jul 2018 17:14:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1fgcjO-0002Zd-Em
	for qemu-trivial@nongnu.org; Fri, 20 Jul 2018 17:14:32 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:46796 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1fgcjE-00025U-VC; Fri, 20 Jul 2018 17:14:21 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5B5C58D69D;
	Fri, 20 Jul 2018 21:14:20 +0000 (UTC)
Received: from [10.10.120.165] (ovpn-120-165.rdu2.redhat.com [10.10.120.165])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B39851C55D;
	Fri, 20 Jul 2018 21:14:17 +0000 (UTC)
To: John Snow <jsnow@redhat.com>, Stefan Weil <sw@weilnetz.de>,
	QEMU Developer <qemu-devel@nongnu.org>
References: <20180712195120.27394-1-sw@weilnetz.de>
	<07226662-e636-2ff7-5cb4-7a64c6020c04@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>,
	qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <e932a87f-83b7-dcc8-d2da-33cc68fa47de@redhat.com>
Date: Fri, 20 Jul 2018 16:14:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <07226662-e636-2ff7-5cb4-7a64c6020c04@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Fri, 20 Jul 2018 21:14:20 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Fri, 20 Jul 2018 21:14:20 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eblake@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-devel] [Qemu-block] [PATCH] block: Fix
 typos in comments (found by codespell)
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
X-List-Received-Date: Fri, 20 Jul 2018 21:14:37 -0000

On 07/12/2018 03:32 PM, John Snow wrote:

>> +++ b/block/gluster.c
>> @@ -1326,7 +1326,7 @@ static int qemu_gluster_has_zero_init(BlockDriverState *bs)
>>    * If @start is in a trailing hole or beyond EOF, return -ENXIO.
>>    * If we can't find out, return a negative errno other than -ENXIO.
>>    *
>> - * (Shamefully copied from file-posix.c, only miniscule adaptions.)
>> + * (Shamefully copied from file-posix.c, only minuscule adaptions.)
> 
> Huh!
> 
> Merriam-Webster lists miniscule as a "disputed" spelling of minuscule.
> Dictionary.com simply lists it as an acceptable alternative.
> 
> Anyway, this is a change from something dubiously correct to something
> unambiguously correct, so it's fine.

While at it, I would s/adaptions/adaptations/

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

