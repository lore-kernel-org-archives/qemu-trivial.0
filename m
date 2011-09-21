Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1R6KTP-0001YS-RQ
	for mharc-qemu-trivial@gnu.org; Wed, 21 Sep 2011 06:56:15 -0400
Received: from eggs.gnu.org ([140.186.70.92]:50840)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <nick@bytemark.co.uk>) id 1R6KTH-000165-AF
	for qemu-trivial@nongnu.org; Wed, 21 Sep 2011 06:56:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <nick@bytemark.co.uk>) id 1R6KTG-0003yc-Ch
	for qemu-trivial@nongnu.org; Wed, 21 Sep 2011 06:56:07 -0400
Received: from egg.sh.bytemark.co.uk ([212.110.161.171]:49704)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <nick@bytemark.co.uk>)
	id 1R6KTE-0003wz-LR; Wed, 21 Sep 2011 06:56:04 -0400
Received: from bytemail.bytemark.co.uk ([212.110.161.227])
	by egg.sh.bytemark.co.uk with esmtp (Exim 4.69)
	(envelope-from <nick@bytemark.co.uk>)
	id 1R6KT8-0003mB-Ot; Wed, 21 Sep 2011 11:55:58 +0100
Received: from desk4.office.bytemark.co.uk ([89.16.168.152]
	helo=localhost.localdomain)
	by bytemail.bytemark.co.uk with esmtp (Exim 4.72)
	(envelope-from <nick@bytemark.co.uk>)
	id 1R6KT8-0004WD-Ix; Wed, 21 Sep 2011 11:55:58 +0100
From: nick@bytemark.co.uk
To: nick@bytemark.co.uk,
	qemu-devel@nongnu.org
Date: Wed, 21 Sep 2011 11:55:48 +0100
Message-Id: <1316602550-13597-1-git-send-email-nick@bytemark.co.uk>
X-Mailer: git-send-email 1.7.0.4
Organization: Bytemark Computer Consulting Ltd.  The Raylor Centre,
	James Street, York YO10 3DW,
	UK. Company registered in England and Wales no. 4484629. VAT
	registration no. GB 804 6718 29.
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 212.110.161.171
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] block/curl: Remedy a crashing bug completing AIOCBs
	from cache
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
X-List-Received-Date: Wed, 21 Sep 2011 10:56:10 -0000

In QEMU master, attempting to read a cached block from a HTTP (or otherwise)
mounted ISO causes an assert to be triggered, killing the entire QEMU process.
It looks like this:

hw/ide/pci.c:314: bmdma_cmd_writeb: Assertion `bm->bus->dma->aiocb == 
((void *)0)' failed.

The following two patches add flush capability to the curl backend, and avoid
triggering the assert by finishing the AIOCB in a QEMUBH callback, rather than
directly in curl_aio_readv().


