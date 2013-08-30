Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VFQta-0007YO-5L
	for mharc-qemu-trivial@gnu.org; Fri, 30 Aug 2013 11:45:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42093)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1VFQtS-0007Pq-Db
	for qemu-trivial@nongnu.org; Fri, 30 Aug 2013 11:45:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1VFQtM-0006dz-Kg
	for qemu-trivial@nongnu.org; Fri, 30 Aug 2013 11:45:50 -0400
Received: from mail-qe0-x22a.google.com ([2607:f8b0:400d:c02::22a]:63097)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1VFQtA-0006cJ-Qa; Fri, 30 Aug 2013 11:45:32 -0400
Received: by mail-qe0-f42.google.com with SMTP id w7so1061928qeb.29
	for <multiple recipients>; Fri, 30 Aug 2013 08:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=Alcw5fmdvP+bPOq3npcs+HnxC7VoqW6mKRupADuh/mc=;
	b=XhcJTfo7EETQ39UwHWLuLi0D28TyFzNaHINsH6Ucg6MiC5D14gwOLqBZPKkHwuEQLL
	bibEtUD3A+g6yhqG7GdkTePz7dPZ/6IaHXdF9LAVquNPUiNkaTIjn4LO39trtTVnCBcA
	2fvAT/usheNW8tgM5wwbXtsMC9cAXkbGrm4KEhJBH2ZEI5J+HgaTrEYJ6SjQKkJoE00h
	6F93oi78NoySR+slxsl128qvIGWOWoC7qSjJSPEWDaAvSqOUi6lbdnX5MPH7FmdqJr8I
	vffsqN0EXZMIl5CyP/zuxsk3GTHWN5Xt7tVyixTSqUj4UDmLtT+H/3++0HAaXKMhbGEg
	GTcg==
X-Received: by 10.224.8.72 with SMTP id g8mr12691928qag.18.1377877532339;
	Fri, 30 Aug 2013 08:45:32 -0700 (PDT)
Received: from yakj.usersys.redhat.com
	(net-37-117-144-28.cust.dsl.vodafone.it. [37.117.144.28])
	by mx.google.com with ESMTPSA id m5sm52743171qaa.13.1969.12.31.16.00.00
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 30 Aug 2013 08:45:31 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <5220BE16.6090103@redhat.com>
Date: Fri, 30 Aug 2013 17:45:26 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: =?UTF-8?B?SGVydsOpIFBvdXNzaW5lYXU=?= <hpoussin@reactos.org>
References: <1376390314-17544-1-git-send-email-hpoussin@reactos.org>
In-Reply-To: <1376390314-17544-1-git-send-email-hpoussin@reactos.org>
X-Enigmail-Version: 1.5.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c02::22a
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: [Qemu-trivial] PING Re: [PATCH for-1.6] isa: fix documentation of
	isa_register_portio_list
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
X-List-Received-Date: Fri, 30 Aug 2013 15:45:56 -0000

Il 13/08/2013 12:38, Hervé Poussineau ha scritto:
> 
> Signed-off-by: Hervé Poussineau <hpoussin@reactos.org>
> ---
>  include/hw/isa/isa.h |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/hw/isa/isa.h b/include/hw/isa/isa.h
> index 495bcf3..fa45a5b 100644
> --- a/include/hw/isa/isa.h
> +++ b/include/hw/isa/isa.h
> @@ -78,7 +78,7 @@ void isa_register_ioport(ISADevice *dev, MemoryRegion *io, uint16_t start);
>   * @dev: the ISADevice against which these are registered; may be NULL.
>   * @start: the base I/O port against which the portio->offset is applied.
>   * @portio: the ports, sorted by offset.
> - * @opaque: passed into the old_portio callbacks.
> + * @opaque: passed into the portio callbacks.
>   * @name: passed into memory_region_init_io.
>   */
>  void isa_register_portio_list(ISADevice *dev, uint16_t start,
> 

Ping.

Paolo

