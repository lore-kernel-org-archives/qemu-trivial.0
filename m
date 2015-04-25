Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ym16e-0003rW-KO
	for mharc-qemu-trivial@gnu.org; Sat, 25 Apr 2015 10:30:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53933)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1Ym16c-0003nq-6U
	for qemu-trivial@nongnu.org; Sat, 25 Apr 2015 10:30:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1Ym16b-0007oF-EY
	for qemu-trivial@nongnu.org; Sat, 25 Apr 2015 10:30:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55022)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>)
	id 1Ym16X-0007kP-6D; Sat, 25 Apr 2015 10:30:49 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t3PEUkml018897
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Sat, 25 Apr 2015 10:30:47 -0400
Received: from localhost (ovpn-113-99.phx2.redhat.com [10.3.113.99])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t3PEUiZm029510; Sat, 25 Apr 2015 10:30:45 -0400
Date: Sat, 25 Apr 2015 10:30:43 -0400
From: Luiz Capitulino <lcapitulino@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <20150425103043.67d5859c@redhat.com>
In-Reply-To: <553B306A.1010808@msgid.tls.msk.ru>
References: <20150331133251.5be10dd6@redhat.com>
	<553B306A.1010808@msgid.tls.msk.ru>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, eblake@redhat.com, qemu-devel@nongnu.org,
	armbru@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] balloon: improve error msg when adding
	second device
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
X-List-Received-Date: Sat, 25 Apr 2015 14:30:55 -0000

On Sat, 25 Apr 2015 09:12:58 +0300
Michael Tokarev <mjt@tls.msk.ru> wrote:

> 31.03.2015 20:32, Luiz Capitulino wrote:
> > A VM supports only one balloon device, but due to several changes
> > in infrastructure the error message got messed up when trying
> > to add a second device. Fix it.
> ...
> Heh.  Such a huge commit message ;)
> 
> Applied to -trivial now.  In the large commit text I missed your
> comment about the patch is okay to go during the freeze, so doing
> it after :)

I've applied it to my own tree and posted a pull request already.

