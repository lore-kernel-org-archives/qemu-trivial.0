Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S9gA2-0001GS-1z
	for mharc-qemu-trivial@gnu.org; Mon, 19 Mar 2012 13:14:22 -0400
Received: from eggs.gnu.org ([208.118.235.92]:53284)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <avi@redhat.com>) id 1S9g9u-0000vN-Sb
	for qemu-trivial@nongnu.org; Mon, 19 Mar 2012 13:14:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <avi@redhat.com>) id 1S9g9p-00017V-VS
	for qemu-trivial@nongnu.org; Mon, 19 Mar 2012 13:14:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:21734)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <avi@redhat.com>)
	id 1S9g9f-000166-ET; Mon, 19 Mar 2012 13:13:59 -0400
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q2JHDpFV025309
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 19 Mar 2012 13:13:51 -0400
Received: from balrog.usersys.redhat.com (dhcp-4-85.tlv.redhat.com
	[10.35.4.85])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q2JHDnvU014133; Mon, 19 Mar 2012 13:13:49 -0400
Message-ID: <4F67694C.6000108@redhat.com>
Date: Mon, 19 Mar 2012 19:13:48 +0200
From: Avi Kivity <avi@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Anthony PERARD <anthony.perard@citrix.com>
References: <1332172474-17567-1-git-send-email-anthony.perard@citrix.com>
In-Reply-To: <1332172474-17567-1-git-send-email-anthony.perard@citrix.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	Xen Devel <xen-devel@lists.xensource.com>,
	QEMU-devel <qemu-devel@nongnu.org>,
	Stefano Stabellini <stefano.stabellini@eu.citrix.com>
Subject: Re: [Qemu-trivial] [PATCH] exec, Fix guest memory access.
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
X-List-Received-Date: Mon, 19 Mar 2012 17:14:20 -0000

On 03/19/2012 05:54 PM, Anthony PERARD wrote:
> In cpu_physical_memory_rw, a change has been introduced and qemu_get_ram_ptr is
> no longuer called with the ram addr we want to access, but only with the
> section address. This patch fixes this. (All other call to qemu_get_ram_ptr are
> already called with the right address.)
>
> This patch fixes Xen guest.
>

Thanks, applied to memory/urgent, will push shortly.

-- 
error compiling committee.c: too many arguments to function


