Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WUY8P-0001BB-Rh
	for mharc-qemu-trivial@gnu.org; Mon, 31 Mar 2014 05:04:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42359)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1WUY8J-00013f-GL
	for qemu-trivial@nongnu.org; Mon, 31 Mar 2014 05:04:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1WUY8E-0004rh-Mm
	for qemu-trivial@nongnu.org; Mon, 31 Mar 2014 05:03:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37430)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>)
	id 1WUY84-0004pm-M3; Mon, 31 Mar 2014 05:03:40 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s2V93cm2009906
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 31 Mar 2014 05:03:38 -0400
Received: from localhost (ovpn-112-28.ams2.redhat.com [10.36.112.28])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s2V93b0v003467; Mon, 31 Mar 2014 05:03:38 -0400
Date: Mon, 31 Mar 2014 11:03:36 +0200
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Prasad Joshi <prasadjoshi.linux@gmail.com>
Message-ID: <20140331090336.GA2663@stefanha-thinkpad.redhat.com>
References: <1396028338-3810-1-git-send-email-prasadjoshi.linux@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1396028338-3810-1-git-send-email-prasadjoshi.linux@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, kwolf@redhat.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] qcow2: fix two memory leaks in
	qcow2_open error code path
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
X-List-Received-Date: Mon, 31 Mar 2014 09:04:00 -0000

On Fri, Mar 28, 2014 at 11:08:58PM +0530, Prasad Joshi wrote:
> Signed-off-by: Prasad Joshi <prasadjoshi.linux@gmail.com>
> ---
>  block/qcow2.c | 4 ++++
>  1 file changed, 4 insertions(+)

Thanks, applied to my block tree:
https://github.com/stefanha/qemu/commits/block

Stefan

