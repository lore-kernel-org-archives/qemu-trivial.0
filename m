Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UmTAV-0007JJ-2h
	for mharc-qemu-trivial@gnu.org; Tue, 11 Jun 2013 14:19:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33962)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UmTAO-000790-Bf
	for qemu-trivial@nongnu.org; Tue, 11 Jun 2013 14:19:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UmTAM-0004vX-F2
	for qemu-trivial@nongnu.org; Tue, 11 Jun 2013 14:19:36 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:59968)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UmTAJ-0004ti-F7; Tue, 11 Jun 2013 14:19:31 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 8C4F0412FA;
	Tue, 11 Jun 2013 22:19:22 +0400 (MSK)
Message-ID: <51B76A28.5030008@msgid.tls.msk.ru>
Date: Tue, 11 Jun 2013 22:19:20 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/17.0 Icedove/17.0
MIME-Version: 1.0
To: "M. Mohan Kumar" <mohan@in.ibm.com>
References: <1370897240-23490-1-git-send-email-mjt@msgid.tls.msk.ru>
	<CAFEAcA88zpSQTLWSwu6ci7rytTMxkWWqjE4jfb=0Svj+9P8NsQ@mail.gmail.com>
	<51B7183E.6070203@msgid.tls.msk.ru>
	<CAFEAcA8g7Ck_vdAraiEsKdYBi=VM8PRTCrA9UnA6GAa+JgXUoQ@mail.gmail.com>
	<87ehc8tvd5.fsf@gmail.com>
In-Reply-To: <87ehc8tvd5.fsf@gmail.com>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH trivial] configure:
 explicitly disable virtfs if softmmu=no
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
X-List-Received-Date: Tue, 11 Jun 2013 18:19:41 -0000

11.06.2013 21:23, M. Mohan Kumar wrote:
> Peter Maydell <peter.maydell@linaro.org> writes:
> 
> How about this approach?

Well, this is definitely wrong :)

> -if test "$softmmu" = yes ; then
> -  if test "$virtfs" != no ; then
> +
> +if test "$virtfs" != no ; then
> +  if test "$softmmu" = yes ; then
>      if test "$cap" = yes && test "$linux" = yes && test "$attr" = yes ; then
>        virtfs=yes
>        tools="$tools fsdev/virtfs-proxy-helper\$(EXESUF)"
> @@ -3415,6 +3416,12 @@ if test "$softmmu" = yes ; then
>        fi
>        virtfs=no
>      fi
> +  else
> +    if test "$virtfs" = yes; then
> +      error_exit "VirtFS is supported only on Linux and requires softmmu"
> +    else
> +     virtfs=no
> +    fi
>    fi
>    if [ "$linux" = "yes" -o "$bsd" = "yes" -o "$solaris" = "yes" ] ; then
>      if [ "$guest_agent" = "yes" ]; then

Now this "if [ $linux..." test is only checked
if $virtfs != no.  Before, it was checked when
$softmmu != no...

FWIW, I still don't understand what Peter Maydell dislikes
in a simplest case I posted initially, where we merely ignore
(disable) virtfs in case !softmmu.  We should probably do the
same for alot of other features which makes sense only if
softmmu==yes, and omit many configure tests which are still
done even if softmmu is disabled, but that's a different
patch for sure.  Maube we should separate out this last linux|bsd|solaris
test and add another if softmmu there, for readability, so that
disabling of virtfs will be closer to other virtfs tests.

I applied my initial patch to our debian tree to fix build
failure for now, because else it fails during build.

Thanks,

/mjt


