Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RvWFC-0005c5-EK
	for mharc-qemu-trivial@gnu.org; Thu, 09 Feb 2012 10:49:10 -0500
Received: from eggs.gnu.org ([140.186.70.92]:52458)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1RvWF5-0005bx-7G
	for qemu-trivial@nongnu.org; Thu, 09 Feb 2012 10:49:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1RvWEz-0004Zp-8D
	for qemu-trivial@nongnu.org; Thu, 09 Feb 2012 10:49:03 -0500
Received: from mx1.redhat.com ([209.132.183.28]:8179)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>)
	id 1RvWEy-0004Zi-VI; Thu, 09 Feb 2012 10:48:57 -0500
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q19Fmsr9022346
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Thu, 9 Feb 2012 10:48:54 -0500
Received: from doriath.home (ovpn-116-73.ams2.redhat.com [10.36.116.73])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q19FmprW001965; Thu, 9 Feb 2012 10:48:52 -0500
Date: Thu, 9 Feb 2012 13:48:51 -0200
From: Luiz Capitulino <lcapitulino@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Message-ID: <20120209134851.46b62fde@doriath.home>
In-Reply-To: <20120209152858.GA6051@stefanha-thinkpad.localdomain>
References: <20120209112942.77ce62bf@doriath.home>
	<20120209152858.GA6051@stefanha-thinkpad.localdomain>
Organization: Red Hat
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [TRIVIAL] virtio_cleanup(): Remove unneeded
 g_free() parameter check
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
X-List-Received-Date: Thu, 09 Feb 2012 15:49:08 -0000

On Thu, 9 Feb 2012 15:28:58 +0000
Stefan Hajnoczi <stefanha@gmail.com> wrote:

> On Thu, Feb 09, 2012 at 11:29:42AM -0200, Luiz Capitulino wrote:
> > 
> > Signed-off-by: Luiz Capitulino <lcapitulino@redhat.com>
> > ---
> >  hw/virtio.c |    3 +--
> >  1 files changed, 1 insertions(+), 2 deletions(-)
> 
> Tweaked commit message to be more conventional with "virtio: Remove
> unneeded g_free() check in virtio_cleanup()".

Thanks.

> 
> Thanks, applied to the trivial patches tree:
> https://github.com/stefanha/qemu/commits/trivial-patches
> 
> Stefan
> 


