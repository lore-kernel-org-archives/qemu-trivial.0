Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aYy7y-000621-MH
	for mharc-qemu-trivial@gnu.org; Thu, 25 Feb 2016 10:46:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48467)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1aYy7r-0005sA-RL
	for qemu-trivial@nongnu.org; Thu, 25 Feb 2016 10:46:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1aYy7n-0002l8-V2
	for qemu-trivial@nongnu.org; Thu, 25 Feb 2016 10:46:47 -0500
Received: from mx1.redhat.com ([209.132.183.28]:41256)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>)
	id 1aYy7f-0002kG-LT; Thu, 25 Feb 2016 10:46:35 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id C102960F;
	Thu, 25 Feb 2016 15:46:34 +0000 (UTC)
Received: from redhat.com (vpn1-7-78.ams2.redhat.com [10.36.7.78])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u1PFkV0n000550
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 25 Feb 2016 10:46:33 -0500
Date: Thu, 25 Feb 2016 15:46:31 +0000
From: "Daniel P. Berrange" <berrange@redhat.com>
To: Ed Maste <emaste@freebsd.org>, qemu-trivial@nongnu.org
Message-ID: <20160225154631.GH10515@redhat.com>
References: <1456414292-55363-1-git-send-email-emaste@freebsd.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1456414292-55363-1-git-send-email-emaste@freebsd.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] io: fix build on FreeBSD
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
Reply-To: "Daniel P. Berrange" <berrange@redhat.com>
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 25 Feb 2016 15:46:53 -0000

On Thu, Feb 25, 2016 at 10:31:32AM -0500, Ed Maste wrote:
> EAI_ADDRFAMILY is obsolete and FreeBSD/s netdb.h does not provide a
> definition.
> 
> Signed-off-by: Ed Maste <emaste@freebsd.org>
> ---
>  tests/test-io-channel-socket.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Reviewed-by: Daniel P. Berrange <berrange@redhat.com>

Copying qemu-trivial to pick up the patch

> 
> diff --git a/tests/test-io-channel-socket.c b/tests/test-io-channel-socket.c
> index 0697363..f4dbd60 100644
> --- a/tests/test-io-channel-socket.c
> +++ b/tests/test-io-channel-socket.c
> @@ -63,7 +63,10 @@ static int check_protocol_support(bool *has_ipv4, bool *has_ipv6)
>  
>      gaierr = getaddrinfo("::1", NULL, &hints, &ai);
>      if (gaierr != 0) {
> -        if (gaierr == EAI_ADDRFAMILY ||
> +        if (
> +#ifdef EAI_ADDRFAMILY
> +            gaierr == EAI_ADDRFAMILY ||
> +#endif
>              gaierr == EAI_FAMILY ||
>              gaierr == EAI_NONAME) {
>              *has_ipv6 = false;
> -- 
> 2.4.6
> 

Regards,
Daniel
-- 
|: http://berrange.com      -o-    http://www.flickr.com/photos/dberrange/ :|
|: http://libvirt.org              -o-             http://virt-manager.org :|
|: http://autobuild.org       -o-         http://search.cpan.org/~danberr/ :|
|: http://entangle-photo.org       -o-       http://live.gnome.org/gtk-vnc :|

