Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wnwe6-0001HR-8J
	for mharc-qemu-trivial@gnu.org; Fri, 23 May 2014 17:04:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50177)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Wnwdy-00018Y-RD
	for qemu-trivial@nongnu.org; Fri, 23 May 2014 17:04:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Wnwdt-0000hi-6v
	for qemu-trivial@nongnu.org; Fri, 23 May 2014 17:04:46 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:36503)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Wnwdi-0000gp-1k; Fri, 23 May 2014 17:04:30 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 5F69242B94;
	Sat, 24 May 2014 01:04:29 +0400 (MSK)
Message-ID: <537FB7DD.6080302@msgid.tls.msk.ru>
Date: Sat, 24 May 2014 01:04:29 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.5.0
MIME-Version: 1.0
To: Le Tan <tamlokveer@gmail.com>, qemu-devel@nongnu.org
References: <y> <cover.1399641611.git.tamlokveer@gmail.com>
	<859e114fe7fcfbd22eddfb8cde3846662598c564.1399641611.git.tamlokveer@gmail.com>
In-Reply-To: <859e114fe7fcfbd22eddfb8cde3846662598c564.1399641611.git.tamlokveer@gmail.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, jan.kiszka@web.de, afaerber@suse.de
Subject: Re: [Qemu-trivial] [PATCH 2/4] audio: replace fprintf(stderr,
 ...) with error_report() in audio
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
X-List-Received-Date: Fri, 23 May 2014 21:04:52 -0000

10.05.2014 03:55, Le Tan wrote:
> Replace fprintf(stderr,...) with error_report() in files audio/*.
> The trailing "\n"s of the @fmt argument have been removed
> because @fmt of error_report() should not contain newline.

Please always check your patches using ./scripts/checkpatch.pl.

I've applied this your patch to -trivial, after fixing this
place:

> --- a/audio/wavcapture.c
> +++ b/audio/wavcapture.c
> @@ -63,8 +63,8 @@ static void wav_destroy (void *opaque)
>          }
>      doclose:
>          if (fclose (wav->f)) {
> -            fprintf (stderr, "wav_destroy: fclose failed: %s",
> -                     strerror (errno));
> +            error_report("wav_destroy: fclose failed: %s",
> +                         strerror (errno));

to not contain an extra space after strerror, and folding whole
thing into one line.  Yes, the code around has the same style,
but the usual rule is that you fix style issues in the code
you touch, to comply with the coding style used in qemu.

Thanks,

/mjt

