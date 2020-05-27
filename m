Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jdmGt-0006ls-B4
	for mharc-qemu-trivial@gnu.org; Tue, 26 May 2020 22:58:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jdmGs-0006ld-CZ
 for qemu-trivial@nongnu.org; Tue, 26 May 2020 22:58:22 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:58804
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jdmGq-0006Md-T5
 for qemu-trivial@nongnu.org; Tue, 26 May 2020 22:58:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590548298;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5PPWpK4OLGyZzI0ktRVuW6UUh8pb3Uq3JvRMMj+bY8U=;
 b=eSd4l/r++gnZO6cWx8B5TG66/GukUwSwfX2WrlMaX9Txy49vBWn94vSAiyhFJs8P2JHQOE
 Xkuy9MxFeSApeOdh2MXoeYMgGPIn6GBcq1Ru3uj/UGW5cv9dMR9R6nIOH0UIvPLkXabPKb
 xTwWqh/MVz2hrifjDR34WFwcZ9e9ZGo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-c-yd-CHoNJ2FNPGSkqnIEg-1; Tue, 26 May 2020 22:58:13 -0400
X-MC-Unique: c-yd-CHoNJ2FNPGSkqnIEg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 37B99107B0E1;
 Wed, 27 May 2020 02:58:12 +0000 (UTC)
Received: from [10.3.112.88] (ovpn-112-88.phx2.redhat.com [10.3.112.88])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D986419D7B;
 Wed, 27 May 2020 02:58:11 +0000 (UTC)
Subject: Re: [PATCH] or1k: Fix compilation hiccup
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, shorne@gmail.com, proljc@gmail.com
References: <159053530937.12401.10203156196787167758@45ef0f9c86ae>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <196f3bd3-b1e2-972c-7c74-281b3bf0d155@redhat.com>
Date: Tue, 26 May 2020 21:58:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <159053530937.12401.10203156196787167758@45ef0f9c86ae>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/26 22:58:18
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Wed, 27 May 2020 02:58:22 -0000

On 5/26/20 6:21 PM, no-reply@patchew.org wrote:
> Patchew URL: https://patchew.org/QEMU/20200526185132.1652355-1-eblake@redhat.com/
> 
> 
> 
> Hi,
> 
> This series seems to have some coding style problems. See output below for
> more information:
> 

> === OUTPUT BEGIN ===
> ERROR: spaces required around that '*' (ctx:WxV)
> #33: FILE: hw/openrisc/openrisc_sim.c:132:
> +    qemu_irq *cpu_irqs[2] = {};
>                ^
> 
> total: 1 errors, 0 warnings, 8 lines checked
> 
> Commit d96d2fbbc5db (or1k: Fix compilation hiccup) has style problems, please review.  If any of these errors
> are false positives report them to the maintainer, see
> CHECKPATCH in MAINTAINERS.

False positive, due to 'qemu_irq' not following the normal naming 
conventions for typedefs.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


