Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lHTCI-0003K6-QP
	for mharc-qemu-trivial@gnu.org; Wed, 03 Mar 2021 10:13:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lHTCG-0003JA-TP
 for qemu-trivial@nongnu.org; Wed, 03 Mar 2021 10:13:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lHTCF-0002cE-79
 for qemu-trivial@nongnu.org; Wed, 03 Mar 2021 10:13:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614784434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ngwSZEAu3UfuYhrNLjDyYFK5PFHhZp8Z9iARDMhZd5c=;
 b=eZ7J5F6rQnc5P003G0bS4o4TntOrn+gBKHCQLiQvGUdMcw9MtxM+734iCzd0SMZN7mcyk8
 dxKU5KAqXKPpFMaUAddwUa5kAvMt731zxoRIrCa0B806rseWD8yOYzGt5PpYchNDc5TiRz
 RUJXjTMbKSJq18pG6FPXW9AIoCVE7UE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-53g4d7AHMwm6B2Y60FxiBw-1; Wed, 03 Mar 2021 10:13:53 -0500
X-MC-Unique: 53g4d7AHMwm6B2Y60FxiBw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B5AD680197D;
 Wed,  3 Mar 2021 15:13:51 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-115-146.ams2.redhat.com [10.36.115.146])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 576B119C46;
 Wed,  3 Mar 2021 15:13:48 +0000 (UTC)
Subject: Re: [PATCH v2 3/8] scripts/tracetool: Replace the word 'whitelist'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, QEMU Trivial <qemu-trivial@nongnu.org>
Cc: Eduardo Otubo <otubo@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, qemu-block@nongnu.org,
 Michael Roth <michael.roth@amd.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz
 <mreitz@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Aurelien Jarno <aurelien@aurel32.net>
References: <20210205171817.2108907-1-philmd@redhat.com>
 <20210205171817.2108907-4-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <af576be4-bc9c-ac52-7213-c2576b9d8990@redhat.com>
Date: Wed, 3 Mar 2021 16:13:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210205171817.2108907-4-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 03 Mar 2021 15:13:57 -0000

On 05/02/2021 18.18, Philippe Mathieu-Daudé wrote:
> Follow the inclusive terminology from the "Conscious Language in your
> Open Source Projects" guidelines [*] and replace the words "whitelist"
> appropriately.
> 
> [*] https://github.com/conscious-lang/conscious-lang-docs/blob/main/faq.md
> 
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   scripts/tracetool/__init__.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/tracetool/__init__.py b/scripts/tracetool/__init__.py
> index 96b1cd69a52..5bc94d95cfc 100644
> --- a/scripts/tracetool/__init__.py
> +++ b/scripts/tracetool/__init__.py
> @@ -100,7 +100,7 @@ def validate_type(name):
>           if bit == "const":
>               continue
>           if bit not in ALLOWED_TYPES:
> -            raise ValueError("Argument type '%s' is not in whitelist. "
> +            raise ValueError("Argument type '%s' is not allowed. "
>                                "Only standard C types and fixed size integer "
>                                "types should be used. struct, union, and "
>                                "other complex pointer types should be "
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


