Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Tvng8-00076Q-Ea
	for mharc-qemu-trivial@gnu.org; Thu, 17 Jan 2013 06:30:40 -0500
Received: from eggs.gnu.org ([208.118.235.92]:48769)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Tvng5-0006xM-FT
	for qemu-trivial@nongnu.org; Thu, 17 Jan 2013 06:30:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Tvng0-00049i-Br
	for qemu-trivial@nongnu.org; Thu, 17 Jan 2013 06:30:37 -0500
Received: from mail-wi0-x22a.google.com ([2a00:1450:400c:c05::22a]:48265)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1Tvnfr-00048A-Aq; Thu, 17 Jan 2013 06:30:23 -0500
Received: by mail-wi0-f170.google.com with SMTP id hq7so4493934wib.5
	for <multiple recipients>; Thu, 17 Jan 2013 03:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=uQjCbBkhWRjLB0j0hu2JbPcskl3nbewTccZiqRF3k5c=;
	b=tvw7cOQdhiKDl+pPoG2lTbToKRfCr+HoAxfIPpnjxrKVIOetQ/WD/JHGAmiKTxfkKf
	ah7kbXFaOSG7NXgEWpqU4jPFnxHxjKmXyKufdEr4DfTtapmjjvC/CfKk1pj/EJokUcBX
	J9BmFTy3UvXcs+MP4aUR1K1sk84C6V8b+Cav2GSbMGQjytCewos7JzmQN1Jp//V3ui80
	+jcLaBocAvGCQGay1DUv0cvbp4KjUfoynZjz1laoxZYnM9thG/FOc3A2c75dcDTPy2R6
	yuj/+mwxakAefc7pEwhfsNBOS9fRqIm8MvqrUQIs+BvxJXoP++vC4J0ouhomhUCC8K8J
	8S0A==
X-Received: by 10.180.82.69 with SMTP id g5mr15462476wiy.21.1358421863059;
	Thu, 17 Jan 2013 03:24:23 -0800 (PST)
Received: from localhost (178-26-141-215-dynip.superkabel.de. [178.26.141.215])
	by mx.google.com with ESMTPS id dm3sm12465480wib.9.2013.01.17.03.24.21
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 17 Jan 2013 03:24:22 -0800 (PST)
Date: Thu, 17 Jan 2013 12:24:20 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20130117112420.GJ2586@stefanha-thinkpad.redhat.com>
References: <1358357540-29862-1-git-send-email-armbru@redhat.com>
	<1358357540-29862-9-git-send-email-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1358357540-29862-9-git-send-email-armbru@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::22a
Cc: qemu-trivial@nongnu.org, eblake@redhat.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v2 08/11] qemu-log: Plug trivial memory
 leak in cpu_set_log_filename()
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
X-List-Received-Date: Thu, 17 Jan 2013 11:30:39 -0000

On Wed, Jan 16, 2013 at 06:32:17PM +0100, Markus Armbruster wrote:
> diff --git a/qemu-log.c b/qemu-log.c
> index 64a1b88..30c8b01 100644
> --- a/qemu-log.c
> +++ b/qemu-log.c
> @@ -21,10 +21,12 @@
>  #include "qemu/log.h"
>  
>  #ifdef WIN32
> -static const char *logfilename = "qemu.log";
> +#define DEFAULT_LOGFILENAME "qemu.log"
>  #else
> -static const char *logfilename = "/tmp/qemu.log";
> +#define DEFAULT_LOGFILENAME "/tmp/qemu.log"
>  #endif
> +
> +static const char *logfilename;
[...]
> @@ -84,6 +88,7 @@ void qemu_set_log(int log_flags, bool use_own_buffers)
>  
>  void cpu_set_log_filename(const char *filename)
>  {
> +    g_free((void *)logfilename);

Might as well drop the const from the variable declaration to indicate
that we allocate/free this string.

Stefan

