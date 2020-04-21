Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jR0jN-0002tR-NE
	for mharc-qemu-trivial@gnu.org; Tue, 21 Apr 2020 17:47:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42528)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1jR0jJ-0002pP-V4
 for qemu-trivial@nongnu.org; Tue, 21 Apr 2020 17:46:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1jR0jI-0001MU-M6
 for qemu-trivial@nongnu.org; Tue, 21 Apr 2020 17:46:57 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:35467
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jR0jI-0001Hy-0w
 for qemu-trivial@nongnu.org; Tue, 21 Apr 2020 17:46:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587505614;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ISw6c4GHvGqoGOp/HGKgTicBxUOMvPj3sGUkvS18AKg=;
 b=AQMXh5pBuMmWyNG/fzQyNJKi4feFnE83cpmnA5XcJimJtRLLJ6WJ/2Kvj7vExLbD02/nYT
 7xRDEEu/8Xn7iKATBdFPHP65R/T6JquMGfL/+2sevMLgyd6e253PhgLIoU20LoOdFgm7/U
 6jX5IAeR91RlSBPwBcRF+4o7/a1MJ/k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-RIeGk8QAMraxEdo2ii6iHA-1; Tue, 21 Apr 2020 17:46:52 -0400
X-MC-Unique: RIeGk8QAMraxEdo2ii6iHA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D365802570;
 Tue, 21 Apr 2020 21:46:39 +0000 (UTC)
Received: from [10.10.116.80] (ovpn-116-80.rdu2.redhat.com [10.10.116.80])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E027860BEC;
 Tue, 21 Apr 2020 21:46:38 +0000 (UTC)
Subject: Re: [PATCH 2/2] tools: Fix use of fcntl(F_SETFD) during socket
 activation
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org
References: <20200420175309.75894-1-eblake@redhat.com>
 <20200420175309.75894-3-eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <645b3b83-1494-36a9-35df-fa09c364b85e@redhat.com>
Date: Tue, 21 Apr 2020 16:46:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200420175309.75894-3-eblake@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=eblake@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/21 15:21:16
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
X-List-Received-Date: Tue, 21 Apr 2020 21:46:59 -0000

On 4/20/20 12:53 PM, Eric Blake wrote:
> Blindly setting FD_CLOEXEC without a read-modify-write will
> inadvertently clear any other intentionally-set bits, such as a
> proposed new bit for designating a fd that must behave in 32-bit mode.
> However, we cannot use our wrapper qemu_set_cloexec(), because that
> wrapper intentionally abort()s on failure, whereas the probe here
> intentionally tolerates failure to deal with incorrect socket
> activation gracefully.  Instead, fix the code to do the proper
> read-modify-write.
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>   util/systemd.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)

As qemu-nbd is impacted, I'll queue 2/2 through my NBD tree if 
qemu-trivial doesn't pick it up first.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


