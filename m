Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lq8pR-0001fd-3N
	for mharc-qemu-trivial@gnu.org; Mon, 07 Jun 2021 02:33:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lq8pL-0001fP-2b
 for qemu-trivial@nongnu.org; Mon, 07 Jun 2021 02:33:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lq8pB-0002FC-C5
 for qemu-trivial@nongnu.org; Mon, 07 Jun 2021 02:33:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623047603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YlPff1dO2jUNuXIXizOUeFds6VUcCs9RiqiyleaepgY=;
 b=Rd9U7K+ua5gRPB9wJ5v8j78EmKv++k++oCLIcMjYDIA0qY44qsgNUEQVrlNu8TJEQjR6MQ
 6bxQlo/70tcpeToiN2avIGcw1CobssAczIyucENDGvPZrMJEziOX/pvZA7yuzrEfLCMaQX
 sbYUnrXOOAUyeSX+KICvoxyDccphmfs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-235-v_t2ZuH_MAO5KoSIgwYK0A-1; Mon, 07 Jun 2021 02:32:57 -0400
X-MC-Unique: v_t2ZuH_MAO5KoSIgwYK0A-1
Received: by mail-wr1-f70.google.com with SMTP id
 n14-20020a5d484e0000b029011993ecb409so5558461wrs.1
 for <qemu-trivial@nongnu.org>; Sun, 06 Jun 2021 23:32:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YlPff1dO2jUNuXIXizOUeFds6VUcCs9RiqiyleaepgY=;
 b=PRNkrlkvyfSVUJbJewKbn+ocaz1ROvnN4DJj9Z9E4b2aSSSr5ltQvNGcG0SUT2gCOt
 7w3SqT7owZ2e/0QwJlhBezlAKyeGLPACZMkAbgrJ7A5iQGkFwZ/PpwcTUQPYvno1cJpa
 pncwXkp0WvxEerm2onH6uuEw0RW0U4ZNDdt3JFNR9doQmS0cniYfslT+7OncDas4zqR5
 9UJ63BDJuWK0ul1QpEIJBDO+KlBR+BLyVvK7IdWN7rFNxG4o7Hd2rJ6Cw+AOsEqsZlAw
 01KrbF25++HuzYxTYHOLI9R9kjLPJwnEoA16gf7qY16vbugso07WdOyVrrZnb2hcnI2v
 crnA==
X-Gm-Message-State: AOAM530uqj1/ygAB1ghq2rnwzHk7NxZIe/Keb3Kl3Irk6GqybjTol/h9
 rfx+Qou/Ou+lY/0rytQkbLAgI3M1/yk7ORnVl/ge6ugj/WjD+QM8PFxeakiHE8EpJ5UcsrtM31j
 tqK4Z9842m8lnRDJAzA==
X-Received: by 2002:a1c:a917:: with SMTP id s23mr10932135wme.55.1623047576454; 
 Sun, 06 Jun 2021 23:32:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxc91uNx/kY6F9jPoMvmz8nQV/rKluaaR7eaPgvNnsm4wLjMcOooLESzbfDFq3tvN0ptSu7Ow==
X-Received: by 2002:a1c:a917:: with SMTP id s23mr10932118wme.55.1623047576241; 
 Sun, 06 Jun 2021 23:32:56 -0700 (PDT)
Received: from thuth.remote.csb (pd957536e.dip0.t-ipconnect.de.
 [217.87.83.110])
 by smtp.gmail.com with ESMTPSA id 62sm16128648wrm.1.2021.06.06.23.32.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Jun 2021 23:32:55 -0700 (PDT)
Subject: Re: [PATCH 1/2] Remove leading underscores from QEMU defines
To: Ahmed Abouzied <email@aabouzied.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210605174938.13782-1-email@aabouzied.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <909aa479-9e58-1672-ac34-108815688dd2@redhat.com>
Date: Mon, 7 Jun 2021 08:32:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210605174938.13782-1-email@aabouzied.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 07 Jun 2021 06:33:38 -0000

On 05/06/2021 19.49, Ahmed Abouzied wrote:
> Leading underscores followed by a capital letter or underscore are
> reserved by the C standard.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/369
> 
> Signed-off-by: Ahmed Abouzied <email@aabouzied.com>
> ---
>   include/fpu/softfloat-helpers.h             | 4 ++--
>   include/hw/usb/dwc2-regs.h                  | 4 ++--
>   include/hw/usb/xlnx-usb-subsystem.h         | 4 ++--
>   include/hw/usb/xlnx-versal-usb2-ctrl-regs.h | 4 ++--
>   include/qemu/plugin-memory.h                | 4 ++--
>   include/qemu/selfmap.h                      | 4 ++--
>   include/user/syscall-trace.h                | 4 ++--
>   plugins/plugin.h                            | 4 ++--
>   tests/qtest/fuzz/qos_fuzz.h                 | 4 ++--
>   tests/tcg/minilib/minilib.h                 | 4 ++--
>   10 files changed, 20 insertions(+), 20 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


