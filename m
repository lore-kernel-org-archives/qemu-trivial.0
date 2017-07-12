Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dVIDs-0005d5-K8
	for mharc-qemu-trivial@gnu.org; Wed, 12 Jul 2017 10:02:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42872)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dVIDn-0005Xz-0N
	for qemu-trivial@nongnu.org; Wed, 12 Jul 2017 10:02:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dVIDf-0004oZ-Go
	for qemu-trivial@nongnu.org; Wed, 12 Jul 2017 10:02:31 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:43401)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dVIDd-0004kA-DW; Wed, 12 Jul 2017 10:02:21 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 232E240F6A;
	Wed, 12 Jul 2017 17:02:18 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 13A35ACD;
	Wed, 12 Jul 2017 17:02:18 +0300 (MSK)
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <cover.1499866676.git.mjt@msgid.tls.msk.ru>
	<47cedaad-93e6-fc94-0bc2-278e2eea25e2@redhat.com>
Cc: qemu-trivial@nongnu.org
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <1901fce9-2e94-553d-f626-56fce97c7dba@msgid.tls.msk.ru>
Date: Wed, 12 Jul 2017 17:02:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <47cedaad-93e6-fc94-0bc2-278e2eea25e2@redhat.com>
Content-Type: text/plain; charset=windows-1251
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PULL 00/13] Trivial patches for 2017-07-12
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
X-List-Received-Date: Wed, 12 Jul 2017 14:02:35 -0000

12.07.2017 16:57, Eric Blake wrote:

>> trivial patches for 2017-07-12
>>
>> ----------------------------------------------------------------
>> Eric Blake (2):
>>       qobject: Catch another straggler for use of qdict_put_str()
>>       qobject: Update coccinelle script to catch Q{INC, DEC}REF
> 
> You picked up v1 of these patches, when Markus was already planning on
> merging v2.  It may be easier to respin a v2 of the pull request that
> drops these patches from -trivial.

I haven't seen a v2, and the discussion for v1 seemed conclusive enough
and the patches looked okay too. But ok, I dropped these and resent.

Thanks,

/mjt

