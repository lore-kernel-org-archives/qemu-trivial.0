Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jiJmM-0007qo-6Y
	for mharc-qemu-trivial@gnu.org; Mon, 08 Jun 2020 11:33:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jiJmK-0007pH-P8
 for qemu-trivial@nongnu.org; Mon, 08 Jun 2020 11:33:36 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:40697
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jiJmJ-00021q-U4
 for qemu-trivial@nongnu.org; Mon, 08 Jun 2020 11:33:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591630415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oxWQ4bhEfnQYH5cmCr4iZSh4Wrs0FK3XYt4YmOQiIF8=;
 b=jFwBoDrCqiiUiLTRIn5QsUMytVMTsG1KOYg3gOG1fZt1A1AdZ5hb7Y1EwkQfBIzoo/6Dsh
 Qli6PoyIrkipCidswzzAKnB+0S6wckOLGli9P+zYLTO8GrLmkaEQe1PtoOUj2qsjJYhalj
 Vo2b+pXHUGs3TQnek7M34Lgh0Uqn3rw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-mFA6yMqTMYmE-5BbQyBlwA-1; Mon, 08 Jun 2020 11:33:30 -0400
X-MC-Unique: mFA6yMqTMYmE-5BbQyBlwA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A982E108BD0C;
 Mon,  8 Jun 2020 15:33:28 +0000 (UTC)
Received: from [10.3.113.22] (ovpn-113-22.phx2.redhat.com [10.3.113.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1EAEC891E6;
 Mon,  8 Jun 2020 15:33:25 +0000 (UTC)
Subject: Re: [PATCH] hw/openrisc/openrisc_sim: Add assertion to silent GCC
 warning
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, =?UTF-8?Q?Martin_Li=c5=a1ka?= <mliska@suse.cz>
Cc: Stafford Horne <shorne@gmail.com>, qemu-trivial@nongnu.org,
 Christophe de Dinechin <dinechin@redhat.com>, 1874073@bugs.launchpad.net,
 Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Jia Liu <proljc@gmail.com>
References: <20200608071409.17024-1-philmd@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <95f1d638-3921-ffdf-8f07-2f077d1d0cc9@redhat.com>
Date: Mon, 8 Jun 2020 10:33:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200608071409.17024-1-philmd@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=eblake@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/08 05:40:56
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Mon, 08 Jun 2020 15:33:37 -0000

On 6/8/20 2:14 AM, Philippe Mathieu-Daudé wrote:
> When compiling with GCC 10 (Fedora 32) using CFLAGS=-O2 we get:

In the subject: s/silent/silence/

> 
>      CC      or1k-softmmu/hw/openrisc/openrisc_sim.o
>    hw/openrisc/openrisc_sim.c: In function ‘openrisc_sim_init’:
>    hw/openrisc/openrisc_sim.c:87:42: error: ‘cpu_irqs[0]’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
>       87 |         sysbus_connect_irq(s, i, cpu_irqs[i][irq_pin]);
>          |                                  ~~~~~~~~^~~
> 
> While humans can tell smp_cpus will always be in the [1, 2] range,
> (openrisc_sim_machine_init sets mc->max_cpus = 2), the compiler
> can't.
> 
> Add an assertion to give the compiler a hint there's no use of
> uninitialized data.
> 
> Buglink: https://bugs.launchpad.net/qemu/+bug/1874073
> Reported-by: Martin Liška <mliska@suse.cz>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   hw/openrisc/openrisc_sim.c | 1 +
>   1 file changed, 1 insertion(+)

Tested-by: Eric Blake <eblake@redhat.com>

With the typo fixed,
Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


