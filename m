Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ROUJF-0005NW-N4
	for mharc-qemu-trivial@gnu.org; Thu, 10 Nov 2011 08:04:49 -0500
Received: from eggs.gnu.org ([140.186.70.92]:57341)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1ROUJC-0005Bk-Fi
	for qemu-trivial@nongnu.org; Thu, 10 Nov 2011 08:04:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1ROUJB-0002db-N3
	for qemu-trivial@nongnu.org; Thu, 10 Nov 2011 08:04:46 -0500
Received: from mx1.redhat.com ([209.132.183.28]:18780)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>)
	id 1ROUJ1-0002Zo-S9; Thu, 10 Nov 2011 08:04:36 -0500
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id pAAD4WJm017992
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Thu, 10 Nov 2011 08:04:33 -0500
Received: from dhcp-5-188.str.redhat.com (vpn1-5-234.ams2.redhat.com
	[10.36.5.234])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id pAAD4TFm022167
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 10 Nov 2011 08:04:31 -0500
Message-ID: <4EBBCC9B.7040302@redhat.com>
Date: Thu, 10 Nov 2011 14:07:39 +0100
From: Kevin Wolf <kwolf@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>
References: <1320913402-8762-1-git-send-email-wdongxu@linux.vnet.ibm.com>
In-Reply-To: <1320913402-8762-1-git-send-email-wdongxu@linux.vnet.ibm.com>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] block:add coroutine_fn
 marker to coroutine functions
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
X-List-Received-Date: Thu, 10 Nov 2011 13:04:47 -0000

Am 10.11.2011 09:23, schrieb Dong Xu Wang:
> From: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>
> 
> Looks better when reviewing these source files.
> 
> Signed-off-by: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>

Thanks, applied to the block branch (for 1.1)

Kevin

