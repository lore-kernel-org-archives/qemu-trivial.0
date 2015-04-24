Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YliqY-0005oy-Uw
	for mharc-qemu-trivial@gnu.org; Fri, 24 Apr 2015 15:01:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56824)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1YliqU-0005mA-Af
	for qemu-trivial@nongnu.org; Fri, 24 Apr 2015 15:01:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1YliqR-000203-3A
	for qemu-trivial@nongnu.org; Fri, 24 Apr 2015 15:01:02 -0400
Received: from mail-qg0-f44.google.com ([209.85.192.44]:36670)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1YliqQ-0001zu-Vc
	for qemu-trivial@nongnu.org; Fri, 24 Apr 2015 15:00:59 -0400
Received: by qgeb100 with SMTP id b100so27088509qge.3
	for <qemu-trivial@nongnu.org>; Fri, 24 Apr 2015 12:00:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=3erTfJJWMyKoGSrs2rg1w9HmXj4yprrc4b+j0fk/0aE=;
	b=hDnUw3qFo7NzhCCl8M/dvwYyTK/1HVPiYpNGvOdZd5jifFq7NfoXWRA+kf6f/EqOag
	pDvBEyyQq+uXaZr7MKMjIHhsUFWFpzPlcE8Lz03QfYVfCk7et3+ju3Xl2X4aiPX3oxBE
	oGhHmaa5hnkiFi4vWxl7NOODCnXnT2vHo9P/x26hHtrIMhRRiQzLbq7qxTH491GNxnjr
	Ov8yxNG+1HtRmY4TRXPzJqpORiwfsrExrA26uKKfdACbaVNVZ5t80HLHbhuRhsFLGZCs
	QDiCGLHUGfutvk600L9H7SjvrRclX6n5aJELNoODEvr0XkOWc/aZGvg7S1H+WYtNmzg1
	shhw==
X-Gm-Message-State: ALoCoQnGzaij3+fwngDwdAOul6DTVX/z7h/3lzfb51sH7vMteUfkckvcJbgJ6bKPT3OPUtshAwk7
MIME-Version: 1.0
X-Received: by 10.55.40.132 with SMTP id o4mr18198011qko.61.1429902058200;
	Fri, 24 Apr 2015 12:00:58 -0700 (PDT)
Sender: peter.crosthwaite@petalogix.com
Received: by 10.96.97.41 with HTTP; Fri, 24 Apr 2015 12:00:58 -0700 (PDT)
In-Reply-To: <553A8046.7080709@siemens.com>
References: <553A8046.7080709@siemens.com>
Date: Fri, 24 Apr 2015 12:00:58 -0700
X-Google-Sender-Auth: 1qw-aGRlouAQzoWZS149w-Bplig
Message-ID: <CAEgOgz6x6y5wFu8mjwjUK2r=FX+oNKLrWGuG5aT7cFaFOYKFew@mail.gmail.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.192.44
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hostmem: Fix mem-path
	property name in error report
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
X-List-Received-Date: Fri, 24 Apr 2015 19:01:06 -0000

On Fri, Apr 24, 2015 at 10:41 AM, Jan Kiszka <jan.kiszka@siemens.com> wrote:
> The subtle difference between "property not found" and "property not
> set" is already confusing enough.
>
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>

Reviewed-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>

> ---
>  backends/hostmem-file.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/backends/hostmem-file.c b/backends/hostmem-file.c
> index 5179994..4b55361 100644
> --- a/backends/hostmem-file.c
> +++ b/backends/hostmem-file.c
> @@ -43,7 +43,7 @@ file_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
>          return;
>      }
>      if (!fb->mem_path) {
> -        error_setg(errp, "mem_path property not set");
> +        error_setg(errp, "mem-path property not set");
>          return;
>      }
>  #ifndef CONFIG_LINUX
> --
> 2.1.4
>

