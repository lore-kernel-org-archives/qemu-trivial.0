Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VINkJ-0008Uz-C2
	for mharc-qemu-trivial@gnu.org; Sat, 07 Sep 2013 15:00:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32804)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1VINkC-0008Ms-Hh
	for qemu-trivial@nongnu.org; Sat, 07 Sep 2013 15:00:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1VINk7-0000Ia-67
	for qemu-trivial@nongnu.org; Sat, 07 Sep 2013 15:00:28 -0400
Received: from v220110690675601.yourvserver.net ([37.221.199.173]:56391)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1VINjw-0000Fv-56; Sat, 07 Sep 2013 15:00:12 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	96ADB72819E7; Sat,  7 Sep 2013 21:00:09 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id 1AzfrmxJGD9f; Sat,  7 Sep 2013 21:00:07 +0200 (CEST)
Received: from [192.168.178.35] (p54AD9804.dip0.t-ipconnect.de [84.173.152.4])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	91C9872819DE; Sat,  7 Sep 2013 21:00:07 +0200 (CEST)
Message-ID: <522B77B7.8010700@weilnetz.de>
Date: Sat, 07 Sep 2013 21:00:07 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130803 Thunderbird/17.0.8
MIME-Version: 1.0
To: qemu-trivial <qemu-trivial@nongnu.org>
References: <1374769498-22383-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1374769498-22383-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.4.6
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.199.173
Cc: qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] Makefile: Remove some more files when
	cleaning
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
X-List-Received-Date: Sat, 07 Sep 2013 19:00:34 -0000

Am 25.07.2013 18:24, schrieb Stefan Weil:
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  Makefile |    4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 29f1043..80aeb18 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -237,7 +237,8 @@ clean:
>  	find . -name '*.[oda]' -type f -exec rm -f {} +
>  	find . -name '*.l[oa]' -type f -exec rm -f {} +
>  	rm -f $(TOOLS) $(HELPERS-y) qemu-ga TAGS cscope.* *.pod *~ */*~
> -	rm -Rf .libs
> +	rm -f fsdev/*.pod
> +	rm -rf .libs */.libs
>  	rm -f qemu-img-cmds.h
>  	@# May not be present in GENERATED_HEADERS
>  	rm -f trace/generated-tracers-dtrace.dtrace*
> @@ -262,6 +263,7 @@ qemu-%.tar.bz2:
>  distclean: clean
>  	rm -f config-host.mak config-host.h* config-host.ld $(DOCS) qemu-options.texi qemu-img-cmds.texi qemu-monitor.texi
>  	rm -f config-all-devices.mak config-all-disas.mak
> +	rm -f po/*.mo
>  	rm -f roms/seabios/config.mak roms/vgabios/config.mak
>  	rm -f qemu-doc.info qemu-doc.aux qemu-doc.cp qemu-doc.cps qemu-doc.dvi
>  	rm -f qemu-doc.fn qemu-doc.fns qemu-doc.info qemu-doc.ky qemu-doc.kys


Ping?


