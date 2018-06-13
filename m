Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fT4fA-0006Wl-42
	for mharc-qemu-trivial@gnu.org; Wed, 13 Jun 2018 08:14:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39971)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1fT4f5-0006VN-LV
	for qemu-trivial@nongnu.org; Wed, 13 Jun 2018 08:14:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1fT4f1-0005W9-KU
	for qemu-trivial@nongnu.org; Wed, 13 Jun 2018 08:14:03 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:46374 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1fT4ep-0005BM-FU; Wed, 13 Jun 2018 08:13:47 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CD743857A3;
	Wed, 13 Jun 2018 12:13:46 +0000 (UTC)
Received: from [10.10.120.103] (ovpn-120-103.rdu2.redhat.com [10.10.120.103])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 676722026987;
	Wed, 13 Jun 2018 12:13:44 +0000 (UTC)
To: Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>
References: <20180611011501.10235-1-f4bug@amsat.org>
	<20180611011501.10235-12-f4bug@amsat.org>
	<15d222dd-d2e9-4855-62c6-f89f2ee59c52@linaro.org>
	<76aa5170-1d18-8799-6ff1-a7c0dba0b489@redhat.com>
	<8537ca07-2645-6c2c-5945-a91da035b474@linaro.org>
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Eduardo Habkost <ehabkost@redhat.com>,
	"open list:Block layer core" <qemu-block@nongnu.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	"open list:X86" <xen-devel@lists.xenproject.org>,
	Richard Henderson <rth@twiddle.net>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <a856ef80-fcab-0003-2bdd-89a1849fe857@redhat.com>
Date: Wed, 13 Jun 2018 07:13:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <8537ca07-2645-6c2c-5945-a91da035b474@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Wed, 13 Jun 2018 12:13:46 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Wed, 13 Jun 2018 12:13:46 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eblake@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v4 11/40] hw/xen: Use the
 IEC binary prefix definitions
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
X-List-Received-Date: Wed, 13 Jun 2018 12:14:04 -0000

On 06/12/2018 04:10 PM, Richard Henderson wrote:
>> So there's tradeoffs either way, and you at least need to document in your
>> commit messages what auditing you have done that any type changes introduced by
>> your changes are safe.
> 
> I'm more concerned about unnecessary or unintended signed vs unsigned changes
> than I am about width.  But if we're going to force a 64-bit type, use
> (int64_t)1 not 1LL.  That way the type will match the existing PRId64 printf
> markup.

Or spell it UINT64_C(1) if you don't want a cast.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

