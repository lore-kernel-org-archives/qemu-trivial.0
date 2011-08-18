Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QuBX8-0007h1-Q6
	for mharc-qemu-trivial@gnu.org; Thu, 18 Aug 2011 18:57:54 -0400
Received: from eggs.gnu.org ([140.186.70.92]:55487)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1QuBX5-0007YV-SV
	for qemu-trivial@nongnu.org; Thu, 18 Aug 2011 18:57:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1QuBX5-0004w3-1z
	for qemu-trivial@nongnu.org; Thu, 18 Aug 2011 18:57:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:12238)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>)
	id 1QuBX1-0004uE-U7; Thu, 18 Aug 2011 18:57:48 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p7IMvclN012848
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Thu, 18 Aug 2011 18:57:38 -0400
Received: from dhcp-5-188.str.redhat.com (vpn1-6-103.ams2.redhat.com
	[10.36.6.103])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p7IMvYED002647
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256 verify=NO);
	Thu, 18 Aug 2011 18:57:36 -0400
Message-ID: <4E4D9991.60707@redhat.com>
Date: Fri, 19 Aug 2011 01:00:33 +0200
From: Kevin Wolf <kwolf@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110707 Thunderbird/5.0
MIME-Version: 1.0
To: Nicholas Thomas <nick@bytemark.co.uk>
References: <1313398834.17401.135.camel@desk4.office.bytemark.co.uk>
In-Reply-To: <1313398834.17401.135.camel@desk4.office.bytemark.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] block/curl: Handle failed
	reads gracefully.
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
X-List-Received-Date: Thu, 18 Aug 2011 22:57:52 -0000

Am 15.08.2011 11:00, schrieb Nicholas Thomas:
> Current behaviour if a read fails is for the acb to not get finished.
> This causes an infinite loop in bdrv_read_em (block.c). The read failure
> never gets reported to the  guest and if the error condition clears, the
> process never recovers.
> 
> With this patch, when curl reports a failure we finish the acb as a
> failure. This results in the guest receiving an I/O error (rather than
> the read hanging indefinitely) and if the error condition subsequently
> clears, retries work as expected.
> 
> The simplest test is to put an ISO on a web server you have control over
> and open it with qemu-io. Then move the ISO out of the way and attempt
> to read some data - you should see behaviour matching the above.
> 
> Signed-off-by: Nick Thomas <nick@bytemark.co.uk>

Thanks, applied to the block branch.

Kevin

