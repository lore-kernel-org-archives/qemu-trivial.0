Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1R6Mrk-0003RR-4Z
	for mharc-qemu-trivial@gnu.org; Wed, 21 Sep 2011 09:29:32 -0400
Received: from eggs.gnu.org ([140.186.70.92]:60505)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1R6Mrd-00033S-Lv
	for qemu-trivial@nongnu.org; Wed, 21 Sep 2011 09:29:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1R6Mrc-0004a5-N6
	for qemu-trivial@nongnu.org; Wed, 21 Sep 2011 09:29:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33846)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>)
	id 1R6MrW-0004Xm-6p; Wed, 21 Sep 2011 09:29:18 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p8LDT9nP004174
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 21 Sep 2011 09:29:10 -0400
Received: from dhcp-5-188.str.redhat.com (dhcp-5-175.str.redhat.com
	[10.32.5.175])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p8LDT8uA008145
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 21 Sep 2011 09:29:09 -0400
Message-ID: <4E79E758.9000509@redhat.com>
Date: Wed, 21 Sep 2011 15:32:08 +0200
From: Kevin Wolf <kwolf@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0.2) Gecko/20110906 Thunderbird/6.0.2
MIME-Version: 1.0
To: nick@bytemark.co.uk
References: <1316602550-13597-1-git-send-email-nick@bytemark.co.uk>
In-Reply-To: <1316602550-13597-1-git-send-email-nick@bytemark.co.uk>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] block/curl: Remedy a crashing bug
 completing AIOCBs from cache
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
X-List-Received-Date: Wed, 21 Sep 2011 13:29:30 -0000

Am 21.09.2011 12:55, schrieb nick@bytemark.co.uk:
> In QEMU master, attempting to read a cached block from a HTTP (or otherwise)
> mounted ISO causes an assert to be triggered, killing the entire QEMU process.
> It looks like this:
> 
> hw/ide/pci.c:314: bmdma_cmd_writeb: Assertion `bm->bus->dma->aiocb == 
> ((void *)0)' failed.
> 
> The following two patches add flush capability to the curl backend, and avoid
> triggering the assert by finishing the AIOCB in a QEMUBH callback, rather than
> directly in curl_aio_readv().

Thanks, applied to the block branch.

Kevin

