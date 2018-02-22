Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eoyxD-0002vq-9y
	for mharc-qemu-trivial@gnu.org; Thu, 22 Feb 2018 17:03:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39957)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1eoyxB-0002v3-CQ
	for qemu-trivial@nongnu.org; Thu, 22 Feb 2018 17:03:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1eoyxA-0007HZ-J8
	for qemu-trivial@nongnu.org; Thu, 22 Feb 2018 17:03:01 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:38018 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1eoyx5-0007BS-DC; Thu, 22 Feb 2018 17:02:55 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 933668425E;
	Thu, 22 Feb 2018 22:02:45 +0000 (UTC)
Received: from [10.10.122.122] (ovpn-122-122.rdu2.redhat.com [10.10.122.122])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E668E213AEE2;
	Thu, 22 Feb 2018 22:02:36 +0000 (UTC)
To: qemu-devel@nongnu.org
References: <20180222215838.18223-1-eblake@redhat.com>
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <f96c8383-6cea-6b27-3b9c-e84568bbef88@redhat.com>
Date: Thu, 22 Feb 2018 16:02:36 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180222215838.18223-1-eblake@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Thu, 22 Feb 2018 22:02:45 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Thu, 22 Feb 2018 22:02:45 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eblake@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] checkpatch: Exempt long URLs
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
X-List-Received-Date: Thu, 22 Feb 2018 22:03:02 -0000

On 02/22/2018 03:58 PM, Eric Blake wrote:
> Sometimes, we want to refer to really long URLs, but checkpatch
> balks, and we have to manually bypass the check.  URL shorterners

s/shorterners/shorteners/

(Is it bad when I spell-check my own patches?)

> may be nice at reducing long links, but it's hard to guarantee the
> shortened link will live as long as the real target, and it is
> also nice to see the original target without having to load the
> shortened URL through a browser.  So exempt a line containing
> only a URL from the long-line syntax check.
> 
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

