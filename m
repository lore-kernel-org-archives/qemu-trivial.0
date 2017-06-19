Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dMsrK-0006qW-5y
	for mharc-qemu-trivial@gnu.org; Mon, 19 Jun 2017 05:20:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46409)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dMsrI-0006or-35
	for qemu-trivial@nongnu.org; Mon, 19 Jun 2017 05:20:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dMsrH-0006Zv-90
	for qemu-trivial@nongnu.org; Mon, 19 Jun 2017 05:20:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45714)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1dMsrB-0006VK-K7; Mon, 19 Jun 2017 05:20:25 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 67D928046F;
	Mon, 19 Jun 2017 09:20:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 67D928046F
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=thuth@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 67D928046F
Received: from [10.36.116.149] (ovpn-116-149.ams2.redhat.com [10.36.116.149])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2730C816B1;
	Mon, 19 Jun 2017 09:20:22 +0000 (UTC)
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>
References: <1495486409-5197-1-git-send-email-thuth@redhat.com>
	<20170616161954.GD4366@noname.fritz.box>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <62da550f-bbf6-736d-6ed8-9503e8aaf97c@redhat.com>
Date: Mon, 19 Jun 2017 11:20:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <20170616161954.GD4366@noname.fritz.box>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Mon, 19 Jun 2017 09:20:24 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-doc: Move the qemu-ga
 description into a separate chapter
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
X-List-Received-Date: Mon, 19 Jun 2017 09:20:33 -0000

On 16.06.2017 18:19, Kevin Wolf wrote:
> Am 22.05.2017 um 22:53 hat Thomas Huth geschrieben:
>> The qemu-ga description is currently a subsection of the Disk Images
>> chapter - which does not make much sense since the qemu-ga is not
>> directly related to disk images. So let's move this information
>> into a separate chapter instead.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
> 
> This patch messed up the start of the manpage (qemu.1).
> 
> It refers to "qemu-ga - QEMU Guest Agent" now and the synopsis section
> includes the description of a part of the targets as well as some
> literal texinfo code.

I just had a look at it, and the qemu-ga patch just triggered another
problem in qemu-doc.texi to become more obvious: There were some
sections opened with "@c man begin OPTIONS" but never closed again.
After closing them properly, the man page looks right again (and the
badly marked sections now also show up in the man page correctly). I
just sent a patch.
Maybe we should also add some logic to scripts/texi2pod.pl that emits a
warning when a "@c man" section is not closed properly? (Someone with
the right Perl-foo around here?)

 Thomas

