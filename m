Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k0Mtg-0000gB-Bg
	for mharc-qemu-trivial@gnu.org; Tue, 28 Jul 2020 06:31:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1k0Mte-0000dm-Do
 for qemu-trivial@nongnu.org; Tue, 28 Jul 2020 06:31:46 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:22860
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1k0Mtb-0001xp-C8
 for qemu-trivial@nongnu.org; Tue, 28 Jul 2020 06:31:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595932302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=M1AqVBYUcZ4HxALsQVI6C8fn34KO/f/b/o1SspF3z5E=;
 b=YC/Ohf1xfGNdkruDiO6PLYIky1DR84CFTEQRe10wKSMGyL3QTNaHxnOg4+RJ+dyHWEEQwD
 deqriG+8owVgIyEseRVtz/TX8TgaJGW+38huM0tKNpsRUv8sVUJxu0PQuLFndMJSEvg1jq
 Pk0k9JWK+5EXDrCc7H43/wl4lmMdUnY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-J9p_2fa2NAmxAf85468BQg-1; Tue, 28 Jul 2020 06:31:40 -0400
X-MC-Unique: J9p_2fa2NAmxAf85468BQg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 220AE186A82C;
 Tue, 28 Jul 2020 10:31:39 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-161.ams2.redhat.com [10.36.112.161])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D83F5726BA;
 Tue, 28 Jul 2020 10:31:37 +0000 (UTC)
Subject: Re: [PATCH] virtio-ccw-input: fix description
To: Cornelia Huck <cohuck@redhat.com>, Halil Pasic <pasic@linux.ibm.com>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20200728102820.273598-1-cohuck@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <e07fb1d5-0b41-f498-cfe3-40358fb00786@redhat.com>
Date: Tue, 28 Jul 2020 12:31:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200728102820.273598-1-cohuck@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/28 06:02:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Tue, 28 Jul 2020 10:31:46 -0000

On 28/07/2020 12.28, Cornelia Huck wrote:
> Fix a copy/paste error.
> 
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>  hw/s390x/virtio-ccw-input.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/s390x/virtio-ccw-input.c b/hw/s390x/virtio-ccw-input.c
> index 5601e25deed8..83136fbba15c 100644
> --- a/hw/s390x/virtio-ccw-input.c
> +++ b/hw/s390x/virtio-ccw-input.c
> @@ -1,5 +1,5 @@
>  /*
> - * virtio ccw scsi implementation
> + * virtio ccw input implementation
>   *
>   * Copyright 2012, 2015 IBM Corp.
>   *
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


