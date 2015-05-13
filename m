Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YsT4v-0007hX-Ps
	for mharc-qemu-trivial@gnu.org; Wed, 13 May 2015 05:35:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60038)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1YsT4j-0007W8-3J
	for qemu-trivial@nongnu.org; Wed, 13 May 2015 05:35:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1YsT4d-0004Fo-Gl
	for qemu-trivial@nongnu.org; Wed, 13 May 2015 05:35:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47273)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>)
	id 1YsT4X-0004Ek-T0; Wed, 13 May 2015 05:35:26 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t4D9ZPLk001177
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Wed, 13 May 2015 05:35:25 -0400
Received: from noname.str.redhat.com (dhcp-192-197.str.redhat.com
	[10.33.192.197])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id t4D9ZNl2006932; Wed, 13 May 2015 05:35:24 -0400
Date: Wed, 13 May 2015 11:35:23 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Eric Blake <eblake@redhat.com>
Message-ID: <20150513093523.GF4263@noname.str.redhat.com>
References: <1431443456-21605-1-git-send-email-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1431443456-21605-1-git-send-email-eblake@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, qemu-block@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] qemu-io: Use getopt() correctly
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
X-List-Received-Date: Wed, 13 May 2015 09:35:41 -0000

Am 12.05.2015 um 17:10 hat Eric Blake geschrieben:
> POSIX says getopt() returns -1 on completion.  While Linux happens
> to define EOF as -1, this definition is not required by POSIX, and
> there may be platforms where checking for EOF instead of -1 would
> lead to an infinite loop.
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>

Thanks, applied to my block branch.

Kevin

