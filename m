Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iz216-0001XV-Tz
	for mharc-qemu-trivial@gnu.org; Tue, 04 Feb 2020 12:29:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37675)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1iz215-0001RI-03
 for qemu-trivial@nongnu.org; Tue, 04 Feb 2020 12:29:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1iz213-0003Sg-6G
 for qemu-trivial@nongnu.org; Tue, 04 Feb 2020 12:29:38 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:48920
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1iz213-0003Ok-1C
 for qemu-trivial@nongnu.org; Tue, 04 Feb 2020 12:29:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580837376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZubadfosTDTxtVOt8kLgLQxnfRxFqkndMKY7Cd0SmAg=;
 b=NK5PMqcblWu9ykFuyma7z/qpXhMIfAnI1RzCK/g3kdJm0YfuV42A3ID0oV4OIzkcNUgTyj
 HGwAm4ERmAHCNishk76B+yWO186v0UjDOT86RT7cLRZAZVX4ajmUSbNt2W7hb9kUPE1iwJ
 R9xlV6Tlr8uLdkpsM1WIQGqFkm/0Cfg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-q4hrFqsINmytQmvZ7bLEaA-1; Tue, 04 Feb 2020 12:29:32 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E2A81005F6E;
 Tue,  4 Feb 2020 17:29:31 +0000 (UTC)
Received: from [10.3.116.181] (ovpn-116-181.phx2.redhat.com [10.3.116.181])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5260F7FB79;
 Tue,  4 Feb 2020 17:29:28 +0000 (UTC)
Subject: Re: [PATCH] qemu-options: replace constant 1 with HAS_ARG
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, thuth@redhat.com, armbru@redhat.com
References: <20200204165638.25051-1-jsnow@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <aac4e7cc-50e0-6e36-1995-fee3f9f1747a@redhat.com>
Date: Tue, 4 Feb 2020 11:29:27 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200204165638.25051-1-jsnow@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: q4hrFqsINmytQmvZ7bLEaA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Feb 2020 17:29:40 -0000

On 2/4/20 10:56 AM, John Snow wrote:
> This is the only instance of a non-zero constant not using a symbolic
> constant.
> ---
>   qemu-options.hx | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Eric Blake <eblake@redhat.com>

> diff --git a/qemu-options.hx b/qemu-options.hx
> index 224a8e8712..ff3e806977 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -1955,7 +1955,7 @@ STEXI
>   Start in full screen.
>   ETEXI
>   
> -DEF("g", 1, QEMU_OPTION_g ,
> +DEF("g", HAS_ARG, QEMU_OPTION_g ,
>       "-g WxH[xDEPTH]  Set the initial graphical resolution and depth\n",
>       QEMU_ARCH_PPC | QEMU_ARCH_SPARC | QEMU_ARCH_M68K)
>   STEXI
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


