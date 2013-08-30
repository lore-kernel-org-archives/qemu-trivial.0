Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VFQtI-0007GK-Cc
	for mharc-qemu-trivial@gnu.org; Fri, 30 Aug 2013 11:45:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41998)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1VFQtB-0007BW-Bm
	for qemu-trivial@nongnu.org; Fri, 30 Aug 2013 11:45:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1VFQt5-0006b2-SD
	for qemu-trivial@nongnu.org; Fri, 30 Aug 2013 11:45:33 -0400
Received: from mail-qe0-x229.google.com ([2607:f8b0:400d:c02::229]:44405)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1VFQsr-0006Y2-8f; Fri, 30 Aug 2013 11:45:13 -0400
Received: by mail-qe0-f41.google.com with SMTP id ff1so1308901qeb.28
	for <multiple recipients>; Fri, 30 Aug 2013 08:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=HxhTXow1RA67iOaHIcnW/Oar/t0sk3XW6HOMdXUinBc=;
	b=In27W9jVxDq3t0N5Jd2/wujCwlfBCAEviwOV0i0bWh87Cg6+bE1HLk/ti1rlHHAUF1
	kfxYvEsDzYKgf3RXgZT0hC5uQ8Ie6RuhWC1vubMBxEv7dRVMLbi5BOTfvEOSV1GK0lRD
	3h+30ZA69hY1K/iKFUhmxTrvO+EhYh+a/80/fJaQYzdLq+HazpcIRbwPk7HrQEht7Act
	4UMfVjYsdBMeFGBawUQ7AqV/MMcqE2mxgqdehwe+Ie62/trpCtwKOdyFpCXuF+V5XFlb
	UplO08x9y6cz/1MrJK3sT6wWxv66RPlZlLzOFLOdr/A5iCdLP8kL7rX5lTd9mMFOX/HU
	8sdQ==
X-Received: by 10.49.47.84 with SMTP id b20mr9794237qen.83.1377877512222;
	Fri, 30 Aug 2013 08:45:12 -0700 (PDT)
Received: from yakj.usersys.redhat.com
	(net-37-117-144-28.cust.dsl.vodafone.it. [37.117.144.28])
	by mx.google.com with ESMTPSA id a7sm50802992qeg.2.1969.12.31.16.00.00
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 30 Aug 2013 08:45:10 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <5220BDFF.2010906@redhat.com>
Date: Fri, 30 Aug 2013 17:45:03 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: =?UTF-8?B?SGVydsOpIFBvdXNzaW5lYXU=?= <hpoussin@reactos.org>
References: <1376473744-18435-1-git-send-email-hpoussin@reactos.org>
In-Reply-To: <1376473744-18435-1-git-send-email-hpoussin@reactos.org>
X-Enigmail-Version: 1.5.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c02::229
Cc: qemu-trivial@nongnu.org, aliguori@us.ibm.com, av1474@comtv.ru,
	qemu-devel@nongnu.org, qemu-stable@nongnu.org
Subject: [Qemu-trivial] PING Re: [PATCH for-1.6] adlib: sort offsets in
	portio registration
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
X-List-Received-Date: Fri, 30 Aug 2013 15:45:39 -0000

Il 14/08/2013 11:49, Hervé Poussineau ha scritto:
> This fixes the following assert when -device adlib is used:
> ioport.c:240: portio_list_add: Assertion `pio->offset >= off_last' failed.
> 
> Signed-off-by: Hervé Poussineau <hpoussin@reactos.org>
> ---
>  hw/audio/adlib.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/audio/adlib.c b/hw/audio/adlib.c
> index 0421d47..db4a953 100644
> --- a/hw/audio/adlib.c
> +++ b/hw/audio/adlib.c
> @@ -284,9 +284,9 @@ static void Adlib_fini (AdlibState *s)
>  }
>  
>  static MemoryRegionPortio adlib_portio_list[] = {
> -    { 0x388, 4, 1, .read = adlib_read, .write = adlib_write, },
>      { 0, 4, 1, .read = adlib_read, .write = adlib_write, },
>      { 0, 2, 1, .read = adlib_read, .write = adlib_write, },
> +    { 0x388, 4, 1, .read = adlib_read, .write = adlib_write, },
>      PORTIO_END_OF_LIST(),
>  };
>  
> 

Ping, and Cc to qemu-stable

