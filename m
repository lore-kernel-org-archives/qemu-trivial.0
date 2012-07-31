Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SwDJE-00039P-Nw
	for mharc-qemu-trivial@gnu.org; Tue, 31 Jul 2012 10:20:28 -0400
Received: from eggs.gnu.org ([208.118.235.92]:49778)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1SwDJ5-0002nf-UK
	for qemu-trivial@nongnu.org; Tue, 31 Jul 2012 10:20:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1SwDIs-0006Ql-PU
	for qemu-trivial@nongnu.org; Tue, 31 Jul 2012 10:20:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:30142)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1SwDIe-0006Gy-Ss; Tue, 31 Jul 2012 10:19:53 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q6VEJnWj002738
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 31 Jul 2012 10:19:49 -0400
Received: from blackfin.pond.sub.org (ovpn-116-60.ams2.redhat.com
	[10.36.116.60])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q6VEJmQt010916; Tue, 31 Jul 2012 10:19:48 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id A479D20057; Tue, 31 Jul 2012 16:19:47 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
References: <1343739695-7757-1-git-send-email-peter.maydell@linaro.org>
Date: Tue, 31 Jul 2012 16:19:47 +0200
In-Reply-To: <1343739695-7757-1-git-send-email-peter.maydell@linaro.org>
	(Peter Maydell's message of "Tue, 31 Jul 2012 14:01:35 +0100")
Message-ID: <87pq7c9fng.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: patches@linaro.org, qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	qemu-devel@nongnu.org, Jan Kiszka <jan.kiszka@siemens.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Makefile: Avoid explicit
	list of directories in clean target
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
X-List-Received-Date: Tue, 31 Jul 2012 14:20:27 -0000

Peter Maydell <peter.maydell@linaro.org> writes:

> Avoid having an explicit list of directories in the 'clean'
> target by using 'find' to remove all .o and .d files instead.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I figured that (unlike Makefile.target) we should probably take
> the xargs route here since otherwise the rm command line is huge...
>
> There's also an argument that there's not much point having a clean
> target in Makefile.target when this one blows away most of it anyway.
>
>  Makefile |    7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 621cb86..9f7eaa8 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -212,13 +212,10 @@ clean:
>  # avoid old build problems by removing potentially incorrect old files
>  	rm -f config.mak op-i386.h opc-i386.h gen-op-i386.h op-arm.h opc-arm.h gen-op-arm.h
>  	rm -f qemu-options.def
> -	rm -f *.o *.d *.a *.lo $(TOOLS) $(HELPERS-y) qemu-ga TAGS cscope.* *.pod *~ */*~
> +	find . -name '*.[od]' | xargs rm -f
> +	rm -f *.a *.lo $(TOOLS) $(HELPERS-y) qemu-ga TAGS cscope.* *.pod *~ */*~

Shit happens if you somehow manage to create a "mean" file name in the
build tree.  Sure you don't want to -print0 | xargs -0?

>  	rm -Rf .libs
> -	rm -f slirp/*.o slirp/*.d audio/*.o audio/*.d block/*.o block/*.d net/*.o net/*.d fsdev/*.o fsdev/*.d ui/*.o ui/*.d qapi/*.o qapi/*.d qga/*.o qga/*.d
> -	rm -f qom/*.o qom/*.d
> -	rm -f usb/*.o usb/*.d hw/*.o hw/*.d
>  	rm -f qemu-img-cmds.h
> -	rm -f trace/*.o trace/*.d
>  	rm -f trace-dtrace.dtrace trace-dtrace.dtrace-timestamp
>  	@# May not be present in GENERATED_HEADERS
>  	rm -f trace-dtrace.h trace-dtrace.h-timestamp

