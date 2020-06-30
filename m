Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jqGU7-0001Yd-Gx
	for mharc-qemu-trivial@gnu.org; Tue, 30 Jun 2020 09:39:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dinechin@redhat.com>)
 id 1jqGTy-0001IZ-Ri
 for qemu-trivial@nongnu.org; Tue, 30 Jun 2020 09:39:30 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:56050
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dinechin@redhat.com>)
 id 1jqGTx-0006Ka-04
 for qemu-trivial@nongnu.org; Tue, 30 Jun 2020 09:39:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593524367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BshmLbkCegvWQdOrab3Q23b6T16SbqzgLcrY5ZDWofo=;
 b=DdqgVEzykTpaOfoGLRQxl1Gz7f5+xWJzOzaB22kvG3EMOem9I3g4YBjEe6csD7cRcgloR0
 fPyhbIPe82TCrBhDNxQk0+UxDK8CT1yiHCigbqR8vvVec3s5ppN+V+aR3d1Qv1W684wSP7
 Vd8E1U0t09PQpoNOhqXhfj3/0JULEV0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-fxhnA3w1Mg6DgPEn1ZgnZw-1; Tue, 30 Jun 2020 09:39:24 -0400
X-MC-Unique: fxhnA3w1Mg6DgPEn1ZgnZw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB03C800D5C;
 Tue, 30 Jun 2020 13:39:22 +0000 (UTC)
Received: from titinator (ovpn-114-115.ams2.redhat.com [10.36.114.115])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 252647FE9C;
 Tue, 30 Jun 2020 13:39:11 +0000 (UTC)
References: <20200626164307.3327380-1-dinechin@redhat.com>
 <20200626164307.3327380-2-dinechin@redhat.com>
 <20200630052756-mutt-send-email-mst@kernel.org>
User-agent: mu4e 1.5.2; emacs 26.3
From: Christophe de Dinechin <dinechin@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Eduardo Habkost
 <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, =?utf-8?Q?Mar?=
 =?utf-8?Q?c-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>, Laurent
 Vivier <laurent@vivier.eu>, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-trivial@nongnu.org, Richard Henderson <rth@twiddle.net>, Gerd
 Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>
Subject: Re: [PATCH 01/10] modules: Provide macros making it easier to
 identify module exports
In-reply-to: <20200630052756-mutt-send-email-mst@kernel.org>
Date: Tue, 30 Jun 2020 15:39:10 +0200
Message-ID: <lybll0d669.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dinechin@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=205.139.110.120; envelope-from=dinechin@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/30 03:55:26
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Tue, 30 Jun 2020 13:39:31 -0000


On 2020-06-30 at 11:38 CEST, Michael S. Tsirkin wrote...
> On Fri, Jun 26, 2020 at 06:42:58PM +0200, Christophe de Dinechin wrote:
>> In order to facilitate the move of large chunks of functionality to
>> load modules, it is simpler to create a wrapper with the same name
>> that simply relays the implementation. For efficiency, this is
>> typically done using inline functions in the header for the
>> corresponding functionality. In that case, we rename the actual
>> implementation by appending _implementation to its name. This makes it
>> easier to select which function you want to put a breakpoint on.
>>
>> Signed-off-by: Christophe de Dinechin <dinechin@redhat.com>
>> ---
>>  include/qemu/module.h | 24 ++++++++++++++++++++++++
>>  1 file changed, 24 insertions(+)
>>
>> diff --git a/include/qemu/module.h b/include/qemu/module.h
>> index 011ae1ae76..1922a0293c 100644
>> --- a/include/qemu/module.h
>> +++ b/include/qemu/module.h
>> @@ -39,6 +39,30 @@ static void __attribute__((constructor)) do_qemu_init_ ## function(void)    \
>>  }
>>  #endif
>>
>> +#ifdef CONFIG_MODULES
>> +/* Identify which functions are replaced by a callback stub */
>> +#ifdef MODULE_STUBS
>> +#define MODIFACE(Ret,Name,Args)                                         \
>> +    Ret (*Name)Args;                                                    \
>> +    extern Ret Name##_implementation Args
>> +#else /* !MODULE_STUBS */
>> +#define MODIFACE(Ret,Name,Args)                                         \
>> +    extern Ret (*Name)Args;                                             \
>> +    extern Ret Name##_implementation Args
>> +#endif /* MODULE_STUBS */
>> +
>> +#define MODIMPL(Ret,Name,Args)                                          \
>> +    static void __attribute__((constructor)) Name##_register(void)      \
>> +    {                                                                   \
>> +        Name = Name##_implementation;                                   \
>> +    }                                                                   \
>> +    Ret Name##_implementation Args
>> +#else /* !CONFIG_MODULES */
>> +/* When not using a module, such functions are called directly */
>> +#define MODIFACE(Ret,Name,Args)         Ret Name Args
>> +#define MODIMPL(Ret,Name,Args)          Ret Name Args
>> +#endif /* CONFIG_MODULES */
>> +
>>  typedef enum {
>>      MODULE_INIT_MIGRATION,
>>      MODULE_INIT_BLOCK,
>
> Hmm that's quite a bit of overhead for each call across modules.

Do you mean runtime overhead, i.e. the difference between
foo(x) and (*foo)(x)?


> Can't code patching be used somehow?

I've considered it, but this seems like a bit of a hammer for half a dozen
calls that are mostly init, so not performance sensitive.

In the old times, ld.so used to do that for you. All you had to do was to
mark one symbol as weak. Apparently for security reasons, that feature was
dropped several years ago. At least, that put call patching where it
belonged, i.e. in the loader.

>
>
>> --
>> 2.26.2


--
Cheers,
Christophe de Dinechin (IRC c3d)


