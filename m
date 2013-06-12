Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UmhPB-00018L-Vg
	for mharc-qemu-trivial@gnu.org; Wed, 12 Jun 2013 05:31:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54182)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UmhCD-0004xm-Dg
	for qemu-trivial@nongnu.org; Wed, 12 Jun 2013 05:18:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UmhCB-00060T-Lo
	for qemu-trivial@nongnu.org; Wed, 12 Jun 2013 05:18:25 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:55553)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UmhC5-0005tc-Id; Wed, 12 Jun 2013 05:18:17 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 5997241366;
	Wed, 12 Jun 2013 13:18:16 +0400 (MSK)
Message-ID: <51B83CD7.5030001@msgid.tls.msk.ru>
Date: Wed, 12 Jun 2013 13:18:15 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/17.0 Icedove/17.0
MIME-Version: 1.0
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <1370249911-19708-1-git-send-email-stefanha@redhat.com>
	<1370249911-19708-3-git-send-email-stefanha@redhat.com>
	<20130612072221.GA946@stefanha-thinkpad.muc.redhat.com>
In-Reply-To: <20130612072221.GA946@stefanha-thinkpad.muc.redhat.com>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, qemu-stable@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Cam Macdonell <cam@cs.ualberta.ca>,
	Eric Blake <eblake@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH v2 2/2] ivshmem: add missing error exit(2)
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
X-List-Received-Date: Wed, 12 Jun 2013 09:18:27 -0000

12.06.2013 11:22, Stefan Hajnoczi wrote:
>> diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c
>> index a19a6d6..5658f73 100644
>> --- a/hw/misc/ivshmem.c
>> +++ b/hw/misc/ivshmem.c
>> @@ -735,6 +735,7 @@ static int pci_ivshmem_init(PCIDevice *dev)
>>  
>>          if (s->shmobj == NULL) {
>>              fprintf(stderr, "Must specify 'chardev' or 'shm' to ivshmem\n");
>> +            exit(1);
>>          }
>>  
>>          IVSHMEM_DPRINTF("using shm_open (shm object = %s)\n", s->shmobj);
> 
> Ping?

Ow.  I missed it because part 1/2 were applied to scsi branch by
Paolo and I marked whole thread as "done".

Applied this 2/2 now to the trivial patches tree.

Thank you!

/mjt


