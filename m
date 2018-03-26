Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f0Q1T-0008Gh-Ac
	for mharc-qemu-trivial@gnu.org; Mon, 26 Mar 2018 07:10:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45672)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1f0Q1R-0008Bn-0J
	for qemu-trivial@nongnu.org; Mon, 26 Mar 2018 07:10:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1f0Q1P-0001WF-T3
	for qemu-trivial@nongnu.org; Mon, 26 Mar 2018 07:10:40 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:57734 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1f0Q1C-0001PK-OP; Mon, 26 Mar 2018 07:10:26 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 60AC2EBFFC;
	Mon, 26 Mar 2018 11:10:26 +0000 (UTC)
Received: from [10.36.117.130] (ovpn-117-130.ams2.redhat.com [10.36.117.130])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 96A0BD7DE0;
	Mon, 26 Mar 2018 11:10:21 +0000 (UTC)
To: Eric Blake <eblake@redhat.com>, Michal Privoznik <mprivozn@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, famz@redhat.com, qemu-block@nongnu.org,
	qemu-stable <qemu-stable@nongnu.org>
References: <6f10cd53d361a395aa0e85a9311ec4e9a8fc11e5.1521868451.git.mprivozn@redhat.com>
	<73a91502-7cda-c3c3-b439-78d7bae0f2e2@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <631c6561-01f3-aca1-c886-369d723208ef@redhat.com>
Date: Mon, 26 Mar 2018 13:10:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <73a91502-7cda-c3c3-b439-78d7bae0f2e2@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Mon, 26 Mar 2018 11:10:26 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Mon, 26 Mar 2018 11:10:26 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'pbonzini@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-2.12] qemu-pr-helper:
 Actually allow users to specify pidfile
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
X-List-Received-Date: Mon, 26 Mar 2018 11:10:42 -0000

On 24/03/2018 12:46, Eric Blake wrote:
> On 03/24/2018 12:14 AM, Michal Privoznik wrote:
>> Due to wrong specification of arguments to getopt_long() any
>> attempt to set pidfile resulted in:
>>
>> 1) the default to be leaked
>> 2) the @pidfile variable to be set to NULL (because optarg is
>> NULL without this patch).
> 
> Broken since the introduction in commit b855f8d, in 2.11 (documentation
> has always mentioned the argument, code has never supported it).

Queued, thanks.

Paolo

>>
>> Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
> 
> CC: qemu-stable@nongnu.org
> Reviewed-by: Eric Blake <eblake@redhat.com>
> 


