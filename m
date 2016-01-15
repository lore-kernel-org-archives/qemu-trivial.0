Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aK7gL-0001e4-1e
	for mharc-qemu-trivial@gnu.org; Fri, 15 Jan 2016 11:57:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44122)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1aK7gI-0001aW-9Y
	for qemu-trivial@nongnu.org; Fri, 15 Jan 2016 11:56:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1aK7gH-0000qi-66
	for qemu-trivial@nongnu.org; Fri, 15 Jan 2016 11:56:58 -0500
Received: from mx1.redhat.com ([209.132.183.28]:56531)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1aK7gC-0000pu-M4; Fri, 15 Jan 2016 11:56:52 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 14766C0A1603;
	Fri, 15 Jan 2016 16:56:52 +0000 (UTC)
Received: from [10.36.112.70] (ovpn-112-70.ams2.redhat.com [10.36.112.70])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u0FGuTwY020925
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 15 Jan 2016 11:56:34 -0500
To: Sitsofe Wheeler <sitsofe@yahoo.com>, qemu-devel@nongnu.org
References: <1452718226-25001-1-git-send-email-sitsofe@yahoo.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <569924BC.8080704@redhat.com>
Date: Fri, 15 Jan 2016 17:56:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <1452718226-25001-1-git-send-email-sitsofe@yahoo.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] docs: Style the command and its options
	in the synopsis
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
X-List-Received-Date: Fri, 15 Jan 2016 16:56:59 -0000



On 13/01/2016 21:50, Sitsofe Wheeler wrote:
> Signed-off-by: Sitsofe Wheeler <sitsofe@yahoo.com>
> ---
>  fsdev/virtfs-proxy-helper.texi | 2 +-
>  qemu-doc.texi                  | 8 ++++----
>  qemu-ga.texi                   | 2 +-
>  qemu-img.texi                  | 2 +-
>  4 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/fsdev/virtfs-proxy-helper.texi b/fsdev/virtfs-proxy-helper.texi
> index e60e3b9..9a25d7e 100644
> --- a/fsdev/virtfs-proxy-helper.texi
> +++ b/fsdev/virtfs-proxy-helper.texi
> @@ -1,6 +1,6 @@
>  @example
>  @c man begin SYNOPSIS
> -usage: virtfs-proxy-helper options
> +@command{virtfs-proxy-helper} @var{options}
>  @c man end
>  @end example
>  
> diff --git a/qemu-doc.texi b/qemu-doc.texi
> index 7bc3882..ca4d9de 100644
> --- a/qemu-doc.texi
> +++ b/qemu-doc.texi
> @@ -259,7 +259,7 @@ Linux should boot and give you a prompt.
>  
>  @example
>  @c man begin SYNOPSIS
> -usage: qemu-system-i386 [options] [@var{disk_image}]
> +@command{qemu-system-i386} [@var{options}] [@var{disk_image}]
>  @c man end
>  @end example
>  
> @@ -1406,7 +1406,7 @@ no type is given, the HCI logic corresponds to @code{-bt hci,vlan=0}.
>  This USB device implements the USB Transport Layer of HCI.  Example
>  usage:
>  @example
> -qemu-system-i386 [...OPTIONS...] -usbdevice bt:hci,vlan=3 -bt device:keyboard,vlan=3
> +@command{qemu-system-i386} [...@var{OPTIONS}...] @option{-usbdevice} bt:hci,vlan=3 @option{-bt} device:keyboard,vlan=3
>  @end example
>  @end table
>  
> @@ -2755,7 +2755,7 @@ qemu-i386 /usr/local/qemu-i386/wine/bin/wine \
>  @subsection Command line options
>  
>  @example
> -usage: qemu-i386 [-h] [-d] [-L path] [-s size] [-cpu model] [-g port] [-B offset] [-R size] program [arguments...]
> +@command{qemu-i386} [@option{-h]} [@option{-d]} [@option{-L} @var{path}] [@option{-s} @var{size}] [@option{-cpu} @var{model}] [@option{-g} @var{port}] [@option{-B} @var{offset}] [@option{-R} @var{size}] @var{program} [@var{arguments}...]
>  @end example
>  
>  @table @option
> @@ -2897,7 +2897,7 @@ qemu-sparc64 /bin/ls
>  @subsection Command line options
>  
>  @example
> -usage: qemu-sparc64 [-h] [-d] [-L path] [-s size] [-bsd type] program [arguments...]
> +@command{qemu-sparc64} [@option{-h]} [@option{-d]} [@option{-L} @var{path}] [@option{-s} @var{size}] [@option{-bsd} @var{type}] @var{program} [@var{arguments}...]
>  @end example
>  
>  @table @option
> diff --git a/qemu-ga.texi b/qemu-ga.texi
> index 536a9b5..0e53bf6 100644
> --- a/qemu-ga.texi
> +++ b/qemu-ga.texi
> @@ -1,6 +1,6 @@
>  @example
>  @c man begin SYNOPSIS
> -usage: qemu-ga [OPTIONS]
> +@command{qemu-ga} [@var{OPTIONS}]
>  @c man end
>  @end example
>  
> diff --git a/qemu-img.texi b/qemu-img.texi
> index 55c6be3..7163a10 100644
> --- a/qemu-img.texi
> +++ b/qemu-img.texi
> @@ -1,6 +1,6 @@
>  @example
>  @c man begin SYNOPSIS
> -usage: qemu-img command [command options]
> +@command{qemu-img} @var{command} [@var{command} @var{options}]
>  @c man end
>  @end example
>  
> 

Queued, thanks.

Paolo

