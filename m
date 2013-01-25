Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TyfXX-0007X4-7f
	for mharc-qemu-trivial@gnu.org; Fri, 25 Jan 2013 04:25:39 -0500
Received: from eggs.gnu.org ([208.118.235.92]:56819)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1TyfQm-0000z6-Oi
	for qemu-trivial@nongnu.org; Fri, 25 Jan 2013 04:18:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1TyfQj-0008Gv-Lb
	for qemu-trivial@nongnu.org; Fri, 25 Jan 2013 04:18:40 -0500
Received: from mx1.redhat.com ([209.132.183.28]:20741)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>)
	id 1TyfQc-0008Fn-Ty; Fri, 25 Jan 2013 04:18:31 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r0P9ITRd023706
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 25 Jan 2013 04:18:29 -0500
Received: from dhcp-5-188.str.redhat.com (vpn1-6-44.ams2.redhat.com
	[10.36.6.44])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r0P9IQDw001828
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256 verify=NO);
	Fri, 25 Jan 2013 04:18:28 -0500
Message-ID: <51024DE2.907@redhat.com>
Date: Fri, 25 Jan 2013 10:18:26 +0100
From: Kevin Wolf <kwolf@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: Vishvananda Ishaya <vishvananda@gmail.com>
References: <1359050440-52511-1-git-send-email-vishvananda@gmail.com>
In-Reply-To: <1359050440-52511-1-git-send-email-vishvananda@gmail.com>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] block: Create proper size file for disk
	mirror
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
X-List-Received-Date: Fri, 25 Jan 2013 09:25:37 -0000

Am 24.01.2013 19:00, schrieb Vishvananda Ishaya:
> The qmp monitor command to mirror a disk was passing -1 for size
> along with the disk's backing file. This size of the resulting disk
> is the size of the backing file, which is incorrect if the disk
> has been resized. Therefore we should always pass in the size of
> the current disk.
> 
> Signed-off-by: Vishvananda Ishaya <vishvananda@gmail.com>

Thanks, applied to the block branch.

Can you send a qemu-iotests test case that tests this condition?
(Probably best as an extension to case 041)

Kevin

