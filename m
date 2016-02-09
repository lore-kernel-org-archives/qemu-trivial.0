Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aT9Ah-0006GZ-8E
	for mharc-qemu-trivial@gnu.org; Tue, 09 Feb 2016 09:21:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56345)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1aT9AZ-00062b-18
	for qemu-trivial@nongnu.org; Tue, 09 Feb 2016 09:21:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1aT9AY-00039E-1C
	for qemu-trivial@nongnu.org; Tue, 09 Feb 2016 09:21:30 -0500
Received: from mx1.redhat.com ([209.132.183.28]:49884)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>)
	id 1aT9AS-00038Z-RI; Tue, 09 Feb 2016 09:21:24 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 7361D19CBB2;
	Tue,  9 Feb 2016 14:21:24 +0000 (UTC)
Received: from redhat.com (vpn1-7-79.ams2.redhat.com [10.36.7.79])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u19ELLrk010860
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 9 Feb 2016 09:21:23 -0500
Date: Tue, 9 Feb 2016 14:21:21 +0000
From: "Daniel P. Berrange" <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20160209142120.GM24614@redhat.com>
References: <1455027417-32278-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1455027417-32278-1-git-send-email-pbonzini@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] w32: include winsock2.h
	before windows.h
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
X-List-Received-Date: Tue, 09 Feb 2016 14:21:36 -0000

On Tue, Feb 09, 2016 at 03:16:57PM +0100, Paolo Bonzini wrote:
> Recent Fedora complains while compiling ui/sdl.c:
> 
>     /usr/x86_64-w64-mingw32/sys-root/mingw/include/winsock2.h:15:2: warning: #warning Please include winsock2.h before windows.h [-Wcpp]
> 
> And with this patch we dutifully obey.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  include/sysemu/os-win32.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/sysemu/os-win32.h b/include/sysemu/os-win32.h
> index 400e098..fbed346 100644
> --- a/include/sysemu/os-win32.h
> +++ b/include/sysemu/os-win32.h
> @@ -26,8 +26,8 @@
>  #ifndef QEMU_OS_WIN32_H
>  #define QEMU_OS_WIN32_H
>  
> -#include <windows.h>
>  #include <winsock2.h>
> +#include <windows.h>
>  
>  /* Workaround for older versions of MinGW. */
>  #ifndef ECONNREFUSED

include/qemu/sockets.h also has windows.h included before winsock2.h

Presumably it didn't cause a failure for you because everything using
sockets.h already pulls in osdep.h. A reason to prune sockets.h
headers perhaps.

Regards,
Daniel
-- 
|: http://berrange.com      -o-    http://www.flickr.com/photos/dberrange/ :|
|: http://libvirt.org              -o-             http://virt-manager.org :|
|: http://autobuild.org       -o-         http://search.cpan.org/~danberr/ :|
|: http://entangle-photo.org       -o-       http://live.gnome.org/gtk-vnc :|

