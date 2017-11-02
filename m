Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eAMXg-0001pv-S1
	for mharc-qemu-trivial@gnu.org; Thu, 02 Nov 2017 16:56:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41870)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1eAMXe-0001o3-E9
	for qemu-trivial@nongnu.org; Thu, 02 Nov 2017 16:56:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1eAMXd-0006Oc-JX
	for qemu-trivial@nongnu.org; Thu, 02 Nov 2017 16:56:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58638)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jsnow@redhat.com>)
	id 1eAMXO-0005wY-Hc; Thu, 02 Nov 2017 16:56:30 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7E5F385547;
	Thu,  2 Nov 2017 20:56:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 7E5F385547
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=jsnow@redhat.com
Received: from [10.18.17.35] (dhcp-17-35.bos.redhat.com [10.18.17.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D89FE60618;
	Thu,  2 Nov 2017 20:56:28 +0000 (UTC)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	qemu-trivial@nongnu.org, qemu-arm@nongnu.org
References: <1508784509-29377-1-git-send-email-thuth@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <2aa7bf9c-cceb-fdf7-4eac-5d318c854518@redhat.com>
Date: Thu, 2 Nov 2017 16:56:28 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1508784509-29377-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 02 Nov 2017 20:56:29 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/ide/ahci: Move allwinner
 code into a separate file
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
X-List-Received-Date: Thu, 02 Nov 2017 20:56:47 -0000



On 10/23/2017 02:48 PM, Thomas Huth wrote:
> The allwinner code is only needed for the allwinner board (for which
> we also have a separate CONFIG_ALLWINNER_A10 config switch), so it
> does not make sense that we compile this for all the other boards
> that need AHCI, too. Let's move it to a separate file that is only
> compiled when CONFIG_ALLWINNER_A10 is set.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Belated, as it's already merged to master, but:

Thanks, applied to my IDE tree:

https://github.com/jnsnow/qemu/commits/ide
https://github.com/jnsnow/qemu.git

--js

