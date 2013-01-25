Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Tyo14-0001ed-Qz
	for mharc-qemu-trivial@gnu.org; Fri, 25 Jan 2013 13:28:42 -0500
Received: from eggs.gnu.org ([208.118.235.92]:60265)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1Tyo12-0001eV-0N
	for qemu-trivial@nongnu.org; Fri, 25 Jan 2013 13:28:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1Tyo10-0001k8-S4
	for qemu-trivial@nongnu.org; Fri, 25 Jan 2013 13:28:39 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38832)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>)
	id 1Tyo10-0001k0-KI; Fri, 25 Jan 2013 13:28:38 -0500
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r0PISaN2004407
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 25 Jan 2013 13:28:37 -0500
Received: from dhcp-5-188.str.redhat.com (vpn1-6-44.ams2.redhat.com
	[10.36.6.44])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r0PISXn3025176
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 25 Jan 2013 13:28:35 -0500
Message-ID: <5102CED1.8080306@redhat.com>
Date: Fri, 25 Jan 2013 19:28:33 +0100
From: Kevin Wolf <kwolf@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: Eric Blake <eblake@redhat.com>
References: <1359050440-52511-1-git-send-email-vishvananda@gmail.com>
	<51024DE2.907@redhat.com>
	<DAF889AE-060E-4C05-BC98-FC4AF47CAAAF@gmail.com>
	<5102CB36.30204@redhat.com>
In-Reply-To: <5102CB36.30204@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Vishvananda Ishaya <vishvananda@gmail.com>,
	qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] block: Create proper size
 file for disk mirror
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
X-List-Received-Date: Fri, 25 Jan 2013 18:28:41 -0000

Am 25.01.2013 19:13, schrieb Eric Blake:
> On 01/25/2013 11:10 AM, Vishvananda Ishaya wrote:
>>
>> On Jan 25, 2013, at 1:18 AM, Kevin Wolf <kwolf@redhat.com> wrote:
>>
>>> Am 24.01.2013 19:00, schrieb Vishvananda Ishaya:
>>>> The qmp monitor command to mirror a disk was passing -1 for size
>>>> along with the disk's backing file. This size of the resulting disk
>>>> is the size of the backing file, which is incorrect if the disk
>>>> has been resized. Therefore we should always pass in the size of
>>>> the current disk.
>>>>
>>>> Signed-off-by: Vishvananda Ishaya <vishvananda@gmail.com>
>>>
>>> Thanks, applied to the block branch.
>>>
>>> Can you send a qemu-iotests test case that tests this condition?
>>> (Probably best as an extension to case 041)
>>
>> I have a test for this. Would you like it as a separate patch or
>> should i respin the original?
> 
> Since the original has already been applied to the block branch, you are
> best off sending a separate patch for the test addition.

Yes, please.

Kevin

