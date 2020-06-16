Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jlBjP-0000pU-2R
	for mharc-qemu-trivial@gnu.org; Tue, 16 Jun 2020 09:34:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jlBjM-0000np-C1
 for qemu-trivial@nongnu.org; Tue, 16 Jun 2020 09:34:24 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:26110
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jlBjK-0007ur-MR
 for qemu-trivial@nongnu.org; Tue, 16 Jun 2020 09:34:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592314461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=v4lfiPT02mODVhaVAGSmH93xCOfGOBkxdn0UU5vH5M4=;
 b=J9UgKx32kP/MGLSj/HZUg1KujcTKD918uxRVDjq9IEtxGlYfbkyZLKmKOfJu22+y57PioZ
 LfEgdiBCSesAZdgeTCIcHVZXRpUbCs8mY1ZsuZo9OfBfeL/XMj+Z3IWeo2uZdOLhbX0W+F
 EwlNZjginJAlnF+cX5++2S8MHLiXJMk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-N9gvPoBUO3OX7dVTj72MOw-1; Tue, 16 Jun 2020 09:34:19 -0400
X-MC-Unique: N9gvPoBUO3OX7dVTj72MOw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1AF1B134C2;
 Tue, 16 Jun 2020 13:34:18 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-114-128.ams2.redhat.com [10.36.114.128])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5434D7930D;
 Tue, 16 Jun 2020 13:34:15 +0000 (UTC)
Subject: Re: [PATCH v4 1/7] MAINTAINERS: Cover 'hw/sh4/sh_intc.h' with the R2D
 machine
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 qemu-trivial@nongnu.org, Magnus Damm <magnus.damm@gmail.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20200611114317.13044-1-f4bug@amsat.org>
 <20200611114317.13044-2-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <bb388c24-092c-28f5-2a78-daee14ed5731@redhat.com>
Date: Tue, 16 Jun 2020 15:34:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200611114317.13044-2-f4bug@amsat.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/16 02:46:07
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
X-List-Received-Date: Tue, 16 Jun 2020 13:34:24 -0000

On 11/06/2020 13.43, Philippe Mathieu-Daudé wrote:
> Commit 81527b94ad added hw/intc/sh_intc.c, complete by
> adding its corresponding header.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 13711aafe8..87ceca7ff1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1257,6 +1257,7 @@ S: Maintained
>  F: hw/sh4/r2d.c
>  F: hw/intc/sh_intc.c
>  F: hw/timer/sh_timer.c
> +F: include/hw/sh4/sh_intc.h
>  
>  Shix
>  M: Yoshinori Sato <ysato@users.sourceforge.jp>

Hmm, sh_intc.h is used by sh7750_init() in sh7750.c ... and that
function is used by both, r2d and shix machines ... so should that maybe
rather be part of both machines or a generic entry?

 Thomas



