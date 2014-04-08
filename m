Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WXQJU-0006Xe-3z
	for mharc-qemu-trivial@gnu.org; Tue, 08 Apr 2014 03:19:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49800)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1WXQJM-0006Of-Kv
	for qemu-trivial@nongnu.org; Tue, 08 Apr 2014 03:19:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1WXQJG-0006Eg-Ur
	for qemu-trivial@nongnu.org; Tue, 08 Apr 2014 03:19:12 -0400
Received: from mail-pa0-x22c.google.com ([2607:f8b0:400e:c03::22c]:41512)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>)
	id 1WXQJ5-0006Cc-9o; Tue, 08 Apr 2014 03:18:55 -0400
Received: by mail-pa0-f44.google.com with SMTP id bj1so636228pad.31
	for <multiple recipients>; Tue, 08 Apr 2014 00:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=jHZ6T9f56xUG7HClQoYat9qG/IXEvEHCsvRyabbpMWs=;
	b=w7AfDHxg/beFzDfhPcZf0hE5a4Igs5usRlHlGlPxfX5UqJSKTWv77hKxdbekURo215
	9hXnAOunw0cgTXC+H4nTgb6M01fc9LTsseptnywehBm7LnQ32OXyxupi73Uw2wkPJxXt
	kcOUEnH02wYy+MjVYN9i6G3nMhFROy5C6KguEsHnEKIvfp5ruheQvcnymzTIqP+iNrvT
	u/tJGPdUdBItjtPCD2ZR3EkoerC0TYnTDL/C2o2c73dG2/6GVfTiGhnMu7NwWwsrRoyS
	IxydqsjX2PpzSR0urqnA5oP50FEYh+vpx42pqeKTKaeQ8kzn/eRWbfj8AaFMihek+oxo
	q32w==
X-Received: by 10.68.220.230 with SMTP id pz6mr2648337pbc.24.1396941533876;
	Tue, 08 Apr 2014 00:18:53 -0700 (PDT)
Received: from [192.168.1.104] ([124.126.227.121])
	by mx.google.com with ESMTPSA id kc9sm2514441pbc.25.2014.04.08.00.18.48
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 08 Apr 2014 00:18:53 -0700 (PDT)
Message-ID: <5343A2D4.2070703@gmail.com>
Date: Tue, 08 Apr 2014 15:18:44 +0800
From: Chen Gang <gang.chen.5i5j@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
References: <1396940651-10513-1-git-send-email-mjt@msgid.tls.msk.ru>
	<1396940651-10513-2-git-send-email-mjt@msgid.tls.msk.ru>
In-Reply-To: <1396940651-10513-2-git-send-email-mjt@msgid.tls.msk.ru>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c03::22c
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PULL 01/11] vl: Report accelerator not
 supported for target more nicely
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
X-List-Received-Date: Tue, 08 Apr 2014 07:19:18 -0000

Thanks, and I will/should finish the left trivial patches within this
week (2014-04-13)


On 04/08/2014 03:04 PM, Michael Tokarev wrote:
> From: Chen Gang <gang.chen.5i5j@gmail.com>
> 
> When you ask for an accelerator not supported for your target, you get
> a bogus "accelerator does not exist" message:
> 
>   $ qemu-system-arm -machine none,accel=kvm
>   KVM not supported for this target
>   "kvm" accelerator does not exist.
>   No accelerator found!
> 
> Suppress it.
> 
> Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>  vl.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/vl.c b/vl.c
> index 9975e5a..db9ea90 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -2740,7 +2740,7 @@ static int configure_accelerator(QEMUMachine *machine)
>                  if (!accel_list[i].available()) {
>                      printf("%s not supported for this target\n",
>                             accel_list[i].name);
> -                    continue;
> +                    break;
>                  }
>                  *(accel_list[i].allowed) = true;
>                  ret = accel_list[i].init(machine);
> 

-- 
Chen Gang

Open, share, and attitude like air, water, and life which God blessed

