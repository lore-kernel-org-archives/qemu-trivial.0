Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jgsmU-00083P-Q5
	for mharc-qemu-trivial@gnu.org; Thu, 04 Jun 2020 12:31:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jgsmS-000811-P5
 for qemu-trivial@nongnu.org; Thu, 04 Jun 2020 12:31:48 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:50543
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jgsmR-0000Pf-25
 for qemu-trivial@nongnu.org; Thu, 04 Jun 2020 12:31:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591288305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VwR2i17AJE1XdoL3lGGiJkAxWVVGajg1WAaJZN6adqA=;
 b=MZEISvtP0kCZ3SLd3s0ymEbyiUuaLJew+h5pjlNa7LCnnSjYcGtJYjCx09Sw7y18juOeca
 bP6e9UG7W9OUEPPwyfFK4SlYPdL64q6nnUlix0e/kBomLJA405StwXyBpBPdDmEA7ybCNd
 xTotSMgscRL+rWS+Qit+RPEaJgNWAvI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-kccEep4JOxunVBfYELQ6UQ-1; Thu, 04 Jun 2020 12:31:44 -0400
X-MC-Unique: kccEep4JOxunVBfYELQ6UQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EFA10107ACF2;
 Thu,  4 Jun 2020 16:31:42 +0000 (UTC)
Received: from [10.3.113.22] (ovpn-113-22.phx2.redhat.com [10.3.113.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B2C87A1EF;
 Thu,  4 Jun 2020 16:31:42 +0000 (UTC)
Subject: Re: [PATCH 2/2] lockable: do not rely on optimization for null
 lockables
To: Joe Slater <joe.slater@windriver.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, qemu-stable@nongnu.org
References: <20200603224903.26268-1-joe.slater@windriver.com>
 <20200603224903.26268-3-joe.slater@windriver.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <7db61e38-b9f1-80f4-15c1-fed43f0a939f@redhat.com>
Date: Thu, 4 Jun 2020 11:31:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200603224903.26268-3-joe.slater@windriver.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/04 01:31:23
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
X-List-Received-Date: Thu, 04 Jun 2020 16:31:49 -0000

On 6/3/20 5:49 PM, Joe Slater wrote:
> If we use QLNULL for null lockables, we can always
> use referencing unknown_lock_type as a link time
> error indicator.
> 
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>   include/qemu/lockable.h | 19 ++++++-------------
>   1 file changed, 6 insertions(+), 13 deletions(-)
> 
> diff --git a/include/qemu/lockable.h b/include/qemu/lockable.h
> index 7f7aebb..7fc5750 100644
> --- a/include/qemu/lockable.h
> +++ b/include/qemu/lockable.h
> @@ -24,21 +24,14 @@ struct QemuLockable {
>       QemuLockUnlockFunc *unlock;
>   };
>   
> -#define QLNULL ((QemuLockable *)0)
> -
> -
> -/* This function gives an error if an invalid, non-NULL pointer type is passed
> - * to QEMU_MAKE_LOCKABLE.  For optimized builds, we can rely on dead-code elimination
> - * from the compiler, and give the errors already at link time.
> +/*
> + *  If unknown_lock_type() is referenced, it means we have tried to passed something
> + *  not recognized as lockable to the macros below.  Use QLNULL to intentionally pass
> + *  a null lockable.
>    */
> -#if defined(__OPTIMIZE__) && !defined(__SANITIZE_ADDRESS__)
> +#define QLNULL ((QemuLockable *)0)

Looks like a bit of churn (especially if you take my comment on 1/2 to 
spell it NULL instead of 0).  Should these be combined into a single patch?

>   void unknown_lock_type(void *);
> -#else
> -static inline void unknown_lock_type(void *unused)
> -{
> -    abort();
> -}
> -#endif
> +
>   
>   static inline __attribute__((__always_inline__)) QemuLockable *
>   qemu_make_lockable(void *x, QemuLockable *lockable)


Reading further in the file:

/* Auxiliary macros to simplify QEMU_MAKE_LOCABLE.  */

We should fix that typo while improving things.

/* QEMU_MAKE_LOCKABLE - Make a polymorphic QemuLockable
  *
  * @x: a lock object (currently one of QemuMutex, QemuRecMutex, 
CoMutex, QemuSpin).
  *
  * Returns a QemuLockable object that can be passed around
  * to a function that can operate with locks of any kind, or
  * NULL if @x is %NULL.

Should this comment be tweaked to call out %QLNULL?

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


