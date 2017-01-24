Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cVvtn-0007Pa-Bx
	for mharc-qemu-trivial@gnu.org; Tue, 24 Jan 2017 02:52:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44064)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cVvtl-0007ON-K1
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2017 02:52:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cVvtg-00007I-On
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2017 02:52:13 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:45840)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cVvtg-00006m-Hl
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2017 02:52:08 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 93F1B420AB;
	Tue, 24 Jan 2017 10:52:07 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 1B78A548;
	Tue, 24 Jan 2017 10:52:07 +0300 (MSK)
To: Chao Fan <fanc.fnst@cn.fujitsu.com>, qemu-trivial@nongnu.org,
	pbonzini@redhat.com
References: <20161229110026.14816-1-fanc.fnst@cn.fujitsu.com>
	<b677f9c0-aac8-e4c7-c983-821032c6a5b8@msgid.tls.msk.ru>
Cc: douly.fnst@cn.fujitsu.com, caoj.fnst@cn.fujitsu.com
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <466c366f-2314-8007-e188-75fc285eb7b7@msgid.tls.msk.ru>
Date: Tue, 24 Jan 2017 10:52:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <b677f9c0-aac8-e4c7-c983-821032c6a5b8@msgid.tls.msk.ru>
Content-Type: text/plain; charset=windows-1251
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] bitmap: a typo of the example in comment
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
X-List-Received-Date: Tue, 24 Jan 2017 07:52:14 -0000

12.01.2017 13:51, Michael Tokarev wrote:
> 29.12.2016 14:00, Chao Fan wrote:
>> *   DirtyMemoryBlocks *blocks =
>> *       atomic_rcu_read(&ram_list.dirty_memory[DIRTY_MEMORY_MIGRATION]);
>>
>> blocks is a pointer, so here should be "->" instead of "."
> 
> Applied to -trivial, thank you!

After rework of this code by pbonzini it's not needed anymore.

Thanks!

/mjt

