Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TOmh6-0005Zz-Tb
	for mharc-qemu-trivial@gnu.org; Thu, 18 Oct 2012 05:47:12 -0400
Received: from eggs.gnu.org ([208.118.235.92]:36330)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1TOmgz-0005Gc-ON
	for qemu-trivial@nongnu.org; Thu, 18 Oct 2012 05:47:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1TOmgy-0008Hj-VC
	for qemu-trivial@nongnu.org; Thu, 18 Oct 2012 05:47:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40812)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>)
	id 1TOmgq-0008G1-S8; Thu, 18 Oct 2012 05:46:57 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q9I9ktke013152
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Thu, 18 Oct 2012 05:46:55 -0400
Received: from dhcp-5-188.str.redhat.com (vpn1-7-183.ams2.redhat.com
	[10.36.7.183])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q9I9krc4030539
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256 verify=NO);
	Thu, 18 Oct 2012 05:46:54 -0400
Message-ID: <507FD00C.7000008@redhat.com>
Date: Thu, 18 Oct 2012 11:46:52 +0200
From: Kevin Wolf <kwolf@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: Luiz Capitulino <lcapitulino@redhat.com>
References: <20121017164525.0e9b2941@doriath.home>
In-Reply-To: <20121017164525.0e9b2941@doriath.home>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] block: bdrv_create(): don't leak
	cco.filename on error
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
X-List-Received-Date: Thu, 18 Oct 2012 09:47:11 -0000

Am 17.10.2012 21:45, schrieb Luiz Capitulino:
> 
> Signed-off-by: Luiz Capitulino <lcapitulino@redhat.com>

Thanks, applied to the block branch.

Kevin

