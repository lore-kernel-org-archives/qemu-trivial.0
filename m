Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QGojy-0002jU-Hk
	for mharc-qemu-trivial@gnu.org; Mon, 02 May 2011 04:44:26 -0400
Received: from eggs.gnu.org ([140.186.70.92]:33545)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alevy@redhat.com>) id 1QGojv-0002eC-UZ
	for qemu-trivial@nongnu.org; Mon, 02 May 2011 04:44:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alevy@redhat.com>) id 1QGoju-0001kO-VS
	for qemu-trivial@nongnu.org; Mon, 02 May 2011 04:44:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:20857)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alevy@redhat.com>)
	id 1QGojo-0001jx-Qn; Mon, 02 May 2011 04:44:17 -0400
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p428iEWp001509
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 2 May 2011 04:44:14 -0400
Received: from playa.redhat.com (dhcp-3-110.tlv.redhat.com [10.35.3.110])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p428i9T2023227
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO);
	Mon, 2 May 2011 04:44:13 -0400
Date: Mon, 2 May 2011 11:44:09 +0300
From: Alon Levy <alevy@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20110502084409.GE17629@playa.redhat.com>
Mail-Followup-To: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <1304322846-24376-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1304322846-24376-1-git-send-email-pbonzini@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/4] libcacard: add correct
 subdirectory dependencies
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
X-List-Received-Date: Mon, 02 May 2011 08:44:24 -0000

On Mon, May 02, 2011 at 09:54:03AM +0200, Paolo Bonzini wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> Cc: qemu-trivial@nongnu.org
> ---
>  Makefile           |    2 ++
>  Makefile.objs      |    7 +++----
>  libcacard/Makefile |    9 +--------
>  3 files changed, 6 insertions(+), 12 deletions(-)
> 

Reviewed-by: Alon Levy <alevy@redhat.com>

> diff --git a/Makefile b/Makefile
> index 67c0268..2b0438c 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -88,6 +88,8 @@ include $(SRC_PATH)/Makefile.objs
>  endif
>  
>  $(common-obj-y): $(GENERATED_HEADERS)
> +subdir-libcacard: $(oslib-obj-y) $(trace-obj-y) qemu-malloc.o qemu-timer-common.o
> +
>  $(filter %-softmmu,$(SUBDIR_RULES)): $(trace-obj-y) $(common-obj-y) subdir-libdis
>  
>  $(filter %-user,$(SUBDIR_RULES)): $(GENERATED_HEADERS) $(trace-obj-y) subdir-libdis-user subdir-libuser
> diff --git a/Makefile.objs b/Makefile.objs
> index 44ce368..0ba989f 100644
> --- a/Makefile.objs
> +++ b/Makefile.objs
> @@ -7,8 +7,8 @@ qobject-obj-y += qerror.o
>  #######################################################################
>  # oslib-obj-y is code depending on the OS (win32 vs posix)
>  oslib-obj-y = osdep.o
> -oslib-obj-$(CONFIG_WIN32) += oslib-win32.o
> -oslib-obj-$(CONFIG_POSIX) += oslib-posix.o
> +oslib-obj-$(CONFIG_WIN32) += oslib-win32.o qemu-thread-win32.o
> +oslib-obj-$(CONFIG_POSIX) += oslib-posix.o qemu-thread-posix.o
>  
>  #######################################################################
>  # block-obj-y is code used by both qemu system emulation and qemu-img
> @@ -143,8 +143,7 @@ common-obj-y += $(addprefix ui/, $(ui-obj-y))
>  common-obj-$(CONFIG_VNC) += $(addprefix ui/, $(vnc-obj-y))
>  
>  common-obj-y += iov.o acl.o
> -common-obj-$(CONFIG_POSIX) += qemu-thread-posix.o compatfd.o
> -common-obj-$(CONFIG_WIN32) += qemu-thread-win32.o
> +common-obj-$(CONFIG_POSIX) += compatfd.o
>  common-obj-y += notify.o event_notifier.o
>  common-obj-y += qemu-timer.o qemu-timer-common.o
>  
> diff --git a/libcacard/Makefile b/libcacard/Makefile
> index 4010029..1d34df0 100644
> --- a/libcacard/Makefile
> +++ b/libcacard/Makefile
> @@ -4,14 +4,7 @@
>  
>  $(call set-vpath, $(SRC_PATH):$(SRC_PATH)/libcacard)
>  
> -ifeq ($(CONFIG_WIN32),y)
> -QEMU_THREAD=qemu-thread-win32.o
> -else
> -QEMU_THREAD=qemu-thread-posix.o
> -endif
> -
> -
> -QEMU_OBJS=$(addprefix ../, $(QEMU_THREAD) $(oslib-obj-y) $(trace-obj-y) qemu-malloc.o qemu-timer-common.o)
> +QEMU_OBJS=$(addprefix ../, $(oslib-obj-y) $(trace-obj-y) qemu-malloc.o qemu-timer-common.o)
>  
>  QEMU_CFLAGS+=-I../
>  
> -- 
> 1.7.4.4
> 
> 
> 

