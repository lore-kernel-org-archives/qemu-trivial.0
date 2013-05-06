Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UZOFA-0004WS-08
	for mharc-qemu-trivial@gnu.org; Mon, 06 May 2013 12:26:28 -0400
Received: from eggs.gnu.org ([208.118.235.92]:54023)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1UZOF8-0004WJ-0Y
	for qemu-trivial@nongnu.org; Mon, 06 May 2013 12:26:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1UZOF6-0006Ip-O9
	for qemu-trivial@nongnu.org; Mon, 06 May 2013 12:26:25 -0400
Received: from mail-yh0-x236.google.com ([2607:f8b0:4002:c01::236]:58266)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1UZOF6-0006If-I4; Mon, 06 May 2013 12:26:24 -0400
Received: by mail-yh0-f54.google.com with SMTP id b12so743368yha.13
	for <multiple recipients>; Mon, 06 May 2013 09:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=Ik/V7K8/mF81o5OOAIauuhsy1ks7tJ56xZXs4WXMG+s=;
	b=NwaYw+FQOlgUhKnptwiA3SZiRZ0qrsI7y5WzW4EZLS7GsrsnJC9h/z5wILBvpy5uNn
	eqsZifpZE7IpveHiMnDHxDEc+JEbAW3fxHm2kOcWGB5+otJIoWmT7vwQoLK9QzbMIfPq
	dFYXZn/K6JtAt30NFruwVtBDwPnDjz0smMkSvj8cWcAvVjoPmkwoxdXQehEq1NWRmzpm
	ghqO3SK12F4Q7sVLi6rkDX09leYYCQ/fghEK56+RHwUEgoCRyduI/UblNuKhWhx2t+kU
	mYqqB2ao/8C/8YTBN9k6hfRqu6btPc0yEMifWeF2UIXNd3VO09v7Fr3M6aTQtA47WDE/
	xR8Q==
X-Received: by 10.236.111.112 with SMTP id v76mr18881921yhg.20.1367857584161; 
	Mon, 06 May 2013 09:26:24 -0700 (PDT)
Received: from yakj.usersys.redhat.com (93-34-176-20.ip50.fastwebnet.it.
	[93.34.176.20])
	by mx.google.com with ESMTPSA id n15sm48576298yhi.2.2013.05.06.09.26.22
	for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 06 May 2013 09:26:23 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <5187D9A6.6050807@redhat.com>
Date: Mon, 06 May 2013 18:26:14 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130311 Thunderbird/17.0.4
MIME-Version: 1.0
To: Jan Kiszka <jan.kiszka@siemens.com>
References: <5187D529.7010502@siemens.com>
In-Reply-To: <5187D529.7010502@siemens.com>
X-Enigmail-Version: 1.5.1
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4002:c01::236
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] memory: Replace open-coded
	memory_region_is_romd
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
X-List-Received-Date: Mon, 06 May 2013 16:26:27 -0000

Il 06/05/2013 18:07, Jan Kiszka ha scritto:
> Improves readability.
> 
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>  translate-all.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/translate-all.c b/translate-all.c
> index da93608..0d84b0d 100644
> --- a/translate-all.c
> +++ b/translate-all.c
> @@ -1359,7 +1359,7 @@ void tb_invalidate_phys_addr(hwaddr addr)
>      section = phys_page_find(address_space_memory.dispatch,
>                               addr >> TARGET_PAGE_BITS);
>      if (!(memory_region_is_ram(section->mr)
> -          || (section->mr->rom_device && section->mr->readable))) {
> +          || memory_region_is_romd(section->mr))) {
>          return;
>      }
>      ram_addr = (memory_region_get_ram_addr(section->mr) & TARGET_PAGE_MASK)
> 

Not trivial enough for qemu-trivial, let's open a memory branch for 1.6.

Any volunteers for co-maintaining it? :)

Paolo

