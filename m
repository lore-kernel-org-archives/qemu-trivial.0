Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ff8XU-0003wW-Gn
	for mharc-qemu-trivial@gnu.org; Mon, 16 Jul 2018 14:48:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50486)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1ff8XS-0003v4-7Y
	for qemu-trivial@nongnu.org; Mon, 16 Jul 2018 14:48:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1ff8XR-0007YE-6x
	for qemu-trivial@nongnu.org; Mon, 16 Jul 2018 14:48:02 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:53918 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1ff8XL-0007WY-VN; Mon, 16 Jul 2018 14:47:56 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1DCBB7DAC6;
	Mon, 16 Jul 2018 18:47:55 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 22CB32156893;
	Mon, 16 Jul 2018 18:47:54 +0000 (UTC)
Date: Mon, 16 Jul 2018 19:47:52 +0100
From: "Daniel P. Berrange" <berrange@redhat.com>
To: Mike Krinkin <krinkin.m.u@gmail.com>
Cc: qemu-devel@nongnu.org, armbru@redhat.com, pbonzini@redhat.com,
	qemu-trivial@nongnu.org
Message-ID: <20180716184752.GA30657@redhat.com>
Reply-To: "Daniel P. Berrange" <berrange@redhat.com>
References: <20180716174146.19845-1-krinkin.m.u@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20180716174146.19845-1-krinkin.m.u@gmail.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Mon, 16 Jul 2018 18:47:55 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Mon, 16 Jul 2018 18:47:55 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'berrange@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [PATCH] opts: fix NULL pointer derefernce in
 get_opt_value
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Jul 2018 18:48:03 -0000

On Mon, Jul 16, 2018 at 06:41:46PM +0100, Mike Krinkin wrote:
> The value argument can be NULL, for example, in hw/i386/multiboot.c
> in the load_multiboot function get_opt_value is explicitly called
> with NULL as the second argument.
> 
> The problem was introduced in commit 950c4e6c94b1 ("opts: don't
> silently truncate long option values"). This change fixes the
> problem by adding a check whether the value is NULL or not.
> 
> Signed-off-by: Mike Krinkin <krinkin.m.u@gmail.com>
> ---
>  util/qemu-option.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

This problem is fixed in this:

  https://lists.gnu.org/archive/html/qemu-devel/2018-06/msg01490.html

but it is still waiting for i386 maintainers to respond....

Regards,
Daniel
-- 
|: http://berrange.com      -o-    http://www.flickr.com/photos/dberrange/ :|
|: http://libvirt.org              -o-             http://virt-manager.org :|
|: http://entangle-photo.org       -o-    http://search.cpan.org/~danberr/ :|

