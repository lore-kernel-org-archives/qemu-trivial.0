Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jilCD-0008C1-B6
	for mharc-qemu-trivial@gnu.org; Tue, 09 Jun 2020 16:50:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jilCC-0008Aw-De
 for qemu-trivial@nongnu.org; Tue, 09 Jun 2020 16:50:08 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:26696
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jilCB-0004vs-DJ
 for qemu-trivial@nongnu.org; Tue, 09 Jun 2020 16:50:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591735806;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CjeVb4SCCgkygTMOTDNpQWtbKFVCa9kq7dzhwh20dwU=;
 b=iwWnfU1InIXV3bNjJ/8AoxoNbWVy6dNtmE3i71S0DpbQg2eLccBGzSByZJAl0C7CbmovFh
 JjG32YUy2ZGY955EOms+W2uox9tlFg/YQOcouI3unQOIw0pmZQ9NShixV+Z5WKLNzQ7UlG
 5S56EpeZWdfQXqTKJkVuNfQCeN8nmd4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-248-HsG7c7kUPhiVjaAJ55QYrQ-1; Tue, 09 Jun 2020 16:50:01 -0400
X-MC-Unique: HsG7c7kUPhiVjaAJ55QYrQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E5C8107ACCA;
 Tue,  9 Jun 2020 20:50:00 +0000 (UTC)
Received: from [10.3.113.22] (ovpn-113-22.phx2.redhat.com [10.3.113.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 649C17B5F4;
 Tue,  9 Jun 2020 20:49:56 +0000 (UTC)
Subject: Re: [PATCH] hw/openrisc/openrisc_sim: Add assertion to silent GCC
 warning
To: Stafford Horne <shorne@gmail.com>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, =?UTF-8?Q?Martin_Li=c5=a1ka?= <mliska@suse.cz>,
 qemu-trivial@nongnu.org, Christophe de Dinechin <dinechin@redhat.com>,
 1874073@bugs.launchpad.net, Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Jia Liu <proljc@gmail.com>
References: <20200608071409.17024-1-philmd@redhat.com>
 <95f1d638-3921-ffdf-8f07-2f077d1d0cc9@redhat.com>
 <20200609204227.GI75760@lianli.shorne-pla.net>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <ddb9102f-19c1-fc48-8c94-608bcca86be9@redhat.com>
Date: Tue, 9 Jun 2020 15:49:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200609204227.GI75760@lianli.shorne-pla.net>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/09 02:41:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Tue, 09 Jun 2020 20:50:08 -0000

On 6/9/20 3:42 PM, Stafford Horne wrote:

>>> While humans can tell smp_cpus will always be in the [1, 2] range,
>>> (openrisc_sim_machine_init sets mc->max_cpus = 2), the compiler
>>> can't.
>>>
>>> Add an assertion to give the compiler a hint there's no use of
>>> uninitialized data.
>>>

> Acked-by: Stafford Horne <shorne@gmail.com>
> 
> I see there are now two patches for this, I kind of like this assert fix.
> 
> Shall I queue it for OpenRISC pulling?  Or can someone else pick this up?

Looks like Laurent already volunteered to queue it through the trivial 
patches tree.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


