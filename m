Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WFRJq-0006wJ-6A
	for mharc-qemu-trivial@gnu.org; Mon, 17 Feb 2014 11:45:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52009)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1WFRJg-0006eq-4B
	for qemu-trivial@nongnu.org; Mon, 17 Feb 2014 11:45:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1WFRJX-0005O3-O0
	for qemu-trivial@nongnu.org; Mon, 17 Feb 2014 11:45:12 -0500
Received: from mail-ee0-x231.google.com ([2a00:1450:4013:c00::231]:55873)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1WFRJG-0005Aw-5b; Mon, 17 Feb 2014 11:44:46 -0500
Received: by mail-ee0-f49.google.com with SMTP id d17so7159929eek.22
	for <multiple recipients>; Mon, 17 Feb 2014 08:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=RhtZzeWDaJU3DhwZn4MirEvZPCThHaTjo97IA9lmUac=;
	b=GzTbtAqrDlVlhFnq1uR8g9yDaeotDI/XH6cz8jNfed4IpWvVRF0UrClv5tIpiCr+L+
	1MPU4LeynxT4LluDv6E7DFnrT/WJckgGZNIJzelIsZnYqXQZy+vyAsOzwQy/jY8cZaz3
	KOMO1rLEfevhuiTBDrPzqo5uKEPuwyxkax5Veg6ndK37suV9Oo2orLLFQ5Mvt9YHWQAH
	Ohzj6waawa3BoMCFW0ZrbxY7qfAdUsPFfQmQKT96c3zgtoQmrvfxii2D80Gy5prEMn7f
	0N8Hq/H0N/uhsynEWemU58dxn8keEDZLYogyIRm8UAXPTcOBgedGRyv6ZdNHgDngRRXQ
	zHNg==
X-Received: by 10.14.202.8 with SMTP id c8mr2892681eeo.88.1392655484951;
	Mon, 17 Feb 2014 08:44:44 -0800 (PST)
Received: from yakj.usersys.redhat.com
	(net-37-117-154-249.cust.vodafonedsl.it. [37.117.154.249])
	by mx.google.com with ESMTPSA id
	j42sm59684079eep.21.2014.02.17.08.44.42 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 17 Feb 2014 08:44:43 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <53023C79.70808@redhat.com>
Date: Mon, 17 Feb 2014 17:44:41 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Luiz Capitulino <lcapitulino@redhat.com>, qemu-devel@nongnu.org
References: <20140214143408.4b34d2c7@redhat.com>
In-Reply-To: <20140214143408.4b34d2c7@redhat.com>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4013:c00::231
Cc: qemu-trivial@nongnu.org, ehabkost@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] qemu-options.hx: improve -numa doc
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
X-List-Received-Date: Mon, 17 Feb 2014 16:45:20 -0000

Il 14/02/2014 20:34, Luiz Capitulino ha scritto:
> The -numa option documentation in qemu's manpage lacks the command-line
> options and some information regarding how it relates to options -m and
> -smp. This commit fills in the missing text.
>
> Signed-off-by: Luiz Capitulino <lcapitulino@redhat.com>
> ---
>  qemu-options.hx | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 56e5fdf..ed1d409 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -97,10 +97,13 @@ ETEXI
>  DEF("numa", HAS_ARG, QEMU_OPTION_numa,
>      "-numa node[,mem=size][,cpus=cpu[-cpu]][,nodeid=node]\n", QEMU_ARCH_ALL)
>  STEXI
> -@item -numa @var{opts}
> +@item -numa node[,mem=@var{size}][,cpus=@var{cpu[-cpu]}][,nodeid=@var{node}]
>  @findex -numa
> -Simulate a multi node NUMA system. If mem and cpus are omitted, resources
> -are split equally.
> +Simulate a multi node NUMA system. If @var{mem} and @var{cpus} are omitted,
> +resources are split equally. Also, note that the -@option{numa} option doesn't
> +allocate any of the specified resources. That is, it just assigns existing
> +resources to NUMA nodes. This means that one still has to use the -@option{m}
> +and -@option{smp} options to respectively allocate RAM and vCPUs.
>  ETEXI
>
>  DEF("add-fd", HAS_ARG, QEMU_OPTION_add_fd,
>

Applied to (rebased) NUMA branch.

Paolo

