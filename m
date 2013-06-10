Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Um0iS-0006x5-SD
	for mharc-qemu-trivial@gnu.org; Mon, 10 Jun 2013 07:56:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42915)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1Um0iP-0006wx-Vb
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 07:56:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1Um0iO-0000q5-QI
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 07:56:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50182)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>)
	id 1Um0iO-0000pw-IY; Mon, 10 Jun 2013 07:56:48 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r5ABulln029350
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 10 Jun 2013 07:56:47 -0400
Received: from dhcp-200-207.str.redhat.com (dhcp-192-246.str.redhat.com
	[10.33.192.246])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id r5ABukPw005337; Mon, 10 Jun 2013 07:56:46 -0400
Date: Mon, 10 Jun 2013 13:56:45 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: "Richard W.M. Jones" <rjones@redhat.com>
Message-ID: <20130610115645.GE3636@dhcp-200-207.str.redhat.com>
References: <1370864323-25679-1-git-send-email-rjones@redhat.com>
	<1370864323-25679-2-git-send-email-rjones@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1370864323-25679-2-git-send-email-rjones@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, stefanha@redhat.com
Subject: Re: [Qemu-trivial] [PATCH v2] block/curl.c: Refuse to open the
	handle for writes.
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
X-List-Received-Date: Mon, 10 Jun 2013 11:56:52 -0000

Am 10.06.2013 um 13:38 hat Richard W.M. Jones geschrieben:
> From: "Richard W.M. Jones" <rjones@redhat.com>
> 
> Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
> Signed-off-by: Fam Zheng <famz@redhat.com>

Thanks, applied to the block branch.

Kevin

