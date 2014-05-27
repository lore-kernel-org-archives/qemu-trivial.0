Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WpHn3-0004ly-Gi
	for mharc-qemu-trivial@gnu.org; Tue, 27 May 2014 09:51:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47489)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1WpHmt-0004ZQ-If
	for qemu-trivial@nongnu.org; Tue, 27 May 2014 09:51:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1WpHmm-0006bi-3e
	for qemu-trivial@nongnu.org; Tue, 27 May 2014 09:51:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41827)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>)
	id 1WpHmW-0006Y1-VR; Tue, 27 May 2014 09:51:09 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s4RDouiX020686
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Tue, 27 May 2014 09:50:56 -0400
Received: from localhost (ovpn-112-44.ams2.redhat.com [10.36.112.44])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s4RDotL3024620; Tue, 27 May 2014 09:50:56 -0400
Date: Tue, 27 May 2014 15:50:54 +0200
From: Stefan Hajnoczi <stefanha@redhat.com>
To: serge.fdrv@gmail.com
Message-ID: <20140527135054.GF31463@stefanha-thinkpad.redhat.com>
References: <1401178560-3852-1-git-send-email-serge.fdrv@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1401178560-3852-1-git-send-email-serge.fdrv@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, Alex Bligh <alex@alex.org.uk>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Subject: Re: [Qemu-trivial] [PATCH] qtest: fix hex2nib for capital characters
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
X-List-Received-Date: Tue, 27 May 2014 13:51:39 -0000

On Tue, May 27, 2014 at 12:16:00PM +0400, serge.fdrv@gmail.com wrote:
> From: Sergey Fedorov <serge.fdrv@gmail.com>
> 
> Signed-off-by: Sergey Fedorov <serge.fdrv@gmail.com>
> 
> ---
>  qtest.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

