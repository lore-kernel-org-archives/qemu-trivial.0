Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XlubE-0005GD-2A
	for mharc-qemu-trivial@gnu.org; Wed, 05 Nov 2014 02:01:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51481)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xlub9-0005B2-Cg
	for qemu-trivial@nongnu.org; Wed, 05 Nov 2014 02:01:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xlub4-00059E-Vp
	for qemu-trivial@nongnu.org; Wed, 05 Nov 2014 02:01:43 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:33786)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Xluaw-00058L-4b; Wed, 05 Nov 2014 02:01:30 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 294AE40A5C;
	Wed,  5 Nov 2014 10:01:29 +0300 (MSK)
Message-ID: <5459CB49.1070803@msgid.tls.msk.ru>
Date: Wed, 05 Nov 2014 10:01:29 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.2.0
MIME-Version: 1.0
To: zhanghailiang <zhang.zhanghailiang@huawei.com>, 
 lcapitulino@redhat.com
References: <1415101770-13568-1-git-send-email-zhang.zhanghailiang@huawei.com>
In-Reply-To: <1415101770-13568-1-git-send-email-zhang.zhanghailiang@huawei.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, armbru@redhat.com, imammedo@redhat.com,
	qemu-devel@nongnu.org, peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [PATCH v7] numa: make 'info numa' take into
 account hotplugged memory
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Nov 2014 07:01:47 -0000

04.11.2014 14:49, zhanghailiang wrote:
> When do memory hotplug, if there is numa node, we should add
> the memory size to the corresponding node memory size.
> 
> It affects the result of hmp command "info numa".
> 
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
> ---
> Hi Luiz,
> 
> This patch has been long time in the mail list.
> The change does not affect anything but the 'info numa' command.
> Actully, i have another patch that fix balloon bug.(https://lists.gnu.org/archive/html/qemu-devel/2014-09/msg01568.html)
> It is related to memory hotplug too and based on this patch.
> 
> Since you don't have bandwidth for another pull request for v2.2.
> Maybe go -trivial is another choice if you agreed;)
> 
> I'm OK if you think it's not appropriate.

I applied this to -trivial.  I don't really understand what
does "have bandwidth for a pull request" mean, but..

Thanks,

/mjt

