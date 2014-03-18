Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WPqHU-0008AV-Ti
	for mharc-qemu-trivial@gnu.org; Tue, 18 Mar 2014 05:25:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35981)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1WPqHN-00085r-EG
	for qemu-trivial@nongnu.org; Tue, 18 Mar 2014 05:25:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1WPqHJ-0003ON-0f
	for qemu-trivial@nongnu.org; Tue, 18 Mar 2014 05:25:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41379)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>)
	id 1WPqHI-0003OF-L5; Tue, 18 Mar 2014 05:25:44 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s2I9Phf9028852
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 18 Mar 2014 05:25:43 -0400
Received: from localhost (ovpn-112-48.ams2.redhat.com [10.36.112.48])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s2I9PfSA009236; Tue, 18 Mar 2014 05:25:42 -0400
Date: Tue, 18 Mar 2014 10:25:41 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20140318092541.GB25460@stefanha-thinkpad.redhat.com>
References: <1394827750-28635-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1394827750-28635-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] configure: Show trace output file
	conditionally
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
X-List-Received-Date: Tue, 18 Mar 2014 09:25:54 -0000

On Fri, Mar 14, 2014 at 09:09:10PM +0100, Stefan Weil wrote:
> It is only used with the simple trace backend.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  configure |    2 ++
>  1 file changed, 2 insertions(+)

Thanks, applied to my tracing-next tree:
https://github.com/stefanha/qemu/commits/tracing-next

Stefan

