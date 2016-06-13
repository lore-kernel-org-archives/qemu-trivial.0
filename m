Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bCODW-0004mA-Ga
	for mharc-qemu-trivial@gnu.org; Mon, 13 Jun 2016 05:31:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45866)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bCODR-0004hV-8D
	for qemu-trivial@nongnu.org; Mon, 13 Jun 2016 05:31:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bCODQ-0008ON-7R
	for qemu-trivial@nongnu.org; Mon, 13 Jun 2016 05:31:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37538)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1bCODK-0008Nn-BQ; Mon, 13 Jun 2016 05:31:22 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1304C155E3;
	Mon, 13 Jun 2016 09:31:21 +0000 (UTC)
Received: from [10.36.112.17] (ovpn-112-17.ams2.redhat.com [10.36.112.17])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5D9VHZY018465
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 13 Jun 2016 05:31:19 -0400
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <1465571084-19885-1-git-send-email-thuth@redhat.com>
Cc: qemu-trivial@nongnu.org
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <048c3741-e276-4600-ec78-fc3c4dbea16a@redhat.com>
Date: Mon, 13 Jun 2016 11:31:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.0
MIME-Version: 1.0
In-Reply-To: <1465571084-19885-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Mon, 13 Jun 2016 09:31:21 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] configure: Remove unused
 CONFIG_SIGEV_THREAD_ID switch
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
X-List-Received-Date: Mon, 13 Jun 2016 09:31:33 -0000



On 10/06/2016 17:04, Thomas Huth wrote:
> The CONFIG_SIGEV_THREAD_ID switch is unused since the related code
> has been removed by commit 6d327171551a12b937c5718073b9848d0274c74d
> ("aio / timers: Remove alarm timers"), so it can safely be removed
> nowadays.

Queued, thanks.

Paolo

> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  configure | 22 ----------------------
>  1 file changed, 22 deletions(-)
> 
> diff --git a/configure b/configure
> index 8c2f90b..469aa45 100755
> --- a/configure
> +++ b/configure
> @@ -4178,24 +4178,6 @@ if compile_prog "" "" ; then
>  fi
>  
>  ##########################################
> -# check if we have usable SIGEV_THREAD_ID
> -
> -sigev_thread_id=no
> -cat > $TMPC << EOF
> -#include <signal.h>
> -int main(void) {
> -  struct sigevent ev;
> -  ev.sigev_notify = SIGEV_THREAD_ID;
> -  ev._sigev_un._tid = 0;
> -  asm volatile("" : : "g"(&ev));
> -  return 0;
> -}
> -EOF
> -if compile_prog "" "" ; then
> -    sigev_thread_id=yes
> -fi
> -
> -##########################################
>  # check if trace backend exists
>  
>  $python "$source_path/scripts/tracetool.py" "--backends=$trace_backends" --check-backends  > /dev/null 2> /dev/null
> @@ -4862,7 +4844,6 @@ echo "preadv support    $preadv"
>  echo "fdatasync         $fdatasync"
>  echo "madvise           $madvise"
>  echo "posix_madvise     $posix_madvise"
> -echo "sigev_thread_id   $sigev_thread_id"
>  echo "uuid support      $uuid"
>  echo "libcap-ng support $cap_ng"
>  echo "vhost-net support $vhost_net"
> @@ -5277,9 +5258,6 @@ fi
>  if test "$posix_madvise" = "yes" ; then
>    echo "CONFIG_POSIX_MADVISE=y" >> $config_host_mak
>  fi
> -if test "$sigev_thread_id" = "yes" ; then
> -  echo "CONFIG_SIGEV_THREAD_ID=y" >> $config_host_mak
> -fi
>  
>  if test "$spice" = "yes" ; then
>    echo "CONFIG_SPICE=y" >> $config_host_mak
> 

