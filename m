Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b7fu1-0004oV-83
	for mharc-qemu-trivial@gnu.org; Tue, 31 May 2016 05:23:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39730)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1b7ftw-0004k4-Qy
	for qemu-trivial@nongnu.org; Tue, 31 May 2016 05:23:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1b7ftt-0006tP-6t
	for qemu-trivial@nongnu.org; Tue, 31 May 2016 05:23:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40518)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>)
	id 1b7fth-0006qT-TV; Tue, 31 May 2016 05:23:38 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5DC3F7F361;
	Tue, 31 May 2016 09:23:37 +0000 (UTC)
Received: from redhat.com (vpn1-7-198.ams2.redhat.com [10.36.7.198])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4V9NY8M010689
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 31 May 2016 05:23:36 -0400
Date: Tue, 31 May 2016 10:23:33 +0100
From: "Daniel P. Berrange" <berrange@redhat.com>
To: Steven Luo <steven@steven676.net>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-stable@nongnu.org
Message-ID: <20160531092333.GJ21628@redhat.com>
Reply-To: "Daniel P. Berrange" <berrange@redhat.com>
References: <1464324793-29101-1-git-send-email-steven@steven676.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1464324793-29101-1-git-send-email-steven@steven676.net>
User-Agent: Mutt/1.6.0 (2016-04-01)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 31 May 2016 09:23:37 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] Fix configure test for PBKDF2 in nettle
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
X-List-Received-Date: Tue, 31 May 2016 09:23:56 -0000

On Thu, May 26, 2016 at 09:53:13PM -0700, Steven Luo wrote:
> From: Steven Luo <steven+qemu@steven676.net>
> 
> On my Debian jessie system, including nettle/pbkdf2.h does not cause
> NULL to be defined, which causes the test to fail to compile.  Include
> stddef.h to bring in a definition of NULL.
> 
> Cc: qemu-trivial@nongnu.org
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Steven Luo <steven+qemu@steven676.net>
> ---
> I suppose this could also be fixed by defining NULL ourselves, or by
> replacing NULLs with 0s -- if one of those other approaches is
> preferred, let me know.

What you've done here looks just fine to me.

> 
>  configure | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/configure b/configure
> index c37fc5f..0aae017 100755
> --- a/configure
> +++ b/configure
> @@ -2342,6 +2342,7 @@ if test "$nettle" != "no"; then
>          nettle="yes"
>  
>          cat > $TMPC << EOF
> +#include <stddef.h>
>  #include <nettle/pbkdf2.h>
>  int main(void) {
>       pbkdf2_hmac_sha256(8, NULL, 1000, 8, NULL, 8, NULL);
> -- 
> 2.1.4
> 

Regards,
Daniel
-- 
|: http://berrange.com      -o-    http://www.flickr.com/photos/dberrange/ :|
|: http://libvirt.org              -o-             http://virt-manager.org :|
|: http://autobuild.org       -o-         http://search.cpan.org/~danberr/ :|
|: http://entangle-photo.org       -o-       http://live.gnome.org/gtk-vnc :|

