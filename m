Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jpq5C-00058I-Om
	for mharc-qemu-trivial@gnu.org; Mon, 29 Jun 2020 05:28:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dinechin@redhat.com>)
 id 1jpq5A-00057V-O1
 for qemu-trivial@nongnu.org; Mon, 29 Jun 2020 05:28:09 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:44173
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dinechin@redhat.com>)
 id 1jpq57-000705-Nf
 for qemu-trivial@nongnu.org; Mon, 29 Jun 2020 05:28:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593422883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iAiZkmlllUDU6Hf0ynFGHQpYtJ3oBZ1TUQASTXUy2VI=;
 b=J1F2DwM4cWhk1M2TDUwhYVXiELkuYltavpSr9HKU9MkRl2/4Am5MZjdIU/nz+7fQxYf302
 WpDmvWIBgwTgU78UlYA0w4F5kSZ6ZSTvdbasNbpzZJG4GJo9VzcelsEW7HPFPvIoQLAPlP
 ZZdSopGG2uAbgo5sZGu4ltmy/CXa3Vw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-2XS1eaGmNqSSer7wMYIfkw-1; Mon, 29 Jun 2020 05:28:00 -0400
X-MC-Unique: 2XS1eaGmNqSSer7wMYIfkw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 130C2107B7C4;
 Mon, 29 Jun 2020 09:27:59 +0000 (UTC)
Received: from titinator (ovpn-114-115.ams2.redhat.com [10.36.114.115])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C7E882B472;
 Mon, 29 Jun 2020 09:27:47 +0000 (UTC)
References: <20200626164307.3327380-1-dinechin@redhat.com>
 <20200626164307.3327380-9-dinechin@redhat.com>
 <20200626172613.GN1028934@redhat.com>
User-agent: mu4e 1.5.2; emacs 26.3
From: Christophe de Dinechin <dinechin@redhat.com>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>, "Michael
 S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org, Cleber Rosa
 <crosa@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier
 <laurent@vivier.eu>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Gerd
 Hoffmann <kraxel@redhat.com>, =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Subject: Re: [PATCH 08/10] build: Add SPICE_CFLAGS and SPICE_LIBS to relevant
 files
In-reply-to: <20200626172613.GN1028934@redhat.com>
Date: Mon, 29 Jun 2020 11:27:46 +0200
Message-ID: <lytuyucjcd.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.120; envelope-from=dinechin@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/29 01:10:03
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
X-List-Received-Date: Mon, 29 Jun 2020 09:28:09 -0000


On 2020-06-26 at 19:26 CEST, Daniel P. Berrang=C3=A9 wrote...
> On Fri, Jun 26, 2020 at 06:43:05PM +0200, Christophe de Dinechin wrote:
>> Instead of adding the spice build flags to the top-level build
>> options, add them where they are necessary. This is a step to move the
>> burden of linking with spice libraries away from the top-level qemu.
>>
>> Signed-off-by: Christophe de Dinechin <dinechin@redhat.com>
>> ---
>>  configure                |  4 ++--
>>  hw/display/Makefile.objs |  1 +
>>  hw/i386/Makefile.objs    |  1 +
>>  monitor/Makefile.objs    |  3 +++
>>  softmmu/Makefile.objs    |  2 +-
>>  stubs/Makefile.objs      |  2 +-
>>  ui/Makefile.objs         |  4 ++--
>>  util/module.c            | 13 +++++++++++--
>>  8 files changed, 22 insertions(+), 8 deletions(-)
>
>> diff --git a/stubs/Makefile.objs b/stubs/Makefile.objs
>> index f32b9e47a3..1df8bb3814 100644
>> --- a/stubs/Makefile.objs
>> +++ b/stubs/Makefile.objs
>> @@ -19,10 +19,10 @@ stub-obj-y +=3D replay.o
>>  stub-obj-y +=3D runstate-check.o
>>  stub-obj-$(CONFIG_SOFTMMU) +=3D semihost.o
>>  stub-obj-y +=3D set-fd-handler.o
>> -stub-obj-y +=3D vmgenid.o
>>  stub-obj-y +=3D sysbus.o
>>  stub-obj-y +=3D tpm.o
>>  stub-obj-y +=3D trace-control.o
>> +stub-obj-y +=3D vmgenid.o
>>  stub-obj-y +=3D vmstate.o
>>  stub-obj-$(CONFIG_SOFTMMU) +=3D win32-kbd-hook.o
>>
>
> This looks unrelated to this series.

I'll send a separate trivial patch to fix the alphabetical ordering.
I used to have a spice.c stub here, which conflicted every time. This is ho=
w
I noticed the alphabetical order was not respected here.

>
>
>
>> diff --git a/util/module.c b/util/module.c
>> index 2fa93561fe..29b4806520 100644
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
>> @@ -85,6 +85,15 @@ void register_dso_module_init(void (*fn)(void), modul=
e_init_type type)
>>  {
>>      ModuleEntry *e;
>>
>> +#ifdef CONFIG_TRACE_RECORDER
>> +    static const char *name[] =3D {
>> +        "MIGRATION", "BLOCK", "OPTS", "QOM",
>> +        "TRACE", "XEN_BACKEND", "LIBQOS", "FUZZ_TARGET",
>> +        "MAX"
>> +    };
>> +#endif
>> +    record(modules, "Register DSO module init %p type %u %+s",
>> +           fn, type, name[type]);
>>      init_lists();
>
> This looks unrelated too, but in general debugging should go via QEMU's
> standard trace backends.
>

Yes. I apparently botched a fixup. That was supposed to be a private patch
for my own use.



--
Cheers,
Christophe de Dinechin (IRC c3d)


