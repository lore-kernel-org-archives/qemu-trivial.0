Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RNLOi-0007mQ-QZ
	for mharc-qemu-trivial@gnu.org; Mon, 07 Nov 2011 04:21:44 -0500
Received: from eggs.gnu.org ([140.186.70.92]:34728)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RNLOY-00078Y-7U
	for qemu-trivial@nongnu.org; Mon, 07 Nov 2011 04:21:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RNLOV-0001No-Lp
	for qemu-trivial@nongnu.org; Mon, 07 Nov 2011 04:21:34 -0500
Received: from mail-fx0-f45.google.com ([209.85.161.45]:56270)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RNLOV-0001L3-Er
	for qemu-trivial@nongnu.org; Mon, 07 Nov 2011 04:21:31 -0500
Received: by mail-fx0-f45.google.com with SMTP id p15so5986632faa.4
	for <qemu-trivial@nongnu.org>; Mon, 07 Nov 2011 01:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=pDSQva4XtAd+Qv8IiN0ZE3Wfu8HCMIsiGTWpmU44+Pc=;
	b=GeqoCgoelu1L+X3Z6hygXHgSPSeMSJ9k5hswdvE89Jr/aJXsYx30BacQEs/MVmUKpI
	fKuxvpFtz0bf9yf4g0D1wscJeHs79kj/wcnRgQSRXmnHMRreHvCuaPB4a7ByFXRb94cS
	h2g+I1Yem0ccBatSR8d3GKNLOW80OS+2oX6Lk=
Received: by 10.223.14.3 with SMTP id e3mr46653199faa.25.1320657691050;
	Mon, 07 Nov 2011 01:21:31 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id
	a21sm30503061fao.18.2011.11.07.01.21.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 Nov 2011 01:21:30 -0800 (PST)
Date: Mon, 7 Nov 2011 08:25:38 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Chen Wen-Ren <chenwj@iis.sinica.edu.tw>
Message-ID: <20111107082538.GF9450@stefanha-thinkpad.localdomain>
References: <1320481099-39231-1-git-send-email-chenwj@iis.sinica.edu.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1320481099-39231-1-git-send-email-chenwj@iis.sinica.edu.tw>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.161.45
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 2/2] linux-user/main.c: Add option to
 user-mode emulation so that user can specify log file name
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
X-List-Received-Date: Mon, 07 Nov 2011 09:21:43 -0000

On Sat, Nov 05, 2011 at 04:18:19PM +0800, Chen Wen-Ren wrote:
>   Add an option so that user can specify the log file name they want.
> 
> Signed-off-by: Chen Wen-Ren <chenwj@iis.sinica.edu.tw>
> ---
>  linux-user/main.c |    8 ++++++++
>  1 files changed, 8 insertions(+), 0 deletions(-)
> 
> diff --git a/linux-user/main.c b/linux-user/main.c
> index d1bbc57..c275c0b 100644
> --- a/linux-user/main.c
> +++ b/linux-user/main.c
> @@ -45,6 +45,7 @@ int gdbstub_port;
>  envlist_t *envlist;
>  const char *cpu_model;
>  unsigned long mmap_min_addr;
> +extern const char *logfilename;

linux-user/main.c already uses cpu_set_log_filename(log_file).  It
should not be necessary to make exec.c:logfilename global.

Take a look at how bsd-user/main.c does what you're trying to do.

Please send the patch through the linux-user maintainer, Riku Voipio
<riku.voipio@iki.fi>, since this adds a user-visible command-line
option.

Stefan

