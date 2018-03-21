Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eyZvO-0001XP-Mk
	for mharc-qemu-trivial@gnu.org; Wed, 21 Mar 2018 05:20:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40227)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcel@redhat.com>) id 1eyZvM-0001WC-NB
	for qemu-trivial@nongnu.org; Wed, 21 Mar 2018 05:20:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcel@redhat.com>) id 1eyZvL-0000JA-Rt
	for qemu-trivial@nongnu.org; Wed, 21 Mar 2018 05:20:48 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:48652 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcel@redhat.com>)
	id 1eyZvH-0000D9-9K; Wed, 21 Mar 2018 05:20:43 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A25DA4173ECE;
	Wed, 21 Mar 2018 09:20:39 +0000 (UTC)
Received: from mapfelba-osx.local (unknown [10.35.206.53])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E0906215CDB7;
	Wed, 21 Mar 2018 09:20:35 +0000 (UTC)
To: Fam Zheng <famz@redhat.com>
Cc: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, Yuval Shaia <yuval.shaia@oracle.com>
References: <20180319215335.1119213-1-eblake@redhat.com>
	<56ec7ba5-a6e1-2268-3313-8babc640c024@redhat.com>
	<20180321020709.GA16095@lemon.usersys.redhat.com>
From: Marcel Apfelbaum <marcel@redhat.com>
Message-ID: <56ff5d55-ad21-01b9-aa62-f7786aa9289d@redhat.com>
Date: Wed, 21 Mar 2018 11:20:33 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180321020709.GA16095@lemon.usersys.redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Wed, 21 Mar 2018 09:20:39 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Wed, 21 Mar 2018 09:20:39 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'marcel@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [PATCH for-2.12] rdma: Fix 32-bit compilation
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
X-List-Received-Date: Wed, 21 Mar 2018 09:20:49 -0000

On 21/03/2018 4:07, Fam Zheng wrote:
> On Tue, 03/20 12:30, Marcel Apfelbaum wrote:
>> Hi Eric,
>>
>> On 19/03/2018 23:53, Eric Blake wrote:
>>> Use the correct printf formats, so that a 32-bit compile doesn't
>>> spit out lots of warnings about %lx being incompatible with uint64_t.
>>> Broken since initial commit ef6d4ccd.
>>>
>>> Signed-off-by: Eric Blake <eblake@redhat.com>
>>> ---
>>>
>>> I don't know if 'make vm-build-ubuntu.i368' would catch this (it failed
>>> for me for other reasons); I found it via a 32-bit rawhide VM.
>>>
>>
>> I couldn't run 'make vm-build-ubuntu.i368' either. (Stuck on "Booting from Hard Disk...")
> 
> I tried this now and it works for me. Could you delete "$HOME/.cache/qemu-vm"
> and do it again from a git tree, then pastbin the full log?
> 

Hi Fam,
I did that but it didn't help.

Here is the log: https://da.gd/8wJHj
I try to run the same command line, and it still stuck in the boot process.
Problem is, the command line looks fine, may be another issue with my PC...
I'll continue to debug it.

Thanks for the help,
Marcel

> Fam
> 


