Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jiEOJ-0001gf-DV
	for mharc-qemu-trivial@gnu.org; Mon, 08 Jun 2020 05:48:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jiEOI-0001fP-FL
 for qemu-trivial@nongnu.org; Mon, 08 Jun 2020 05:48:26 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:44938
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jiEOH-0003Jz-1v
 for qemu-trivial@nongnu.org; Mon, 08 Jun 2020 05:48:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591609703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=4/W6HcO4458PVJW5JgST81/+vr1po3CnYyaz6iS9oKc=;
 b=dj96qdaEz+9xkMOVnAlZwQhCZ3BBJ38yx5PHRgzjArv+bO2KDc4j8qSuT/TGIlle7CAivk
 /zQiV0LYHMNOIYLKGjltagZ2/f2K9d6cFy+89iHJGMDm/9jsEDNmH0wIYZdX775tS8Xmfo
 k2URqDpZjV1m3NPltU6svjWgN40rbmc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-kp1iSBoxMe2UqRPmK4pR_g-1; Mon, 08 Jun 2020 05:48:20 -0400
X-MC-Unique: kp1iSBoxMe2UqRPmK4pR_g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DD694A0BD8;
 Mon,  8 Jun 2020 09:48:18 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-119.ams2.redhat.com [10.36.112.119])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B30F5D9C9;
 Mon,  8 Jun 2020 09:48:14 +0000 (UTC)
Subject: Re: [PATCH v2 2/8] MAINTAINERS: Mark SH4 based R2D & Shix machines
 orphan
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Magnus Damm <magnus.damm@gmail.com>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Markus Armbruster <armbru@redhat.com>,
 Fam Zheng <fam@euphon.net>, Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aleksandar Markovic <aleksandar.m.mail@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20200608090142.6793-1-f4bug@amsat.org>
 <20200608090142.6793-3-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <8f97580c-bf25-dd83-e23e-dcea1e6ce6b7@redhat.com>
Date: Mon, 8 Jun 2020 11:48:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200608090142.6793-3-f4bug@amsat.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/08 01:20:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
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
X-List-Received-Date: Mon, 08 Jun 2020 09:48:26 -0000

On 08/06/2020 11.01, Philippe Mathieu-Daudé wrote:
> Last commit from Magnus Damm is fc8e320ef583, which date is
> Fri Nov 13 2009.  As nobody else seems to care about the patches
> posted [*] related to the R2D and Shix machines, mark them orphan.
> 
> Many thanks to Magnus for his substantial contributions to QEMU,
> and for introducing these SH4 based machine!
> 
> [*] https://lists.gnu.org/archive/html/qemu-devel/2020-05/msg08519.html
> 
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  MAINTAINERS | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 49d90c70de..a012d9b74e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1250,14 +1250,15 @@ SH4 Machines
>  ------------
>  R2D
>  M: Magnus Damm <magnus.damm@gmail.com>
> -S: Maintained
> +S: Orphan
>  F: hw/sh4/r2d.c
>  F: hw/intc/sh_intc.c
>  F: hw/timer/sh_timer.c
> +F: include/hw/sh4/sh_intc.h
>  
>  Shix
>  M: Magnus Damm <magnus.damm@gmail.com>
> -S: Odd Fixes
> +S: Orphan
>  F: hw/sh4/shix.c

Having both, an "M:" entry and "S: Orphan" in a section sounds weird.
Magnus, are you still interested in these sections? If not, I think the
"M:" line should be removed...?

 Thomas


