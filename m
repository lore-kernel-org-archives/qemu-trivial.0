Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kVwNO-0007KR-WB
	for mharc-qemu-trivial@gnu.org; Fri, 23 Oct 2020 08:40:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kVwNK-0007Hh-8z
 for qemu-trivial@nongnu.org; Fri, 23 Oct 2020 08:40:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kVwNH-00048e-Cr
 for qemu-trivial@nongnu.org; Fri, 23 Oct 2020 08:40:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603456850;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ljFUqSYqRJEktbBj0ZQJlURkOmCwQ/nrjBOonQin4ZY=;
 b=BD9H5Pfpy1R1L2B/dXc59NcPUzFUwMsnwfijQ27WBSL+5OVsnRnfslVu8KfVvJyp0eGdDn
 hZ32oUve/mTEvfhjssT27LE+dEY1v80IiIxhAgRLzLs8Pa4eYpENBNBL96jhD5lP0yUb11
 vy/YmPrs3cpeFvPM82NxRly2aUR2hdo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-0KLtgcRsOlGq42HIuIfugA-1; Fri, 23 Oct 2020 08:40:48 -0400
X-MC-Unique: 0KLtgcRsOlGq42HIuIfugA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 796485F9E1;
 Fri, 23 Oct 2020 12:40:47 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-115-61.ams2.redhat.com [10.36.115.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CC4F655762;
 Fri, 23 Oct 2020 12:40:43 +0000 (UTC)
Subject: Re: [PATCH 11/30] prep: Fix Lesser GPL version number
To: Chetan Pant <chetan4windows@gmail.com>, qemu-trivial@nongnu.org
Cc: hpoussin@reactos.org, qemu-devel@nongnu.org,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20201014134248.14146-1-chetan4windows@gmail.com>
 <20201023121933.19227-1-chetan4windows@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <d2f9d56d-05ea-b380-ba51-7739ee09e8b5@redhat.com>
Date: Fri, 23 Oct 2020 14:40:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20201023121933.19227-1-chetan4windows@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/23 01:44:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.108, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 23 Oct 2020 12:40:57 -0000

On 23/10/2020 14.19, Chetan Pant wrote:
> There is no "version 2" of the "Lesser" General Public License.
> It is either "GPL version 2.0" or "Lesser GPL version 2.1".
> This patch replaces all occurrences of "Lesser GPL version 2" with
> "Lesser GPL version 2.1" in comment section.
> 
> Signed-off-by: Chetan Pant <chetan4windows@gmail.com>
> ---
>  hw/isa/i82378.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/isa/i82378.c b/hw/isa/i82378.c
> index 8285b06..2a2ff05 100644
> --- a/hw/isa/i82378.c
> +++ b/hw/isa/i82378.c
> @@ -6,7 +6,7 @@
>   * This library is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
>   * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>   *
>   * This library is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


