Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Qmn66-0001X8-5Z
	for mharc-qemu-trivial@gnu.org; Fri, 29 Jul 2011 09:27:26 -0400
Received: from eggs.gnu.org ([140.186.70.92]:59671)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1Qmn64-0001X1-3h
	for qemu-trivial@nongnu.org; Fri, 29 Jul 2011 09:27:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1Qmn63-00006X-86
	for qemu-trivial@nongnu.org; Fri, 29 Jul 2011 09:27:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:63786)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>)
	id 1Qmn63-00006P-0u; Fri, 29 Jul 2011 09:27:23 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p6TDRLGF029235
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 29 Jul 2011 09:27:21 -0400
Received: from dhcp-5-188.str.redhat.com (vpn1-7-64.ams2.redhat.com
	[10.36.7.64])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p6TDRHWc015837
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256 verify=NO);
	Fri, 29 Jul 2011 09:27:19 -0400
Message-ID: <4E32B5E7.9090304@redhat.com>
Date: Fri, 29 Jul 2011 15:30:15 +0200
From: Kevin Wolf <kwolf@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110707 Thunderbird/5.0
MIME-Version: 1.0
To: Frediano Ziglio <freddy77@gmail.com>
References: <1311790322-10889-1-git-send-email-freddy77@gmail.com>
In-Reply-To: <1311790322-10889-1-git-send-email-freddy77@gmail.com>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 0/3] small trivial patches
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
X-List-Received-Date: Fri, 29 Jul 2011 13:27:25 -0000

Am 27.07.2011 20:11, schrieb Frediano Ziglio:
> Minor fixes and improves
> 
> Frediano Ziglio (3):
>   block: removed unused function
>   block: typo fix
>   aio: always check paio_init result
> 
>  block.c           |   13 -------------
>  block.h           |    2 --
>  block/raw-posix.c |   13 ++++++-------
>  3 files changed, 6 insertions(+), 22 deletions(-)

Thanks, applied all to the block branch (and modified the commit log to
say "raw-posix: ..." for patches 2 and 3)

Kevin

