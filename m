Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ipzbT-000876-51
	for mharc-qemu-trivial@gnu.org; Fri, 10 Jan 2020 14:05:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48892)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1ipzbP-00086P-B6
 for qemu-trivial@nongnu.org; Fri, 10 Jan 2020 14:05:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1ipzbM-0006zO-Al
 for qemu-trivial@nongnu.org; Fri, 10 Jan 2020 14:05:46 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:32972
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1ipzbM-0006u2-5S
 for qemu-trivial@nongnu.org; Fri, 10 Jan 2020 14:05:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578683143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bttTzXiMaz1WxT+fAEauqKCdwjNBX/qJEjpntrdEXNc=;
 b=g1lzy8cS+NtcJwbhZXqgvLOWm++yuyn3L6fNBG3S0aqyLERnAMN8g/czKKNWujmH4MekHa
 UhWWmG+Z5JVA7oUefuWU+mf70S4YSyFMxXWS/3Vh8MhRDcG0sNN6syxvcz4mUD5p2ttMlD
 OpZCUhHOX8+SrTw81ft6H3h9a+eLSEE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-156-KjM2uee6O9-kTQwdZEGyDw-1; Fri, 10 Jan 2020 14:05:41 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B80CB107ACC9;
 Fri, 10 Jan 2020 19:05:40 +0000 (UTC)
Received: from [10.3.117.16] (ovpn-117-16.phx2.redhat.com [10.3.117.16])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 359D41001B05;
 Fri, 10 Jan 2020 19:05:40 +0000 (UTC)
Subject: Re: [PATCH v1 00/59] trivial unneeded labels cleanup
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>
References: <20200106182425.20312-1-danielhb413@gmail.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <15cc13a7-4061-b4e8-fc0a-c0c8386cf969@redhat.com>
Date: Fri, 10 Jan 2020 13:05:39 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200106182425.20312-1-danielhb413@gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: KjM2uee6O9-kTQwdZEGyDw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
X-List-Received-Date: Fri, 10 Jan 2020 19:05:49 -0000

On 1/6/20 12:23 PM, Daniel Henrique Barboza wrote:
> Hello,
> 
> This is the type of cleanup I've contributed to Libvirt
> during the last year. Figured QEMU also deserves the same
> care.
> 
> The idea here is remove unneeded labels. By 'unneeded' I
> mean labels that does nothing but a 'return' call. One
> common case is something like this:
> 
> if ()
>      goto cleanup;
> [...]
>   cleanup:
>      return 0;
> 
> This code can be simplified to:
> 
> if ()
>      return 0;
> 
> 

How much of this work is done manually, and how much via Coccinelle?


>   qga/commands-win32.c          | 17 ++++---
>   target/mips/mips-semi.c       | 15 +++---
>   target/unicore32/softmmu.c    | 23 +++-------
>   util/aio-posix.c              |  3 +-
>   util/module.c                 | 11 ++---

Hmm, no change to scripts/coccinelle, so presumably all manual :(

If we have a Coccinelle script that performs this transformation, we are 
more likely to be able to catch all places in the tree that would 
benefit (rather than relying on grep calls or other manual inspection), 
and more importantly, we can repeat the effort periodically to fix 
future additions that don't comply with the preferred style as well as 
backport the patch by rerunning the Coccinelle script with less worry of 
changed context.  Automated cleanups are always going to be easier to 
swallow (even if the diffstat is larger) than manual ad hoc cleanups.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


