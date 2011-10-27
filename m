Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RJLgG-0003qG-CX
	for mharc-qemu-trivial@gnu.org; Thu, 27 Oct 2011 04:51:20 -0400
Received: from eggs.gnu.org ([140.186.70.92]:33628)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1RJLgD-0003pt-TT
	for qemu-trivial@nongnu.org; Thu, 27 Oct 2011 04:51:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1RJLgC-0006PH-Py
	for qemu-trivial@nongnu.org; Thu, 27 Oct 2011 04:51:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53636)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>)
	id 1RJLgC-0006PC-GO; Thu, 27 Oct 2011 04:51:16 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p9R8pEuk029816
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Thu, 27 Oct 2011 04:51:14 -0400
Received: from dhcp-5-188.str.redhat.com (dhcp-5-175.str.redhat.com
	[10.32.5.175])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p9R8pBiS005636
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256 verify=NO);
	Thu, 27 Oct 2011 04:51:13 -0400
Message-ID: <4EA91C3B.2060908@redhat.com>
Date: Thu, 27 Oct 2011 10:54:19 +0200
From: Kevin Wolf <kwolf@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Zhi Yong Wu <wuzhy@linux.vnet.ibm.com>
References: <1319698737-17270-1-git-send-email-wuzhy@linux.vnet.ibm.com>
In-Reply-To: <1319698737-17270-1-git-send-email-wuzhy@linux.vnet.ibm.com>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, stefanha@linux.vnet.ibm.com
Subject: Re: [Qemu-trivial] [PATCH] qcow2: fix some errors and typo in
	qcow2.txt
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
X-List-Received-Date: Thu, 27 Oct 2011 08:51:19 -0000

Am 27.10.2011 08:58, schrieb Zhi Yong Wu:
> Signed-off-by: Zhi Yong Wu <wuzhy@linux.vnet.ibm.com>
> ---
>  docs/specs/qcow2.txt |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)

Thanks, applied to the block branch.

Kevin

