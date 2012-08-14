Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T1IKT-0008EE-Bw
	for mharc-qemu-trivial@gnu.org; Tue, 14 Aug 2012 10:42:45 -0400
Received: from eggs.gnu.org ([208.118.235.92]:58116)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1T1IKQ-00085h-EB
	for qemu-trivial@nongnu.org; Tue, 14 Aug 2012 10:42:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1T1IKN-0005iB-Hi
	for qemu-trivial@nongnu.org; Tue, 14 Aug 2012 10:42:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:10509)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>)
	id 1T1IKN-0005hX-AW; Tue, 14 Aug 2012 10:42:39 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q7EEgLAo027331
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 14 Aug 2012 10:42:21 -0400
Received: from doriath.home (ovpn-113-111.phx2.redhat.com [10.3.113.111])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q7EEgJWm028818; Tue, 14 Aug 2012 10:42:20 -0400
Date: Tue, 14 Aug 2012 11:43:03 -0300
From: Luiz Capitulino <lcapitulino@redhat.com>
To: Alberto Garcia <agarcia@igalia.com>
Message-ID: <20120814114303.4e65b24b@doriath.home>
In-Reply-To: <20120814141537.GA27231@igalia.com>
References: <1344944488-27075-1-git-send-email-agarcia@igalia.com>
	<20120814104230.64aed4e3@doriath.home>
	<20120814141537.GA27231@igalia.com>
Organization: Red Hat
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] ivshmem,
	qdev-monitor: fix order of qerror parameters
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
X-List-Received-Date: Tue, 14 Aug 2012 14:42:44 -0000

On Tue, 14 Aug 2012 16:15:37 +0200
Alberto Garcia <agarcia@igalia.com> wrote:

> On Tue, Aug 14, 2012 at 10:42:30AM -0300, Luiz Capitulino wrote:
> 
> > Additionally, we should check all old QERR_ macros to see if anyone
> > else swaps parameters like this and change them too.
> 
> Yes, I also noticed the problem and checked all QERR_ macros, I only
> found the two that I corrected in the patch, but double checking the
> list won't hurt I guess :)

Yes, you're right. I've just double checked it and these are the only
two cases and both have only one single user.

This patch is fine then:

 Reviewed-by: Luiz Capitulino <lcapitulino@redhat.com>

