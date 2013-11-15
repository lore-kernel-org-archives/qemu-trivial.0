Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VhFZO-000711-Od
	for mharc-qemu-trivial@gnu.org; Fri, 15 Nov 2013 04:20:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48940)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1VhFZH-0006rX-VR
	for qemu-trivial@nongnu.org; Fri, 15 Nov 2013 04:20:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1VhFZC-00034T-Mc
	for qemu-trivial@nongnu.org; Fri, 15 Nov 2013 04:19:59 -0500
Received: from mx1.redhat.com ([209.132.183.28]:39828)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>)
	id 1VhFZ0-00033F-Bj; Fri, 15 Nov 2013 04:19:42 -0500
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id rAF9JeVg001816
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 15 Nov 2013 04:19:40 -0500
Received: from localhost (ovpn-112-40.ams2.redhat.com [10.36.112.40])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id rAF9Jcaa019791; Fri, 15 Nov 2013 04:19:39 -0500
Date: Fri, 15 Nov 2013 10:19:38 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20131115091938.GF12545@stefanha-thinkpad.redhat.com>
References: <1384452423-7831-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1384452423-7831-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH (1.7?)] configure: Use -B switch only for
 Python versions which support it
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
X-List-Received-Date: Fri, 15 Nov 2013 09:20:05 -0000

On Thu, Nov 14, 2013 at 07:07:03PM +0100, Stefan Weil wrote:
> Commit 1d984a67a95d88f3e708b077dab8adeb47c38c93 added the -B switch
> unconditionally. This breaks Python versions before 2.6 which don't
> support that switch.
> 
> Now configure adds -B only if it is accepted by the Python interpreter.
> 
> This modification introduces a small incompatiblity because -B might now
> also be added when configure was called with --python=PYTHON_INTERPRETER.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  configure |    9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)

Thanks for the quick fix!

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

