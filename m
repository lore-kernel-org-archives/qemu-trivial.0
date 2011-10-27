Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RJLfh-0003A8-9I
	for mharc-qemu-trivial@gnu.org; Thu, 27 Oct 2011 04:50:45 -0400
Received: from eggs.gnu.org ([140.186.70.92]:53509)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1RJLfe-000334-0U
	for qemu-trivial@nongnu.org; Thu, 27 Oct 2011 04:50:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1RJLfd-0006HH-5H
	for qemu-trivial@nongnu.org; Thu, 27 Oct 2011 04:50:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:29905)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>)
	id 1RJLfa-0006Gi-P7; Thu, 27 Oct 2011 04:50:38 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p9R8oZ3H029632
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Thu, 27 Oct 2011 04:50:36 -0400
Received: from dhcp-5-188.str.redhat.com (dhcp-5-175.str.redhat.com
	[10.32.5.175])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p9R8oXMZ005481
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256 verify=NO);
	Thu, 27 Oct 2011 04:50:35 -0400
Message-ID: <4EA91C16.6050908@redhat.com>
Date: Thu, 27 Oct 2011 10:53:42 +0200
From: Kevin Wolf <kwolf@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Eric Sunshine <sunshine@sunshineco.com>
References: <1319658678-18355-1-git-send-email-sunshine@sunshineco.com>
In-Reply-To: <1319658678-18355-1-git-send-email-sunshine@sunshineco.com>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Stefan Weil <weil@mail.berlios.de>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] Teach block/vdi about "discarded" (no
 longer allocated) blocks
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
X-List-Received-Date: Thu, 27 Oct 2011 08:50:43 -0000

Am 26.10.2011 21:51, schrieb Eric Sunshine:
> An entry in the VDI block map will hold an offset to the actual block if
> the block is allocated, or one of two specially-interpreted values if
> not allocated. Using VirtualBox terminology, value VDI_IMAGE_BLOCK_FREE
> (0xffffffff) represents a never-allocated block (semantically arbitrary
> content).  VDI_IMAGE_BLOCK_ZERO (0xfffffffe) represents a "discarded"
> block (semantically zero-filled).  block/vdi knows only about
> VDI_IMAGE_BLOCK_FREE.  Teach it about VDI_IMAGE_BLOCK_ZERO.
> 
> Signed-off-by: Eric Sunshine <sunshine@sunshineco.com>

Thanks, applied to the block branch.

Kevin

