Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZaL4E-00073J-II
	for mharc-qemu-trivial@gnu.org; Fri, 11 Sep 2015 05:56:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37243)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1ZaL4B-0006yA-Mw
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 05:56:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1ZaL4A-0000rW-Tk
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 05:56:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53629)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1ZaL46-0000h9-Ku; Fri, 11 Sep 2015 05:56:18 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 47EA4A2C07;
	Fri, 11 Sep 2015 09:56:18 +0000 (UTC)
Received: from [10.36.112.66] (ovpn-112-66.ams2.redhat.com [10.36.112.66])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t8B9uE8r013606
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 11 Sep 2015 05:56:16 -0400
To: Michael Tokarev <mjt@tls.msk.ru>, Gerd Hoffmann <kraxel@redhat.com>
References: <1436788726-20590-1-git-send-email-kraxel@redhat.com>
	<55F2830C.1000308@msgid.tls.msk.ru>
	<1441962833.29362.16.camel@redhat.com>
	<55F29D9C.6080504@msgid.tls.msk.ru>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <55F2A53F.8060400@redhat.com>
Date: Fri, 11 Sep 2015 11:56:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <55F29D9C.6080504@msgid.tls.msk.ru>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] virtio-vga: enable for i386
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
X-List-Received-Date: Fri, 11 Sep 2015 09:56:24 -0000



On 11/09/2015 11:23, Michael Tokarev wrote:
> Ok, applied this one to -trivial (with a commit comment :)
> 
> The other 2 are actually 2 incarnations of the same patch,
> http://patchwork.ozlabs.org/patch/494250/
> 
> Since the replies hasn't been seen at qemu-trivial@ I haven't
> found the replies.  Now I did, and it looks like the patch
> needs some more work ;)

I think the sys/ioctl.h issue has been fixed now:

    $ grep -Fr ioctl.h include/standard-headers/
    $

Paolo

