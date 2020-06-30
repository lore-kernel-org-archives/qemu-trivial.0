Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jqGmc-000685-GZ
	for mharc-qemu-trivial@gnu.org; Tue, 30 Jun 2020 09:58:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dinechin@redhat.com>)
 id 1jqGmb-00067n-5w
 for qemu-trivial@nongnu.org; Tue, 30 Jun 2020 09:58:45 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:43272
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dinechin@redhat.com>)
 id 1jqGmY-0001fy-N3
 for qemu-trivial@nongnu.org; Tue, 30 Jun 2020 09:58:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593525521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ppzTCUceLqN6uA98HIW5i9rjPNyCKh8MPq6R3QBzDSU=;
 b=gVeLfodUaaymp9CSHOBNIQ3mN8WiYoYpTMwAUF8DTUs/V15By0KUmVoAa/0k3lpwuqibfr
 hB2+DEiRp7jZg3qMtULpIKY9gnyoXgTpO10BR+U+s91c6miBD1Bxx2bhFJ5JJcqBoinVkK
 JaaU24eTiEPOMBDeuINZjlxTXk6yCKg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98-mKmQ8yixN0CpQJBJjC7leA-1; Tue, 30 Jun 2020 09:58:39 -0400
X-MC-Unique: mKmQ8yixN0CpQJBJjC7leA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4FAAE107B467;
 Tue, 30 Jun 2020 13:56:34 +0000 (UTC)
Received: from titinator (ovpn-114-115.ams2.redhat.com [10.36.114.115])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BBBA174182;
 Tue, 30 Jun 2020 13:56:14 +0000 (UTC)
References: <20200626164307.3327380-1-dinechin@redhat.com>
 <20200626164307.3327380-9-dinechin@redhat.com>
 <20200629230843.b4s7rajxw5qfp3ei@sirius.home.kraxel.org>
User-agent: mu4e 1.5.2; emacs 26.3
From: Christophe de Dinechin <dinechin@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Eduardo Habkost
 <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, =?utf-8?Q?Mar?=
 =?utf-8?Q?c-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>, Laurent
 Vivier <laurent@vivier.eu>, "Michael S. Tsirkin" <mst@redhat.com>, Michael
 Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org, Richard Henderson
 <rth@twiddle.net>, Cleber Rosa <crosa@redhat.com>
Subject: Re: [PATCH 08/10] build: Add SPICE_CFLAGS and SPICE_LIBS to relevant
 files
In-reply-to: <20200629230843.b4s7rajxw5qfp3ei@sirius.home.kraxel.org>
Date: Tue, 30 Jun 2020 15:56:12 +0200
Message-ID: <ly5zb8d5dv.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Tue, 30 Jun 2020 13:58:45 -0000


On 2020-06-30 at 01:08 CEST, Gerd Hoffmann wrote...
>   Hi,
>
>>  obj-$(CONFIG_PC) += pc.o pc_sysfw.o
>> +pc.o-cflags += $(SPICE_CFLAGS)
>
> Hmm, looks strange.  Why does pc.c need spice?

It includes ui/qemu-spice.h, and I did not check why.
Turns out this is not needed. So I'll remove it.

>
>> +qmp-cmds.o-cflags += $(SPICE_CFLAGS)
>> +hmp-cmds.o-cflags += $(SPICE_CFLAGS)
>
> spice monitor commands need this I guess?

Yes.

>
>> +misc.o-cflags += $(SPICE_CFLAGS)
>
> Why this?

qemu_using_spice and qemu_spice_migrate_info

>
>> +vl.o-cflags := $(GPROF_CFLAGS) $(SDL_CFLAGS) $(SPICE_CFLAGS)
>
> spice init probably

Yes.
.
>
>> -stub-obj-y += vmgenid.o
>>  stub-obj-y += sysbus.o
>>  stub-obj-y += tpm.o
>>  stub-obj-y += trace-control.o
>> +stub-obj-y += vmgenid.o
>
> Huh?

I sent it separately as a trivial patch. Wrong alphabetical order, and where
that change was placed was causing a conflict on each rebase with a spice.c
stub I had at some point "at the right spot" ;-)

>
>> -spice-app.mo-cflags := $(GIO_CFLAGS)
>> -spice-app.mo-libs := $(GIO_LIBS)
>> +spice-app.mo-cflags := $(GIO_CFLAGS) $(SPICE_CFLAGS)
>> +spice-app.mo-libs := $(GIO_LIBS) $(SPICE_LIBS)
>
> Good.
>
>> --- a/util/module.c
>> +++ b/util/module.c
>> @@ -22,11 +22,11 @@
>>  #ifdef CONFIG_MODULE_UPGRADES
>>  #include "qemu-version.h"
>>  #endif
>> -#ifdef CONFIG_TRACE_RECORDER
>>  #include "trace/recorder.h"
>> -#endif
>>
>>
>> +RECORDER(modules, 16, "QEMU load modules");
>> +
>>  typedef struct ModuleEntry
>>  {
>>      void (*init)(void);
>> @@ -85,6 +85,15 @@ void register_dso_module_init(void (*fn)(void), module_init_type type)
>>  {
>>      ModuleEntry *e;
>>
>> +#ifdef CONFIG_TRACE_RECORDER
>> +    static const char *name[] = {
>> +        "MIGRATION", "BLOCK", "OPTS", "QOM",
>> +        "TRACE", "XEN_BACKEND", "LIBQOS", "FUZZ_TARGET",
>> +        "MAX"
>> +    };
>> +#endif
>> +    record(modules, "Register DSO module init %p type %u %+s",
>> +           fn, type, name[type]);
>>      init_lists();
>>
>>      e = g_malloc0(sizeof(*e));
>
> Unrelated change.
>
> (the recorder stuff should probably integrate with qemu trace support,
> so you can record any trace point qemu has, but that'll be another patch
> series ...)

I sent it separately, and fixed the leftover patch.

>
> take care,
>   Gerd


--
Cheers,
Christophe de Dinechin (IRC c3d)


