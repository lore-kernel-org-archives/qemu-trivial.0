Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UhFg1-0005Bv-SM
	for mharc-qemu-trivial@gnu.org; Tue, 28 May 2013 04:54:42 -0400
Received: from eggs.gnu.org ([208.118.235.92]:37700)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1UhFfu-00052N-R4
	for qemu-trivial@nongnu.org; Tue, 28 May 2013 04:54:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1UhFfp-0002xM-0v
	for qemu-trivial@nongnu.org; Tue, 28 May 2013 04:54:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:20561)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1UhFfd-0002uZ-Bb; Tue, 28 May 2013 04:54:17 -0400
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r4S8sFpX014657
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 28 May 2013 04:54:15 -0400
Received: from yakj.usersys.redhat.com (ovpn-112-37.ams2.redhat.com
	[10.36.112.37])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r4S8s7h8014304; Tue, 28 May 2013 04:54:11 -0400
Message-ID: <51A470A9.8000502@redhat.com>
Date: Tue, 28 May 2013 10:54:01 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Alexey Kardashevskiy <aik@ozlabs.ru>
References: <1369698254-32350-1-git-send-email-aik@ozlabs.ru>
	<1369698583-32533-1-git-send-email-aik@ozlabs.ru>
In-Reply-To: <1369698583-32533-1-git-send-email-aik@ozlabs.ru>
X-Enigmail-Version: 1.5.1
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v3] qemu: fix out of tree cross compile
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
X-List-Received-Date: Tue, 28 May 2013 08:54:40 -0000

Il 28/05/2013 01:49, Alexey Kardashevskiy ha scritto:
> The symlink to "asm" platform linux headers is made in the build tree by
> the configure script but gcc is not told to look for them there.
> 
> The patch fixes this.
> 
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
> 
> The previous patch did not remove the old line adding includes. Early morning,
> lack of focus :)
> 
> ---
>  configure |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configure b/configure
> index 5ae7e4a..eca2a20 100755
> --- a/configure
> +++ b/configure
> @@ -547,7 +547,7 @@ Haiku)
>    if [ "$cpu" = "i386" -o "$cpu" = "x86_64" ] ; then
>      audio_possible_drivers="$audio_possible_drivers fmod"
>    fi
> -  QEMU_INCLUDES="-I\$(SRC_PATH)/linux-headers $QEMU_INCLUDES"
> +  QEMU_INCLUDES="-I\$(SRC_PATH)/linux-headers -I$(pwd)/linux-headers $QEMU_INCLUDES"
>  ;;
>  esac
>  
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

Paolo

