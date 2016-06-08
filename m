Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bAfs4-0005ht-Tz
	for mharc-qemu-trivial@gnu.org; Wed, 08 Jun 2016 11:58:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55483)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bAfs2-0005fi-Pk
	for qemu-trivial@nongnu.org; Wed, 08 Jun 2016 11:58:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bAfs0-0004a1-UJ
	for qemu-trivial@nongnu.org; Wed, 08 Jun 2016 11:58:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51655)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>)
	id 1bAfrt-0004WP-Ml; Wed, 08 Jun 2016 11:58:09 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2DFC87F6A2;
	Wed,  8 Jun 2016 15:58:08 +0000 (UTC)
Received: from [10.36.112.71] (ovpn-112-71.ams2.redhat.com [10.36.112.71])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u58Fw5Vi023953; Wed, 8 Jun 2016 11:58:06 -0400
To: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org
References: <1465398683-3152-1-git-send-email-thuth@redhat.com>
Cc: qemu-trivial@nongnu.org
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <75cb4d01-7089-9d36-aaf8-948e67dce0b0@redhat.com>
Date: Wed, 8 Jun 2016 17:58:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.0
MIME-Version: 1.0
In-Reply-To: <1465398683-3152-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Wed, 08 Jun 2016 15:58:08 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: Remove unused
 CONFIG_ZERO_MALLOC setting
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
X-List-Received-Date: Wed, 08 Jun 2016 15:58:19 -0000



On 08/06/2016 17:11, Thomas Huth wrote:
> CONFIG_ZERO_MALLOC was only used in qemu-malloc.c and
> this file has been removed with the following commit:
> 
> 	41a748265f4879b52b0e87ff9c93bed975163886
> 	Remove qemu_malloc/qemu_free
> 
> So we don't need this configuration setting anymore.
> This patch also removes the z_version variable, since
> this is now also not needed anymore.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Laurent Vivier <lvivier@redhat.com>

> ---
>  configure | 16 ----------------
>  1 file changed, 16 deletions(-)
> 
> diff --git a/configure b/configure
> index 4627d2c..316297b 100755
> --- a/configure
> +++ b/configure
> @@ -270,7 +270,6 @@ aix="no"
>  blobs="yes"
>  pkgversion=""
>  pie=""
> -zero_malloc=""
>  qom_cast_debug="yes"
>  trace_backends="log"
>  trace_file="trace"
> @@ -1389,8 +1388,6 @@ fi
>  
>  # Consult white-list to determine whether to enable werror
>  # by default.  Only enable by default for git builds
> -z_version=$(cut -f3 -d. $source_path/VERSION)
> -
>  if test -z "$werror" ; then
>      if test -d "$source_path/.git" -a \
>          "$linux" = "yes" ; then
> @@ -4575,16 +4572,6 @@ if test "$libnfs" != "no" ; then
>    fi
>  fi
>  
> -# Disable zero malloc errors for official releases unless explicitly told to
> -# enable/disable
> -if test -z "$zero_malloc" ; then
> -    if test "$z_version" = "50" ; then
> -	zero_malloc="no"
> -    else
> -	zero_malloc="yes"
> -    fi
> -fi
> -
>  # Now we've finished running tests it's OK to add -Werror to the compiler flags
>  if test "$werror" = "yes"; then
>      QEMU_CFLAGS="-Werror $QEMU_CFLAGS"
> @@ -5346,9 +5333,6 @@ if [ "$bsd" = "yes" ] ; then
>    echo "CONFIG_BSD=y" >> $config_host_mak
>  fi
>  
> -if test "$zero_malloc" = "yes" ; then
> -  echo "CONFIG_ZERO_MALLOC=y" >> $config_host_mak
> -fi
>  if test "$localtime_r" = "yes" ; then
>    echo "CONFIG_LOCALTIME_R=y" >> $config_host_mak
>  fi
> 

