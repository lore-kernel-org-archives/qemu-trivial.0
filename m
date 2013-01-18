Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TwCEz-0005hh-BS
	for mharc-qemu-trivial@gnu.org; Fri, 18 Jan 2013 08:44:17 -0500
Received: from eggs.gnu.org ([208.118.235.92]:34414)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TwCEw-0005hY-L4
	for qemu-trivial@nongnu.org; Fri, 18 Jan 2013 08:44:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TwCEo-0004yp-Vw
	for qemu-trivial@nongnu.org; Fri, 18 Jan 2013 08:44:14 -0500
Received: from mail-bk0-f48.google.com ([209.85.214.48]:35780)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TwCEo-0004ya-PK; Fri, 18 Jan 2013 08:44:06 -0500
Received: by mail-bk0-f48.google.com with SMTP id jc3so1999803bkc.21
	for <multiple recipients>; Fri, 18 Jan 2013 05:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=dNflpV+ZYfyrlUGSultbw8DyqjIHowOMyXM5aGzk6dA=;
	b=zcEv6awkELt7wfEV5K9T1P8x6HA2u7I7nHbAkTpQCTGn0F89zpjjYKdMDrGlQnWzID
	wCfFSPJ/d+eHw5gUXC3O8R9Tdl+LxvE7zKOg+CaDyMQmx+LfQieHIoc2xfsBplPqd6fT
	fawM/5x8bP1at4F4kiwQDFJp25lro/C9FlTmVRucKap9nHi4UjabwOrKi3QUwg1bzwzg
	pZ9rmfvQiAn/6thcuq6DP3l5Tf63B+LCDTMXWDuX5cnWxPff1+l+4oL3KijdXO6DQeko
	a3VxC+sUCZL2siIidG/SMMOqO+lNYDYMksiNiLkKfkQrHHv+ihTKoAVtzGllawUkjbKz
	3Osw==
X-Received: by 10.204.130.75 with SMTP id r11mr656353bks.138.1358516645626;
	Fri, 18 Jan 2013 05:44:05 -0800 (PST)
Received: from localhost (178-26-141-215-dynip.superkabel.de. [178.26.141.215])
	by mx.google.com with ESMTPS id c10sm3880258bkw.1.2013.01.18.05.44.04
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 18 Jan 2013 05:44:04 -0800 (PST)
Date: Fri, 18 Jan 2013 14:44:02 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <20130118134402.GC24367@stefanha-thinkpad.redhat.com>
References: <1358420032-25275-1-git-send-email-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1358420032-25275-1-git-send-email-mjt@msgid.tls.msk.ru>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.214.48
Cc: qemu-trivial@nongnu.org, TeLeMan <geleman@gmail.com>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [Trivial PATCH] acpitable: open the
 data file in binary mode
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
X-List-Received-Date: Fri, 18 Jan 2013 13:44:15 -0000

On Thu, Jan 17, 2013 at 02:53:52PM +0400, Michael Tokarev wrote:
> -acpitable {file|data}=file reads the content of file, but it is
> in binary form, so the file should be opened usin O_BINARY flag.
> On *nix it is a no-op, but on windows and other weird platform
> it is really needed.
> 
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>  hw/acpi.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

