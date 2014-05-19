Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WmLMd-0003uz-Co
	for mharc-qemu-trivial@gnu.org; Mon, 19 May 2014 07:04:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59289)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1WmLMV-0003lq-N8
	for qemu-trivial@nongnu.org; Mon, 19 May 2014 07:04:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1WmLMP-0005Kp-KM
	for qemu-trivial@nongnu.org; Mon, 19 May 2014 07:04:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:22410)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1WmLMC-0005Hr-V3; Mon, 19 May 2014 07:03:49 -0400
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s4JB3iui017308
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 19 May 2014 07:03:45 -0400
Received: from yakj.usersys.redhat.com (ovpn-112-37.ams2.redhat.com
	[10.36.112.37])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s4JB3drG010871; Mon, 19 May 2014 07:03:41 -0400
Message-ID: <5379E50B.5070607@redhat.com>
Date: Mon, 19 May 2014 13:03:39 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>, Hani Benhabiles <kroosec@gmail.com>,
	qemu-devel@nongnu.org
References: <1400410205-26152-1-git-send-email-kroosec@gmail.com>
	<5379BA0A.7080200@msgid.tls.msk.ru>
In-Reply-To: <5379BA0A.7080200@msgid.tls.msk.ru>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, kwolf@redhat.com, stefanha@redhat.com
Subject: Re: [Qemu-trivial] [PATCH 1/2] nbd: Don't export a block device
 with no medium.
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
X-List-Received-Date: Mon, 19 May 2014 11:04:13 -0000

Il 19/05/2014 10:00, Michael Tokarev ha scritto:
> 18.05.2014 14:50, Hani Benhabiles wrote:
>> The device is exported with erroneous values and can't be read.
>>
>> Before the patch:
>> $ sudo nbd-client localhost -p 10809 /dev/nbd0 -name floppy0
>> Negotiation: ..size = 17592186044415MB
>> bs=1024, sz=18446744073709547520 bytes
>>
>> $ sudo mount /dev/nbd0 /mnt/tmp/
>> mount: block device /dev/nbd0 is write-protected, mounting read-only
>> mount: /dev/nbd0: can't read superblock
>>
>> After the patch:
>> (qemu) nbd_server_add ide0-hd0
>> (qemu) nbd_server_add floppy0
>> Device 'floppy0' has no medium
>
> I'm not sure this is the right direction.  Maybe we should actually
> allow exporting devices with no medium to be able to insert medium
> later without re-starting the server?  Especially with -t (persistent).
> I dunno.  At least this is the decision which should not be left to
> a -trivial tree.

The protocol has no support for marking a device as no-medium, or for 
reporting a medium change, so there's nothing sane that we can do. 
(Upon a medium change, for example, the embedded NBD server will shut 
down all connections).

In particular, for qemu-nbd there is no support for named exports, so 
even with "-t" it makes sense to just exit with an error condition and 
ask the user to reinvoke qemu-nbd later.

I'll revive the nbd-next branch for these two patches.  Thanks Michael 
for carrying the other two.

Paolo

