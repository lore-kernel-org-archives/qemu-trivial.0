Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aB34X-0005u5-LK
	for mharc-qemu-trivial@gnu.org; Mon, 21 Dec 2015 11:12:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35270)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1aB34V-0005r0-G7
	for qemu-trivial@nongnu.org; Mon, 21 Dec 2015 11:12:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1aB34U-0000OV-Ge
	for qemu-trivial@nongnu.org; Mon, 21 Dec 2015 11:12:27 -0500
Received: from mx1.redhat.com ([209.132.183.28]:34402)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>)
	id 1aB34P-0000N3-NY; Mon, 21 Dec 2015 11:12:21 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id 614BE8E25B;
	Mon, 21 Dec 2015 16:12:21 +0000 (UTC)
Received: from redhat.com (vpn1-5-146.ams2.redhat.com [10.36.5.146])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tBLGCHqb000331
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 21 Dec 2015 11:12:20 -0500
Date: Mon, 21 Dec 2015 16:12:17 +0000
From: "Daniel P. Berrange" <berrange@redhat.com>
To: Eric Blake <eblake@redhat.com>
Message-ID: <20151221161216.GF5316@redhat.com>
References: <1450713257-17108-1-git-send-email-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1450713257-17108-1-git-send-email-eblake@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] crypto: Fix typo in example
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
X-List-Received-Date: Mon, 21 Dec 2015 16:12:28 -0000

On Mon, Dec 21, 2015 at 08:54:17AM -0700, Eric Blake wrote:
> The example code wouldn't even compile, since it did not use
> a consistent spelling for the Error ** parameter.
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>

Reviewed-by: Daniel P. Berrange <berrange@redhat.com>

> ---
>  include/crypto/tlssession.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/crypto/tlssession.h b/include/crypto/tlssession.h
> index b38fe69..d356a8d 100644
> --- a/include/crypto/tlssession.h
> +++ b/include/crypto/tlssession.h
> @@ -56,7 +56,7 @@
>   *
>   * static int mysock_run_tls(int sockfd,
>   *                           QCryptoTLSCreds *creds,
> - *                           Error *erp)
> + *                           Error *errp)
>   * {
>   *    QCryptoTLSSession *sess;
>   *

Regards,
Daniel
-- 
|: http://berrange.com      -o-    http://www.flickr.com/photos/dberrange/ :|
|: http://libvirt.org              -o-             http://virt-manager.org :|
|: http://autobuild.org       -o-         http://search.cpan.org/~danberr/ :|
|: http://entangle-photo.org       -o-       http://live.gnome.org/gtk-vnc :|

