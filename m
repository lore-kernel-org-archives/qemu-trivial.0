Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WT9sW-0008TK-B9
	for mharc-qemu-trivial@gnu.org; Thu, 27 Mar 2014 08:57:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54340)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1WT9sQ-0008Kl-7y
	for qemu-trivial@nongnu.org; Thu, 27 Mar 2014 08:57:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1WT9sL-0006h8-MZ
	for qemu-trivial@nongnu.org; Thu, 27 Mar 2014 08:57:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39345)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1WT9s9-0006S4-Iv; Thu, 27 Mar 2014 08:57:29 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s2RCvQqn010453
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Thu, 27 Mar 2014 08:57:27 -0400
Received: from nial.usersys.redhat.com (dhcp-1-126.brq.redhat.com
	[10.34.1.126])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s2RCvO0m031441; Thu, 27 Mar 2014 08:57:25 -0400
Date: Thu, 27 Mar 2014 13:57:23 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <20140327135723.36395142@nial.usersys.redhat.com>
In-Reply-To: <5333BEA0.7040309@msgid.tls.msk.ru>
References: <5333BEA0.7040309@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] current (2014-03-27) trivial patches
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
X-List-Received-Date: Thu, 27 Mar 2014 12:57:50 -0000

On Thu, 27 Mar 2014 10:01:04 +0400
Michael Tokarev <mjt@tls.msk.ru> wrote:

> Hello.
> 
> I weren't able to process -trivial patches regularly for a while,
> and we are now past 2.0-rc1 schedule, which means hard freeze and
> bugfix-only mode, as far as I can see.
> 
> Current queue can be seen at
> 
>  http://git.corpit.ru/?p=qemu.git;a=shortlog;h=refs/heads/trivial-patches-next
> 
> (I rebased it to current master).
> 
> It contains:
> 
>  - adding missing 'static' attributes series by Stefan Weil,
>    which is safe to go for 2.0
> 
>  - a few documentation changes/fixes, which is definitely safe for 2.0
> 
>  - bugfix for KVM_GET_DIRTY_LOG ioctl, which should go to 2.0
> 
>  - series by Peter which tries to avoid shifting into sign bit,
>    which has been reviewed and looks safe, but I'm not sure if
>    it's okay for 2.0 (it doesn't hurt to keep it out for now)
> 
>  - conversion of -m to QemuOpts, for which I unfortunately don't
>    have good reason to go to 2.0 currently
> 
>  - 2 patches left from series by Prasad Joshi, which are safe for 2.0.
> 
> I think that except of -m-to-QemuOpts conversion, everything should
> go to 2.0, maybe that one too (Cc'ing Igor for that as well).
It should be fine if -m-to-QemuOpts goes in 2.1 early.

> 
> I'm about to prepare pull request, but want to hear some opinions
> first, even for such trivial ;) things, because I weren't following
> development lately.
> 
> Thanks,
> 
> /mjt
> 


